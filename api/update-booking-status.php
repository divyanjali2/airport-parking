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

$reference = $_REQUEST['reference'] ?? null;
$status = $_REQUEST['status'] ?? null;

if (!$reference) {
    api_error("Reference is required", null, 400);
}

if (!$status) {
    api_error("Status is required", null, 400);
}

/*
|--------------------------------------------------------------------------
| Optional: restrict allowed statuses (recommended)
|--------------------------------------------------------------------------
*/

$allowedStatuses = ['confirmed', 'pending', 'cancelled'];

if (!in_array($status, $allowedStatuses)) {
    api_error("Invalid status value", $allowedStatuses, 400);
}

/*
|--------------------------------------------------------------------------
| Check if booking exists
|--------------------------------------------------------------------------
*/

try {
    $check = $conn->prepare("
        SELECT id 
        FROM reserved_slots 
        WHERE reference_number = ? 
        LIMIT 1
    ");

    $check->execute([$reference]);

    $row = $check->fetch(PDO::FETCH_ASSOC);

    if (!$row) {
        api_error("No booking found for this reference", null, 404);
    }

} catch (Exception $e) {
    api_error("Database error", $e->getMessage(), 500);
}

/*
|--------------------------------------------------------------------------
| Update booking status
|--------------------------------------------------------------------------
*/

try {
    $update = $conn->prepare("
        UPDATE reserved_slots 
        SET booking_status = ?
        WHERE reference_number = ?
    ");

    $update->execute([$status, $reference]);

} catch (Exception $e) {
    api_error("Failed to update status", $e->getMessage(), 500);
}

/*
|--------------------------------------------------------------------------
| Success response
|--------------------------------------------------------------------------
*/

echo json_encode([
    "status" => "success",
    "message" => "Booking status updated successfully",
    "reference_number" => $reference,
    "booking_status" => $status
]);

exit;