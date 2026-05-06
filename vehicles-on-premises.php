<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

$selectedDate = $_GET['date'] ?? date('Y-m-d');
$selectedStart = $selectedDate . ' 00:00:00';
$selectedEnd   = $selectedDate . ' 23:59:59';

try {
    $stmt = $conn->prepare("
        SELECT
            id,
            reference_number,
            booking_type,
            name AS customer_name,
            start_date,
            end_date,
            total_price,
            total_price_final,
            pdf_path
        FROM reserved_slots
        WHERE is_trashed = 0
          AND is_no_show = 0
          AND start_date <= :selected_end
          AND end_date >= :selected_start
        ORDER BY start_date DESC
    ");
    $stmt->execute([
        ':selected_start' => $selectedStart,
        ':selected_end'   => $selectedEnd
    ]);
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

                <form method="GET" class="mb-3 d-flex align-items-end gap-3 justify-content-end">
                    <div>
                        <label for="dateFilter" class="form-label">Filter by Date:</label>
                        <input
                            type="date"
                            id="dateFilter"
                            name="date"
                            class="form-control"
                            value="<?= htmlspecialchars($selectedDate) ?>"
                            style="width:170px;"
                        >
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary">Apply</button>
                    </div>
                    <div>
                        <a href="vehicles-on-premises.php" class="btn btn-danger">Today</a>
                    </div>
                    <div>
                        <button type="button" id="exportCSV" class="btn btn-info">Export CSV</button>
                    </div>
                </form>

                <div class="table-responsive">
                    <table id="parkedVehiclesTable" class="table table-bordered table-striped align-middle">
                        <thead>
                        <tr class="table-dark">
                            <th>#</th>
                            <th>Booking Type</th>
                            <th>Reference No</th>
                            <th>Customer Name</th>
                            <th>Date Range</th>
                            <th>Total Price (LKR)</th>
                            <th>PDF</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($parkedVehicles as $i => $b): ?>
                            <tr>
                                <td><?= $i + 1 ?></td>
                                <td><?= ucfirst(htmlspecialchars($b['booking_type'])) ?></td>
                                <td><?= htmlspecialchars($b['reference_number']) ?></td>
                                <td><?= htmlspecialchars($b['customer_name']) ?></td>
                                <td data-order="<?= htmlspecialchars($b['start_date']) ?>">
                                    <?= date('d M Y H:i', strtotime($b['start_date'])) ?>
                                    -
                                    <?= date('d M Y H:i', strtotime($b['end_date'])) ?>
                                </td>
                                <td>
                                    <?= number_format(!empty($b['total_price_final']) ? $b['total_price_final'] : $b['total_price'], 2) ?>
                                </td>
                                <td>
                                    <?php if (!empty($b['pdf_path'])): ?>
                                        <?php
                                        $webPath = str_replace('\\', '/', $b['pdf_path']);
                                        $docRoot = str_replace('\\', '/', $_SERVER['DOCUMENT_ROOT']);
                                        if (strpos($webPath, $docRoot) === 0) {
                                            $webPath = substr($webPath, strlen($docRoot));
                                        }
                                        ?>
                                        <a href="<?= htmlspecialchars($webPath) ?>" target="_blank" class="btn btn-sm btn-primary">
                                            View PDF
                                        </a>
                                    <?php else: ?>
                                        N/A
                                    <?php endif; ?>
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
            order: [[4, 'desc']],
            buttons: [{
                extend: 'csvHtml5',
                className: 'd-none',
                text: 'Export CSV',
                exportOptions: {
                    columns: [0,1,2,3,4,5],
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