<?php
session_start();
require_once __DIR__ . '/db_connect.php';

$id = $_GET['id'] ?? null;
$customerId = $_SESSION['customer_id'] ?? ($_GET['customer_id'] ?? null);

if (!$id || !$customerId) exit('Invalid request');

try {
    $userStmt = $conn->prepare("SELECT email FROM website_customer WHERE id = ?");
    $userStmt->execute([$customerId]);
    $customer = $userStmt->fetch(PDO::FETCH_ASSOC);

    if (!$customer) exit('Customer not found');

    $customerEmail = $customer['email'];

    $stmt = $conn->prepare("
        SELECT *
        FROM reserved_slots
        WHERE id = ?
        AND email = ?
        AND is_trashed = 0
        AND is_no_show = 0
        AND (vehicle_status IS NULL OR vehicle_status != 'completed')
    ");
    $stmt->execute([$id, $customerEmail]);
    $b = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$b) exit('Booking not found or cannot be edited');

} catch (PDOException $e) {
    exit('Database error');
}

function toDatetimeLocal($dt) {
    if (!$dt) return '';
    $ts = strtotime(str_replace('/', '-', $dt));
    return $ts ? date('Y-m-d\TH:i', $ts) : '';
}

$originalEnd = $b['end_date'] ?? null;
$editedEndDb = !empty($b['end_date_edited']) ? $b['end_date_edited'] : null;

$originalEndTs = strtotime(str_replace('/', '-', $originalEnd));
$baseTotalPrice = (float)($b['total_price'] ?? 0);

$finalTotalPrice = isset($b['total_price_final']) && $b['total_price_final'] !== null
    ? (float)$b['total_price_final']
    : $baseTotalPrice;
?>

<style>
.customer-edit-box {
    font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
}

.customer-edit-summary {
    background: #f4f6f8;
    border-left: 4px solid #003272;
    padding: 14px;
    border-radius: 8px;
    margin-bottom: 16px;
}

.customer-edit-summary strong {
    color: #003272;
}

.customer-edit-grid {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 14px;
}

.customer-edit-group {
    margin-bottom: 14px;
}

.customer-edit-group label {
    display: block;
    font-weight: bold;
    color: #003272;
    margin-bottom: 6px;
    font-size: 12px;
}

.customer-edit-group input,
.customer-edit-group textarea {
    width: 100%;
    padding: 11px 12px;
    border: 1px solid #ccd6e0;
    border-radius: 8px;
    outline: none;
    font-size: 14px;
}

.customer-edit-group input:focus,
.customer-edit-group textarea:focus {
    border-color: #003272;
    box-shadow: 0 0 0 3px rgba(0, 50, 114, 0.12);
}

.price-box {
    background: #eef6ff;
    border: 1px solid #cfe5ff;
    border-radius: 10px;
    padding: 14px;
}

.price-box input {
    font-size: 20px;
    font-weight: bold;
    color: #003272;
}

#customer_late_fee_label {
    display: block;
    margin-top: 8px;
    font-weight: bold;
}

.text-success {
    color: #198754;
}

.text-warning {
    color: #b45309;
}

.customer-save-btn {
    background: #003272;
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 11px 18px;
    cursor: pointer;
    font-weight: bold;
}

.customer-save-btn:hover {
    background: #001f47;
}

@media (max-width: 700px) {
    .customer-edit-grid {
        grid-template-columns: 1fr;
    }
}
</style>

<div class="customer-edit-box">
    <div class="customer-edit-summary">
        <strong>Reference:</strong> <?= htmlspecialchars($b['reference_number']) ?><br>
        <strong>Current End Date:</strong> <?= htmlspecialchars($b['end_date']) ?><br>
        <strong>Base Total:</strong> LKR <?= number_format($baseTotalPrice, 2) ?>
    </div>

    <div class="customer-edit-grid">
        <div class="customer-edit-group">
            <label>New End Date/Time</label>
            <input
                type="datetime-local"
                id="customer_edited_end_date"
                value="<?= htmlspecialchars(toDatetimeLocal($editedEndDb ?: $originalEnd)) ?>"
            >
        </div>

        <div class="customer-edit-group price-box">

            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px;">

                <div>
                    <label>Base Price (LKR)</label>
                    <input type="text" value="<?= number_format($baseTotalPrice, 2, '.', '') ?>" readonly>
                </div>

                <div>
                    <label>Late Fee (LKR)</label>
                    <input type="text" id="customer_late_fee_amount" value="0.00" readonly>
                </div>

                <div style="grid-column: span 2;">
                    <label>Updated Total Price (LKR)</label>
                    <input type="text" id="customer_updated_total_price" value="<?= number_format($finalTotalPrice, 2, '.', '') ?>" readonly>
                    <small id="customer_late_fee_label"></small>
                </div>

            </div>

        </div>
    </div>

    <div class="customer-edit-group">
        <label>Edit Reason</label>
        <textarea id="customer_edit_reason" rows="3" placeholder="Enter reason for changing end date" required></textarea>
    </div>

    <button type="button" class="customer-save-btn" id="saveCustomerBookingEdit" data-id="<?= (int)$b['id'] ?>" >
        Save Changes
    </button>
</div>

<script>
(function () {
    const baseTotalPrice = <?= json_encode($baseTotalPrice) ?>;
    const originalEndRaw = <?= json_encode($originalEnd ?? '') ?>;

    const originalEndTs = new Date(
        originalEndRaw.replace(/-/g, '/')
    ).getTime();

    const $editedEnd = $("#customer_edited_end_date");
    const $updatedTotal = $("#customer_updated_total_price");
    const $lateLabel = $("#customer_late_fee_label");
    const $lateFeeAmount = $("#customer_late_fee_amount");
    function getSurchargePercent(lateMinutes) {

        const lateHours = lateMinutes / 60;

        // Up to 2 hours = Free
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

        if (!originalEndTs || !$editedEnd.val()) {

            $updatedTotal.val(baseTotalPrice.toFixed(2));

            $lateLabel.text("");

            return;
        }

        const editedEndTs = new Date(
            $editedEnd.val()
        ).getTime();

        if (isNaN(editedEndTs)) {

            $updatedTotal.val(baseTotalPrice.toFixed(2));

            $lateLabel
                .removeClass()
                .addClass("text-warning")
                .text("Invalid date format.");

            return;
        }

        /*
        |--------------------------------------------------------------------------
        | CALCULATE LATE TIME
        |--------------------------------------------------------------------------
        */

        const diffMs = editedEndTs - originalEndTs;

        const diffMinutes = Math.ceil(diffMs / 60000);

        let pct = 0;

        if (diffMinutes > 0) {
            pct = getSurchargePercent(diffMinutes);
        }

        /*
        |--------------------------------------------------------------------------
        | PRICE CALCULATION
        |--------------------------------------------------------------------------
        */

        const lateFee = baseTotalPrice * (pct / 100);

        const updatedTotal = baseTotalPrice + lateFee;

        /*
        |--------------------------------------------------------------------------
        | UPDATE UI
        |--------------------------------------------------------------------------
        */

        $lateFeeAmount.val(lateFee.toFixed(2));

        $updatedTotal.val(updatedTotal.toFixed(2));

        if (pct === 0) {

            if (diffMinutes > 0) {

                $lateLabel
                    .removeClass()
                    .addClass("text-success")
                    .text("Up to 2 hours waived off.");

            } else {

                $lateLabel
                    .removeClass()
                    .addClass("text-success")
                    .text("No late charge.");
            }

        } else if (pct === 50) {

            $lateLabel
                .removeClass()
                .addClass("text-warning")
                .text(`2 to 8 hours late charge: 50% | Extra LKR ${lateFee.toFixed(2)}`);

        } else {

            $lateLabel
                .removeClass()
                .addClass("text-danger")
                .text(`More than 8 hours: Full day charge | Extra LKR ${lateFee.toFixed(2)}`);
        }
    }

    $editedEnd.off("change.customerEdit input.customerEdit")
        .on("change.customerEdit input.customerEdit", recalcPricePreview);

    $("#saveCustomerBookingEdit").off("click.customerEdit").on("click.customerEdit", function () {
        const bookingId = $(this).data("id");

        $.ajax({
            url: "assets/includes/customer-update-booking.php",
            type: "POST",
            dataType: "json",
            data: {
                id: bookingId,
                customer_id: <?= (int)$customerId ?>,
                edited_end_date: $editedEnd.val(),
                total_price_final: $updatedTotal.val(),
                reason: $("#customer_edit_reason").val()
            },
            success: function (res) {
                if (res.success) {
                    alert("Booking updated successfully.");
                    location.reload();
                } else {
                    alert(res.message || "Failed to update booking.");
                }
            },
            error: function () {
                alert("Server error while updating booking.");
            }
        });
    });

    recalcPricePreview();
})();
</script>