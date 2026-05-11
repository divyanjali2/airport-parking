<?php
require_once __DIR__ . '/db_connect.php';

header('Content-Type: text/plain');

$id = $_POST['id'] ?? null;
$vehicle_number = $_POST['vehicle_number'] ?? '';
$flight_number = $_POST['flight_number'] ?? '';

if (!$id) {
    http_response_code(400);
    exit('error: invalid id');
}

try {
    $stmt = $conn->prepare("
        UPDATE reserved_slots
        SET vehicle_number = ?,
            flight_number = ?
        WHERE id = ?
    ");

    $stmt->execute([$vehicle_number, $flight_number, $id]);

    echo "success";

} catch (PDOException $e) {
    http_response_code(500);
    echo "error: " . $e->getMessage();
}