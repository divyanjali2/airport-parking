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

if (empty($_POST['booking_ids']) || !is_array($_POST['booking_ids'])) {
    echo json_encode([
        'success' => false,
        'message' => 'Please select at least one booking.'
    ]);
    exit;
}

$userId = $_SESSION['user_id'];
$bookingIds = array_map('intval', $_POST['booking_ids']);
// Generate next batch number
$stmtBatch = $conn->query("
    SELECT handover_batch
    FROM reserved_slots
    WHERE handover_batch IS NOT NULL
    ORDER BY id DESC
    LIMIT 1
");

$lastBatch = $stmtBatch->fetchColumn();

$nextBatchNumber = 1;

if ($lastBatch && preg_match('/Batch\s+(\d+)/i', $lastBatch, $matches)) {
    $nextBatchNumber = ((int)$matches[1]) + 1;
}

$handoverBatch = 'Batch ' . $nextBatchNumber;

try {
    $placeholders = implode(',', array_fill(0, count($bookingIds), '?'));

    $sql = "
        UPDATE reserved_slots
        SET 
            cash_handover = 1,
            handover_datetime = NOW(),
            handover_by = ?,
            handover_batch = ?
        WHERE id IN ($placeholders)
        AND payment_status = 'Paid Fully'
        AND booking_status = 'confirmed'
        AND cash_handover = 0
    ";

    $params = array_merge([$userId, $handoverBatch], $bookingIds);

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);

    echo json_encode([
        'success' => true,
        'updated_count' => $stmt->rowCount(),
        'handover_batch' => $handoverBatch
    ]);

} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Database error: ' . $e->getMessage()
    ]);
}