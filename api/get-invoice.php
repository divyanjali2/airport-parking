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

// Validate format
if (!preg_match('/^G\d+-AP-\d+$/', $reference)) {
    api_error("Invalid reference format", null, 400);
}

try {
    $stmt = $conn->prepare("
        SELECT end_date 
        FROM reserved_slots 
        WHERE reference_number = ? 
        LIMIT 1
    ");

    $stmt->execute([$reference]);

    $slot = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$slot) {
        api_error("No reservation found for this reference", null, 404);
    }

    $endDate = $slot['end_date'] ?? null;

} catch (Exception $e) {
    api_error("Database error", $e->getMessage(), 500);
}

echo json_encode([
    "reference_number" => $reference,
    "end_date" => $endDate
]);

exit;