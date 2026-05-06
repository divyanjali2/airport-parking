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
    grid-template-columns: 1fr 1fr;
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
            <small>Grace period: 2 hours after current end time.</small>
        </div>

        <div class="customer-edit-group price-box">
            <label>Updated Total Price (LKR)</label>
            <input
                type="text"
                id="customer_updated_total_price"
                value="<?= number_format($finalTotalPrice, 2, '.', '') ?>"
                readonly
            >
            <small id="customer_late_fee_label"></small>
        </div>
    </div>

    <div class="customer-edit-group">
        <label>Edit Reason</label>
        <textarea id="customer_edit_reason" rows="3" placeholder="Enter reason for changing end date"></textarea>
    </div>

    <button
        type="button"
        class="customer-save-btn"
        id="saveCustomerBookingEdit"
        data-id="<?= (int)$b['id'] ?>"
    >
        Save Changes
    </button>
</div>

<script>
(function () {
    const baseTotalPrice = <?= json_encode($baseTotalPrice) ?>;
    const originalEndTs = <?= json_encode($originalEndTs ? $originalEndTs * 1000 : null) ?>;

    const $editedEnd = $("#customer_edited_end_date");
    const $updatedTotal = $("#customer_updated_total_price");
    const $lateLabel = $("#customer_late_fee_label");

    function getSurchargePercent(lateMinutesAfterGrace) {
        if (lateMinutesAfterGrace <= 0) return 0;
        if (lateMinutesAfterGrace <= 120) return 25;
        if (lateMinutesAfterGrace <= 240) return 50;
        if (lateMinutesAfterGrace <= 360) return 75;
        return 100;
    }

    function recalcPricePreview() {
        if (!originalEndTs || !$editedEnd.val()) {
            $updatedTotal.val(baseTotalPrice.toFixed(2));
            $lateLabel.text("");
            return;
        }

        const editedEndTs = new Date($editedEnd.val()).getTime();

        if (isNaN(editedEndTs)) {
            $updatedTotal.val(baseTotalPrice.toFixed(2));
            $lateLabel.removeClass().addClass("text-warning").text("Invalid date format.");
            return;
        }

        const graceEndTs = originalEndTs + (2 * 60 * 60 * 1000);
        const lateMinutesAfterGrace = Math.ceil((editedEndTs - graceEndTs) / 60000);

        const pct = getSurchargePercent(lateMinutesAfterGrace);
        const lateFee = baseTotalPrice * (pct / 100);
        const updated = baseTotalPrice + lateFee;

        $updatedTotal.val(updated.toFixed(2));

        if (pct === 0) {
            $lateLabel.removeClass().addClass("text-success")
                .text("Within grace period. No surcharge.");
        } else {
            $lateLabel.removeClass().addClass("text-warning")
                .text(`Late surcharge: ${pct}% | Extra LKR ${lateFee.toFixed(2)}`);
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