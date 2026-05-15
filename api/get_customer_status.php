<?php

header("Content-Type: application/json");

require_once __DIR__ . '/../assets/includes/db_connect.php';

$reference_number = $_GET['reference_number'] ?? '';

if (!$reference_number) {
    exit(json_encode([
        'status' => false,
        'message' => 'reference_number is required'
    ]));
}

$sql = "SELECT
            reference_number,
            status,
            check_in_datetime,
            check_out_datetime,
            check_in_by_name,
            check_out_by_name
        FROM customer_handling
        WHERE reference_number = :reference_number
        ORDER BY id DESC
        LIMIT 1";

$stmt = $conn->prepare($sql);

$stmt->execute([
    ':reference_number' => $reference_number
]);

$result = $stmt->fetch(PDO::FETCH_ASSOC);

if ($result) {

    echo json_encode([
        'status' => true,
        'data' => $result
    ]);

} else {

    echo json_encode([
        'status' => false,
        'message' => 'No record found'
    ]);
}