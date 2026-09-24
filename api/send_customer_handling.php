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
            ch.id,
            ch.reference_number,
            ch.check_in_datetime,
            ch.check_in_by_name,
            ch.check_out_datetime,
            ch.check_out_by_name,
            ch.status,
            ch.created_at,
            rs.total_price,
            rs.total_price_final,
            COALESCE(rs.total_price_final, rs.total_price, 0) AS final_price,
            COALESCE(rs.total_price, 0) AS price,
            rs.cash_handover,
            rs.cash_received_status,
            CASE 
                WHEN rs.cash_handover = 1 AND rs.cash_received_status = 'accepted' THEN 'Accepted by Finance'
                WHEN rs.cash_handover = 1 THEN 'Cash Handed Over'
                ELSE 'Pending Cash Handover'
            END AS finance_status
        FROM customer_handling ch
        LEFT JOIN reserved_slots rs ON rs.id = (
            SELECT rs2.id 
            FROM reserved_slots rs2 
            WHERE rs2.reference_number = ch.reference_number 
            ORDER BY rs2.is_trashed ASC, rs2.id DESC 
            LIMIT 1
        )
        ORDER BY ch.created_at DESC
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