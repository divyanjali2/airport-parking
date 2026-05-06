<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: add-invoices.php");
    exit;
}

$selectedBookings = $_POST['selected_bookings'] ?? [];
$grandTotalAmount = isset($_POST['grand_total_amount']) ? (float) $_POST['grand_total_amount'] : 0;
$sentBy = $_SESSION['user_id'] ?? null;

if (empty($selectedBookings)) {
    die("No invoices selected.");
}

try {
    $conn->beginTransaction();

    $placeholders = implode(',', array_fill(0, count($selectedBookings), '?'));

    $fetchStmt = $conn->prepare("
        SELECT id, reference_number, total_price, total_price_final
        FROM reserved_slots
        WHERE id IN ($placeholders)
          AND is_trashed = 0
          AND status = 'pending'
    ");
    $fetchStmt->execute($selectedBookings);
    $bookings = $fetchStmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($bookings)) {
        throw new Exception("No valid pending bookings found.");
    }

    $batchId = 'INV-' . date('Ymd') . '-' . rand(100,999);

    $insertStmt = $conn->prepare("
        INSERT INTO sent_invoices (
            batch_id,
            reserved_slot_id,
            reference_number,
            invoice_amount,
            batch_total_amount,
            sent_by
        ) VALUES (
            :batch_id,
            :reserved_slot_id,
            :reference_number,
            :invoice_amount,
            :batch_total_amount,
            :sent_by
        )
    ");

    $updateStmt = $conn->prepare("
        UPDATE reserved_slots
        SET status = 'send_to_finance'
        WHERE id = :id
    ");

    foreach ($bookings as $booking) {
        $amount = !empty($booking['total_price_final'])
            ? (float)$booking['total_price_final']
            : (float)$booking['total_price'];

        $insertStmt->execute([
            ':batch_id' => $batchId,
            ':reserved_slot_id'   => $booking['id'],
            ':reference_number'   => $booking['reference_number'],
            ':invoice_amount'     => $amount,
            ':batch_total_amount' => $grandTotalAmount,
            ':sent_by'            => $sentBy
        ]);

        $updateStmt->execute([
            ':id' => $booking['id']
        ]);
    }

    $conn->commit();

    $_SESSION['success_message'] = "Invoices sent to finance successfully.";
    header("Location: add-invoices.php");
    exit;

} catch (Exception $e) {
    if ($conn->inTransaction()) {
        $conn->rollBack();
    }

    die("Error: " . htmlspecialchars($e->getMessage()));
}