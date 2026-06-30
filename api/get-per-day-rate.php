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
        SELECT *
        FROM per_day_rates
        ORDER BY id DESC
    ");

    $stmt->execute();

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success",
        "message" => "Data fetched successfully",
        "data" => $data
    ]);

} catch (PDOException $e) {

    api_error(
        "Database error",
        $e->getMessage(),
        500
    );
}