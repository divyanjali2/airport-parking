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
                id,
                reference_number,
                booking_type,
                name AS customer_name,
                whatsapp_number,
                slot_number,
                start_date,
                end_date,
                total_price,
                remarks,
                updated_at,
                pdf_path
            FROM reserved_slots
            WHERE is_trashed = 1
            ORDER BY updated_at DESC
        ");

        $trashedBookings = $stmt->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e) {
        die('<div class="text-danger">Database error: '.$e->getMessage().'</div>');
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Airport Parking | Reservations Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            body { font-family: "Cambria", sans-serif; background-color: #f4f6f8; font-size: 12px; }
            .container { max-width: max-content; }
            .dashboard-card { background: #fff; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 20px; margin-top: 40px; }
            h2 { color: #0a277d; font-weight: 600; margin-bottom: 20px; }
            table thead { background-color: #000 !important; color: #fff !important; }
            table thead tr th { background-color: #000; color: #fff; }
            .dataTables_wrapper .dataTables_filter input { border-radius: 8px; border: 1px solid #ccc; padding: 4px 8px; }
            .dataTables_wrapper .dataTables_length select { border-radius: 8px; border: 1px solid #ccc; }
            #redirectMessage { margin-top: 15px; font-weight: 600; color: #dc3545; }
        </style>
    </head>
    <body>
    <div class="d-flex">
        <!-- Sidebar -->
        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>
        <div class="container-fluid">
            <div class="card dashboard-card">
                <h2 class="text-center fw-bold">🗑️ Trashed Reservations</h2>

                <div class="table-responsive">
                    <table id="trashTable" class="table table-bordered table-striped align-middle">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Booking Type</th>
                                <th>Reference</th>
                                <th>Customer</th>
                                <th>WhatsApp</th>
                                <th>Slot</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Total (LKR)</th>
                                <th>Remark</th>
                                <th>Trashed On</th>
                                <th>Invoice</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($trashedBookings as $i => $b): ?>
                                <tr>
                                    <td><?= $i + 1 ?></td>
                                    <td><?= ucfirst(htmlspecialchars($b['booking_type'])) ?></td>
                                    <td><?= htmlspecialchars($b['reference_number']) ?></td>
                                    <td><?= htmlspecialchars($b['customer_name']) ?></td>
                                    <td><?= htmlspecialchars($b['whatsapp_number']) ?></td>
                                    <td><?= htmlspecialchars($b['slot_number']) ?></td>
                                    <td><?= date('d M Y', strtotime($b['start_date'])) ?></td>
                                    <td><?= date('d M Y', strtotime($b['end_date'])) ?></td>
                                    <td><?= number_format($b['total_price'], 2) ?></td>
                                    <td><?= htmlspecialchars($b['remarks']) ?></td>
                                    <td><?= date('d M Y H:i', strtotime($b['updated_at'])) ?></td>
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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/2.1.2/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.1.2/js/dataTables.bootstrap5.js"></script>

    <script>
        $(function () {
            $('#trashTable').DataTable({
                pageLength: 25,
                order: [[10, 'desc']],
                responsive: true
            });
        });
    </script>
</body>
</html>