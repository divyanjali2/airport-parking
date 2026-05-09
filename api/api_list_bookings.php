<?php

require_once __DIR__ . '/../assets/includes/db_connect.php';

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type');

error_reporting(E_ALL);
ini_set('display_errors', 1);

function sendResponse($success, $message, $data = null, $statusCode = 200)
{
    http_response_code($statusCode);

    echo json_encode([
        'success' => $success,
        'message' => $message,
        'data' => $data
    ]);

    exit;
}

try {

    /*
    |--------------------------------------------------------------------------
    | INPUTS
    |--------------------------------------------------------------------------
    */

    $date = $_GET['date'] ?? null;
    $start_date = $_GET['start_date'] ?? null;
    $end_date = $_GET['end_date'] ?? null;

    $month = $_GET['month'] ?? null;
    $year  = $_GET['year'] ?? date('Y');

    $currentYear = date('Y');

    /*
    |--------------------------------------------------------------------------
    | DEFAULT = TODAY
    |--------------------------------------------------------------------------
    */

    if (!$date && !$start_date && !$end_date) {
        $today = date('Y-m-d');
        $start_date = $today;
        $end_date = $today;
    }

    if ($date) {
        $start_date = $date;
        $end_date = $date;
    }

    /*
    |--------------------------------------------------------------------------
    | BASE WHERE
    |--------------------------------------------------------------------------
    */

    $where = "WHERE (rs.is_trashed = 0 OR rs.is_trashed IS NULL)";
    $params = [];

    if ($start_date && $end_date) {
        $where .= " AND DATE(rs.start_date) <= ? AND DATE(rs.end_date) >= ?";
        $params[] = $end_date;
        $params[] = $start_date;
    }

    /*
    |--------------------------------------------------------------------------
    | PARKED VEHICLES
    |--------------------------------------------------------------------------
    */

    $stmt = $conn->prepare("
        SELECT COUNT(*) as total_parked
        FROM reserved_slots rs
        $where
        AND rs.booking_status = 'confirmed'
    ");
    $stmt->execute($params);
    $totalParked = (int)$stmt->fetch(PDO::FETCH_ASSOC)['total_parked'];

    /*
    |--------------------------------------------------------------------------
    | COMPLETED PARKING
    |--------------------------------------------------------------------------
    */

    $stmt = $conn->prepare("
        SELECT COUNT(*) as total_completed
        FROM reserved_slots rs
        $where
        AND rs.vehicle_status = 'completed'
    ");
    $stmt->execute($params);
    $totalCompleted = (int)$stmt->fetch(PDO::FETCH_ASSOC)['total_completed'];

    /*
    |--------------------------------------------------------------------------
    | ACTIVE PARKING
    |--------------------------------------------------------------------------
    */

    $stmt = $conn->prepare("
        SELECT COUNT(*) as active_parking
        FROM reserved_slots rs
        $where
        AND rs.booking_status = 'confirmed'
        AND (rs.vehicle_status != 'completed' OR rs.vehicle_status IS NULL)
    ");
    $stmt->execute($params);
    $activeParking = (int)$stmt->fetch(PDO::FETCH_ASSOC)['active_parking'];

    /*
    |--------------------------------------------------------------------------
    | TOTAL BOOKINGS
    |--------------------------------------------------------------------------
    */

    $stmt = $conn->prepare("
        SELECT COUNT(*) as total_bookings
        FROM reserved_slots rs
        $where
    ");
    $stmt->execute($params);
    $totalBookings = (int)$stmt->fetch(PDO::FETCH_ASSOC)['total_bookings'];

    /*
    |--------------------------------------------------------------------------
    | REVENUE (MONTH / YEAR / DEFAULT YEAR)
    |--------------------------------------------------------------------------
    */

    if ($month) {

        $stmt = $conn->prepare("
            SELECT COALESCE(SUM(rs.total_price_final),0) as revenue
            FROM reserved_slots rs
            WHERE (rs.is_trashed = 0 OR rs.is_trashed IS NULL)
            AND MONTH(rs.start_date) = ?
            AND YEAR(rs.start_date) = ?
        ");

        $stmt->execute([$month, $year]);
        $revenueType = "monthly";

    } else {

        $stmt = $conn->prepare("
            SELECT COALESCE(SUM(rs.total_price_final),0) as revenue
            FROM reserved_slots rs
            WHERE (rs.is_trashed = 0 OR rs.is_trashed IS NULL)
            AND YEAR(rs.start_date) = ?
        ");

        $stmt->execute([$year]);

        $revenueType = ($year == $currentYear) ? "current_year_default" : "yearly";
    }

    $revenue = (float)$stmt->fetch(PDO::FETCH_ASSOC)['revenue'];

    /*
    |--------------------------------------------------------------------------
    | HANDOVER INFO (JOIN WITH USERS TABLE)
    |--------------------------------------------------------------------------
    */

    $handoverStmt = $conn->prepare("
        SELECT 
            rs.handover_by,
            rs.handover_datetime,
            rs.cash_handover,
            u.name AS handover_by_name
        FROM reserved_slots rs
        LEFT JOIN users u ON rs.handover_by = u.id
        WHERE (rs.is_trashed = 0 OR rs.is_trashed IS NULL)
        ORDER BY rs.handover_datetime DESC
        LIMIT 1
    ");

    $handoverStmt->execute();
    $handover = $handoverStmt->fetch(PDO::FETCH_ASSOC);

    /*
    |--------------------------------------------------------------------------
    | RESPONSE
    |--------------------------------------------------------------------------
    */

    sendResponse(true, 'Dashboard stats retrieved successfully', [
        'date_filter' => [
            'start_date' => $start_date,
            'end_date' => $end_date
        ],
        'revenue_filter' => [
            'month' => $month,
            'year' => $year
        ],
        'stats' => [
            'total_parked_vehicles' => $totalParked,
            'total_completed_parking' => $totalCompleted,
            'active_parking_count' => $activeParking,
            'total_bookings' => $totalBookings,
            'revenue' => $revenue,
            'revenue_type' => $revenueType
        ],
        'handover' => [
            'handover_by_id' => $handover['handover_by'] ?? null,
            'handover_by_name' => $handover['handover_by_name'] ?? null,
            'handover_datetime' => $handover['handover_datetime'] ?? null,
            'cash_handover' => $handover['cash_handover'] ?? null
        ]
    ]);

} catch (PDOException $e) {

    sendResponse(false, 'Database Error: ' . $e->getMessage(), null, 500);
}