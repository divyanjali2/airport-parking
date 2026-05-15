<?php

header("Content-Type: application/json");

require_once __DIR__ . '/../assets/includes/db_connect.php';

$data = json_decode(file_get_contents("php://input"), true);

$reference_number = $data['reference_number'] ?? '';
$check_in_by_name = $data['check_in_by_name'] ?? '';

if (!$check_in_by_name) {
    exit(json_encode([
        'status' => false,
        'message' => 'check_in_by_name is required'
    ]));
}

$customer_status = 'check_in';

$sql = "INSERT INTO customer_handling (
            reference_number,
            check_in_datetime,
            check_in_by_name,
            status,
            created_at,
            updated_at
        ) VALUES (
            :reference_number,
            NOW(),
            :check_in_by_name,
            :status,
            NOW(),
            NOW()
        )";

$stmt = $conn->prepare($sql);

$stmt->execute([
    ':reference_number' => $reference_number,
    ':check_in_by_name' => $check_in_by_name,
    ':status' => $customer_status
]);

echo json_encode([
    'status' => true,
    'customer_status' => $customer_status,
    'message' => 'Check-in saved successfully'
]);