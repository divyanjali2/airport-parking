<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: invoice-batches.php");
    exit;
}

$batchId = trim($_POST['batch_id'] ?? '');

if ($batchId === '') {
    $_SESSION['toast_message'] = 'Invalid batch ID.';
    $_SESSION['toast_type'] = 'error';
    header("Location: invoice-batches.php");
    exit;
}

try {
    $conn->beginTransaction();

    $stmt = $conn->prepare("
        SELECT reserved_slot_id
        FROM sent_invoices
        WHERE batch_id = :batch_id
    ");
    $stmt->execute([':batch_id' => $batchId]);
    $slotIds = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (empty($slotIds)) {
        throw new Exception('No reserved slots found for this batch.');
    }

    $placeholders = implode(',', array_fill(0, count($slotIds), '?'));

    $update = $conn->prepare("
        UPDATE reserved_slots
        SET status = 'accepted'
        WHERE id IN ($placeholders)
    ");
    $update->execute($slotIds);

    $conn->commit();

    $_SESSION['toast_message'] = 'Batch accepted successfully.';
    $_SESSION['toast_type'] = 'success';

} catch (Exception $e) {
    if ($conn->inTransaction()) {
        $conn->rollBack();
    }

    $_SESSION['toast_message'] = 'Failed to accept batch: ' . $e->getMessage();
    $_SESSION['toast_type'] = 'error';
}

header("Location: invoice-batches.php");
exit;