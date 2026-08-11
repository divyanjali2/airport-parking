<?php
session_start();
require_once __DIR__ . '/db_connect.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized']);
    exit;
}

$ref = $_GET['reference'] ?? '';

if (empty($ref)) {
    echo json_encode(['success' => false, 'message' => 'Missing reference number']);
    exit;
}

try {
    $stmt = $conn->prepare("
        SELECT
            reference_number,
            slot_number,
            name,
            vehicle_number,
            vehicle_type,
            start_date,
            end_date,
            end_date_edited,
            days,
            price_per_day,
            extra_services,
            total_price,
            total_price_final,
            late_fee_percent,
            late_fee_amount,
            booking_type,
            pdf_path
        FROM reserved_slots
        WHERE reference_number = :ref
        LIMIT 1
    ");
    $stmt->execute([':ref' => $ref]);
    $booking = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$booking) {
        echo json_encode(['success' => false, 'message' => 'Booking not found']);
        exit;
    }

    // Calculate base parking cost
    $days = (float)($booking['days'] ?? 0);
    $pricePerDay = (float)($booking['price_per_day'] ?? 0);
    $baseParkingCost = $days * $pricePerDay;

    // Parse extra services
    $extrasRaw = $booking['extra_services'] ?? '';
    $extras = [];
    $extrasTotal = 0;

    if (!empty($extrasRaw)) {
        $extraItems = array_map('trim', explode(',', $extrasRaw));
        foreach ($extraItems as $item) {
            if (empty($item)) continue;

            // Match known services to their prices
            $price = 0;
            $lowerItem = strtolower($item);
            if (strpos($lowerItem, 'body wash') !== false || strpos($lowerItem, 'vacuum') !== false) {
                $price = 1000;
            } elseif (strpos($lowerItem, 'shuttle two way') !== false) {
                $price = 1000;
            } elseif (strpos($lowerItem, 'shuttle one way') !== false) {
                $price = 500;
            }

            $extras[] = ['name' => $item, 'price' => $price];
            $extrasTotal += $price;
        }
    }

    // Late fee
    $lateFeeAmount = (float)($booking['late_fee_amount'] ?? 0);
    $lateFeePercent = (float)($booking['late_fee_percent'] ?? 0);

    // Original total and final total
    $originalTotal = (float)($booking['total_price'] ?? 0);
    $finalTotal = (float)($booking['total_price_final'] ?? 0);

    // Build PDF URL
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    $projectRoot = dirname(dirname(dirname($_SERVER['SCRIPT_NAME'])));
    $baseUrl = $protocol . '://' . $_SERVER['HTTP_HOST'] . $projectRoot;
    $pdfFile = 'Invoice_' . $booking['reference_number'] . '.pdf';
    $pdfUrl = $baseUrl . '/assets/invoices/' . rawurlencode($pdfFile);

    echo json_encode([
        'success' => true,
        'data' => [
            'reference_number' => $booking['reference_number'],
            'slot_number' => $booking['slot_number'],
            'customer_name' => $booking['name'],
            'vehicle_number' => $booking['vehicle_number'],
            'vehicle_type' => $booking['vehicle_type'],
            'start_date' => $booking['start_date'],
            'end_date' => $booking['end_date'],
            'end_date_edited' => $booking['end_date_edited'],
            'days' => $days,
            'price_per_day' => $pricePerDay,
            'base_parking_cost' => $baseParkingCost,
            'extras' => $extras,
            'extras_total' => $extrasTotal,
            'late_fee_percent' => $lateFeePercent,
            'late_fee_amount' => $lateFeeAmount,
            'original_total' => $originalTotal,
            'final_total' => $finalTotal,
            'booking_type' => $booking['booking_type'],
            'pdf_url' => $pdfUrl,
        ]
    ]);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
}
