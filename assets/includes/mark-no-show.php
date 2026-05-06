<?php
session_start();
header('Content-Type: application/json');

require_once __DIR__ . '/db_connect.php';

try {
    $id = isset($_POST['id']) ? (int) $_POST['id'] : 0;
    $reason = trim($_POST['reason'] ?? '');

    if ($id <= 0) {
        throw new Exception('Invalid booking id.');
    }

    if ($reason === '') {
        throw new Exception('Reason is required.');
    }

    $stmt = $conn->prepare("
        UPDATE reserved_slots
        SET
            is_no_show = 1,
            no_show_reason = :reason
        WHERE id = :id
    ");

    $stmt->execute([
        ':id' => $id,
        ':reason' => $reason,
    ]);

    echo json_encode([
        'success' => true,
        'message' => 'Booking marked as no show.'
    ]);
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}