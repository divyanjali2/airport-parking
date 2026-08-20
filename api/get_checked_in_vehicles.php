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
            ch.id,
            ch.reference_number,
            ch.check_in_datetime,
            ch.check_in_by_name,
            ch.check_out_datetime,
            ch.check_out_by_name,
            ch.created_at,
            ch.updated_at,
            ch.status,
            rs.start_date,
            rs.end_date,
            rs.extra_services
        FROM customer_handling ch
        INNER JOIN reserved_slots rs ON rs.reference_number = ch.reference_number
        WHERE ch.status = 'check_in'
          AND rs.is_no_show = 0
          AND rs.is_trashed = 0
        ORDER BY ch.check_in_datetime DESC
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
