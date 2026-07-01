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

// Use provided date or today's date
$date = $_GET['date'] ?? date('Y-m-d');

try {

    $stmt = $conn->prepare("
        SELECT
            reference_number,
            start_date,
            end_date,
            name,
            total_price
        FROM reserved_slots
        WHERE
            is_trashed = 0
            AND is_no_show = 0
            AND DATE(start_date) BETWEEN ? AND DATE_ADD(?, INTERVAL 6 DAY)
        ORDER BY start_date ASC
    ");

    $stmt->execute([$date, $date]);

    $bookings = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success",
        "from_date" => $date,
        "to_date" => date('Y-m-d', strtotime($date . ' +6 days')),
        "count" => count($bookings),
        "bookings" => $bookings
    ]);

} catch (Exception $e) {
    api_error("Database error", $e->getMessage(), 500);
}

exit;