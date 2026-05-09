<?php
session_start();
require_once __DIR__ . '/db_connect.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode([
        'success' => false,
        'message' => 'Unauthorized access.'
    ]);
    exit;
}

if (empty($_POST['handover_batch']) || empty($_POST['handover_datetime'])) {
    echo json_encode([
        'success' => false,
        'message' => 'Handover batch and date time are required.'
    ]);
    exit;
}

$handoverBatch = trim($_POST['handover_batch']);
$handoverDatetime = trim($_POST['handover_datetime']);
$userId = $_SESSION['user_id'];

try {
    $stmt = $conn->prepare("
        UPDATE reserved_slots
        SET
            cash_received_status = 'accepted',
            cash_received_by = :user_id,
            cash_received_datetime = NOW()
        WHERE handover_batch = :handover_batch
        AND handover_datetime = :handover_datetime
        AND cash_handover = 1
        AND booking_status = 'confirmed'
        AND (cash_received_status IS NULL OR cash_received_status = 'pending')
    ");

    $stmt->execute([
        ':user_id' => $userId,
        ':handover_batch' => $handoverBatch,
        ':handover_datetime' => $handoverDatetime
    ]);

    echo json_encode([
        'success' => true,
        'updated_count' => $stmt->rowCount()
    ]);

} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Database error: ' . $e->getMessage()
    ]);
}