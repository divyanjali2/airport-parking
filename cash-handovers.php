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
        rs.handover_batch,
        rs.handover_datetime,
        rs.handover_by,
        u.name AS handover_by_name,
        COUNT(*) AS booking_count,
        SUM(COALESCE(rs.total_price_final, rs.total_price, 0)) AS total_amount,
        GROUP_CONCAT(rs.reference_number ORDER BY rs.reference_number SEPARATOR ', ') AS reference_numbers
    FROM reserved_slots rs
    LEFT JOIN users u 
        ON u.id = rs.handover_by
    WHERE rs.is_trashed = 0
    AND rs.is_no_show = 0
    AND rs.cash_handover = 1
    AND rs.booking_status = 'confirmed'
    GROUP BY 
        rs.handover_batch,
        rs.handover_datetime,
        rs.handover_by,
        u.name
    ORDER BY rs.handover_datetime DESC
");

    $handovers = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . $e->getMessage() . '</div>');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cash Handovers | Airport Parking</title>
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

        table thead tr th {
            background-color: #000 !important;
            color: #fff !important;
        }
    </style>
</head>
<body>
    <div class="d-flex">

        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

        <div class="flex-grow-1">
            <div class="container-fluid">
                <div class="card dashboard-card">

                    <h2 class="text-center fw-bold">
                        <i class="bi bi-cash-coin"></i> Cash Handover Details
                    </h2>

                    <div class="table-responsive">
                        <table id="cashHandoverTable" class="table table-bordered table-striped align-middle">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <!-- <th>Batch</th> -->
                                    <th>Handover Date & Time</th>
                                    <th>Handover By</th>
                                    <th>Booking Count</th>
                                    <th>Reference Numbers</th>
                                    <th>Total Amount (LKR)</th>
                                </tr>
                            </thead>

                            <tbody>
                                <?php foreach ($handovers as $i => $h): ?>
                                    <tr>
                                        <td><?= $i + 1 ?></td>
                                        <!-- <td><?= htmlspecialchars($h['handover_batch']) ?></td> -->
                                        <td>
                                            <?= !empty($h['handover_datetime'])
                                                ? date('d M Y h:i A', strtotime($h['handover_datetime']))
                                                : 'N/A'
                                            ?>
                                        </td>
                                        <td>
                                            <?= htmlspecialchars($h['handover_by_name'] ?? 'Unknown User') ?>
                                        </td>
                                        <td><?= number_format((int)$h['booking_count']) ?></td>
                                        <td><?= htmlspecialchars($h['reference_numbers']) ?></td>
                                        <td class="text-end">
                                            <?= number_format((float)$h['total_amount'], 2) ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>

                            <tfoot>
                                <tr class="fw-bold">
                                    <td colspan="5" class="text-end">Grand Total</td>
                                    <td class="text-end">
                                        <?php
                                            $grandTotal = array_sum(array_column($handovers, 'total_amount'));
                                            echo number_format((float)$grandTotal, 2);
                                        ?>
                                    </td>
                                </tr>
                            </tfoot>
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
        $(function () {
            $('#cashHandoverTable').DataTable({
                pageLength: 50,
                lengthMenu: [10, 25, 50, 100],
                order: [[2, 'desc']]
            });
        });
    </script>
</body>
</html>