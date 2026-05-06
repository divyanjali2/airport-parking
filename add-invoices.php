<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

date_default_timezone_set('Asia/Colombo');

$todayDateTime = date('d M Y h:i A');

try {
    $stmt = $conn->prepare("
        SELECT 
            id,
            reference_number,
            total_price,
            total_price_final
        FROM reserved_slots
        WHERE is_trashed = 0
            AND is_no_show = 0 
          AND status = 'pending'
        ORDER BY created_at DESC
    ");
    $stmt->execute();
    $pendingBookings = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Invoices</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
        body {
            font-family: "Cambria", sans-serif;
            background-color: #f4f6f8;
            font-size: 14px;
        }
        .page-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            padding: 24px;
            margin-top: 40px;
        }
        .modal-header {
            background: #ffc107;
        }
        .selected-summary {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            padding: 15px;
        }
        .invoice-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }
    </style>
</head>
<body>
    <?php if (!empty($_SESSION['success_message'])): ?>
    <div class="toast-container position-fixed top-0 end-0 p-3">
        <div id="successToast" class="toast align-items-center text-bg-success border-0" role="alert">
            <div class="d-flex">
                <div class="toast-body">
                    <?= htmlspecialchars($_SESSION['success_message']) ?>
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
            </div>
        </div>
    </div>
    <?php unset($_SESSION['success_message']); ?>
    <?php endif; ?>
    <div class="d-flex">
        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

        <div class="flex-grow-1">
            <div class="container-fluid">
                <div class="page-card">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h3 class="fw-bold mb-0">Add Invoices</h3>
                        <a href="reservations.php" class="btn btn-secondary">Back</a>
                    </div>

                    <p class="mb-3">
                        <strong>Today Date & Time:</strong> <?= htmlspecialchars($todayDateTime) ?>
                    </p>

                    <button class="btn btn-warning text-dark" data-bs-toggle="modal" data-bs-target="#addInvoiceModal">
                        Open Invoice Modal
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addInvoiceModal" tabindex="-1" aria-labelledby="addInvoiceModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form method="post" action="save-invoice.php">
                    <div class="modal-header">
                        <h5 class="modal-title fw-bold" id="addInvoiceModalLabel">Pending Invoices</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Current Date & Time</label>
                            <input type="text" class="form-control" value="<?= htmlspecialchars($todayDateTime) ?>" readonly>
                        </div>

                       <div class="mb-3">
                            <label class="form-label fw-bold">Pending Invoices</label>

                            <?php if (!empty($pendingBookings)): ?>
                                <div class="mb-2 d-flex flex-column gap-2 align-items-end">
                                    <input  type="text"  id="invoiceSearch"  class="form-control w-50"  placeholder="Search reference number..." >
                                    <div id="noInvoiceMatch" class="text-danger small mt-2 d-none">
                                        No matching reference number found.
                                    </div>
                                </div>

                                <div class="list-group" id="invoiceList">
                                    <?php foreach ($pendingBookings as $booking): ?>
                                        <?php
                                            $amount = !empty($booking['total_price_final'])
                                                ? $booking['total_price_final']
                                                : $booking['total_price'];
                                        ?>
                                        <label class="list-group-item d-flex align-items-center gap-2 invoice-item">
                                            <input
                                                class="form-check-input mt-0 invoice-check"
                                                type="checkbox"
                                                name="selected_bookings[]"
                                                value="<?= htmlspecialchars($booking['id']) ?>"
                                                data-id="<?= htmlspecialchars($booking['id']) ?>"
                                                data-reference="<?= htmlspecialchars($booking['reference_number']) ?>"
                                                data-amount="<?= htmlspecialchars($amount) ?>"
                                            >
                                            <div class="invoice-row">
                                                <span><?= htmlspecialchars($booking['reference_number']) ?></span>
                                                <span class="fw-bold text-success">
                                                    LKR <?= number_format((float)$amount, 2) ?>
                                                </span>
                                            </div>
                                        </label>
                                    <?php endforeach; ?>
                                </div>
                            <?php else: ?>
                                <div class="alert alert-info mb-0">
                                    No Pending Invoices found.
                                </div>
                            <?php endif; ?>
                        </div>
                        <input type="hidden" name="grand_total_amount" id="grand_total_amount" value="0">

                        <div class="selected-summary mt-4">
                            <h6 class="fw-bold mb-3">Selected Invoice Details</h6>
                            <div id="selectedInvoicesList" class="mb-2 text-muted">
                                No invoices selected.
                            </div>
                            <div class="fw-bold">
                                Total Selected Amount: <span id="grandTotal">LKR 0.00</span>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <a href="reservations.php" class="btn btn-secondary">Close</a>
                        <button type="submit" class="btn btn-primary">Proceed</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const toastEl = document.getElementById('successToast');
            if (toastEl) {
                const toast = new bootstrap.Toast(toastEl, {
                    delay: 4000
                });
                toast.show();
            }
        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.getElementById('invoiceSearch');
            const noMatch = document.getElementById('noInvoiceMatch');
            if (!searchInput) return;

            searchInput.addEventListener('input', function () {
                const search = this.value.trim().toLowerCase();
                const items = document.querySelectorAll('.invoice-item');
                let visibleCount = 0;

                items.forEach(item => {
                    const checkbox = item.querySelector('.invoice-check');
                    const ref = (checkbox.dataset.reference || '').toLowerCase();

                    if (search === '' || ref.includes(search)) {
                        item.classList.remove('d-none');
                        visibleCount++;
                    } else {
                        item.classList.add('d-none');
                    }
                });

                if (noMatch) {
                    noMatch.classList.toggle('d-none', visibleCount > 0);
                }
            });
        });
    </script>

    <script>
        function updateSelectedInvoices() {
            const checked = document.querySelectorAll('.invoice-check:checked');
            const list = document.getElementById('selectedInvoicesList');
            const grandTotal = document.getElementById('grandTotal');
            const hiddenGrandTotal = document.getElementById('grand_total_amount');

            if (checked.length === 0) {
                list.innerHTML = '<span class="text-muted">No invoices selected.</span>';
                grandTotal.textContent = 'LKR 0.00';
                hiddenGrandTotal.value = 0;
                return;
            }

            let html = '<ul class="list-group">';
            let total = 0;

            checked.forEach(item => {
                const ref = item.dataset.reference;
                const amount = parseFloat(item.dataset.amount) || 0;
                total += amount;

                html += `
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <span>${ref}</span>
                        <span class="fw-bold text-success">
                            LKR ${amount.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2})}
                        </span>
                    </li>
                `;
            });

            html += '</ul>';
            list.innerHTML = html;

            grandTotal.textContent = 'LKR ' + total.toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });

            hiddenGrandTotal.value = total.toFixed(2);
        }

        document.addEventListener('change', function(e) {
            if (e.target.classList.contains('invoice-check')) {
                updateSelectedInvoices();
            }
        });
    </script>
</body>
</html>