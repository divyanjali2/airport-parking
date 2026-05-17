<?php
require_once __DIR__ . '/../assets/includes/db_connect.php';

header('Content-Type: application/json');

function api_error($message, $code = 400) {
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
    // Get reserved slot data
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

    // Main folder
    $baseDir = "https://airportparking.lk/payment-receipts";

    // Folder using reference number
    $receiptFolder = $baseDir . "/" . $reference;

    if (!is_dir($receiptFolder)) {
        mkdir($receiptFolder, 0777, true);
    }

    // Receipt file name
    $receiptNo = "REC-" . $reference . "-" . date("YmdHis");
    $fileName = $receiptNo . ".pdf";

    $fullPath = $receiptFolder . "/" . $fileName;

    // Path to save in database
    $dbPath = "payment-receipts/" . $reference . "/" . $fileName;

    // Save uploaded PDF
    if (!move_uploaded_file($_FILES['pdf']['tmp_name'], $fullPath)) {
        api_error("Failed to save PDF file", 500);
    }

    // Duration example
    $expectedDuration = null;
    if (!empty($booking['start_date']) && !empty($booking['end_date'])) {
        $start = new DateTime($booking['start_date']);
        $end = new DateTime($booking['end_date']);
        $expectedDuration = $start->diff($end)->format('%a days');
    }

    // Insert payment receipt
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

    echo json_encode([
        "status" => "success",
        "message" => "Payment receipt saved successfully",
        "receipt_no" => $receiptNo,
        "receipt_path" => $dbPath
    ]);

} catch (Exception $e) {
    api_error($e->getMessage(), 500);
}