<?php
session_start();
require_once __DIR__ . '/db_connect.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Unauthorized access.']);
    exit;
}

$handoverBatch = trim($_POST['handover_batch'] ?? '');
$type          = trim($_POST['type'] ?? '');
$userId        = $_SESSION['user_id'];

if ($handoverBatch === '' || $type === '') {
    echo json_encode(['success' => false, 'message' => 'Missing batch or type.']);
    exit;
}

try {
    if ($type === 'checkin') {
        $stmt = $conn->prepare("
            UPDATE reserved_slots
            SET checkin_received_status = 'accepted',
                checkin_received_by = :user_id,
                checkin_received_datetime = NOW()
            WHERE checkin_handover_batch = :batch
              AND checkin_received_status = 'pending'
              AND booking_status = 'confirmed'
        ");
    } else {
        $stmt = $conn->prepare("
            UPDATE reserved_slots
            SET cash_received_status = 'accepted',
                cash_received_by = :user_id,
                cash_received_datetime = NOW()
            WHERE handover_batch = :batch
              AND cash_handover = 1
              AND booking_status = 'confirmed'
              AND (cash_received_status IS NULL OR cash_received_status = 'pending')
        ");
    }

    $stmt->execute([':user_id' => $userId, ':batch' => $handoverBatch]);
    echo json_encode(['success' => true, 'updated_count' => $stmt->rowCount()]);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
}