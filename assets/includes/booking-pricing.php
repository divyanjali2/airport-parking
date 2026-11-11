<?php
namespace AirportBookingPricing;

use DateTimeImmutable;
use DateTimeZone;
use InvalidArgumentException;
use PDO;

function findPromo(PDO $db, string $code, ?DateTimeImmutable $now = null): ?array
{
    $code = strtoupper(trim($code));
    if ($code === '') return null;
    if (strlen($code) > 64) throw new InvalidArgumentException('Invalid promo code.');
    $query = $db->prepare('SELECT * FROM promo_codes WHERE code = ? LIMIT 1');
    $query->execute([$code]);
    $promo = $query->fetch(PDO::FETCH_ASSOC);
    $today = ($now ?? new DateTimeImmutable('now', new DateTimeZone('Asia/Colombo')))->format('Y-m-d');
    if (!$promo || !$promo['is_active']) throw new InvalidArgumentException('This promo code is invalid or inactive.');
    if ($promo['valid_from'] && $today < $promo['valid_from']) {
        throw new InvalidArgumentException('This promo code is valid from ' . $promo['valid_from'] . '.');
    }
    if ($promo['valid_until'] && $today > $promo['valid_until']) {
        throw new InvalidArgumentException('This promo code has expired.');
    }
    return $promo;
}

function calculate(string $startValue, string $endValue, float $rate, array $extras, ?array $promo): array
{
    $zone = new DateTimeZone('Asia/Colombo');
    $parse = static function (string $value) use ($zone): DateTimeImmutable {
        $date = DateTimeImmutable::createFromFormat('!Y-m-d\TH:i', $value, $zone);
        if (!$date || $date->format('Y-m-d\TH:i') !== $value) {
            throw new InvalidArgumentException('Please select valid booking dates.');
        }
        return $date;
    };
    $start = $parse($startValue);
    $end = $parse($endValue);
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
    $promo = findPromo($db, (string)($data['promoCode'] ?? ''));
    $rate = (float)$db->query('SELECT price FROM per_day_rates ORDER BY id DESC LIMIT 1')->fetchColumn();
    $extras = $data['extras'] ?? [];
    if (!is_array($extras)) throw new InvalidArgumentException('Invalid extra services.');
    return calculate((string)($data['startDate'] ?? ''), (string)($data['endDate'] ?? ''), $rate, $extras, $promo);
}
