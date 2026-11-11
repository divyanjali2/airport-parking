<?php
header('Content-Type: application/json');
header('Cache-Control: no-store');
require_once __DIR__ . '/../assets/includes/db_connect.php';
require_once __DIR__ . '/../assets/includes/booking-pricing.php';

try {
    $promo = \AirportBookingPricing\findPromo($conn, (string)($_POST['code'] ?? ''));
    if (!$promo) throw new InvalidArgumentException('Please enter a promo code.');
    echo json_encode(['success' => true, 'promo' => [
        'code' => $promo['code'], 'name' => $promo['name'],
        'discount_type' => $promo['discount_type'], 'amount' => (float)$promo['amount'],
        'free_shuttle' => (bool)$promo['free_shuttle'],
    ]]);
} catch (InvalidArgumentException $error) {
    http_response_code(422);
    echo json_encode(['success' => false, 'message' => $error->getMessage()]);
} catch (Throwable $error) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Unable to validate the promo code. Please try again.']);
}
