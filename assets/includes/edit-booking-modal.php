<?php
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

// Fields to display in modal
$fields = [
    'name' => 'Customer',
    'email' => 'Email',
    'whatsapp_number' => 'WhatsApp',
    'slot_number' => 'Slot',
    'vehicle_type' => 'Vehicle',
    'vehicle_number' => 'Vehicle Number',
    'flight_number' => 'Flight',
    'start_date' => 'Start Date',
    'end_date' => 'End Date',
    'total_price' => 'Total Price (LKR)',
    'receiver_name' => 'Receiver Name',
    'passenger_count' => 'Passenger Count'
];

// Show Air Ticket and Passport Copy
$airTicket = !empty($b['air_ticket_image_url']) ? $b['air_ticket_image_url'] : null;
$passportCopy = !empty($b['passport_copy_image_url']) ? $b['passport_copy_image_url'] : null;

function toWebPath($path) {
    if (!$path) return null;

    if (preg_match('#^https?://#i', $path)) {
        return $path;
    }

    $path = str_replace('\\', '/', $path);

    if (isset($_SERVER['DOCUMENT_ROOT']) && strpos($path, $_SERVER['DOCUMENT_ROOT']) === 0) {
        $path = substr($path, strlen($_SERVER['DOCUMENT_ROOT']));
    }

    if (!empty($path) && $path[0] !== '/') {
        $path = '/' . $path;
    }

    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    $baseUrl = $protocol . '://' . $_SERVER['HTTP_HOST'];

    return $baseUrl . $path;
}

function toDatetimeLocal($dt) {
    if (!$dt) return '';
    $ts = strtotime(str_replace('/', '-', $dt));
    if (!$ts) return '';
    return date('Y-m-d\TH:i', $ts);
}

// Price / date values
$originalEnd = $b['end_date'] ?? null;
$editedEndDb = !empty($b['end_date_edited']) ? $b['end_date_edited'] : null;

$baseTotalPrice = (float)($b['total_price'] ?? 0);
$finalTotalPrice = isset($b['total_price_final']) && $b['total_price_final'] !== null
    ? (float)$b['total_price_final']
    : $baseTotalPrice;

$lateFeePercentDb = (int)($b['late_fee_percent'] ?? 0);
$lateFeeAmountDb  = (float)($b['late_fee_amount'] ?? 0);

// Decode images
$images = [];
if (!empty($b['images'])) {
    $decoded = json_decode($b['images'], true);
    if (is_array($decoded)) {
        $images = $decoded;
    }
}
?>

<div class="modal-header">
    <h5 class="fw-bold modal-title">Edit Booking – <?= htmlspecialchars($b['reference_number']) ?></h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">
    <div class="row g-3">
        <?php foreach ($fields as $k => $label): ?>
            <div class="col-md-3">
                <label class="form-label"><?= htmlspecialchars($label) ?></label>
                <input class="form-control" value="<?= htmlspecialchars($b[$k] ?? '') ?>" readonly>
            </div>
        <?php endforeach; ?>
    </div>

    <hr>

    <div class="row">
        <div class="col-6 mt-2">
            <label class="form-label fw-bold">Air Ticket Image</label><br>
            <?php if ($airTicket): ?>
                <a href="<?= htmlspecialchars(toWebPath($airTicket)) ?>" target="_blank">
                    <img src="<?= htmlspecialchars(toWebPath($airTicket)) ?>" style="height:120px; margin-right:5px;" alt="Air Ticket">
                </a>
            <?php else: ?>
                N/A
            <?php endif; ?>
        </div>

        <div class="col-6 mt-2">
            <label class="form-label fw-bold">Passport Copy Image</label><br>
            <?php if ($passportCopy): ?>
                <a href="<?= htmlspecialchars(toWebPath($passportCopy)) ?>" target="_blank">
                    <img src="<?= htmlspecialchars(toWebPath($passportCopy)) ?>" style="height:120px; margin-right:5px;" alt="Passport Copy">
                </a>
            <?php else: ?>
                N/A
            <?php endif; ?>
        </div>
    </div>

    <hr>

    <div class="row g-3">
        <div class="col-md-6 col-lg-3">
            <label class="form-label fw-bold">Meter Reading (km) <span class="text-danger">*</span></label>
            <input
                type="number"
                class="form-control"
                id="meter_reading"
                value="<?= htmlspecialchars($b['meter_reading'] ?? '') ?>"
                placeholder="Enter meter reading"
                required
            >
        </div>

        <div class="col-md-6 col-lg-3">
            <label class="form-label fw-bold">New End Date/Time</label>
            <input
                type="datetime-local"
                class="form-control"
                id="edited_end_date"
                value="<?= htmlspecialchars(toDatetimeLocal($editedEndDb ?: $originalEnd)) ?>"
                data-original-end="<?= htmlspecialchars($originalEnd ?? '') ?>"
                data-existing-edited="<?= htmlspecialchars($editedEndDb ?? '') ?>"
            >
            <?php if ($editedEndDb): ?>
                <small class="text-success">
                    Previously edited on: <?= htmlspecialchars($b['end_date_edited_at'] ?? '') ?>
                </small>
            <?php else: ?>
                <small class="text-muted">
                    Grace period: 2 hours. After that, surcharge applies.
                </small>
            <?php endif; ?>
        </div>

        <div class="col-md-6 col-lg-3">
            <label class="form-label fw-bold">Updated Total Price (LKR)</label>
            <input
                type="text"
                class="form-control"
                id="updated_total_price"
                value="<?= htmlspecialchars(number_format($finalTotalPrice, 2, '.', '')) ?>"
                readonly
            >
            <small class="text-muted" id="late_fee_label">
                <?php if ($editedEndDb && ($lateFeePercentDb > 0 || $lateFeeAmountDb > 0)): ?>
                    Late surcharge: <?= (int)$lateFeePercentDb ?>% (LKR <?= number_format($lateFeeAmountDb, 2) ?>)
                <?php elseif ($editedEndDb): ?>
                    Within grace period (0% surcharge).
                <?php endif; ?>
            </small>
        </div>

        <div class="col-6 col-lg-3">
            <label class="form-label fw-bold">Upload Images <span class="text-danger">*</span></label>
            <input type="file" class="form-control" id="images" name="images[]" multiple accept="image/*" required>
            <small class="text-muted">You can upload 5 or more images.</small>
        </div>

        <?php if (!empty($images)): ?>
            <div class="col-12 mt-2">
                <strong>Existing Images:</strong><br>
                <?php foreach ($images as $img): ?>
                    <?php
                    $img = str_replace('\\', '/', $img);
                    if (isset($_SERVER['DOCUMENT_ROOT']) && strpos($img, $_SERVER['DOCUMENT_ROOT']) === 0) {
                        $img = str_replace($_SERVER['DOCUMENT_ROOT'], '', $img);
                    }
                    if (!empty($img) && $img[0] !== '/') $img = '/' . $img;
                    ?>
                    <img src="<?= htmlspecialchars($img) ?>" style="height:80px; margin-right:5px;" alt="Booking Image">
                <?php endforeach; ?>
            </div>
        <?php endif; ?>

        <div class="col-12">
            <label class="form-label fw-bold">
                Staff Remarks <span id="remarkRequired" class="text-danger d-none">*</span>
            </label>
            <textarea id="edit-remark" class="form-control" rows="4"><?= htmlspecialchars($b['remarks'] ?? '') ?></textarea>
        </div>

        <div class="col-12 mt-3">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="move-to-trash" <?= !empty($b['is_trashed']) ? 'checked' : '' ?>>
                <label class="form-check-label fw-bold" for="move-to-trash">Move to Trash</label>
            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
    <button class="btn btn-primary" id="saveRemark" data-id="<?= (int)$b['id'] ?>">Save Remark</button>
</div>

<script>
(function () {
    const baseTotalPrice = <?= json_encode((float)$baseTotalPrice) ?>;

    const $editedEndDate = $('#edited_end_date');
    const $updatedTotalPrice = $('#updated_total_price');
    const $lateFeeLabel = $('#late_fee_label');
    const $moveToTrash = $('#move-to-trash');
    const $remarkRequired = $('#remarkRequired');
    const $editRemark = $('#edit-remark');

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

    function recalcPricePreview() {
        const editedVal = $editedEndDate.val();
        const originalDb = $editedEndDate.attr('data-original-end');

        if (!editedVal || !originalDb) {
            $updatedTotalPrice.val(baseTotalPrice.toFixed(2));
            $lateFeeLabel.text('');
            return;
        }

        const originalEnd = parseDbDate(originalDb);
        const editedEnd = new Date(editedVal);

        if (!originalEnd || isNaN(originalEnd.getTime()) || isNaN(editedEnd.getTime())) {
            $updatedTotalPrice.val(baseTotalPrice.toFixed(2));
            $lateFeeLabel.text('Invalid date format.');
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
    }

    $moveToTrash.off('change.editTrash').on('change.editTrash', function () {
        if (this.checked) {
            $remarkRequired.removeClass('d-none');
            $editRemark.attr('required', true);
        } else {
            $remarkRequired.addClass('d-none');
            $editRemark.removeAttr('required');
        }
    });

    $editedEndDate.off('change.editEnd input.editEnd').on('change.editEnd input.editEnd', function () {
        recalcPricePreview();
    });

    if ($moveToTrash.is(':checked')) {
        $remarkRequired.removeClass('d-none');
        $editRemark.attr('required', true);
    }

    recalcPricePreview();
})();
</script>