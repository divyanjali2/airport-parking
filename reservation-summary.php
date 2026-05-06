<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

date_default_timezone_set('Asia/Colombo');

try {
    $stmt = $conn->prepare("
        SELECT
            rs.id,
            rs.reference_number,
            rs.name AS customer_name,
            rs.booking_type,
            rs.whatsapp_number,
            rs.start_date,
            rs.end_date,
            rs.total_price,
            rs.total_price_final,
            rs.late_fee_percent,
            rs.late_fee_amount,
            rs.status,
            si.batch_id,
            si.invoice_amount,
            si.sent_at
        FROM reserved_slots rs
        LEFT JOIN sent_invoices si 
            ON si.reserved_slot_id = rs.id
        WHERE rs.is_trashed = 0
                AND rs.is_no_show = 0
                
        ORDER BY si.sent_at DESC, rs.created_at DESC
    ");
    $stmt->execute();
    $reservations = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reservation Summary</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css"><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">

    <style>
        body {
            font-family: "Cambria", sans-serif;
            background-color: #f4f6f8;
            font-size: 13px;
        }
        .page-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            padding: 24px;
            margin-top: 40px;
        }
        h3 {
            color: #0a277d;
            font-weight: 700;
        }
        table thead {
            background: #000 !important;
            color: #fff !important;
        }
        .amount-main {
            font-weight: 700;
            color: #198754;
        }
        .late-fee-box {
            font-size: 12px;
            color: #6c757d;
            line-height: 1.4;
        }
        .summary-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .badge-status {
            padding: 8px 12px;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

        <div class="flex-grow-1">
            <div class="container-fluid">
                <div class="page-card">
                    <div class="summary-top">
                        <h3 class="mb-0">Reservation Summary</h3>
                        <!-- <a href="reservations.php" class="btn btn-secondary">Back</a> -->
                    </div>

                    <div class="table-responsive">
                        <table id="reservationSummaryTable" class="table table-bordered table-striped align-middle">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Batch ID</th>
                                    <th>Reference No</th>
                                    <th>Customer</th>
                                    <th>Booking Type</th>
                                    <th>WhatsApp</th>
                                    <th>Parking Dates</th>
                                    <th>Amount Details</th>
                                    <th>Sent Amount</th>
                                    <th>Sent At</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($reservations)): ?>
                                    <?php foreach ($reservations as $i => $row): ?>
                                        <?php
                                            $hasFinal = !empty($row['total_price_final']) && (float)$row['total_price_final'] > 0;
                                        ?>
                                        <tr>
                                            <td><?= $i + 1 ?></td>
                                            <td><?= htmlspecialchars($row['batch_id'] ?? '-') ?></td>
                                            <td><?= htmlspecialchars($row['reference_number']) ?></td>
                                            <td><?= htmlspecialchars($row['customer_name']) ?></td>
                                            <td><?= htmlspecialchars(ucfirst($row['booking_type'])) ?></td>
                                            <td><?= htmlspecialchars($row['whatsapp_number']) ?></td>
                                            <td data-order="<?= htmlspecialchars($row['start_date']) ?>">
                                                <?= date('d M Y', strtotime($row['start_date'])) ?>
                                                <br>
                                                <small class="text-muted">to</small>
                                                <br>
                                                <?= date('d M Y', strtotime($row['end_date'])) ?>
                                            </td>
                                            <td>
                                                <?php if ($hasFinal): ?>
                                                    <div><strong>Base:</strong> LKR <?= number_format((float)$row['total_price'], 2) ?></div>
                                                    <div><strong>Final:</strong> <span class="amount-main">LKR <?= number_format((float)$row['total_price_final'], 2) ?></span></div>
                                                    <div class="late-fee-box mt-1">
                                                        <div>Late Fee %: <?= number_format((float)$row['late_fee_percent'], 2) ?>%</div>
                                                        <div>Late Fee Amount: LKR <?= number_format((float)$row['late_fee_amount'], 2) ?></div>
                                                    </div>
                                                <?php else: ?>
                                                    <div class="amount-main">LKR <?= number_format((float)$row['total_price'], 2) ?></div>
                                                <?php endif; ?>
                                            </td>
                                            <td>
                                                <span class="amount-main">
                                                    LKR <?= number_format((float)($row['invoice_amount'] ?? 0), 2) ?>
                                                </span>
                                            </td>
                                            <td>
                                                <?= !empty($row['sent_at']) ? date('d M Y h:i A', strtotime($row['sent_at'])) : 'N/A' ?>
                                            </td>
                                            <td>
                                                <span class="badge bg-info text-dark badge-status">
                                                    <?= htmlspecialchars(ucwords(str_replace('_', ' ', $row['status']))) ?>
                                                </span>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <!-- <tr>
                                        <td colspan="11" class="text-center text-muted">No reservations found.</td>
                                    </tr> -->
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/2.1.2/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.1.2/js/dataTables.bootstrap5.js"></script>
    <script>
        $(function () {
            $('#reservationSummaryTable').DataTable({
                pageLength: 25,
                lengthMenu: [10, 25, 50, 100],
                order: [[9, 'desc']]
            });
        });
    </script>
</body>
</html>