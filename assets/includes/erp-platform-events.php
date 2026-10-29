<?php

namespace AirportErpEvents;

use RuntimeException;
use Throwable;

// The installer fills this with the chosen private configuration path.
const CONFIG_PATH = '';

// Included by the booking handler; this file is not a public API endpoint.
if (realpath($_SERVER['SCRIPT_FILENAME'] ?? '') === __FILE__) {
    http_response_code(404);
    exit;
}

function sendEvent(string $url, string $token, array $payload): array
{
    $curl = curl_init($url);
    curl_setopt_array($curl, [
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => json_encode($payload, JSON_THROW_ON_ERROR),
        CURLOPT_HTTPHEADER => ['Authorization: Bearer '.$token, 'Content-Type: application/json', 'Accept: application/json'],
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CONNECTTIMEOUT => 2,
        CURLOPT_TIMEOUT => 5,
        CURLOPT_FOLLOWLOCATION => false,
    ]);
    $body = curl_exec($curl);
    $status = (int) curl_getinfo($curl, CURLINFO_HTTP_CODE);
    $curlError = curl_errno($curl);
    curl_close($curl);
    $response = is_string($body) ? json_decode($body, true) : null;
    $ok = in_array($status, [200, 201], true) && is_array($response)
        && isset($response['id']) && is_numeric($response['id']) && isset($response['created']) && is_bool($response['created']);

    // Log only numeric transport details, never headers, tokens, or response bodies.
    $error = $curlError !== 0 ? 'ERP connection failed (cURL code '.$curlError.').' :
        ($status ? 'ERP returned HTTP '.$status.($ok ? '' : ' without a valid acknowledgement.') : 'ERP connection failed.');

    return ['ok' => $ok, 'error' => $ok ? null : $error, 'http_status' => $status, 'curl_code' => $curlError];
}

function notifyBooking(string $bookingId, string $reference, ?array $config = null, ?callable $transport = null): bool
{
    $failure = 'Configuration could not be loaded.';
    try {
        if ($config === null) {
            $path = getenv('AIRPORT_ERP_EVENTS_CONFIG') ?: (CONFIG_PATH !== '' ? CONFIG_PATH : (PHP_OS_FAMILY === 'Windows'
                ? 'C:/xampp/airport-erp-bridge/config.php'
                : dirname(__DIR__, 3).'/private/airport-erp-config.php'));
            if (!is_file($path)) {
                $failure = 'Configuration file is missing.';
                throw new RuntimeException('Configuration missing.');
            }
            if (!is_readable($path)) {
                $failure = 'Configuration file is not readable by PHP.';
                throw new RuntimeException('Configuration unreadable.');
            }
            $config = require $path;
        }
        $failure = 'Invalid endpoint, token, or booking ID/reference.';
        $url = $config['endpoint'] ?? '';
        $parts = parse_url($url);
        if (!is_array($parts) || !isset($parts['host'], $parts['scheme'])
            || ($parts['scheme'] !== 'https' && !($parts['scheme'] === 'http' && in_array($parts['host'], ['127.0.0.1', 'localhost', '::1'], true)))
            || isset($parts['user']) || isset($parts['pass']) || strlen($config['token'] ?? '') < 32
            || $bookingId === '' || $reference === '') {
            throw new RuntimeException('Invalid notification configuration or booking.');
        }
        $failure = 'Transport failed; check PHP cURL availability and server connectivity.';
        $transport ??= __NAMESPACE__.'\\sendEvent';
        $result = $transport($url, $config['token'], [
            'source_booking_id' => $bookingId,
            'event_type' => 'booking.created',
            'booking_reference' => $reference,
        ]);
        if (!($result['ok'] ?? false)) {
            // Never log arbitrary transport error strings, which could contain secrets.
            $failure = 'Delivery was not acknowledged';
            if (isset($result['http_status']) && is_int($result['http_status'])) {
                $failure .= '; HTTP '.$result['http_status'];
            }
            if (isset($result['curl_code']) && is_int($result['curl_code'])) {
                $failure .= '; cURL code '.$result['curl_code'];
            }
            $failure .= '.';
            throw new RuntimeException('Delivery was not acknowledged.');
        }
        return true;
    } catch (Throwable $error) {
        // Do not expose tokens, customer details, or HTTP errors in the booking response.
        error_log('[airport-erp] Booking saved, but ERP notification failed. '.$failure);
        return false;
    }
}

/** Register only after the booking INSERT succeeds. No network request runs here. */
function deferBooking(string $bookingId, string $reference, ?array $config = null, ?callable $transport = null): void
{
    // A disconnected browser must not cancel delivery of an already saved booking.
    ignore_user_abort(true);
    register_shutdown_function(static function () use ($bookingId, $reference, $config, $transport): void {
        finishBookingResponse();
        notifyBooking($bookingId, $reference, $config, $transport);
    });
}

function finishBookingResponse(): void
{
    // Release the session lock before the browser makes its next request.
    if (session_status() === PHP_SESSION_ACTIVE) {
        session_write_close();
    }
    if (function_exists('fastcgi_finish_request')) {
        fastcgi_finish_request();
        return;
    }
    if (function_exists('litespeed_finish_request')) {
        litespeed_finish_request();
        return;
    }
    // Apache/XAMPP fallback: send the complete buffered JSON with its length.
    // A reverse proxy may still buffer it; PHP-FPM is preferred on live hosting.
    $body = '';
    while (ob_get_level() > 0) {
        $chunk = ob_get_clean();
        if ($chunk === false) {
            break;
        }
        $body = $chunk.$body;
    }
    if (PHP_SAPI !== 'cli' && !headers_sent() && !zlib_get_coding_type()) {
        header('Content-Length: '.strlen($body));
        header('Connection: close');
    }
    echo $body;
    flush();
}
