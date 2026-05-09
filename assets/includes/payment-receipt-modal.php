<?php
session_start();
require_once __DIR__ . '/db_connect.php';

$id = $_GET['id'] ?? null;
if (!$id) exit('Invalid request');

try {
    $stmt = $conn->prepare("SELECT * FROM reserved_slots WHERE id = ?");
    $stmt->execute([$id]);
    $b = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$b) exit('Booking not found');
} catch (PDOException $e) {
    exit('Database error');
}

$originalEnd = $b['end_date'] ?? null;
$editedEndDb = !empty($b['end_date_edited']) ? $b['end_date_edited'] : null;

$baseTotalPrice = (float)($b['total_price'] ?? 0);
$finalTotalPrice = isset($b['total_price_final']) && $b['total_price_final'] !== null
    ? (float)$b['total_price_final']
    : $baseTotalPrice;

$lateFeePercentDb = (int)($b['late_fee_percent'] ?? 0);
$lateFeeAmountDb  = (float)($b['late_fee_amount'] ?? 0);

$lastReceipt = null;
$totalPaidSoFar = 0;

try {
    $receiptStmt = $conn->prepare("
        SELECT *
        FROM payment_receipts
        WHERE reserved_slot_id = ?
        ORDER BY id DESC
        LIMIT 1
    ");
    $receiptStmt->execute([$b['id']]);
    $lastReceipt = $receiptStmt->fetch(PDO::FETCH_ASSOC);

    $paidStmt = $conn->prepare("
        SELECT COALESCE(SUM(payment_amount), 0) AS total_paid
        FROM payment_receipts
        WHERE reserved_slot_id = ?
    ");
    $paidStmt->execute([$b['id']]);
    $paidRow = $paidStmt->fetch(PDO::FETCH_ASSOC);
    $totalPaidSoFar = (float)($paidRow['total_paid'] ?? 0);
} catch (PDOException $e) {
    $lastReceipt = null;
    $totalPaidSoFar = 0;
}

function toDatetimeLocal($dt) {
    if (!$dt) return '';
    $ts = strtotime(str_replace('/', '-', $dt));
    if (!$ts) return '';
    return date('Y-m-d\TH:i', $ts);
}

$canGenerateReceiptTime = false;

if (!empty($b['end_date'])) {

    $endTimestamp = strtotime($b['end_date']);
    $nowTimestamp = time();

    $before24Hours = $endTimestamp - (24 * 60 * 60);

    if ($nowTimestamp >= $before24Hours) {
        $canGenerateReceiptTime = true;
    }
}
?>

<div class="modal-header">
    <h5 class="modal-title fw-bold">Generate Payment Receipt - <?= htmlspecialchars($b['reference_number']) ?></h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">
    <div class="row g-3">
        <div class="col-md-4">
            <label class="form-label fw-bold">Customer Name</label>
            <input type="text" class="form-control" value="<?= htmlspecialchars($b['name'] ?? '') ?>" readonly>
        </div>

        <div class="col-md-4">
            <label class="form-label fw-bold">Contact Number</label>
            <input type="text" class="form-control" value="<?= htmlspecialchars($b['whatsapp_number'] ?? '') ?>" readonly>
        </div>

        <div class="col-md-4">
            <label class="form-label fw-bold">Vehicle Number</label>
            <input type="text" class="form-control" value="<?= htmlspecialchars($b['vehicle_number'] ?? '') ?>" readonly>
        </div>

        <div class="col-md-4">
            <label class="form-label fw-bold">Original Total Price (LKR)</label>
            <input type="text" class="form-control" value="<?= number_format($baseTotalPrice, 2, '.', '') ?>" readonly>
        </div>

        <div class="col-md-4">
            <label class="form-label fw-bold">Already Paid (LKR)</label>
            <input type="text" class="form-control" id="already_paid_amount" value="<?= number_format($totalPaidSoFar, 2, '.', '') ?>" readonly>
        </div>

        <div class="col-md-4">
            <label class="form-label fw-bold">New End Date/Time</label>
            <input
                type="datetime-local"
                class="form-control"
                id="receipt_edited_end_date"
                value="<?= htmlspecialchars(toDatetimeLocal($editedEndDb ?: $originalEnd)) ?>"
                data-original-end="<?= htmlspecialchars($originalEnd ?? '') ?>"
            >
            <?php if ($editedEndDb): ?>
                <small class="text-success">
                    Previously edited on: <?= htmlspecialchars($b['end_date_edited_at'] ?? '') ?>
                </small>
            <?php else: ?>
                <small class="text-muted">Grace period: 2 hours. After that, surcharge applies.</small>
            <?php endif; ?>
        </div>

        <div class="col-md-4">
            <label class="form-label fw-bold">Updated Total Price (LKR)</label>
            <input
                type="text"
                class="form-control"
                id="receipt_updated_total_price"
                value="<?= number_format($finalTotalPrice, 2, '.', '') ?>"
                readonly
            >
            <small class="text-muted" id="receipt_late_fee_label">
                <?php if ($editedEndDb && ($lateFeePercentDb > 0 || $lateFeeAmountDb > 0)): ?>
                    Late surcharge: <?= (int)$lateFeePercentDb ?>% (LKR <?= number_format($lateFeeAmountDb, 2) ?>)
                <?php elseif ($editedEndDb): ?>
                    Within grace period (0% surcharge).
                <?php endif; ?>
            </small>
        </div>

        <div class="col-md-4">
            <label class="form-label fw-bold">Balance to Collect (LKR)</label>
            <input type="text" class="form-control" id="receipt_balance_amount" readonly>
        </div>

        <div class="col-md-4 d-flex align-items-end">
            <div class="w-100">
               <button
                    type="button"
                    class="btn <?= $canGenerateReceiptTime ? 'btn-success' : 'btn-secondary' ?> w-100"
                    id="confirmGenerateReceiptBtn"
                    <?= $canGenerateReceiptTime ? '' : 'disabled' ?>
                >
                    <?= $canGenerateReceiptTime ? 'Generate Payment Receipt' : 'Available 24 Hours Before End Time' ?>
                </button>

                <small id="receiptStatusText" class="fw-bold mt-2 d-block <?= $lastReceipt ? 'text-success' : 'd-none' ?>">
                    <?php if ($lastReceipt): ?>
                        Receipt generated for Rs. <?= number_format((float)$lastReceipt['payment_amount'], 2) ?>
                    <?php endif; ?>
                </small>
            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
</div>

<script>
(function () {
    const bookingId = <?= (int)$b['id'] ?>;
    const canGenerateReceiptTime = <?= $canGenerateReceiptTime ? 'true' : 'false' ?>;
    const baseTotalPrice = <?= json_encode((float)$baseTotalPrice) ?>;
    let totalPaidSoFar = <?= json_encode((float)$totalPaidSoFar) ?>;

    const $editedEndDate = $('#receipt_edited_end_date');
    const $updatedTotalPrice = $('#receipt_updated_total_price');
    const $balanceAmount = $('#receipt_balance_amount');
    const $lateFeeLabel = $('#receipt_late_fee_label');
    const $generateBtn = $('#confirmGenerateReceiptBtn');
    const $statusText = $('#receiptStatusText');

    let originalEndDate = $editedEndDate.val();
    let originalPrice = normalizeAmount($updatedTotalPrice.val());

    function normalizeAmount(val) {
        return parseFloat(String(val || '').replace(/,/g, '').trim()) || 0;
    }

    function parseDbDate(str) {
        if (!str) return null;
        const normalized = String(str).replace(/\//g, '-').replace(' ', 'T');
        const dt = new Date(normalized);
        return isNaN(dt.getTime()) ? null : dt;
    }

    function getSurchargePercent(lateMinutesAfterGrace) {
        if (lateMinutesAfterGrace <= 0) return 0;
        if (lateMinutesAfterGrace <= 120) return 25;
        if (lateMinutesAfterGrace <= 240) return 50;
        if (lateMinutesAfterGrace <= 360) return 75;
        return 100;
    }

    function updateBalance() {
        const updatedTotal = normalizeAmount($updatedTotalPrice.val());
        const balance = updatedTotal - totalPaidSoFar;
        $balanceAmount.val(balance > 0 ? balance.toFixed(2) : '0.00');
    }

    function checkForChanges() {
        if (!canGenerateReceiptTime) {
            $generateBtn
                .prop('disabled', true)
                .text('Available 24 Hours Before End Time')
                .removeClass('btn-success')
                .addClass('btn-secondary');

            return;
        }

        const currentEndDate = $editedEndDate.val();
        const currentPrice = normalizeAmount($updatedTotalPrice.val());

        if (currentEndDate !== originalEndDate || currentPrice !== originalPrice) {
            $generateBtn
                .prop('disabled', false)
                .text('Generate Payment Receipt')
                .removeClass('btn-secondary')
                .addClass('btn-success');

            $statusText.addClass('d-none').text('');
        }
    }

    function recalcPricePreview() {
        const editedVal = $editedEndDate.val();
        const originalDb = $editedEndDate.attr('data-original-end');

        if (!editedVal || !originalDb) {
            $updatedTotalPrice.val(baseTotalPrice.toFixed(2));
            $lateFeeLabel.text('');
            updateBalance();
            checkForChanges();
            return;
        }

        const originalEnd = parseDbDate(originalDb);
        const editedEnd = new Date(editedVal);

        if (!originalEnd || isNaN(originalEnd.getTime()) || isNaN(editedEnd.getTime())) {
            $updatedTotalPrice.val(baseTotalPrice.toFixed(2));
            $lateFeeLabel.text('Invalid date format.');
            updateBalance();
            checkForChanges();
            return;
        }

        const graceMs = 2 * 60 * 60 * 1000;
        const graceEnd = new Date(originalEnd.getTime() + graceMs);

        const diffMs = editedEnd.getTime() - graceEnd.getTime();
        const lateMinutesAfterGrace = Math.ceil(diffMs / (60 * 1000));

        const pct = getSurchargePercent(lateMinutesAfterGrace);
        const lateFee = baseTotalPrice * (pct / 100);
        const updated = baseTotalPrice + lateFee;

        $updatedTotalPrice.val(updated.toFixed(2));

        if (pct === 0) {
            $lateFeeLabel.text('Within grace period (0% surcharge).');
        } else {
            $lateFeeLabel.text(`Late surcharge: ${pct}% (LKR ${lateFee.toFixed(2)})`);
        }

        updateBalance();
        checkForChanges();
    }

    $editedEndDate.off('change.paymentReceipt input.paymentReceipt').on('change.paymentReceipt input.paymentReceipt', function () {
        recalcPricePreview();
    });

    $generateBtn.off('click.paymentReceipt').on('click.paymentReceipt', function () {
        const updatedTotal = normalizeAmount($updatedTotalPrice.val());
        const balance = updatedTotal - totalPaidSoFar;

        if (balance <= 0) {
            alert('No balance amount to collect.');
            return;
        }

        const ok = confirm(
            `Already paid: Rs. ${totalPaidSoFar.toFixed(2)}\n` +
            `Updated total: Rs. ${updatedTotal.toFixed(2)}\n` +
            `Balance to collect: Rs. ${balance.toFixed(2)}\n\n` +
            `Generate receipt?`
        );

        if (!ok) return;

        $.ajax({
            url: 'assets/includes/generate_receipt.php',
            type: 'POST',
            dataType: 'json',
            data: {
                id: bookingId,
                amount: balance,
                updated_total_price: updatedTotal,
                edited_end_date: $editedEndDate.val()
            },
            success: function (res) {
                if (res.success) {
                    const collected = parseFloat(res.balance_amount || balance) || 0;

                    totalPaidSoFar += collected;
                    $('#already_paid_amount').val(totalPaidSoFar.toFixed(2));
                    updateBalance();

                    $statusText
                        .removeClass('d-none')
                        .addClass('text-success')
                        .text(`Receipt generated for Rs. ${collected.toFixed(2)}`);

                    $generateBtn
                        .prop('disabled', true)
                        .text('Paid')
                        .removeClass('btn-success')
                        .addClass('btn-secondary');

                    originalEndDate = $editedEndDate.val();
                    originalPrice = normalizeAmount($updatedTotalPrice.val());

                    const modalEl = document.getElementById('paymentReceiptModal');
                    const modalInstance = bootstrap.Modal.getInstance(modalEl);
                    if (modalInstance) {
                        modalInstance.hide();
                    }

                    window.open(`cash_receipt.php?receipt_id=${res.receipt_id}`, '_blank');
                } else {
                    alert(res.message || 'Failed to generate receipt.');
                }
            },
            error: function () {
                alert('Server error while generating receipt.');
            }
        });
    });

    recalcPricePreview();
})();
</script>