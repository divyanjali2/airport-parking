<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

try {
    $stmt = $conn->query("
        SELECT
            ch.id,
            ch.reference_number,
            ch.check_in_datetime,
            ch.check_in_by_name,
            ch.check_out_datetime,
            ch.check_out_by_name,
            ch.created_at,
            ch.updated_at,
            ch.status
        FROM customer_handling ch
        INNER JOIN reserved_slots rs ON rs.reference_number = ch.reference_number
        WHERE ch.status = 'check_in'
          AND rs.is_no_show = 0
          AND rs.is_trashed = 0
        ORDER BY ch.check_in_datetime DESC
    ");
    $parkedVehicles = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}

$currentPage = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airport Parking | Vehicles on Premises</title>
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background: #f8f9fa; font-size: 12px; font-family: "Cambria", sans-serif; }
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
                <div class="d-flex justify-content-between align-items-center mb-0">
                    <h4 class="fw-bold mb-0">Vehicles on Premises</h4>
                   
                </div>

                <div class="mb-3 d-flex align-items-end gap-3 justify-content-end">
                    <div>
                        <button type="button" id="exportCSV" class="btn btn-info">Export CSV</button>
                    </div>
                </div>

                <div class="table-responsive">
                    <table id="parkedVehiclesTable" class="table table-bordered table-striped align-middle">
                        <thead>
                        <tr class="table-dark">
                            <th>#</th>
                            <th>Reference No</th>
                            <th>Check In DateTime</th>
                            <th>Check In By</th>
                            <th>Check Out DateTime</th>
                            <th>Check Out By</th>
                            <th>Status</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($parkedVehicles as $i => $b): ?>
                            <tr>
                                <td><?= $i + 1 ?></td>
                                <td><?= htmlspecialchars($b['reference_number']) ?></td>
                                <td data-order="<?= htmlspecialchars($b['check_in_datetime']) ?>">
                                    <?= !empty($b['check_in_datetime']) ? date('d M Y H:i', strtotime($b['check_in_datetime'])) : 'N/A' ?>
                                </td>
                                <td><?= htmlspecialchars($b['check_in_by_name'] ?? 'N/A') ?></td>
                                <td data-order="<?= htmlspecialchars($b['check_out_datetime']) ?>">
                                    <?= !empty($b['check_out_datetime']) ? date('d M Y H:i', strtotime($b['check_out_datetime'])) : 'N/A' ?>
                                </td>
                                <td><?= htmlspecialchars($b['check_out_by_name'] ?? 'N/A') ?></td>
                                <td>
                                    <?php if ($b['status'] == 'check_in'): ?>
                                        <span class="badge bg-success p-2">Check In</span>
                                    <?php else: ?>
                                        <span class="badge bg-danger p-2">Check Out</span>
                                    <?php endif; ?>
                                </td>
                                <td data-order="<?= htmlspecialchars($b['created_at']) ?>">
                                    <?= date('d M Y H:i', strtotime($b['created_at'])) ?>
                                </td>
                                <td data-order="<?= htmlspecialchars($b['updated_at']) ?>">
                                    <?= date('d M Y H:i', strtotime($b['updated_at'])) ?>
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
<script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(function () {
        const table = $('#parkedVehiclesTable').DataTable({
            pageLength: 25,
            lengthMenu: [5, 10, 25, 50, 100],
            responsive: true,
            order: [[2, 'desc']],
            buttons: [{
                extend: 'csvHtml5',
                className: 'd-none',
                text: 'Export CSV',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5, 6, 7, 8],
                    modifier: { search: 'applied' }
                }
            }]
        });

        $('#exportCSV').on('click', function () {
            table.button('.buttons-csv').trigger();
        });
    });
</script>
</body>
</html>