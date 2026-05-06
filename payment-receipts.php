<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

try {
    $stmt = $conn->query("
        SELECT 
            rs.id AS booking_id,
            rs.reference_number,
            rs.name AS customer_name,
            rs.whatsapp_number,
            rs.vehicle_number,
            rs.slot_number,
            COUNT(pr.id) AS receipt_count,
            COALESCE(SUM(pr.payment_amount), 0) AS total_paid,
            MAX(pr.generated_at) AS last_generated_at
        FROM reserved_slots rs
        INNER JOIN payment_receipts pr ON pr.reserved_slot_id = rs.id
        WHERE pr.receipt_path IS NOT NULL
        GROUP BY 
            rs.id,
            rs.reference_number,
            rs.name,
            rs.whatsapp_number,
            rs.vehicle_number,
            rs.slot_number
        ORDER BY last_generated_at DESC
    ");
    $groupedReceipts = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Airport Parking | Payment Receipts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            font-family: "Cambria", sans-serif;
            background-color: #f4f6f8;
            font-size: 12px;
        }
        .dashboard-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            padding: 20px;
            margin-top: 40px;
        }
        h2 {
            color: #0a277d;
            font-weight: 600;
            margin-bottom: 20px;
        }
        table thead {
            background-color: #000 !important;
            color: #fff !important;
        }
        table thead tr th {
            background-color: #000 !important;
            color: #fff !important;
        }
        .dataTables_wrapper .dataTables_filter input {
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 4px 8px;
        }
        .dataTables_wrapper .dataTables_length select {
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        .page-top-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

        <div class="flex-grow-1">
            <div class="container-fluid">
                <div class="card dashboard-card">
                    <div class="page-top-actions">
                        <a href="reservation-summary.php" class="btn btn-secondary">Back to Dashboard</a>
                    </div>

                    <h2 class="text-center fw-bold">💳 Payment Receipts</h2>

                    <div class="table-responsive">
                        <table id="paymentReceiptsTable" class="table table-bordered table-striped align-middle">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Reference No</th>
                                    <th>Customer</th>
                                    <th>Contact</th>
                                    <th>Vehicle No</th>
                                    <th>Total Paid (LKR)</th>
                                    <th>Receipt Count</th>
                                    <th>Last Receipt Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($groupedReceipts as $i => $r): ?>
                                    <tr>
                                        <td><?= $i + 1 ?></td>
                                        <td><?= htmlspecialchars($r['reference_number']) ?></td>
                                        <td><?= htmlspecialchars($r['customer_name']) ?></td>
                                        <td><?= htmlspecialchars($r['whatsapp_number']) ?></td>
                                        <td><?= htmlspecialchars($r['vehicle_number']) ?></td>
                                        <td><?= number_format((float)$r['total_paid'], 2) ?></td>
                                        <td><?= (int)$r['receipt_count'] ?></td>
                                        <td data-order="<?= htmlspecialchars($r['last_generated_at']) ?>">
                                            <?= !empty($r['last_generated_at']) ? date('d M Y h:i A', strtotime($r['last_generated_at'])) : '' ?>
                                        </td>
                                        <td>
                                            <button
                                                class="btn btn-sm btn-primary view-receipt-history"
                                                data-booking-id="<?= (int)$r['booking_id'] ?>"
                                                data-reference="<?= htmlspecialchars($r['reference_number']) ?>"
                                            >
                                                View Details
                                            </button>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>

                    <div class="modal fade" id="receiptHistoryModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content" id="receiptHistoryContent">
                                <!-- AJAX content -->
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/2.1.2/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.1.2/js/dataTables.bootstrap5.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(function () {
            $('#paymentReceiptsTable').DataTable({
                pageLength: 25,
                lengthMenu: [10, 25, 50, 100],
                order: [[8, 'desc']],
                responsive: true
            });

            $(document).on('click', '.view-receipt-history', function () {
                const bookingId = $(this).data('booking-id');

                $('#receiptHistoryContent').load(
                    `assets/includes/payment-receipt-history-modal.php?booking_id=${bookingId}`,
                    function () {
                        bootstrap.Modal.getOrCreateInstance(
                            document.getElementById('receiptHistoryModal')
                        ).show();
                    }
                );
            });
        });
    </script>
</body>
</html>