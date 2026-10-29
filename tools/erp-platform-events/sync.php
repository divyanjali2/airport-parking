<?php

// This script runs from CLI only; it never exposes a web endpoint.
namespace AirportErpEvents;

use PDO;
use RuntimeException;
use Throwable;

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
    curl_close($curl);
    $response = is_string($body) ? json_decode($body, true) : null;
    $ok = in_array($status, [200, 201], true) && is_array($response)
        && isset($response['id']) && is_numeric($response['id']) && isset($response['created']) && is_bool($response['created']);

    return ['ok' => $ok, 'error' => $ok ? null : ($status ? 'ERP returned HTTP '.$status : 'ERP connection failed')];
}

function syncPending(PDO $db, string $url, string $token, ?callable $transport = null): array
{
    $transport ??= __NAMESPACE__.'\\sendEvent';
    $query = $db->prepare('SELECT id, booking_id, booking_reference, attempts FROM erp_booking_event_outbox WHERE sent_at IS NULL AND (next_attempt_at IS NULL OR next_attempt_at <= ?) ORDER BY id LIMIT 50');
    $query->execute([gmdate('Y-m-d H:i:s')]);
    $rows = $query->fetchAll(PDO::FETCH_ASSOC);
    $sent = 0;
    $failed = 0;
    foreach ($rows as $row) {
        try {
            $result = $transport($url, $token, [
                'source_booking_id' => (string) $row['booking_id'],
                'event_type' => 'booking.created',
                'booking_reference' => $row['booking_reference'],
            ]);
        } catch (Throwable $error) {
            // Never log credentials or arbitrary HTTP response bodies.
            $result = ['ok' => false, 'error' => 'ERP delivery failed'];
        }
        if ($result['ok']) {
            $update = $db->prepare('UPDATE erp_booking_event_outbox SET sent_at = ?, attempts = attempts + 1, last_error = NULL, next_attempt_at = NULL WHERE id = ? AND sent_at IS NULL');
            $update->execute([gmdate('Y-m-d H:i:s'), $row['id']]);
            $sent++;
        } else {
            $delay = min(3600, 60 * (2 ** min((int) $row['attempts'], 6)));
            $update = $db->prepare('UPDATE erp_booking_event_outbox SET attempts = attempts + 1, last_error = ?, next_attempt_at = ? WHERE id = ? AND sent_at IS NULL');
            $update->execute([substr($result['error'], 0, 255), gmdate('Y-m-d H:i:s', time() + $delay), $row['id']]);
            $failed++;
        }
    }

    return ['sent' => $sent, 'failed' => $failed];
}

function main(): int
{
    if (PHP_SAPI !== 'cli') {
        http_response_code(404);
        return 1;
    }
    $options = getopt('', ['config:']);
    $path = $options['config'] ?? 'C:/xampp/airport-erp-bridge/config.php';
    if (!is_file($path)) {
        throw new RuntimeException('Bridge configuration file is missing.');
    }
    $config = require $path;
    $url = $config['endpoint'] ?? '';
    $parts = parse_url($url);
    if (!is_array($parts) || !isset($parts['host'], $parts['scheme'])
        || ($parts['scheme'] !== 'https' && !($parts['scheme'] === 'http' && in_array($parts['host'], ['127.0.0.1', 'localhost', '::1'], true)))) {
        throw new RuntimeException('Use HTTPS, or HTTP on localhost, for the ERP endpoint.');
    }
    if (strlen($config['token'] ?? '') < 32) {
        throw new RuntimeException('Bridge token must have at least 32 characters.');
    }
    if (!extension_loaded('curl')) {
        throw new RuntimeException('PHP cURL extension is required.');
    }
    $lock = fopen(sys_get_temp_dir().'/airport-erp-events-'.hash('sha256', realpath($path)).'.lock', 'c');
    if (!$lock || !flock($lock, LOCK_EX | LOCK_NB)) {
        return 0;
    }
    try {
        // Reuse Airport Parking's database connection; no ERP database credentials are shared.
        require rtrim($config['airport_root'], '/\\').'/assets/includes/db_connect.php';
        if (!isset($conn) || !$conn instanceof PDO) {
            throw new RuntimeException('Airport database connection is unavailable.');
        }
        $result = syncPending($conn, $url, $config['token']);
        echo gmdate('c').' sent='.$result['sent'].' failed='.$result['failed'].PHP_EOL;
        return $result['failed'] ? 1 : 0;
    } finally {
        flock($lock, LOCK_UN);
        fclose($lock);
    }
}

if (realpath($_SERVER['SCRIPT_FILENAME'] ?? '') === __FILE__) {
    try {
        exit(main());
    } catch (Throwable $error) {
        // Database/HTTP exceptions can contain sensitive connection details.
        fwrite(STDERR, 'Airport ERP bridge failed. Check configuration and database availability.'.PHP_EOL);
        exit(1);
    }
}
