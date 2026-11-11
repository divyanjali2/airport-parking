<?php
// Run with: php tools/install-booking-promotions.php
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
define('MODX_API_MODE', true);
require dirname(__DIR__) . '/index.php';
require dirname(__DIR__) . '/assets/includes/db_connect.php';
$conn->exec(file_get_contents(__DIR__ . '/promo-codes.sql'));
$conn->exec(file_get_contents(__DIR__ . '/booking-promotions.sql'));

$markup = <<<'HTML'
                                    <div class="form-group mt-2">
                                        <label for="promo-code">Promo code (optional)</label>
                                        <div class="d-flex gap-2">
                                            <input type="text" id="promo-code" name="promoCode" maxlength="64" placeholder="Enter promo code" autocomplete="off" aria-describedby="promo-status promo-shuttle-note">
                                            <button type="button" id="apply-promo" class="btn btn-outline-primary">Apply</button>
                                        </div>
                                        <p id="promo-status" role="status" aria-live="polite" class="mb-1"></p>
                                        <p id="promo-shuttle-note" class="small mb-1">To receive free shuttle with an eligible promo code, select Shuttle One Way or Shuttle Two Way above. If no shuttle is selected, free shuttle is not included in your booking.</p>
                                        <p id="promo-savings" role="status" aria-live="polite" class="small mb-1"></p>
                                    </div>
HTML;

$updated = 0;
foreach ($modx->getCollection(\MODX\Revolution\modResource::class) as $resource) {
    $original = $resource->get('content');
    if (strpos($original, "fetch('assets/includes/save-booking.php'") === false) continue;
    if (strpos($original, 'id="promo-code"') !== false) continue;
    $content = str_replace("\r\n", "\n", $original);
    if (strpos($content, 'function getBookingPrice()') === false) {
        throw new RuntimeException('Unrecognized booking form on resource ' . $resource->get('id'));
    }
    $replacements = [
        '                                    <div class="price-summary mt-2">' => $markup . "\n                                    <div class=\"price-summary mt-2\">",
        "<script>\ndocument.addEventListener('DOMContentLoaded', () => {\n    const slots" => "<script src=\"assets/js/booking-promotions.js\"></script>\n<script>\ndocument.addEventListener('DOMContentLoaded', () => {\n    const slots",
        'const totalPrice = chargedDays * PRICE_PER_DAY + extraServicePrice;' => 'const totalPrice = window.AirportBookingPromotions.adjust(chargedDays * PRICE_PER_DAY, extraServicePrice);',
        "    startDateInput.addEventListener('change', calculatePrice);" => "    window.AirportBookingPromotions.init(calculatePrice);\n    startDateInput.addEventListener('change', calculatePrice);",
        '            totalPrice: Math.round(bookingPrice.totalPrice),' => "            totalPrice: bookingPrice.totalPrice,\n            promoCode: window.AirportBookingPromotions.code(),",
        'if (bookingPrice.totalPrice <= 0)' => 'if (bookingPrice.chargedDays <= 0)',
    ];
    foreach ($replacements as $from => $to) {
        if (substr_count($content, $from) !== 1) throw new RuntimeException('Booking form replacement failed on resource ' . $resource->get('id') . ': ' . $from);
        $content = str_replace($from, $to, $content);
    }
    $resource->set('content', $content);
    if (!$resource->save()) throw new RuntimeException('Could not save booking form.');
    echo 'Updated booking form on resource ' . $resource->get('id') . PHP_EOL;
    $updated++;
}
$modx->cacheManager->refresh();
echo "Booking promotions installed; {$updated} form(s) updated.\n";
