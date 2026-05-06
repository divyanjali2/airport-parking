<?php
session_start();
ob_start();
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
error_reporting(E_ALL);

header('Content-Type: application/json');

use Dompdf\Dompdf;
use Dompdf\Options;

require_once __DIR__ . '/../../vendor/autoload.php';
require_once __DIR__ . '/db_connect.php';

try {
    $data = $_POST;
    $required = [
        'slot','vehicleType','hometown',
        'startDate','endDate','name',
        'email','whatsapp','days','passenger_count',
        'pricePerDay','totalPrice','vehicleNumber'
    ];

    function uploadImage($file, $uploadDir, $publicPath) {
        if (!isset($file) || $file['error'] !== UPLOAD_ERR_OK) {
            return null;
        }

        $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
        $filename = uniqid() . '.' . $ext;
        $targetPath = $uploadDir . $filename;

        if (!move_uploaded_file($file['tmp_name'], $targetPath)) {
            throw new Exception("Failed to upload file: " . $file['name']);
        }

        return $publicPath . $filename;
    }

    function formatDaysHours($decimalDays) {
        $days = floor($decimalDays);
        $hours = round(($decimalDays - $days) * 24);
        return "{$days} days" . ($hours > 0 ? " {$hours} hours" : "");
    }

    function formatDateTime($isoString) {
        $dt = new DateTime($isoString);
        return $dt->format('d M Y, H:i'); 
    }

    foreach ($required as $field) {
        if (empty($data[$field])) {
            throw new Exception("Missing field: {$field}");
        }
    }

    // ===============================
    // BASE URL
    // ===============================
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    $projectRoot = dirname(dirname(dirname($_SERVER['SCRIPT_NAME'])));
    $baseUrl = $protocol . '://' . $_SERVER['HTTP_HOST'] . $projectRoot;

    $uploadDir = __DIR__ . '/../../uploads/';
    $publicPath = $baseUrl . '/uploads/';

    $airTicketUrl = uploadImage($_FILES['air_ticket_image_url'], $uploadDir, $publicPath);
    $passportCopyUrl = uploadImage($_FILES['passport_copy_image_url'], $uploadDir, $publicPath);

    // ===============================
    // GENERATE REFERENCE
    // ===============================
    $stmt = $conn->prepare("SELECT COUNT(*) FROM reserved_slots WHERE slot_number = :slot");
    $stmt->execute([':slot' => $data['slot']]);
    $count = (int)$stmt->fetchColumn();
    $reference = $data['slot'] . '-AP-' . str_pad($count + 1, 2, '0', STR_PAD_LEFT);

    // ===============================
    // INSERT BOOKING
    // ===============================
    $extras = isset($data['extras']) ? implode(', ', $data['extras']) : '';
    $remarks = $data['remarks'] ?? '';
    $receiverName = $data['receiverName'] ?? '';
    $meterReading = $data['meter_reading'] ?? null;
    $images = isset($data['images']) ? json_encode($data['images']) : null;

    $stmt = $conn->prepare("
        INSERT INTO reserved_slots (
        slot_number,
        vehicle_number,
        reference_number,
        vehicle_type,
        hometown,
        flight_number,
        start_date,
        end_date,
        end_date_edited,
        name,
        email,
        whatsapp_number,
        passenger_count,
        days,
        price_per_day,
        total_price,
        total_price_final,
        late_fee_percent,
        late_fee_amount,
        extra_services,
        booking_type,
        created_by,
        remarks,
        is_trashed,
        receiver_name,
        meter_reading,
        images,
        air_ticket_image_url,
        passport_copy_image_url,
        end_date_edited_at,
        created_at,
        updated_at
        ) VALUES (
        :slot,
        :vehicleNumber,
        :ref,
        :vehicle,
        :home,
        :flight,
        :start,
        :end,
        :endEdited,
        :name,
        :email,
        :whatsapp,
        :passenger_count,
        :days,
        :ppd,
        :total,
        :totalFinal,
        :lateFeePercent,
        :lateFeeAmount,
        :extras,
        :bookingType,
        :createdBy,
        :remarks,
        :isTrashed,
        :receiverName,
        :meter,
        :images,
        :airTicket,
        :passportCopy,
        :endEditedAt,
        NOW(),
        NOW()
        )
    ");

    $stmt->execute([
        ':slot'         => $data['slot'],
        ':ref'          => $reference,
        ':vehicleNumber' => $data['vehicleNumber'] ?? '',
        ':vehicle'      => $data['vehicleType'],
        ':home'         => $data['hometown'],
        ':flight'       => $data['flightNumber'] ?? '',
        ':start'        => $data['startDate'],
        ':end'          => $data['endDate'],
        ':endEdited'      => null,
        ':totalFinal'     => null,
        ':lateFeePercent' => 0,
        ':lateFeeAmount'  => 0,
        ':endEditedAt'    => null,
        ':name'         => $data['name'],
        ':email'        => $data['email'],
        ':whatsapp'     => $data['whatsapp'],
        ':passenger_count'     => $data['passenger_count'],
        ':days'         => $data['days'],
        ':ppd'          => $data['pricePerDay'],
        ':total'        => $data['totalPrice'],
        ':extras'       => $extras,
        ':bookingType'  => $data['booking_type'] ?? 'website',
        ':createdBy'    => $_SESSION['user_id'] ?? 'system',  
        ':remarks'      => $remarks,
        ':isTrashed'    => false,
        ':receiverName' => $data['receiver_name'] ?? '',
        ':meter'        => $meterReading,
        ':images'       => $images,
        ':airTicket'    => $airTicketUrl,
        ':passportCopy' => $passportCopyUrl,
    ]);

    $stmtTotal = $conn->prepare("SELECT days, price_per_day, total_price FROM reserved_slots WHERE reference_number = :ref");
    $stmtTotal->execute([':ref' => $reference]);
    $booking = $stmtTotal->fetch(PDO::FETCH_ASSOC);

    $daysDecimal = (float)$booking['days'];
    $formattedDuration = formatDaysHours($daysDecimal);
    $pricePerDay = number_format((float)$booking['price_per_day'], 2);
    $grandTotalFormatted = number_format((float)$booking['total_price'], 2);

    $options = new Options();
    $options->set('isRemoteEnabled', true);
    $options->set('chroot', realpath(__DIR__ . '/../../'));
    $dompdf = new Dompdf($options);

    $logoPath = realpath(__DIR__ . '/../../assets/images/logo.png');
    if (!$logoPath) {
        throw new Exception("Logo image not found");
    }

    $html = "
    <style>
    body { font-family: Cambria; font-size: 12px; margin: 0; padding: 10px; border: 2px solid #105a85ff; }
    .header { text-align: center; margin-bottom: 5px; }
    .header img { max-width: 120px; margin-bottom: 5px; }
    .company-details { text-align: center; font-size: 12px; margin-bottom: 5px; }
    hr { border: 1px solid #000; margin: 5px 0 15px 0; }
    .invoice-title { text-align: center; font-size: 24px; font-weight: bold; margin-bottom: 5px; }
    .reference { text-align: center; font-size: 14px; margin-bottom: 20px; }
    .info-table { width: 100%; margin-bottom: 20px; }
    .info-table td { padding: 5px; vertical-align: top; }
    .slot-table, .extras-table { width: 100%; border-collapse: collapse; margin-bottom: 10px; }
    .slot-table th, .slot-table td, .extras-table th, .extras-table td { border: 1px solid #ddd; padding: 8px; text-align: left; }
    .slot-table th, .extras-table th { background-color: #f2f2f2; }
    .total-row { font-size:16px; font-weight: bold; text-align: right; margin-top: 5px; }
    .footer { margin-top: 50px; text-align: center; font-size: 12px; }
    </style>

    <div class='header'>
        <img src='file://{$logoPath}' alt='Logo'>
    </div>

    <div class='mt-3 company-details'>
        <strong>Airport Parking</strong><br>
        No. 371/5, Negombo Road, Seeduwa, Sri Lanka<br>
        info@airportparking.lk | +94 76 141 4557
    </div>

    <hr>

    <div class='invoice-title'>INVOICE</div>
    <div class='reference'>Reference: {$reference}</div>

    <table class='info-table'>
    <tr>
        <td>
            <strong>Customer Details:</strong><br>
            Name: {$data['name']}<br>
            Email: {$data['email']}<br>
            WhatsApp: {$data['whatsapp']}
        </td>
        <td>
            <strong>Booking Details:</strong><br>
            Flight Number: {$data['flightNumber']}<br>
            Passenger Count: {$data['passenger_count']}<br>
            Start Date: " . formatDateTime($data['startDate']) . "<br>
            End Date: " . formatDateTime($data['endDate']) . "
        </td>
    </tr>
    </table>

    <table class='slot-table'>
        <tr>
            <th>Vehicle Number</th>
            <th>Duration</th>
            <th>Price / Day</th>
        </tr>
        <tr>
            <td>{$data['vehicleNumber']}</td>
            <td>{$formattedDuration}</td>
            <td>{$pricePerDay}</td>
        </tr>
    </table>
    ";

    // ===============================
    // EXTRAS TABLE IF PRESENT
    // ===============================
    $extraPrices = [
        'Body Wash & Vacuum' => 1000,
        'Shuttle One Way' => 500,
        'Shuttle Two Way' => 1000
    ];

    if (!empty($data['extras'])) {
        $html .= "
        <table class='extras-table'>
            <tr>
                <th>Extra Service</th>
                <th>Price</th>
            </tr>";
        foreach ($data['extras'] as $extra) {
            $price = $extraPrices[$extra] ?? 0;
            $html .= "
            <tr>
                <td>{$extra}</td>
                <td>{$price}</td>
            </tr>";
        }
        $html .= "</table>";
    }

    // ===============================
    // GRAND TOTAL
    // ===============================
    $html .= "
    <div class='total-row'>
        <strong>Total: LKR {$grandTotalFormatted}</strong>
    </div>

    <div class='footer'>
        Thank you for choosing Airport Parking Services!
    </div>
    ";

    // ===============================
    // RENDER PDF
    // ===============================
    $dompdf->loadHtml($html);
    $dompdf->setPaper('A5', 'portrait');
    $dompdf->render();

    // ===============================
    // SAVE PDF
    // ===============================
    $invoiceDir = __DIR__ . '/../../assets/invoices/';
    if (!is_dir($invoiceDir)) {
        mkdir($invoiceDir, 0777, true);
    }

    $pdfFile = "Invoice_{$reference}.pdf";
    $pdfPath = $invoiceDir . $pdfFile;
    file_put_contents($pdfPath, $dompdf->output());

    $stmt = $conn->prepare("UPDATE reserved_slots SET pdf_path = :p WHERE reference_number = :r");
    $stmt->execute([
        ':p' => realpath($pdfPath),
        ':r' => $reference
    ]);

    // ===============================
    // RESPONSE
    // ===============================
    ob_clean();
    echo json_encode([
        'success'   => true,
        'reference' => $reference,
        'pdf_url'   => $baseUrl . '/assets/invoices/' . $pdfFile
    ]);

} catch (Throwable $e) {
    ob_clean();
    http_response_code(500);

    echo json_encode([
        'success' => false,
        'error'   => 'Server error',
        'detail'  => $e->getMessage() 
    ]);
}
