<?php

require_once __DIR__ . '/../assets/includes/db_connect.php';

function api_error($message, $data = null, $code = 400)
{
    http_response_code($code);

    echo json_encode([
        "status" => "error",
        "message" => $message,
        "data" => $data
    ]);

    exit;
}

header('Content-Type: application/json');

$reference = $_GET['reference'] ?? null;

if (!$reference) {
    api_error("Reference is required", null, 400);
}

/*
|--------------------------------------------------------------------------
| Fetch booking details from database
|--------------------------------------------------------------------------
*/

try {
    $stmt = $conn->prepare("
        SELECT 
            vehicle_number,
            start_date,
            end_date,
            end_date_edited,
            name,
            email,
            whatsapp_number,
            total_price,
            total_price_final,
            booking_status
        FROM reserved_slots
        WHERE reference_number = ?
        LIMIT 1
    ");

    $stmt->execute([$reference]);

    $booking = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$booking) {
        api_error("No booking found for this reference", null, 404);
    }

} catch (Exception $e) {
    api_error("Database error", $e->getMessage(), 500);
}

/*
|--------------------------------------------------------------------------
| Return response
|--------------------------------------------------------------------------
*/

echo json_encode([
    "reference_number" => $reference,
    "vehicle_number" => $booking['vehicle_number'],
    "start_date" => $booking['start_date'],
    "end_date" => $booking['end_date'],
    "end_date_edited" => $booking['end_date_edited'],
    "name" => $booking['name'],
    "email" => $booking['email'],
    "whatsapp_number" => $booking['whatsapp_number'],
    "total_price" => $booking['total_price'],
    "total_price_final" => $booking['total_price_final'],
    "booking_status" => $booking['booking_status']
]);

exit;