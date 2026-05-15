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

$fields = [
    'name' => 'Customer',
    'email' => 'Email',
    'whatsapp_number' => 'WhatsApp',
    'vehicle_type' => 'Vehicle',
    'start_date' => 'Start Date',
    'end_date' => 'End Date',
    'total_price' => 'Total Price (LKR)',
    'receiver_name' => 'Receiver Name',
    'passenger_count' => 'Passenger Count',
    'vehicle_number' => 'Vehicle Number',
    'flight_number' => 'Flight',
];

$airTicket = !empty($b['air_ticket_image_url']) ? $b['air_ticket_image_url'] : null;
$passportCopy = !empty($b['passport_copy_image_url']) ? $b['passport_copy_image_url'] : null;

function toWebPath($path) {

    if (!$path) return null;

    // already full URL
    if (preg_match('#^https?://#i', $path)) {
        return $path;
    }

    $path = str_replace('\\', '/', $path);
    $path = ltrim($path, '/');

    return 'http://' . $_SERVER['HTTP_HOST'] . '/' . $path;
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
    <h5 class="fw-bold modal-title">
        Edit Booking - <?= htmlspecialchars($b['reference_number']) ?>
    </h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">

    <!-- VEHICLE + FLIGHT -->
    <div class="row g-3">
        <?php foreach ($fields as $k => $label): ?>
            <div class="col-md-3">
                <label class="form-label"><?= htmlspecialchars($label) ?></label>

                <?php if (in_array($k, ['vehicle_number', 'flight_number'])): ?>
                    <!-- editable fields -->
                    <input class="form-control" id="<?= $k ?>" value="<?= htmlspecialchars($b[$k] ?? '') ?>">

                <?php else: ?>
                    <!-- all other fields disabled -->
                    <input class="form-control" value="<?= htmlspecialchars($b[$k] ?? '') ?>" disabled>
                <?php endif; ?>
            </div>
        <?php endforeach; ?>

        <div class="col-12 text-end mt-2">
            <button class="btn btn-success" id="saveTransport" data-id="<?= $b['id'] ?>">
                Save Vehicle & Flight
            </button>
        </div>
    </div>

    <hr>

    <!-- AIR TICKET -->
    <div class="row">
        <div class="col-6">
            <label class="fw-bold">Air Ticket</label><br>

            <?php if ($airTicket): ?>
                <img src="<?= htmlspecialchars(toWebPath($airTicket)) ?>" style="height:120px;">
            <?php else: ?>
                <p>No Air Ticket</p>
            <?php endif; ?>

            <input type="file" id="air_ticket_image" class="form-control mt-2" accept="image/*">

            <button class="btn btn-primary mt-2" id="saveAirTicket" data-id="<?= $b['id'] ?>">
                Update Air Ticket
            </button>
        </div>

        <div class="col-6">
            <label class="fw-bold">Passport Copy</label><br>
            <?php if ($passportCopy): ?>
                <img src="<?= htmlspecialchars(toWebPath($passportCopy)) ?>" style="height:120px;">
            <?php else: ?>
                <p>N/A</p>
            <?php endif; ?>
        </div>
    </div>

    <hr>

    <!-- METER -->
   <div class="row g-3">
        <div class="col-md-6 col-lg-3">
            <label class="form-label fw-bold">Meter Reading (km) <span class="text-danger">*</span></label>
            <input type="number" class="form-control" id="meter_reading" value="<?= htmlspecialchars($b['meter_reading'] ?? '') ?>" placeholder="Enter meter reading" required >
        </div>

        <div class="col-md-6 col-lg-3">
            <label class="form-label fw-bold">New End Date/Time</label>
            <input type="datetime-local" class="form-control" id="edited_end_date" value="<?= htmlspecialchars(toDatetimeLocal($editedEndDb ?: $originalEnd)) ?>" data-original-end="<?= htmlspecialchars($originalEnd ?? '') ?>" data-existing-edited="<?= htmlspecialchars($editedEndDb ?? '') ?>" >
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
            <input type="text" class="form-control" id="updated_total_price" value="<?= htmlspecialchars(number_format($finalTotalPrice, 2, '.', '')) ?>" readonly >
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
            <input type="file" class="form-control" id="images" name="images[]" multiple accept="image/*">
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
    <button class="btn btn-primary" id="saveRemark" data-id="<?= (int)$b['id'] ?>">Save Remark</button>
    <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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

        function getSurchargePercent(lateMinutes) {

            const lateHours = lateMinutes / 60;

            // 1 - 2 hours = Waived Off
            if (lateHours <= 2) {
                return 0;
            }

            // More than 2 hours up to 8 hours = 50%
            if (lateHours <= 8) {
                return 50;
            }

            // More than 8 hours = Full day charge
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

            if (
                !originalEnd ||
                isNaN(originalEnd.getTime()) ||
                isNaN(editedEnd.getTime())
            ) {

                $updatedTotalPrice.val(baseTotalPrice.toFixed(2));

                $lateFeeLabel.text('Invalid date format.');

                return;
            }

            /*
            |--------------------------------------------------------------------------
            | CALCULATE LATE HOURS
            |--------------------------------------------------------------------------
            */

            const diffMs = editedEnd.getTime() - originalEnd.getTime();

            const lateMinutes = Math.ceil(diffMs / (60 * 1000));

            let surchargePercent = 0;

            // Not late
            if (lateMinutes <= 0) {

                surchargePercent = 0;

            } else {

                const lateHours = lateMinutes / 60;

                // 1 - 2 hours = waived
                if (lateHours <= 2) {

                    surchargePercent = 0;

                }

                // 2 - 8 hours = 50%
                else if (lateHours <= 8) {

                    surchargePercent = 50;

                }

                // More than 8 hours = full day
                else {

                    surchargePercent = 100;
                }
            }

            /*
            |--------------------------------------------------------------------------
            | PRICE CALCULATION
            |--------------------------------------------------------------------------
            */

            const lateFee = baseTotalPrice * (surchargePercent / 100);

            const updatedPrice = baseTotalPrice + lateFee;

            /*
            |--------------------------------------------------------------------------
            | UPDATE UI
            |--------------------------------------------------------------------------
            */

            $updatedTotalPrice.val(updatedPrice.toFixed(2));

            if (surchargePercent === 0) {

                if (lateMinutes > 0) {

                    $lateFeeLabel.text(
                        '1 - 2 hours waived off.'
                    );

                } else {

                    $lateFeeLabel.text(
                        'No late charge.'
                    );
                }

            } else if (surchargePercent === 50) {

                $lateFeeLabel.text(
                    `2 - 8 hours late charge: 50% (LKR ${lateFee.toFixed(2)})`
                );

            } else {

                $lateFeeLabel.text(
                    `More than 8 hours: Full day charge applied (LKR ${lateFee.toFixed(2)})`
                );
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

    $('#saveTransport').on('click', function () {

        $.post('assets/includes/update_booking_fields.php', {
            id: $(this).data('id'),
            vehicle_number: $('#vehicle_number').val(),
            flight_number: $('#flight_number').val()
        }, function (res) {

            if (res.trim() === 'success') {
                location.reload();
            } else {
                alert('Update failed: ' + res);
            }
        });
    });

    $('#saveAirTicket').on('click', function () {

        const id = $(this).data('id');
        const file = $('#air_ticket_image')[0].files[0];

        if (!file) {
            alert('Select image first');
            return;
        }

        let formData = new FormData();
        formData.append('id', id);
        formData.append('air_ticket_image', file);

        $.ajax({
            url: 'assets/includes/update_air_ticket.php',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json', 

            success: function (res) {

                console.log(res);

                if (res.success) {
                    alert('Air Ticket updated successfully');
                    location.reload();
                } else {
                    alert('Update failed: ' + res.message);
                }
            },

            error: function (xhr) {
                console.log(xhr.responseText);
                alert('Server error');
            }
        });
    });
</script>