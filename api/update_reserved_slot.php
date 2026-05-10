<?php

header("Content-Type: application/json");

require_once __DIR__ . '/../assets/includes/db_connect.php';

$data = json_decode(file_get_contents("php://input"), true);

$reference_number = $data['reference_number'] ?? '';
$end_date = $data['end_date'] ?? '';

if (!$reference_number || !$end_date) {
    exit(json_encode([
        'status' => false,
        'message' => 'reference_number and end_date are required'
    ]));
}

$sql = "UPDATE reserved_slots 
        SET end_date = :end_date 
        WHERE reference_number = :reference_number";

$stmt = $conn->prepare($sql);

$stmt->execute([
    ':end_date' => $end_date,
    ':reference_number' => $reference_number
]);

echo json_encode([
    'status' => $stmt->rowCount() > 0,
    'message' => $stmt->rowCount() > 0
        ? 'Updated successfully'
        : 'No matching reference found'
]);