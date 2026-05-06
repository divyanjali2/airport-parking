<?php
require_once __DIR__ . '/db_connect.php';

$bookingId = $_GET['booking_id'] ?? null;
if (!$bookingId) exit('Invalid booking');

function makeFileUrl($path) {
    if (!$path) return null;

    $path = str_replace('\\', '/', $path);

    if (preg_match('#^https?://#i', $path)) return $path;

    // Strip document root if present
    $docRoot = str_replace('\\', '/', $_SERVER['DOCUMENT_ROOT'] ?? '');
    if ($docRoot && strpos($path, $docRoot) === 0) {
        $path = substr($path, strlen($docRoot));
    }

    $project = explode('/', trim($_SERVER['SCRIPT_NAME'], '/'))[0] ?? '';

    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';

    return $protocol . '://' . $_SERVER['HTTP_HOST'] . '/' . $project . '/' . ltrim($path, '/');
}

try {
    $stmt = $conn->prepare("
        SELECT receipt_no, receipt_path, payment_amount, generated_at
        FROM payment_receipts
        WHERE reserved_slot_id = ?
        AND receipt_path IS NOT NULL
        ORDER BY generated_at DESC, id DESC
    ");
    $stmt->execute([$bookingId]);
    $receipts = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    exit('Database error');
}
?>

<table class="receipt-list-table">
    <thead>
        <tr>
            <th>#</th>
            <th>Receipt No</th>
            <th>Amount</th>
            <th>Date</th>
            <th>PDF</th>
        </tr>
    </thead>
    <tbody>
        <?php if (!empty($receipts)): ?>
            <?php foreach ($receipts as $i => $r): ?>
                <?php $pdf = makeFileUrl($r['receipt_path']); ?>
                <tr>
                    <td><?= $i + 1 ?></td>
                    <td><?= htmlspecialchars($r['receipt_no']) ?></td>
                    <td>LKR <?= number_format((float)$r['payment_amount'], 2) ?></td>
                    <td><?= !empty($r['generated_at']) ? date('d M Y h:i A', strtotime($r['generated_at'])) : '' ?></td>
                    <td>
                        <a href="<?= htmlspecialchars($pdf) ?>" target="_blank" class="small-btn receipt-btn">
                            Open PDF
                        </a>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="5" style="text-align:center;">No receipts found.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>