<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

try {
    $stmt = $conn->query("
        SELECT
            id,
            reference_number,
            booking_type,
            start_date,
            end_date,
            total_price,
            total_price_final,
            pdf_path,
            no_show_reason,
            status
        FROM reserved_slots
        WHERE is_trashed = 0
          AND is_no_show = 1
        ORDER BY updated_at DESC, created_at DESC
    ");

    $noShowBookings = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airport Parking | No Show Bookings</title>
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css" rel="stylesheet">
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
                        <h4 class="fw-bold mb-0">No Show Bookings</h4>
                    
                    </div>

                    <div class="mb-3 d-flex align-items-end gap-3 justify-content-end">
                        <div>
                            <label for="bookingTypeFilter" class="form-label">Filter by Booking Type:</label>
                            <select id="bookingTypeFilter" class="form-select w-auto">
                                <option value="">All</option>
                                <option value="Direct booking">Direct booking</option>
                                <option value="Website">Website</option>
                            </select>
                        </div>
                        <div>
                            <label for="dateFilter" class="form-label">Filter by Start Date:</label>
                            <input type="date" id="dateFilter" class="form-control" style="width: 170px;">
                        </div>
                        <div class="align-self-end">
                            <button id="clearDateFilter" class="btn btn-danger">Clear</button>
                        </div>
                        <div class="align-self-end">
                            <button id="exportCSV" class="btn btn-info">Export CSV</button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table id="noShowBookingsTable" class="table table-bordered table-striped align-middle">
                            <thead>
                                <tr class="table-dark">
                                    <th>#</th>
                                    <th>Booking Type</th>
                                    <th>Reference No</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Total Price (LKR)</th>
                                    <th>No Show Reason</th>
                                    <th>PDF</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($noShowBookings as $i => $b): ?>
                                    <tr>
                                        <td><?= $i + 1 ?></td>
                                        <td><?= ucfirst(htmlspecialchars($b['booking_type'])) ?></td>
                                        <td><?= htmlspecialchars($b['reference_number']) ?></td>
                                        <td data-order="<?= htmlspecialchars($b['start_date']) ?>">
                                            <?= date('d M Y H:i', strtotime($b['start_date'])) ?>
                                        </td>
                                        <td data-order="<?= htmlspecialchars($b['end_date']) ?>">
                                            <?= date('d M Y H:i', strtotime($b['end_date'])) ?>
                                        </td>
                                        <td>
                                            <?= number_format(!empty($b['total_price_final']) ? $b['total_price_final'] : $b['total_price'], 2) ?>
                                        </td>
                                        <td class="reason-cell">
                                            <?= nl2br(htmlspecialchars($b['no_show_reason'] ?? '')) ?>
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
                                        <td>
                                            <span class="badge bg-danger p-2">No Show</span>
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
            const table = $('#noShowBookingsTable').DataTable({
                pageLength: 25,
                lengthMenu: [5, 10, 25, 50, 100],
                responsive: true,
                order: [[5, 'desc']],
                buttons: [{
                    extend: 'csvHtml5',
                    className: 'd-none',
                    text: 'Export CSV',
                    exportOptions: {
                        columns: ':not(:last-child)',
                        modifier: { search: 'applied' }
                    }
                }]
            });

            $('#exportCSV').on('click', () => {
                table.button('.buttons-csv').trigger();
            });

            $('#bookingTypeFilter').on('change', function () {
                const val = this.value;
                table.column(1)
                    .search(val ? '^' + val + '$' : '', true, false)
                    .draw();
            });

            function normalizeDate(v) {
                const d = new Date(v);
                return isNaN(d) ? null : d.toISOString().slice(0, 10);
            }

            $.fn.dataTable.ext.search.push(function (_, data) {
                const filterDate = $('#dateFilter').val();
                if (!filterDate) return true;

                const rowStart = normalizeDate(data[5]);
                if (!rowStart) return true;

                return rowStart === filterDate;
            });

            $('#dateFilter').on('change', function () {
                table.draw();
            });

            $('#clearDateFilter').on('click', function () {
                $('#dateFilter').val('');
                $('#bookingTypeFilter').val('');
                table.search('').columns().search('').draw();
            });
        });
    </script>
</body>
</html>