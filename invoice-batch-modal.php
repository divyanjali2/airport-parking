<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    exit('<div class="alert alert-danger">Unauthorized access.</div>');
}

if (empty($_GET['batch_id'])) {
    exit('<div class="alert alert-warning">Invalid batch ID.</div>');
}

$batchId = trim($_GET['batch_id']);

try {
    $stmt = $conn->prepare("
        SELECT 
            si.id,
            si.batch_id,
            si.reserved_slot_id,
            si.reference_number,
            si.invoice_amount,
            si.batch_total_amount,
            si.sent_at,
            si.sent_by,
            rs.total_price,
            rs.total_price_final,
            rs.late_fee_percent,
            rs.late_fee_amount
        FROM sent_invoices si
        INNER JOIN reserved_slots rs ON rs.id = si.reserved_slot_id
        WHERE si.batch_id = :batch_id
        ORDER BY si.id ASC
    ");
    $stmt->execute([':batch_id' => $batchId]);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!$rows) {
        exit('<div class="alert alert-info">No records found for this batch.</div>');
    }

    $batchTotal = $rows[0]['batch_total_amount'];
    $sentAt = $rows[0]['sent_at'];
    ?>

    <div class="mb-3">
        <div><strong>Batch ID:</strong> <?= htmlspecialchars($batchId) ?></div>
        <div><strong>Uploaded Date & Time:</strong> <?= date('d M Y h:i A', strtotime($sentAt)) ?></div>
        <div><strong>Total Amount:</strong> LKR <?= number_format((float)$batchTotal, 2) ?></div>
        <div><strong>Invoice Count:</strong> <?= count($rows) ?></div>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle mb-0">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Reference Number</th>
                    <th>Invoice Amount (LKR)</th>
                    <th>Received At</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($rows as $i => $row): ?>
                    <tr>
                        <td><?= $i + 1 ?></td>
                        <td><?= htmlspecialchars($row['reference_number']) ?></td>
                        <td>
                            <?php if (!empty($row['total_price_final']) && (float)$row['total_price_final'] > 0): ?>
                                <div><strong>LKR <?= number_format((float)$row['total_price_final'], 2) ?></strong></div>
                                <small class="text-muted d-block">
                                    Late Fee: <?= number_format((float)$row['late_fee_percent'], 2) ?>%
                                </small>
                                <small class="text-muted d-block">
                                    Late Fee Amount: LKR <?= number_format((float)$row['late_fee_amount'], 2) ?>
                                </small>
                            <?php else: ?>
                                <div><strong>LKR <?= number_format((float)$row['total_price'], 2) ?></strong></div>
                            <?php endif; ?>
                        </td>
                        <td><?= date('d M Y h:i A', strtotime($row['sent_at'])) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <?php
} catch (PDOException $e) {
    echo '<div class="alert alert-danger">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>';
}