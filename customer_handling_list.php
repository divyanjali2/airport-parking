<?php
session_start();

require_once __DIR__ . '/assets/includes/db_connect.php';

try {

    $stmt = $conn->query("
        SELECT
            id,
            reference_number,
            check_in_datetime,
            check_in_by_name,
            check_out_datetime,
            check_out_by_name,
            status,
            created_at
        FROM customer_handling
        ORDER BY updated_at DESC, created_at DESC
    ");

    $customerHandling = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {

    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Airport Parking | Customer Handling</title>

    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables -->
    <link href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>

        body {
            background: #f8f9fa;
            font-size: 12px;
            font-family: "Cambria", sans-serif;
        }

        .dashboard-card {
            margin: 20px;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 0 12px rgba(0,0,0,.08);
            background: #fff;
        }

    </style>

</head>

<body>

<div class="d-flex">

    <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

    <div class="flex-grow-1">

        <div class="container-fluid">

            <div class="card dashboard-card">

                <div class="d-flex justify-content-between align-items-center mb-3">

                    <h4 class="fw-bold mb-0">
                        Customer Handling List
                    </h4>

                </div>

                <div class="table-responsive">

                    <table id="customerHandlingTable"
                           class="table table-bordered table-striped align-middle">

                        <thead>

                            <tr class="table-dark">

                                <th>#</th>
                                <th>Reference Number</th>
                                <th>Check In DateTime</th>
                                <th>Check In By</th>
                                <th>Check Out DateTime</th>
                                <th>Check Out By</th>
                                <th>Status</th>
                                <th>Created At</th>

                            </tr>

                        </thead>

                        <tbody>

                        <?php foreach ($customerHandling as $i => $row): ?>

                            <tr>

                                <td><?= $i + 1 ?></td>

                                <td>
                                    <?= htmlspecialchars($row['reference_number']) ?>
                                </td>

                                <td data-order="<?= htmlspecialchars($row['check_in_datetime']) ?>">
                                    <?= !empty($row['check_in_datetime'])
                                        ? date('d M Y H:i', strtotime($row['check_in_datetime']))
                                        : 'N/A' ?>
                                </td>

                                <td>
                                    <?= htmlspecialchars($row['check_in_by_name'] ?? 'N/A') ?>
                                </td>

                                <td data-order="<?= htmlspecialchars($row['check_out_datetime']) ?>">
                                    <?= !empty($row['check_out_datetime'])
                                        ? date('d M Y H:i', strtotime($row['check_out_datetime']))
                                        : 'N/A' ?>
                                </td>

                                <td>
                                    <?= htmlspecialchars($row['check_out_by_name'] ?? 'N/A') ?>
                                </td>

                                <td>

                                    <?php if ($row['status'] == 'check_in'): ?>

                                        <span class="badge bg-success p-2">
                                            Check In
                                        </span>

                                    <?php else: ?>

                                        <span class="badge bg-danger p-2">
                                            Check Out
                                        </span>

                                    <?php endif; ?>

                                </td>

                                <td data-order="<?= htmlspecialchars($row['created_at']) ?>">
                                    <?= date('d M Y H:i', strtotime($row['created_at'])) ?>
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

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- DataTables -->
<script src="https://cdn.datatables.net/2.1.2/js/dataTables.js"></script>

<script src="https://cdn.datatables.net/2.1.2/js/dataTables.bootstrap5.js"></script>

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>

    $(function () {

        $('#customerHandlingTable').DataTable({

            pageLength: 25,

            lengthMenu: [5, 10, 25, 50, 100],

            responsive: true,

            order: [[0, 'desc']]

        });

    });

</script>

</body>
</html>