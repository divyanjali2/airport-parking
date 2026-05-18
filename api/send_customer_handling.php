<?php

require_once __DIR__ . '/../assets/includes/db_connect.php';

header('Content-Type: application/json');

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

try {

    $stmt = $conn->prepare("
        SELECT
            id,
            reference_number,
            check_in_datetime,
            check_in_by_name,
            check_out_datetime,
            check_out_by_name,
            status,
            created_at
        FROM customer_handling
        ORDER BY created_at DESC
    ");

    $stmt->execute();

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success",
        "total_records" => count($data),
        "data" => $data
    ]);

} catch (PDOException $e) {

    api_error(
        "Database error",
        $e->getMessage(),
        500
    );
}