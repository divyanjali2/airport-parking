<?php
session_start();
require_once __DIR__ . '/db_connect.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized']);
    exit;
}

if (empty($_POST['booking_ids'])) {
    echo json_encode(['success' => false, 'message' => 'No bookings selected']);
    exit;
}

try {
    $bookingIds = $_POST['booking_ids'];
    $userId = $_SESSION['user_id'];
    $handoverTime = date('Y-m-d H:i:s');

    // Get current user name
    $userStmt = $conn->prepare("SELECT full_name FROM users WHERE id = ?");
    $userStmt->execute([$userId]);
    $userName = $userStmt->fetchColumn() ?? 'System';

    $processedCount = 0;
    $removedCount = 0;

    foreach ($bookingIds as $bookingId) {
        // Get booking details
        $bookingStmt = $conn->prepare("
            SELECT rs.id, rs.reference_number, ch.status, rs.total_price, rs.total_price_final
            FROM reserved_slots rs
            INNER JOIN customer_handling ch ON rs.reference_number = ch.reference_number
            WHERE rs.id = ? AND rs.cash_handover = 0
        ");
        $bookingStmt->execute([$bookingId]);
        $booking = $bookingStmt->fetch(PDO::FETCH_ASSOC);

        if (!$booking) continue;

        $status = $booking['status'];
        $originalPrice = (float)$booking['total_price'];
        $finalPrice = (float)($booking['total_price_final'] ?? $originalPrice);

        if ($status === 'check_in') {
            // DO NOT set cash_handover = 1, only record the timestamp
            $updateStmt = $conn->prepare("
                UPDATE reserved_slots
                SET cash_handover_checkin = ?,
                    handover_datetime = ?,
                    handover_by = ?
                WHERE id = ?
            ");
            $updateStmt->execute([$handoverTime, $handoverTime, $userName, $bookingId]);

            // Log the transaction
            $logStmt = $conn->prepare("
                INSERT INTO cash_handover_log (reserved_slot_id, handover_type, amount, handover_by, handover_at)
                VALUES (?, 'check_in', ?, ?, ?)
            ");
            $logStmt->execute([$bookingId, $originalPrice, $userName, $handoverTime]);
            $processedCount++;

        } elseif ($status === 'check_out') {
  
            if ($finalPrice != $originalPrice) {
                // Price changed: Mark as handed over, KEEP in pending with balance
                $balanceAmount = $finalPrice - $originalPrice;
                
                $updateStmt = $conn->prepare("
                    UPDATE reserved_slots
                    SET cash_handover = 1,
                        handover_datetime = ?,
                        handover_by = ?
                    WHERE id = ?
                ");
                $updateStmt->execute([$handoverTime, $userName, $bookingId]);

                // Log the transaction
                $logStmt = $conn->prepare("
                    INSERT INTO cash_handover_log (reserved_slot_id, handover_type, amount, handover_by, handover_at)
                    VALUES (?, 'check_out_balance', ?, ?, ?)
                ");
                $logStmt->execute([$bookingId, $balanceAmount, $userName, $handoverTime]);
                $processedCount++;

            } else {
                // Price same: Mark as handled and REMOVE from pending
                $updateStmt = $conn->prepare("
                    UPDATE reserved_slots
                    SET cash_handover = 1,
                        handover_datetime = ?,
                        handover_by = ?
                    WHERE id = ?
                ");
                $updateStmt->execute([$handoverTime, $userName, $bookingId]);

                // Log the transaction
                $logStmt = $conn->prepare("
                    INSERT INTO cash_handover_log (reserved_slot_id, handover_type, amount, handover_by, handover_at)
                    VALUES (?, 'check_out_no_balance', ?, ?, ?)
                ");
                $logStmt->execute([$bookingId, 0, $userName, $handoverTime]);
                $removedCount++;
            }
        }
    }

    echo json_encode([
        'success' => true,
        'message' => "Cash handover processed: {$processedCount} kept, {$removedCount} completed",
        'processed' => $processedCount,
        'removed' => $removedCount
    ]);

} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Database error: ' . $e->getMessage()
    ]);
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error: ' . $e->getMessage()
    ]);
}
?>