<?php
    require_once __DIR__ . '/assets/includes/db_connect.php';

header('Content-Type: application/json');

$id = $_POST['id'] ?? null;
$paymentStatus = $_POST['payment_status'] ?? 'Paid Fully';

if (!$id) {
    echo json_encode([
        'success' => false,
        'message' => 'Invalid booking ID'
    ]);
    exit;
}

try {
    $stmt = $conn->prepare("
        UPDATE reserved_slots
        SET payment_status = ?
        WHERE id = ?
    ");
    $stmt->execute([$paymentStatus, $id]);

    echo json_encode([
        'success' => true
    ]);
} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Database error'
    ]);
}