<?php
ini_set('display_errors', '0');
error_reporting(0);

require_once dirname(__DIR__, 2) . '/config.core.php';
require_once MODX_CORE_PATH . 'model/modx/modx.class.php';

$modx = new modX();
$modx->initialize('web');

require_once __DIR__ . '/db_connect.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Invalid request method.']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);

$pickupLocation  = trim((string)($input['pickup_location'] ?? ''));
$dropoffLocation = trim((string)($input['dropoff_location'] ?? ''));
$pickupDateTime  = trim((string)($input['pickup_datetime'] ?? ''));
$dropoffDateTime = trim((string)($input['dropoff_datetime'] ?? ''));
$passengerCount  = (int)($input['passenger_count'] ?? 0);
$luggageCount    = (int)($input['luggage_count'] ?? 0);

$_SESSION['rent_search'] = [
    'pickup_location'  => $pickupLocation,
    'dropoff_location' => $dropoffLocation,
    'pickup_datetime'  => $pickupDateTime,
    'dropoff_datetime' => $dropoffDateTime,
];

$pickupDate  = ($pickupDateTime && strtotime($pickupDateTime)) ? date('Y-m-d', strtotime($pickupDateTime)) : '';
$dropoffDate = ($dropoffDateTime && strtotime($dropoffDateTime)) ? date('Y-m-d', strtotime($dropoffDateTime)) : '';

if (!function_exists('getRentalDaysSearch')) {
    function getRentalDaysSearch($pickupDate, $dropoffDate) {
        if (!$pickupDate || !$dropoffDate) return 0;
        $start = strtotime($pickupDate);
        $end   = strtotime($dropoffDate);
        if (!$start || !$end || $end < $start) return 0;
        return max(1, (int)(($end - $start) / 86400) + 1);
    }
}

if (!function_exists('calculateRentalPriceSearch')) {
    function calculateRentalPriceSearch($modx, $carCode, $pickupDate, $dropoffDate) {
        $days = getRentalDaysSearch($pickupDate, $dropoffDate);
        if ($days <= 0 || $carCode === '') return '';

        $sql = "SELECT duration, rate
                FROM car_rental
                WHERE car_code = :car_code
                  AND :pickup_date >= DATE(start_date)
                  AND :dropoff_date <= DATE(end_date)
                ORDER BY duration ASC";

        $stmt = $modx->prepare($sql);
        if (!$stmt) return '';

        $stmt->bindValue(':car_code', $carCode, PDO::PARAM_STR);
        $stmt->bindValue(':pickup_date', $pickupDate, PDO::PARAM_STR);
        $stmt->bindValue(':dropoff_date', $dropoffDate, PDO::PARAM_STR);

        if (!$stmt->execute()) return '';

        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if (!$rows) return '';

        $rates = [];
        foreach ($rows as $row) {
            $duration = (int)($row['duration'] ?? 0);
            $rate     = (float)($row['rate'] ?? 0);
            if ($duration > 0) {
                $rates[$duration] = $rate;
            }
        }

        if (!$rates) return '';

        ksort($rates);
        $maxDuration = max(array_keys($rates));
        $lastRate    = (float)$rates[$maxDuration];
        $total       = 0;

        for ($d = 1; $d <= $days; $d++) {
            if (isset($rates[$d])) {
                $total += (float)$rates[$d];
            } elseif ($d > $maxDuration) {
                $total += $lastRate;
            } else {
                return '';
            }
        }

        return number_format($total, 2, '.', '');
    }
}

$where = [];
$params = [];

if ($passengerCount > 0) {
    $where[] = 'v.pax_count >= :passenger_count';
    $params[':passenger_count'] = $passengerCount;
}

if ($luggageCount > 0) {
    $where[] = 'v.luggage_count >= :luggage_count';
    $params[':luggage_count'] = $luggageCount;
}

$whereSql = !empty($where) ? ('WHERE ' . implode(' AND ', $where)) : '';

$sql = "SELECT
            v1.id,
            v1.image,
            v1.car_category,
            v1.car_model,
            v1.car_code,
            v1.pax_count,
            v1.luggage_count
        FROM vehicles v1
        INNER JOIN (
            SELECT car_category, MIN(id) AS first_id
            FROM vehicles
            {$whereSql}
            GROUP BY car_category
        ) v2 ON v1.id = v2.first_id
        ORDER BY v1.car_category ASC
        LIMIT 12";

$stmt = $modx->prepare($sql);

if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Could not prepare vehicle search.']);
    exit;
}

foreach ($params as $key => $val) {
    $stmt->bindValue($key, $val, PDO::PARAM_INT);
}

if (!$stmt->execute()) {
    echo json_encode(['success' => false, 'message' => 'Could not search vehicles.']);
    exit;
}

$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

$vehicles = [];
foreach ($rows as $row) {
    $vehicles[] = [
        'id'            => (int)$row['id'],
        'image'         => $row['image'] ?? '',
        'car_model'     => $row['car_model'] ?? '',
        'car_category'  => $row['car_category'] ?? '',
        'car_code'      => $row['car_code'] ?? '',
        'pax_count'     => (int)($row['pax_count'] ?? 0),
        'luggage_count' => (int)($row['luggage_count'] ?? 0),
        'price'         => calculateRentalPriceSearch($modx, $row['car_code'] ?? '', $pickupDate, $dropoffDate),
    ];
}

echo json_encode(['success' => true, 'vehicles' => $vehicles]);
exit;