<?php

require_once __DIR__ . '/../assets/includes/db_connect.php';

header('Content-Type: application/json');

function api_error($message, $code = 400)
{
    http_response_code($code);

    echo json_encode([
        "status" => "error",
        "message" => $message
    ]);

    exit;
}

$reference = $_POST['reference'] ?? null;
$generated_by = $_POST['generated_by'] ?? 'system';

if (!$reference) {
    api_error("Reference number is required");
}

if (!isset($_FILES['pdf'])) {
    api_error("PDF file is required");
}

try {

    /*
    |--------------------------------------------------------------------------
    | Fetch booking details
    |--------------------------------------------------------------------------
    */

    $stmt = $conn->prepare("
        SELECT *
        FROM reserved_slots
        WHERE reference_number = ?
        LIMIT 1
    ");

    $stmt->execute([$reference]);

    $booking = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$booking) {
        api_error("Booking not found", 404);
    }

    /*
    |--------------------------------------------------------------------------
    | Create receipt folder
    |--------------------------------------------------------------------------
    */

    // REAL SERVER PATH (IMPORTANT)
    $baseDir = __DIR__ . '/../payment-receipts';

    // Create main folder if not exists
    if (!is_dir($baseDir)) {
        if (!mkdir($baseDir, 0777, true)) {
            api_error("Failed to create payment-receipts directory", 500);
        }
    }

    // Create booking folder
    $receiptFolder = $baseDir . '/' . $reference;

    if (!is_dir($receiptFolder)) {
        if (!mkdir($receiptFolder, 0777, true)) {
            api_error("Failed to create receipt folder", 500);
        }
    }

    /*
    |--------------------------------------------------------------------------
    | Generate receipt filename
    |--------------------------------------------------------------------------
    */

    $receiptNo = "REC-" . $reference . "-" . date("YmdHis");

    $fileName = $receiptNo . ".pdf";

    $fullPath = $receiptFolder . '/' . $fileName;

    // Path saved to database
    $dbPath = "payment-receipts/" . $reference . "/" . $fileName;

    /*
    |--------------------------------------------------------------------------
    | Save uploaded PDF
    |--------------------------------------------------------------------------
    */

    if (!move_uploaded_file($_FILES['pdf']['tmp_name'], $fullPath)) {

        $uploadError = $_FILES['pdf']['error'] ?? 'Unknown';

        api_error("Failed to save PDF file. Upload error code: " . $uploadError, 500);
    }

    /*
    |--------------------------------------------------------------------------
    | Calculate expected duration
    |--------------------------------------------------------------------------
    */

    $expectedDuration = null;

    if (!empty($booking['start_date']) && !empty($booking['end_date'])) {

        $start = new DateTime($booking['start_date']);

        $end = new DateTime($booking['end_date']);

        $expectedDuration = $start->diff($end)->format('%a days');
    }

    /*
    |--------------------------------------------------------------------------
    | Insert receipt record
    |--------------------------------------------------------------------------
    */

    $insert = $conn->prepare("
        INSERT INTO payment_receipts (
            reserved_slot_id,
            receipt_no,
            receipt_path,
            payment_amount,
            payment_status,
            generated_at,
            generated_by,
            customer_name,
            contact_number,
            vehicle_number,
            parking_location,
            expected_parking_duration,
            real_arrived_at,
            created_at,
            updated_at
        ) VALUES (
            ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, NOW(), NOW()
        )
    ");

    $insert->execute([
        $booking['id'],
        $receiptNo,
        $dbPath,
        $booking['total_price'] ?? 0,
        $booking['payment_status'] ?? 'paid',
        $generated_by,
        $booking['name'] ?? null,
        $booking['whatsapp_number'] ?? null,
        $booking['vehicle_number'] ?? null,
        $booking['parking_location'] ?? null,
        $expectedDuration,
        $booking['real_arrived_at'] ?? null
    ]);

    /*
    |--------------------------------------------------------------------------
    | Success response
    |--------------------------------------------------------------------------
    */

    echo json_encode([
        "status" => "success",
        "message" => "Payment receipt saved successfully",
        "receipt_no" => $receiptNo,
        "receipt_path" => $dbPath,
        "file_url" => "https://airportparking.lk/" . $dbPath
    ]);

} catch (Exception $e) {

    api_error($e->getMessage(), 500);
}