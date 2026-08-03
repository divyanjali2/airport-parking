<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

date_default_timezone_set('Asia/Colombo');

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

try {
    // ── PENDING HANDOVERS ──
    $cashStmt = $conn->query("
        SELECT
            ch.id AS customer_handling_id,
            ch.reference_number,
            ch.check_in_datetime,
            ch.check_in_by_name,
            ch.check_out_datetime,
            ch.check_out_by_name,
            ch.status,

            rs.id AS reserved_slot_id,
            rs.name AS customer_name,
            rs.whatsapp_number,
            rs.total_price,
            rs.total_price_final,
            rs.cash_handover,
            rs.cash_handover_checkin,
            rs.handover_datetime,
            rs.handover_by,
            rs.cash_received_status,

            CASE
                WHEN ch.status = 'check_out'
                    AND rs.total_price_final IS NOT NULL
                    AND rs.total_price_final != rs.total_price
                THEN rs.total_price_final - rs.total_price
                ELSE rs.total_price
            END AS cash_collected

        FROM customer_handling ch
        INNER JOIN reserved_slots rs
            ON rs.reference_number = ch.reference_number

        WHERE
            (
                ch.status = 'check_in'
                OR (
                    ch.status = 'check_out'
                    AND rs.total_price_final IS NOT NULL
                    AND rs.total_price_final != rs.total_price
                    AND rs.cash_handover = 0
                )
            )
            AND rs.is_trashed = 0
            AND rs.is_no_show = 0
            AND rs.booking_status = 'confirmed'

        ORDER BY ch.check_in_datetime DESC
    ");

    $cashHandovers = $cashStmt->fetchAll(PDO::FETCH_ASSOC);

    // ── COMPLETED HANDOVERS (Both Check-in and Check-out) ──
    $completedStmt = $conn->query("
        SELECT
            ch.id AS customer_handling_id,
            ch.reference_number,
            ch.check_in_datetime,
            ch.check_in_by_name,
            ch.check_out_datetime,
            ch.check_out_by_name,
            ch.status,

            rs.id AS reserved_slot_id,
            rs.name AS customer_name,
            rs.whatsapp_number,
            rs.total_price,
            rs.total_price_final,
            rs.cash_handover,
            rs.cash_handover_checkin,
            rs.handover_datetime,
            rs.handover_by,
            rs.cash_received_status,
            rs.cash_received_datetime,

            CASE
                WHEN ch.status = 'check_out'
                    AND rs.total_price_final IS NOT NULL
                    AND rs.total_price_final != rs.total_price
                THEN rs.total_price_final - rs.total_price
                ELSE rs.total_price
            END AS cash_collected

        FROM customer_handling ch
        INNER JOIN reserved_slots rs
            ON rs.reference_number = ch.reference_number

        WHERE
            (
                (ch.status = 'check_in' AND rs.cash_handover_checkin IS NOT NULL)
                OR
                (ch.status = 'check_out' AND rs.cash_handover = 1 AND rs.handover_datetime IS NOT NULL)
            )
            AND rs.is_trashed = 0
            AND rs.is_no_show = 0
            AND rs.booking_status = 'confirmed'

        ORDER BY COALESCE(rs.cash_handover_checkin, rs.handover_datetime) DESC
    ");

    $completedHandovers = $completedStmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}

$totalPendingCash = array_sum(array_column($cashHandovers, 'cash_collected'));
$totalCompletedCash = array_sum(array_column($completedHandovers, 'cash_collected'));
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Airport Parking | Cash Handover</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css">

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
            margin-bottom: 40px;
        }

        h2 {
            color: #0a277d;
            font-weight: 600;
            margin-bottom: 20px;
        }

        h3 {
            color: #0a277d;
            font-weight: 600;
            margin-bottom: 15px;
            font-size: 1.2rem;
            border-bottom: 2px solid #0a277d;
            padding-bottom: 10px;
        }

        table thead {
            background-color: #000 !important;
            color: #fff !important;
        }

        table thead tr th {
            background-color: #000;
            color: #fff;
        }

        .table-completed thead {
            background-color: #2e7d32 !important;
        }

        .dataTables_wrapper .dataTables_filter input {
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 4px 8px;
        }

        .dataTables_wrapper .dataTables_length select {
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .balance-amount {
            color: #dc3545;
            font-weight: 700;
        }

        .total-row td {
            background-color: #fff8e1;
            font-weight: 700;
            font-size: 13px;
        }

        .total-row-completed td {
            background-color: #c8e6c9;
            font-weight: 700;
            font-size: 13px;
            color: #1b5e20;
        }

        .summary-strip {
            background: linear-gradient(135deg, #0b0833, #1e3a5f);
            color: #fff;
            border-radius: 10px;
            padding: 16px 24px;
            margin-bottom: 20px;
            display: flex;
            gap: 32px;
            flex-wrap: wrap;
            align-items: center;
        }

        .summary-strip .s-item {
            display: flex;
            flex-direction: column;
        }

        .summary-strip .s-label {
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            opacity: 0.7;
            margin-bottom: 2px;
        }

        .summary-strip .s-value {
            font-size: 1.3rem;
            font-weight: 800;
        }

        .summary-strip .s-sub {
            font-size: 10px;
            opacity: 0.65;
            margin-top: 2px;
        }

        .summary-strip-green {
            background: linear-gradient(135deg, #1b5e20, #4caf50);
            color: #fff;
            border-radius: 10px;
            padding: 16px 24px;
            margin-bottom: 20px;
            display: flex;
            gap: 32px;
            flex-wrap: wrap;
            align-items: center;
        }

        .handover-status {
            font-size: 11px;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
            white-space: normal;
            max-width: 180px;
            line-height: 1.4;
        }

        .handover-done {
            background-color: #d4edda;
            color: #155724;
        }

        .handover-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .alert-info-custom {
            background-color: #e7f3ff;
            border-left: 4px solid #2196F3;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 4px;
        }

        .table-completed {
            background-color: #f9fff9;
        }

        .badge-checkin {
            background-color: #2196F3;
        }

        .badge-checkout {
            background-color: #4caf50;
        }

        .status-badge-checkin {
            background-color: #2196F3;
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            display: inline-block;
        }

        .status-badge-checkout {
            background-color: #4caf50;
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="d-flex">

    <!-- Sidebar -->
    <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

    <!-- Main Content -->
    <div class="flex-grow-1">
        <div class="container-fluid">
            
            <!-- ════════════════════════════════════════════════════════════════ -->
            <!-- PENDING CASH HANDOVER SECTION -->
            <!-- ════════════════════════════════════════════════════════════════ -->
            <div class="card dashboard-card">

                <h2 class="text-center fw-bold">
                    <i class="bi bi-cash-coin me-2"></i> Cash Handover — Pending
                </h2>

                <!-- ── Summary Strip ── -->
                <?php
                    $checkedInCount  = 0;
                    $checkedOutCount = 0;
                    $balanceOnly     = 0;

                    foreach ($cashHandovers as $row) {
                        if ($row['status'] === 'check_in')  $checkedInCount++;
                        if ($row['status'] === 'check_out') {
                            $checkedOutCount++;
                            $balanceOnly += (float)$row['cash_collected'];
                        }
                    }
                ?>
                <div class="summary-strip">
                    <div class="s-item">
                        <span class="s-label">Total Records</span>
                        <span class="s-value"><?= count($cashHandovers) ?></span>
                        <span class="s-sub">Pending handover</span>
                    </div>
                    <div class="s-item">
                        <span class="s-label">Checked In</span>
                        <span class="s-value"><?= $checkedInCount ?></span>
                        <span class="s-sub">Currently parked</span>
                    </div>
                    <div class="s-item">
                        <span class="s-label">Checked Out (Balance)</span>
                        <span class="s-value"><?= $checkedOutCount ?></span>
                        <span class="s-sub">Balance: LKR <?= number_format($balanceOnly, 2) ?></span>
                    </div>
                    <div class="s-item ms-auto">
                        <span class="s-label">Total Pending Cash</span>
                        <span class="s-value">LKR <?= number_format($totalPendingCash, 2) ?></span>
                        <span class="s-sub">All selected records</span>
                    </div>
                </div>

                <!-- ── Table ── -->
                <form id="cashHandoverForm">
                    <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap gap-2">
                        <div>
                            <span class="badge bg-success me-2">✅ Check In = Full Amount</span>
                            <span class="badge bg-warning text-dark">⚠️ Check Out = Balance Only (Final − Original)</span>
                        </div>
                        <button type="submit" id="saveCashHandover" class="btn btn-warning fw-bold">
                            <i class="bi bi-save me-1"></i> Save Handover
                        </button>
                    </div>

                    <div class="table-responsive">
                        <table id="cashHandoverTable" class="table table-bordered table-striped align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>Select</th>
                                    <th>#</th>
                                    <th>Reference No</th>
                                    <th>Customer</th>
                                    <th>WhatsApp</th>
                                    <th>Check In Date/Time</th>
                                    <th>Check In By</th>
                                    <th>Check Out Date/Time</th>
                                    <th>Check Out By</th>
                                    <th>Status</th>
                                    <th>Original Price (LKR)</th>
                                    <th>Final Price (LKR)</th>
                                    <th>Payment Type</th>
                                    <th>Handover Status</th>
                                    <th class="text-end">Cash Collected (LKR)</th>
                                    <th>Finance Status</th>
                                </tr>
                            </thead>

                            <tbody>
                                <?php if (!empty($cashHandovers)): ?>
                                    <?php foreach ($cashHandovers as $index => $row): ?>
                                        <?php
                                            $isCheckOut           = ($row['status'] === 'check_out');
                                            $originalPrice        = (float)($row['total_price']       ?? 0);
                                            $finalPrice           = (float)($row['total_price_final'] ?? 0);
                                            $cashCollected        = (float)($row['cash_collected']    ?? 0);
                                            $checkInHandoverDone  = !empty($row['cash_handover_checkin']);
                                            $checkOutHandoverDone = !empty($row['cash_handover']);
                                            $handoverDone         = $checkInHandoverDone || $checkOutHandoverDone;

                                            $handoverLabel = 'Pending';
                                            if ($checkInHandoverDone && $checkOutHandoverDone) {
                                                $handoverLabel = 'Check-in + check-out amount handed over';
                                            } elseif ($checkInHandoverDone) {
                                                $handoverLabel = 'Check-in amount handed over';
                                            } elseif ($checkOutHandoverDone) {
                                                $handoverLabel = 'Check-in amount handed over';
                                            }
                                        ?>
                                        <tr>
                                            <!-- Checkbox -->
                                            <td class="text-center">
                                                <input
                                                    type="checkbox"
                                                    class="cash-handover-check"
                                                    value="<?= $row['reserved_slot_id'] ?>"
                                                    data-amount="<?= $cashCollected ?>">
                                            </td>

                                            <td><?= $index + 1 ?></td>

                                            <td class="fw-bold text-primary">
                                                <?= htmlspecialchars($row['reference_number'] ?? '-') ?>
                                            </td>

                                            <td><?= htmlspecialchars($row['customer_name'] ?? '-') ?></td>

                                            <td><?= htmlspecialchars($row['whatsapp_number'] ?? '-') ?></td>

                                            <td><?= htmlspecialchars($row['check_in_datetime'] ?? '-') ?></td>

                                            <td><?= htmlspecialchars($row['check_in_by_name'] ?? '-') ?></td>

                                            <td>
                                                <?= $isCheckOut && !empty($row['check_out_datetime'])
                                                    ? htmlspecialchars($row['check_out_datetime'])
                                                    : '<span class="text-muted">—</span>' ?>
                                            </td>

                                            <td>
                                                <?= $isCheckOut && !empty($row['check_out_by_name'])
                                                    ? htmlspecialchars($row['check_out_by_name'])
                                                    : '<span class="text-muted">—</span>' ?>
                                            </td>

                                            <!-- Status Badge -->
                                            <td>
                                                <?php if ($isCheckOut): ?>
                                                    <span class="badge bg-warning text-dark">
                                                        <i class="bi bi-box-arrow-right me-1"></i>Check Out
                                                    </span>
                                                <?php else: ?>
                                                    <span class="badge bg-success">
                                                        <i class="bi bi-box-arrow-in-right me-1"></i>Check In
                                                    </span>
                                                <?php endif; ?>
                                            </td>

                                            <!-- Original Price -->
                                            <td class="text-end">
                                                <?= number_format($originalPrice, 2) ?>
                                            </td>

                                            <!-- Final Price -->
                                            <td class="text-end">
                                                <?php if ($isCheckOut && $finalPrice > 0): ?>
                                                    <span class="balance-amount">
                                                        <?= number_format($finalPrice, 2) ?>
                                                    </span>
                                                <?php else: ?>
                                                    <span class="text-muted">—</span>
                                                <?php endif; ?>
                                            </td>

                                            <td>Cash</td>

                                            <!-- Handover Status -->
                                            <td class="text-center">
                                                <?php if ($handoverDone): ?>
                                                    <span class="handover-status handover-done">
                                                        <i class="bi bi-check-circle"></i>
                                                        <?= htmlspecialchars($handoverLabel) ?>
                                                    </span>
                                                <?php else: ?>
                                                    <span class="handover-status handover-pending">
                                                        <i class="bi bi-clock"></i> Pending
                                                    </span>
                                                <?php endif; ?>
                                            </td>

                                            <!-- Cash Collected -->
                                            <td class="text-end fw-bold">
                                                <?php if ($isCheckOut): ?>
                                                    <span class="balance-amount">
                                                        <?= number_format($cashCollected, 2) ?>
                                                    </span>
                                                    <br>
                                                    <small class="text-muted" style="font-size:10px;">
                                                        Balance only
                                                    </small>
                                                <?php else: ?>
                                                    <?= number_format($cashCollected, 2) ?>
                                                <?php endif; ?>
                                            </td>

                                            <!-- Finance Status -->
                                            <td class="text-center">
                                                <?php if (($row['cash_received_status'] ?? '') === 'accepted'): ?>
                                                    <span class="badge bg-success">
                                                        <i class="bi bi-check-circle me-1"></i>Accepted
                                                    </span>
                                                <?php else: ?>
                                                    <span class="badge bg-warning text-dark">
                                                        <i class="bi bi-clock me-1"></i>Pending
                                                    </span>
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <!-- <tr>
                                        <td colspan="15" class="text-center text-muted py-4">
                                            <i class="bi bi-inbox"></i> No pending cash handovers
                                        </td>
                                    </tr> -->
                                <?php endif; ?>
                            </tbody>

                            <tfoot>
                                <tr class="total-row">
                                    <td colspan="15" class="text-end">
                                        <i class="bi bi-cash-stack me-1"></i> Total Pending Cash
                                    </td>
                                    <td class="text-end">
                                        LKR <?= number_format((float)$totalPendingCash, 2) ?>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </form>

            </div><!-- /dashboard-card -->

            <!-- ════════════════════════════════════════════════════════════════ -->
            <!-- COMPLETED HANDOVERS (Both Check-In and Check-Out Combined) -->
            <!-- ════════════════════════════════════════════════════════════════ -->
            <div class="card dashboard-card table-completed">

                <h3 class="text-success">
                    <i class="bi bi-check-circle me-2"></i> Completed Cash Handovers
                </h3>

                <!-- Summary for Completed -->
                <!-- <div class="summary-strip-green">
                    <div class="s-item">
                        <span class="s-label">Total Records</span>
                        <span class="s-value"><?= count($completedHandovers) ?></span>
                        <span class="s-sub">All completed handovers</span>
                    </div>
                    <div class="s-item ms-auto">
                        <span class="s-label">Total Amount Handed Over</span>
                        <span class="s-value">LKR <?= number_format($totalCompletedCash, 2) ?></span>
                        <span class="s-sub">All completed transactions</span>
                    </div>
                </div> -->

                <div class="table-responsive">
                    <table id="completedHandoversTable" class="table table-bordered table-striped align-middle table-completed">
                        <thead class="table-success">
                            <tr>
                                <th>#</th>
                                <th>Reference No</th>
                                <th>Customer</th>
                                <th>WhatsApp</th>
                                <th>Check In Date/Time</th>
                                <th>Check Out Date/Time</th>
                                <!-- <th>Type</th> -->
                                <th>Handover Date/Time</th>
                                <!-- <th>Handover By</th> -->
                                <th>Original Price (LKR)</th>
                                <th>Late Payment /(LKR)</th>
                                <th>Final Price (LKR)</th>
                                <th>Finance Status</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php if (!empty($completedHandovers)): ?>
                                <?php foreach ($completedHandovers as $index => $row): ?>
                                    <?php
                                        $isCheckOut     = ($row['status'] === 'check_out');
                                        $originalPrice  = (float)($row['total_price'] ?? 0);
                                        $finalPrice     = (float)($row['total_price_final'] ?? 0);
                                        $handoverTime   = $isCheckOut ? $row['handover_datetime'] : $row['cash_handover_checkin'];
                                        
                                        // Determine handover amounts
                                        $checkInAmount  = $originalPrice; // Amount at check-in
                                        $checkOutBalance = $finalPrice - $originalPrice; // Balance at checkout
                                        $hasCheckInHandover  = !empty($row['cash_handover_checkin']);
                                        $hasCheckOutHandover = !empty($row['cash_handover']);
                                        
                                        // For checkout rows with both handovers, show both amounts
                                        if ($isCheckOut && $hasCheckInHandover && $hasCheckOutHandover) {
                                            $amountDisplay = number_format($checkInAmount, 2) . ' and ' . number_format($checkOutBalance, 2);
                                        } elseif ($isCheckOut && $hasCheckOutHandover) {
                                            // Checkout only (no check-in recorded)
                                            $amountDisplay = number_format($checkOutBalance, 2);
                                        } else {
                                            // Check-in only or default
                                            $amountDisplay = number_format($originalPrice, 2);
                                        }
                                    ?>
                                    <tr>
                                        <td><?= $index + 1 ?></td>

                                        <td class="fw-bold text-primary">
                                            <?= htmlspecialchars($row['reference_number'] ?? '-') ?>
                                        </td>

                                        <td><?= htmlspecialchars($row['customer_name'] ?? '-') ?></td>

                                        <td><?= htmlspecialchars($row['whatsapp_number'] ?? '-') ?></td>

                                        <td><?= htmlspecialchars($row['check_in_datetime'] ?? '-') ?></td>

                                        <td>
                                            <?= !empty($row['check_out_datetime'])
                                                ? htmlspecialchars($row['check_out_datetime'])
                                                : '<span class="text-muted">—</span>' ?>
                                        </td>

                                        <!-- Type Badge -->
                                        <!-- <td class="text-center">
                                            <?php if ($isCheckOut): ?>
                                                <span class="status-badge-checkout">
                                                    <i class="bi bi-box-arrow-right me-1"></i>Check Out
                                                </span>
                                            <?php else: ?>
                                                <span class="status-badge-checkin">
                                                    <i class="bi bi-box-arrow-in-right me-1"></i>Check In
                                                </span>
                                            <?php endif; ?>
                                        </td> -->

                                        <td>
                                            <?= !empty($handoverTime)
                                                ? htmlspecialchars($handoverTime)
                                                : '<span class="text-muted">—</span>' ?>
                                        </td>

                                        <!-- <td>
                                            <?= !empty($row['handover_by'])
                                                ? htmlspecialchars($row['handover_by'])
                                                : '<span class="text-muted">—</span>' ?>
                                        </td> -->

                                        <td class="text-end">
                                            <?= number_format($originalPrice, 2) ?>
                                        </td>

                                        <td class="text-end">
                                            <?= number_format($finalPrice - $originalPrice, 2) ?>
                                        </td>

                                        <td class="text-end">
                                            <?php if ($isCheckOut && $finalPrice > 0): ?>
                                                <span class="balance-amount">
                                                    <?= number_format($finalPrice, 2) ?>
                                                </span>
                                            <?php else: ?>
                                                <span class="text-muted">—</span>
                                            <?php endif; ?>
                                        </td>

                                        <!-- Finance Status -->
                                        <td class="text-center">
                                            <?php if (($row['cash_received_status'] ?? '') === 'accepted'): ?>
                                                <span class="badge bg-success">
                                                    <i class="bi bi-check-circle me-1"></i>Accepted
                                                </span>
                                                <?php if (!empty($row['cash_received_datetime'])): ?>
                                                    <br><small class="text-muted" style="font-size:10px;">
                                                        <?= date('d M Y h:i A', strtotime($row['cash_received_datetime'])) ?>
                                                    </small>
                                                <?php endif; ?>
                                            <?php else: ?>
                                                <span class="badge bg-warning text-dark">
                                                    <i class="bi bi-clock me-1"></i>Pending
                                                </span>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <!-- <tr>
                                    <td colspan="12" class="text-center text-muted py-4">
                                        <i class="bi bi-inbox"></i> No completed handovers yet
                                    </td>
                                </tr> -->
                            <?php endif; ?>
                        </tbody>

                        <!-- <tfoot>
                            <tr class="total-row-completed">
                                <td colspan="10" class="text-end">
                                    <i class="bi bi-cash-stack me-1"></i> Total Completed Handovers
                                </td>
                                <td class="text-end">
                                    LKR <?= number_format((float)$totalCompletedCash, 2) ?>
                                </td>
                            </tr>
                        </tfoot> -->
                    </table>
                </div>

            </div>

        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/2.1.2/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.1.2/js/dataTables.bootstrap5.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>

<script>
    $(function () {

        // ── DataTable for Pending ──
        $('#cashHandoverTable').DataTable({
            pageLength: 25,
            lengthMenu: [10, 25, 50, 100],
            responsive: true,
            order: [[5, 'desc']], // sort by check-in datetime
            columnDefs: [
                { orderable: false, targets: [0] }, // checkbox col
            ],
            buttons: [{
                extend: 'csvHtml5',
                className: 'd-none',
                text: 'Export CSV',
                exportOptions: {
                    columns: ':not(:first-child)',
                    modifier: { search: 'applied' }
                }
            }]
        });

        // ── DataTable for Completed ──
        $('#completedHandoversTable').DataTable({
            pageLength: 25,
            lengthMenu: [10, 25, 50, 100],
            responsive: true,
            order: [[7, 'desc']], // sort by handover datetime
        });

        // ── Live total from checked checkboxes ──
        $(document).on('change', '.cash-handover-check', function () {
            let total = 0;
            $('.cash-handover-check:checked').each(function () {
                total += parseFloat($(this).data('amount')) || 0;
            });
            
            console.log('Total selected: LKR ' + total.toFixed(2));
        });

        // ── Cash Handover Form Submit ──
        $(document).on('submit', '#cashHandoverForm', function (e) {
            e.preventDefault();

            const bookingIds = [];
            $('.cash-handover-check:checked').each(function () {
                bookingIds.push($(this).val());
            });

            if (bookingIds.length === 0) {
                alert('⚠️ Please select at least one booking.');
                return;
            }

            $('#saveCashHandover').prop('disabled', true).html(
                '<i class="bi bi-hourglass-split me-1"></i> Processing...'
            );

            $.ajax({
                url: 'assets/includes/save-cash-handover.php',
                type: 'POST',
                dataType: 'json',
                data: { booking_ids: bookingIds },
                success: function (res) {
                    if (res.success) {
                        const successMsg = `✅ Cash handover processed successfully!\n\n` +
                            `Records processed: ${bookingIds.length}\n` +
                            `Check-in records: Kept in pending\n` +
                            `Check-out records: Kept/Removed based on price changes\n\n` +
                            `The page will reload now.`;
                        
                        alert(successMsg);
                        location.reload();
                    } else {
                        alert('❌ ' + (res.message || 'Failed to save cash handover.'));
                        $('#saveCashHandover').prop('disabled', false).html(
                            '<i class="bi bi-save me-1"></i> Save Handover'
                        );
                    }
                },
                error: function (xhr, status, error) {
                    alert('❌ Server error while saving cash handover.\n\n' + error);
                    $('#saveCashHandover').prop('disabled', false).html(
                        '<i class="bi bi-save me-1"></i> Save Handover'
                    );
                }
            });
        });

    });
</script>

</body>
</html>