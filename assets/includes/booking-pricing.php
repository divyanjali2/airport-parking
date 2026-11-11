<?php
namespace AirportBookingPricing;

use DateTimeImmutable;
use DateTimeZone;
use InvalidArgumentException;
use PDO;

function parseBookingDate(string $value): DateTimeImmutable
{
    $date = DateTimeImmutable::createFromFormat('!Y-m-d\TH:i', $value, new DateTimeZone('Asia/Colombo'));
    if (!$date || $date->format('Y-m-d\TH:i') !== $value) {
        throw new InvalidArgumentException('Please select a valid booking start and end date.');
    }
    return $date;
}

function findPromo(PDO $db, string $code, string $startValue): ?array
{
    $code = strtoupper(trim($code));
    if ($code === '') return null;
    if (strlen($code) > 64) throw new InvalidArgumentException('Invalid promo code.');
    $query = $db->prepare('SELECT * FROM promo_codes WHERE code = ? LIMIT 1');
    $query->execute([$code]);
    $promo = $query->fetch(PDO::FETCH_ASSOC);
    $bookingDate = parseBookingDate($startValue)->format('Y-m-d');
    if (!$promo || !$promo['is_active']) throw new InvalidArgumentException('This promo code is invalid or inactive.');
    if ($promo['valid_from'] && $bookingDate < $promo['valid_from']) {
        throw new InvalidArgumentException('This promo code requires a booking start date on or after ' . $promo['valid_from'] . '.');
    }
    if ($promo['valid_until'] && $bookingDate > $promo['valid_until']) {
        throw new InvalidArgumentException('This promo code requires a booking start date on or before ' . $promo['valid_until'] . '.');
    }
    return $promo;
}

function calculate(string $startValue, string $endValue, float $rate, array $extras, ?array $promo): array
{
    $start = parseBookingDate($startValue);
    $end = parseBookingDate($endValue);
    $minutes = ($end->getTimestamp() - $start->getTimestamp()) / 60;
    if ($minutes <= 0 || $rate <= 0) throw new InvalidArgumentException('Please select a valid start and end date.');
    // Match the booking form: 2 hours grace, up to 8 hours half a day.
    $remaining = $minutes % 1440;
    $days = max(1, floor($minutes / 1440) + ($remaining <= 120 ? 0 : ($remaining <= 480 ? 0.5 : 1)));
    $prices = ['Body Wash & Vacuum' => 1000, 'Shuttle One Way' => 500, 'Shuttle Two Way' => 1000];
    $extras = array_values(array_unique($extras));
    $extrasTotal = 0;
    $shuttleSavings = 0;
    $shuttles = 0;
    foreach ($extras as $extra) {
        if (!is_string($extra) || !isset($prices[$extra])) throw new InvalidArgumentException('Invalid extra service.');
        $extrasTotal += $prices[$extra];
        if (strpos($extra, 'Shuttle ') === 0) {
            $shuttles++;
            if ($promo && $promo['free_shuttle']) $shuttleSavings += $prices[$extra];
        }
    }
    if ($shuttles > 1) throw new InvalidArgumentException('Select only one shuttle option.');
    $parking = round($days * $rate, 2);
    $discount = $promo ? ($promo['discount_type'] === 'percentage' ? $parking * (float)$promo['amount'] / 100 : (float)$promo['amount']) : 0;
    $discount = round(min($parking, max(0, $discount)), 2);
    return [
        'days' => $days, 'price_per_day' => $rate, 'parking_subtotal' => $parking,
        'extras_total' => $extrasTotal, 'subtotal' => round($parking + $extrasTotal, 2),
        'promo_code' => $promo['code'] ?? null, 'promo_discount' => $discount,
        'shuttle_discount' => $shuttleSavings,
        'total' => round($parking - $discount + $extrasTotal - $shuttleSavings, 2),
    ];
}

function quote(PDO $db, array $data): array
{
    $promo = findPromo($db, (string)($data['promoCode'] ?? ''), (string)($data['startDate'] ?? ''));
    $rate = (float)$db->query('SELECT price FROM per_day_rates ORDER BY id DESC LIMIT 1')->fetchColumn();
    $extras = $data['extras'] ?? [];
    if (!is_array($extras)) throw new InvalidArgumentException('Invalid extra services.');
    return calculate((string)($data['startDate'] ?? ''), (string)($data['endDate'] ?? ''), $rate, $extras, $promo);
}
