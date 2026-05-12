<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

/* =========================
   ONGOING RESERVATIONS
========================= */
$stmtOngoing = $conn->query("
    SELECT
        rs.id,
        rs.reference_number,
        rs.name,
        rs.start_date,
        rs.end_date,
        rs.booking_status,
        rs.cash_handover,
        rs.payment_status,
        rs.handover_by,
        uc.name AS confirmed_by_name,
        rs.handover_datetime,
        rs.cash_received_by,
        ucash.name AS cash_received_by_name,
        rs.cash_received_datetime
    FROM reserved_slots rs
    LEFT JOIN users uc ON uc.id = rs.handover_by
    LEFT JOIN users ucash ON ucash.id = rs.cash_received_by
    WHERE rs.is_trashed = 0
    AND rs.is_no_show = 0
    AND (
        rs.booking_status != 'completed'
        OR rs.cash_handover = 0
        OR rs.payment_status != 'Paid Fully'
    )
    ORDER BY rs.end_date DESC
");

$ongoing = $stmtOngoing->fetchAll(PDO::FETCH_ASSOC);


/* =========================
   COMPLETED RESERVATIONS
========================= */
$stmtCompleted = $conn->query("
    SELECT
        rs.id,
        rs.reference_number,
        rs.name,
        rs.start_date,
        rs.end_date,
        rs.total_price_final,
        rs.handover_by,
        uc.name AS confirmed_by_name,
        rs.handover_datetime,
        rs.cash_received_by,
        ucash.name AS cash_received_by_name,
        rs.cash_received_datetime
    FROM reserved_slots rs
    LEFT JOIN users uc ON uc.id = rs.handover_by
    LEFT JOIN users ucash ON ucash.id = rs.cash_received_by
    WHERE rs.is_trashed = 0
    AND rs.is_no_show = 0
    AND rs.vehicle_status = 'completed'
    AND rs.cash_handover = 1
    AND rs.payment_status = 'Paid Fully'
    ORDER BY rs.end_date DESC
");

$completed = $stmtCompleted->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Reservation Status Dashboard</title>
<link rel="icon" type="image/png" href="assets/images/footer-logo.png">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
    body {
        font-family: Cambria;
        background: #f4f6f8;
        font-size: 13px;
    }

    .dashboard-card {
        background: #fff;
        padding: 20px;
        margin-top: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    }

    h3 {
        font-weight: bold;
        color: #0a277d;
    }

    table thead {
        background: #000 !important;
        color: #fff;
    }
</style>
</head>

<body>

    <div class="d-flex">

        <!-- Sidebar -->
        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>
        <div class="flex-grow-1">
            <div class="container-fluid">
        <div class="dashboard-card">

            <h3 class="mb-3">🚘 Reservation Status Dashboard</h3>

            <!-- =========================
                ONGOING TABLE
            ========================== -->
            <h5 class="fw-bold mt-3">Ongoing Reservations</h5>

            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="ongoingTable">
                    <thead>
                        <tr>
                            <th>Ref</th>
                            <th>Customer</th>
                            <th>Start</th>
                            <th>End</th>
                            <th>Confirmed By</th>
                            <th>Confirmed At</th>
                            <th>Cash Collected By</th>
                            <th>Cash Collected At</th>
                            <th>Status</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($ongoing as $o): ?>
                            <tr>
                                <td><?= htmlspecialchars($o['reference_number']) ?></td>
                                <td><?= htmlspecialchars($o['name']) ?></td>

                                <td><?= date('d M Y', strtotime($o['start_date'])) ?></td>
                                <td><?= date('d M Y', strtotime($o['end_date'])) ?></td>

                                <td><?= htmlspecialchars($o['confirmed_by_name'] ?? 'Pending') ?></td>

                                <td>
                                    <?= !empty($o['handover_datetime']) 
                                        ? date('d M Y h:i A', strtotime($o['handover_datetime'])) 
                                        : 'N/A' ?>
                                </td>

                                <td><?= htmlspecialchars($o['cash_received_by_name'] ?? 'Pending') ?></td>

                                <td>
                                    <?= !empty($o['cash_received_datetime']) 
                                        ? date('d M Y h:i A', strtotime($o['cash_received_datetime'])) 
                                        : 'N/A' ?>
                                </td>

                                <td>
                                    <?php
                                        if ($o['booking_status'] != 'completed' && $o['cash_handover'] == 0) {
                                            echo '<span class="badge bg-warning">Pending</span>';
                                        } elseif ($o['cash_handover'] == 1) {
                                            echo '<span class="badge bg-info">Cash Collected</span>';
                                        } else {
                                            echo '<span class="badge bg-secondary">In Progress</span>';
                                        }
                                    ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>


            <!-- =========================
                COMPLETED TABLE
            ========================== -->
            <h5 class="fw-bold mt-5">Completed Reservations</h5>

            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="completedTable">
                    <thead>
                        <tr>
                            <th>Ref</th>
                            <th>Customer</th>
                            <th>Start</th>
                            <th>End</th>
                            <th>Confirmed By</th>
                            <th>Cash Received By</th>
                            <th>Completed At</th>
                            <th>Total (LKR)</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($completed as $c): ?>
                            <tr>
                                <td><?= htmlspecialchars($c['reference_number']) ?></td>
                                <td><?= htmlspecialchars($c['name']) ?></td>

                                <td><?= date('d M Y', strtotime($c['start_date'])) ?></td>
                                <td><?= date('d M Y', strtotime($c['end_date'])) ?></td>

                                <td><?= htmlspecialchars($c['confirmed_by_name'] ?? 'N/A') ?></td>

                                <td><?= htmlspecialchars($c['cash_received_by_name'] ?? 'N/A') ?></td>

                                <td>
                                    <?= !empty($c['cash_received_datetime']) 
                                        ? date('d M Y h:i A', strtotime($c['cash_received_datetime'])) 
                                        : 'N/A' ?>
                                </td>

                                <td class="text-end">
                                    <?= number_format((float)$c['total_price_final'], 2) ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(document).ready(function () {
    $('#ongoingTable').DataTable({
        pageLength: 10,
        order: [[2, 'desc']]
    });

    $('#completedTable').DataTable({
        pageLength: 10,
        order: [[6, 'desc']]
    });
});
</script>

</body>
</html>