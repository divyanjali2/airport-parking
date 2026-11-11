<?php
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
require dirname(__DIR__) . '/assets/includes/db_connect.php';
require dirname(__DIR__) . '/assets/includes/booking-pricing.php';

use function AirportBookingPricing\calculate;
use function AirportBookingPricing\findPromo;
use function AirportBookingPricing\quote;

$checks = 0;
function check($actual, $expected, string $label): void {
    global $checks;
    if ($actual != $expected) throw new RuntimeException($label . ': got ' . json_encode($actual) . ', expected ' . json_encode($expected));
    $checks++;
}
function rejected(callable $call, string $label): void {
    try { $call(); } catch (InvalidArgumentException $error) { check(true, true, $label); return; }
    throw new RuntimeException($label . ' was accepted');
}

$promo = ['code' => 'TEST', 'discount_type' => 'percentage', 'amount' => 10, 'free_shuttle' => 1];
$start = '2026-11-14T10:00';
$end = '2026-11-16T10:00';
check(calculate($start, $end, 1000, [], null)['total'], 2000, 'No promo');
check(calculate($start, $end, 1000, [], $promo)['total'], 1800, 'Parking discount without shuttle');
check(calculate($start, $end, 1000, [], $promo)['shuttle_discount'], 0, 'No shuttle is added');
foreach (['Shuttle One Way' => 500, 'Shuttle Two Way' => 1000] as $service => $price) {
    $result = calculate($start, $end, 1000, [$service], $promo);
    check($result['total'], 1800, $service . ' is free');
    check($result['shuttle_discount'], $price, $service . ' saving');
    check(calculate($start, $end, 1000, [$service], null)['total'], 2000 + $price, $service . ' costs normally without promo');
}
check(calculate($start, $end, 1000, ['Body Wash & Vacuum', 'Shuttle Two Way'], $promo)['total'], 2800, 'Car wash remains full price');
$promo['free_shuttle'] = 0;
check(calculate($start, $end, 1000, ['Shuttle One Way'], $promo)['total'], 2300, 'Promo without shuttle benefit');
$promo['discount_type'] = 'fixed';
$promo['amount'] = 5000;
check(calculate($start, $end, 1000, ['Body Wash & Vacuum'], $promo)['total'], 1000, 'Fixed discount capped at parking cost');
foreach (['2026-11-15T12:00' => 1, '2026-11-15T12:01' => 1.5, '2026-11-15T18:00' => 1.5, '2026-11-15T18:01' => 2] as $finish => $days) {
    check(calculate($start, $finish, 1000, [], null)['days'], $days, 'Duration ' . $finish);
}
rejected(fn() => calculate($end, $start, 1000, [], null), 'Reversed dates');
rejected(fn() => calculate('2026-02-30T10:00', $end, 1000, [], null), 'Invalid calendar date');
rejected(fn() => calculate($start, $end, 1000, ['Unknown'], null), 'Unknown extra');
rejected(fn() => calculate($start, $end, 1000, ['Shuttle One Way', 'Shuttle Two Way'], null), 'Two shuttle options');

$conn->beginTransaction();
try {
    $code = 'TEST-' . bin2hex(random_bytes(8));
    $insert = $conn->prepare("INSERT INTO promo_codes (name, code, discount_type, amount, free_shuttle, valid_from, valid_until) VALUES ('Pricing test', ?, 'percentage', 10, 1, '2026-11-13', '2026-11-30')");
    $insert->execute([$code]);
    foreach (['2026-11-13', '2026-11-30'] as $date) {
        check(findPromo($conn, strtolower($code), $date . 'T10:00')['code'], $code, 'Inclusive booking start date and normalized code');
    }
    check(findPromo($conn, $code, '2026-11-15T10:00')['code'], $code, 'Advance booking inside promo window');
    rejected(fn() => findPromo($conn, $code, '2026-11-12T10:00'), 'Booking before promo window');
    rejected(fn() => findPromo($conn, $code, '2026-12-01T10:00'), 'Booking after promo window');
    rejected(fn() => findPromo($conn, 'MISSING-' . $code, $start), 'Unknown promo');
    rejected(fn() => findPromo($conn, $code, ''), 'Missing booking start date');
    rejected(fn() => findPromo($conn, $code, '2026-02-30T10:00'), 'Invalid promo booking date');
    $data = ['startDate' => $start, 'endDate' => $end, 'promoCode' => $code, 'extras' => ['Shuttle Two Way'], 'totalPrice' => 1, 'pricePerDay' => 1, 'days' => 1];
    $rate = (float)$conn->query('SELECT price FROM per_day_rates ORDER BY id DESC LIMIT 1')->fetchColumn();
    check(quote($conn, $data)['total'], round(2 * $rate * 0.9, 2), 'Server ignores submitted price and days');
    $data['startDate'] = '2026-12-01T10:00';
    $data['endDate'] = '2026-12-03T10:00';
    rejected(fn() => quote($conn, $data), 'Save revalidates changed booking start date');
    $conn->prepare('UPDATE promo_codes SET is_active = 0 WHERE code = ?')->execute([$code]);
    rejected(fn() => findPromo($conn, $code, $start), 'Inactive');
} finally {
    $conn->rollBack();
}
echo "Passed {$checks} booking pricing checks; test data rolled back.\n";
