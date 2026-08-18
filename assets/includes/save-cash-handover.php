<?php
session_start();
require_once __DIR__ . '/db_connect.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized access.']);
    exit;
}

if (empty($_POST['booking_ids']) || !is_array($_POST['booking_ids'])) {
    echo json_encode(['success' => false, 'message' => 'Please select at least one booking.']);
    exit;
}

$userId     = $_SESSION['user_id'];
$bookingIds = array_map('intval', $_POST['booking_ids']);

function nextBatch(PDO $conn, string $column, string $prefix): string
{
    $stmt = $conn->query("
        SELECT $column FROM reserved_slots
        WHERE $column IS NOT NULL
        ORDER BY id DESC LIMIT 1
    ");
    $last = $stmt->fetchColumn();
    $next = 1;
    if ($last && preg_match('/(\d+)/', $last, $m)) {
        $next = ((int)$m[1]) + 1;
    }
    return $prefix === 'Batch' ? "Batch {$next}" : "{$prefix}-Batch {$next}";
}

try {
    $conn->beginTransaction();

    $ph = implode(',', array_fill(0, count($bookingIds), '?'));
    $stageStmt = $conn->prepare("
        SELECT rs.id, ch.status
        FROM reserved_slots rs
        INNER JOIN customer_handling ch ON ch.reference_number = rs.reference_number
        WHERE rs.id IN ($ph)
    ");
    $stageStmt->execute($bookingIds);

    $checkinIds = [];
    $checkoutIds = [];
    foreach ($stageStmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
        if ($row['status'] === 'check_in')  $checkinIds[]  = (int)$row['id'];
        if ($row['status'] === 'check_out') $checkoutIds[] = (int)$row['id'];
    }

    $updatedCount = 0;
    $batches = [];

    // ── Check-in stage: full amount handed over ──
    if (!empty($checkinIds)) {
        $batch = nextBatch($conn, 'checkin_handover_batch', 'CI');
        $ph2 = implode(',', array_fill(0, count($checkinIds), '?'));

        $stmt = $conn->prepare("
            UPDATE reserved_slots
            SET
                cash_handover_checkin = NOW(),
                cash_handover_checkin_amount = COALESCE(total_price_final, total_price, 0),
                checkin_handover_batch = ?,
                checkin_handover_by = ?,
                checkin_received_status = 'pending'
            WHERE id IN ($ph2)
              AND booking_status = 'confirmed'
              AND cash_handover_checkin IS NULL
              AND is_trashed = 0
              AND is_no_show = 0
        ");
        $stmt->execute(array_merge([$batch, $userId], $checkinIds));
        $updatedCount += $stmt->rowCount();
        $batches['checkin'] = $batch;
    }

    // ── Check-out stage: late fee only OR full balance (unchanged behavior) ──
    if (!empty($checkoutIds)) {
        $batch = nextBatch($conn, 'handover_batch', 'Batch');
        $ph3 = implode(',', array_fill(0, count($checkoutIds), '?'));

        $stmt = $conn->prepare("
            UPDATE reserved_slots
            SET
                cash_handover = 1,
                payment_status = 'Paid Fully',
                handover_datetime = NOW(),
                handover_by = ?,
                handover_batch = ?,
                cash_received_status = 'pending'
            WHERE id IN ($ph3)
              AND booking_status = 'confirmed'
              AND cash_handover = 0
              AND is_trashed = 0
              AND is_no_show = 0
        ");
        $stmt->execute(array_merge([$userId, $batch], $checkoutIds));
        $updatedCount += $stmt->rowCount();
        $batches['checkout'] = $batch;
    }

    $conn->commit();
    echo json_encode(['success' => true, 'updated_count' => $updatedCount, 'batches' => $batches]);

} catch (PDOException $e) {
    $conn->rollBack();
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
}