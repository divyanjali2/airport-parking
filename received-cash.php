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
        LEFT JOIN users u ON u.id = rs.handover_by
        WHERE rs.is_trashed = 0
        AND rs.is_no_show = 0
        AND rs.cash_handover = 1
        AND rs.booking_status = 'confirmed'
        AND (rs.cash_received_status IS NULL OR rs.cash_received_status = 'pending')
        GROUP BY 
            rs.handover_batch,
            rs.handover_datetime,
            rs.handover_by,
            u.name
        ORDER BY rs.handover_datetime DESC
    ");

    $handovers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $stmtAccepted = $conn->query("
        SELECT
            rs.handover_batch,
            rs.handover_datetime,
            rs.handover_by,
            u1.name AS handover_by_name,
            rs.cash_received_datetime,
            rs.cash_received_by,
            u2.name AS received_by_name,
            COUNT(*) AS booking_count,
            SUM(COALESCE(rs.total_price_final, rs.total_price, 0)) AS total_amount,
            GROUP_CONCAT(rs.reference_number ORDER BY rs.reference_number SEPARATOR ', ') AS reference_numbers
        FROM reserved_slots rs
        LEFT JOIN users u1 ON u1.id = rs.handover_by
        LEFT JOIN users u2 ON u2.id = rs.cash_received_by
        WHERE rs.is_trashed = 0
        AND rs.is_no_show = 0
        AND rs.cash_handover = 1
        AND rs.booking_status = 'confirmed'
        AND rs.cash_received_status = 'accepted'
        GROUP BY 
            rs.handover_batch,
            rs.handover_datetime,
            rs.handover_by,
            u1.name,
            rs.cash_received_datetime,
            rs.cash_received_by,
            u2.name
        ORDER BY rs.cash_received_datetime DESC
    ");

    $acceptedHandovers = $stmtAccepted->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . $e->getMessage() . '</div>');
}

try {
    $stmtCash = $conn->query("
        SELECT
            id,
            reference_number,
            name,
            start_date,
            end_date,
            total_price_final
        FROM reserved_slots
        WHERE payment_status = 'Paid Fully'
        AND cash_handover = 0
        AND booking_status = 'confirmed'
        AND is_trashed = 0
        AND is_no_show = 0
        ORDER BY created_at DESC
    ");

    $cashHandoverBookings = $stmtCash->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die('<div style="color:red;">Database error (cash handover): ' . $e->getMessage() . '</div>');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Received Cash | Airport Parking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body { font-family: "Cambria", sans-serif; background-color: #f4f6f8; font-size: 12px; }
        .dashboard-card { background:#fff; border-radius:12px; box-shadow:0 4px 15px rgba(0,0,0,0.08); padding:20px; margin-top:40px; }
        h2, h4 { color:#0a277d; font-weight:600; margin-bottom:20px; }
        table thead tr th { background:#000 !important; color:#fff !important; }
    </style>
</head>
<body>
<div class="d-flex">

    <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

    <div class="flex-grow-1">
        <div class="container-fluid">
            <div class="card dashboard-card">

                <h4 class="fw-bold mt-2">Cash Handover Pending</h4>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped align-middle" id="cashHandoverTable">
                        <thead class="table-dark">
                            <tr>
                                <th>Reference No</th>
                                <th>Customer</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th class="text-end">Amount (LKR)</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php foreach ($cashHandoverBookings as $c): ?>
                                <tr>
                                    <td>
                                        <?= htmlspecialchars($c['reference_number']) ?>
                                    </td>

                                    <td>
                                        <?= htmlspecialchars($c['name']) ?>
                                    </td>

                                    <td>
                                        <?= !empty($c['start_date']) 
                                            ? date('d M Y', strtotime($c['start_date'])) 
                                            : 'N/A' ?>
                                    </td>

                                    <td>
                                        <?= !empty($c['end_date']) 
                                            ? date('d M Y', strtotime($c['end_date'])) 
                                            : 'N/A' ?>
                                    </td>

                                    <td class="text-end">
                                        <?= number_format((float)($c['total_price_final'] ?? 0), 2) ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>

                <hr>

                <h4 class="fw-bold">Pending Cash to Accept</h4>

                <div class="table-responsive">
                    <table id="receivedCashTable" class="table table-bordered table-striped align-middle">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Handover Date & Time</th>
                                <th>Handover By</th>
                                <th>Booking Count</th>
                                <th>Reference Numbers</th>
                                <th>Total Amount (LKR)</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php foreach ($handovers as $i => $h): ?>
                                <tr>
                                    <td><?= $i + 1 ?></td>
                                    <td>
                                        <?= !empty($h['handover_datetime'])
                                            ? date('d M Y h:i A', strtotime($h['handover_datetime']))
                                            : 'N/A'
                                        ?>
                                    </td>
                                    <td><?= htmlspecialchars($h['handover_by_name'] ?? 'Unknown User') ?></td>
                                    <td><?= number_format((int)$h['booking_count']) ?></td>
                                    <td><?= htmlspecialchars($h['reference_numbers']) ?></td>
                                    <td class="text-end"><?= number_format((float)$h['total_amount'], 2) ?></td>
                                    <td>
                                        <button
                                            type="button"
                                            class="btn btn-sm btn-success accept-cash-btn"
                                            data-batch="<?= htmlspecialchars($h['handover_batch']) ?>"
                                            data-handover-datetime="<?= htmlspecialchars($h['handover_datetime']) ?>"
                                            data-amount="<?= number_format((float)$h['total_amount'], 2) ?>"
                                        >
                                            Accept
                                        </button>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>

                <hr class="my-4">

                <h4 class="fw-bold">Accepted Cash Details</h4>

                <div class="table-responsive">
                    <table id="acceptedCashTable" class="table table-bordered table-striped align-middle">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Handover Date & Time</th>
                                <th>Handover By</th>
                                <th>Accepted Date & Time</th>
                                <th>Accepted By</th>
                                <th>Booking Count</th>
                                <th>Reference Numbers</th>
                                <th>Total Amount (LKR)</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php foreach ($acceptedHandovers as $i => $a): ?>
                                <tr>
                                    <td><?= $i + 1 ?></td>
                                    <td>
                                        <?= !empty($a['handover_datetime'])
                                            ? date('d M Y h:i A', strtotime($a['handover_datetime']))
                                            : 'N/A'
                                        ?>
                                    </td>
                                    <td><?= htmlspecialchars($a['handover_by_name'] ?? 'Unknown User') ?></td>
                                    <td>
                                        <?= !empty($a['cash_received_datetime'])
                                            ? date('d M Y h:i A', strtotime($a['cash_received_datetime']))
                                            : 'N/A'
                                        ?>
                                    </td>
                                    <td><?= htmlspecialchars($a['received_by_name'] ?? 'Unknown User') ?></td>
                                    <td><?= number_format((int)$a['booking_count']) ?></td>
                                    <td><?= htmlspecialchars($a['reference_numbers']) ?></td>
                                    <td class="text-end"><?= number_format((float)$a['total_amount'], 2) ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>

                        <tfoot>
                            <tr class="fw-bold">
                                <td colspan="7" class="text-end">Total Accepted Amount</td>
                                <td class="text-end">
                                    <?php
                                        $acceptedTotal = array_sum(array_column($acceptedHandovers, 'total_amount'));
                                        echo number_format((float)$acceptedTotal, 2);
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

<div class="modal fade" id="acceptCashModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="acceptCashForm">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold">Confirm Cash Received</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <input type="hidden" id="accept_handover_batch">
                    <input type="hidden" id="accept_handover_datetime">

                    <p class="text-danger">
                        Confirm the amount listed received to your hand?
                    </p>

                    <div class="mb-3">
                        <label class="form-label">Amount</label>
                        <input type="text" id="accept_amount_display" class="form-control" readonly>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Cancel
                    </button>
                    <button type="submit" class="btn btn-success" id="confirmAcceptCashBtn">
                        Yes, Accept
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/2.1.2/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.1.2/js/dataTables.bootstrap5.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(function () {
    $('#receivedCashTable').DataTable({
        pageLength: 50,
        lengthMenu: [10, 25, 50, 100],
        order: [[1, 'desc']]
    });

    $('#acceptedCashTable').DataTable({
        pageLength: 50,
        lengthMenu: [10, 25, 50, 100],
        order: [[3, 'desc']]
    });
        $('#cashHandoverTable').DataTable({
        pageLength: 50,
        lengthMenu: [10, 25, 50, 100],
        order: [[3, 'desc']]
    });
});

$(document).on('click', '.accept-cash-btn', function () {
    const batch = $(this).data('batch');
    const handoverDatetime = $(this).data('handover-datetime');
    const amount = $(this).data('amount');

    $('#accept_handover_batch').val(batch);
    $('#accept_handover_datetime').val(handoverDatetime);
    $('#accept_amount_display').val('LKR ' + amount);

    bootstrap.Modal.getOrCreateInstance(
        document.getElementById('acceptCashModal')
    ).show();
});

$(document).on('submit', '#acceptCashForm', function (e) {
    e.preventDefault();

    const batch = $('#accept_handover_batch').val();
    const handoverDatetime = $('#accept_handover_datetime').val();

    $('#confirmAcceptCashBtn').prop('disabled', true).text('Saving...');

    $.ajax({
        url: 'assets/includes/accept-received-cash.php',
        type: 'POST',
        dataType: 'json',
        data: {
            handover_batch: batch,
            handover_datetime: handoverDatetime
        },
        success: function (res) {
            if (res.success) {
                alert('Cash received successfully accepted.');
                location.reload();
            } else {
                alert(res.message || 'Failed to accept cash.');
                $('#confirmAcceptCashBtn').prop('disabled', false).text('Yes, Accept');
            }
        },
        error: function () {
            alert('Server error while accepting cash.');
            $('#confirmAcceptCashBtn').prop('disabled', false).text('Yes, Accept');
        }
    });
});
</script>
</body>
</html>