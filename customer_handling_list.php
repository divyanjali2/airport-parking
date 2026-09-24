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
            ch.status,
            ch.created_at,
            rs.total_price,
            rs.total_price_final,
            rs.cash_handover,
            rs.cash_received_status
        FROM customer_handling ch
        LEFT JOIN reserved_slots rs ON rs.id = (
            SELECT rs2.id 
            FROM reserved_slots rs2 
            WHERE rs2.reference_number = ch.reference_number 
            ORDER BY rs2.is_trashed ASC, rs2.id DESC 
            LIMIT 1
        )
        ORDER BY ch.updated_at DESC, ch.created_at DESC
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
    <link href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css" rel="stylesheet">

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

                <div class="d-flex justify-content-between align-items-center mb-2">

                    <h4 class="fw-bold mb-0">
                        Customer Handling List
                    </h4>

                </div>

                <!-- Date Filter and Export Excel -->
                <div class="mb-3 d-flex flex-wrap align-items-end gap-3 justify-content-end">
                    <div>
                        <label for="fromDate" class="form-label mb-1">From Date:</label>
                        <input type="date" id="fromDate" class="form-control" style="width: 160px;">
                    </div>
                    <div>
                        <label for="toDate" class="form-label mb-1">To Date:</label>
                        <input type="date" id="toDate" class="form-control" style="width: 160px;">
                    </div>
                    <div>
                        <button type="button" id="clearDateFilter" class="btn btn-danger">Clear</button>
                    </div>
                    <div>
                        <button type="button" id="exportExcel" class="btn btn-success">
                            <i class="bi bi-file-earmark-excel me-1"></i> Export Excel
                        </button>
                    </div>
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
                                <th>Final Price (LKR)</th>
                                <th>Status</th>
                                <th>Finance Status</th>
                                <th>Created At</th>

                            </tr>

                        </thead>

                        <tbody>

                        <?php foreach ($customerHandling as $i => $row): 
                            $price = $row['total_price'] !== null ? (float)$row['total_price'] : 0.00;
                            $finalPrice = !empty($row['total_price_final']) ? (float)$row['total_price_final'] : $price;
                            
                            $financeStatus = 'Pending Cash Handover';
                            if ($row['cash_handover'] == 1) {
                                if ($row['cash_received_status'] === 'accepted') {
                                    $financeStatus = 'Accepted by Finance';
                                } else {
                                    $financeStatus = 'Cash Handed Over';
                                }
                            }
                        ?>

                            <tr>

                                <td><?= $i + 1 ?></td>

                                <td>
                                    <?= htmlspecialchars($row['reference_number']) ?>
                                </td>

                                <td data-order="<?= htmlspecialchars($row['check_in_datetime'] ?? '') ?>"
                                    data-export="<?= !empty($row['check_in_datetime']) ? date('d M Y H:i', strtotime($row['check_in_datetime'])) : 'N/A' ?>">
                                    <?= !empty($row['check_in_datetime'])
                                        ? date('d M Y H:i', strtotime($row['check_in_datetime']))
                                        : 'N/A' ?>
                                </td>

                                <td>
                                    <?= htmlspecialchars($row['check_in_by_name'] ?? 'N/A') ?>
                                </td>

                                <td data-order="<?= htmlspecialchars($row['check_out_datetime'] ?? '') ?>"
                                    data-export="<?= !empty($row['check_out_datetime']) ? date('d M Y H:i', strtotime($row['check_out_datetime'])) : 'N/A' ?>">
                                    <?= !empty($row['check_out_datetime'])
                                        ? date('d M Y H:i', strtotime($row['check_out_datetime']))
                                        : 'N/A' ?>
                                </td>

                                <td>
                                    <?= htmlspecialchars($row['check_out_by_name'] ?? 'N/A') ?>
                                </td>

                                <td class="text-end"
                                    data-order="<?= $finalPrice ?>"
                                    data-export="<?= number_format($finalPrice, 2, '.', '') ?>">
                                    <?= number_format($finalPrice, 2) ?>
                                </td>

                                <td data-export="<?= $row['status'] == 'check_in' ? 'Check In' : 'Check Out' ?>">

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

                                <td data-export="<?= htmlspecialchars($financeStatus) ?>">
                                    <?= htmlspecialchars($financeStatus) ?>
                                </td>

                                <td data-order="<?= htmlspecialchars($row['created_at'] ?? '') ?>"
                                    data-export="<?= !empty($row['created_at']) ? date('d M Y H:i', strtotime($row['created_at'])) : 'N/A' ?>">
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
<script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>

    $(function () {

        const table = $('#customerHandlingTable').DataTable({

            pageLength: 25,

            lengthMenu: [5, 10, 25, 50, 100],

            responsive: true,

            order: [[0, 'asc']],
            
            columnDefs: [
                { targets: [8], visible: false } // Hide Finance Status from HTML but keep for export
            ],

            buttons: [
                {
                    extend: 'excelHtml5',
                    className: 'd-none',
                    text: 'Export Excel',
                    title: 'Customer_Handling_List',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                        modifier: { search: 'applied' },
                        format: {
                            body: function (data, row, column, node) {
                                const exp = $(node).attr('data-export');
                                if (exp !== undefined && exp !== '') {
                                    return exp;
                                }
                                return $(node).text().trim().replace(/\s+/g, ' ');
                            }
                        }
                    }
                }
            ]

        });

        // Trigger Export Excel
        $('#exportExcel').on('click', function () {
            table.button('.buttons-excel').trigger();
        });

        // Date filter
        $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
            const fromDate = $('#fromDate').val();
            const toDate = $('#toDate').val();

            if (!fromDate && !toDate) {
                return true;
            }

            const rowNode = table.row(dataIndex).node();
            let rawDate = $(rowNode).find('td').eq(2).attr('data-order') || '';
            if (!rawDate) {
                rawDate = $(rowNode).find('td').eq(9).attr('data-order') || '';
            }
            if (!rawDate) return false;

            const rowDateStr = rawDate.substring(0, 10);
            if (fromDate && rowDateStr < fromDate) return false;
            if (toDate && rowDateStr > toDate) return false;

            return true;
        });

        $('#fromDate, #toDate').on('change', function () {
            table.draw();
        });

        $('#clearDateFilter').on('click', function () {
            $('#fromDate').val('');
            $('#toDate').val('');
            table.draw();
        });

    });

</script>

</body>
</html>