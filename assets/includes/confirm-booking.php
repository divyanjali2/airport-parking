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

if (empty($_POST['id'])) {

    echo json_encode([
        'success' => false,
        'message' => 'Booking ID is required.'
    ]);

    exit;
}

try {

    $stmt = $conn->prepare("
        UPDATE reserved_slots
        SET booking_status = 'confirmed'
        WHERE id = :id
    ");

    $stmt->execute([
        ':id' => $_POST['id']
    ]);

    echo json_encode([
        'success' => true,
        'message' => 'Booking confirmed successfully.'
    ]);

} catch (PDOException $e) {

    echo json_encode([
        'success' => false,
        'message' => 'Database error: ' . $e->getMessage()
    ]);
}