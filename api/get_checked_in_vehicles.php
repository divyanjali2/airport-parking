<?php

require_once __DIR__ . '/../assets/includes/db_connect.php';

function api_error($message, $data = null, $code = 400)
{
    http_response_code($code);

    echo json_encode([
        "status"  => "error",
        "message" => $message,
        "data"    => $data
    ]);

    exit;
}

header('Content-Type: application/json');

try {

    $stmt = $conn->prepare("
        SELECT
            id,
            reference_number,
            check_in_datetime,
            check_in_by_name,
            check_out_datetime,
            check_out_by_name,
            created_at,
            updated_at,
            status
        FROM customer_handling
        WHERE status = 'check_in'
        ORDER BY check_in_datetime DESC
    ");

    $stmt->execute();

    $vehicles = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status"  => "success",
        "count"   => count($vehicles),
        "vehicles" => $vehicles
    ]);

} catch (Exception $e) {
    api_error("Database error", $e->getMessage(), 500);
}

exit;
