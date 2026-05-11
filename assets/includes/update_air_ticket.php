<?php
header('Content-Type: application/json');
require_once __DIR__ . '/db_connect.php';

try {

    $id = $_POST['id'] ?? null;
    if (!$id) throw new Exception('Missing ID');

    if (empty($_FILES['air_ticket_image'])) {
        throw new Exception('No file uploaded');
    }

    $file = $_FILES['air_ticket_image'];

    if ($file['error'] !== UPLOAD_ERR_OK) {
        throw new Exception('Upload error');
    }

    // Get booking
    $stmt = $conn->prepare("SELECT reference_number, air_ticket_image_url FROM reserved_slots WHERE id = ?");
    $stmt->execute([$id]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$row) throw new Exception('Booking not found');

    $ref = $row['reference_number'];
    $oldImage = $row['air_ticket_image_url'];

    // =========================
    // DELETE OLD FILE (FIXED)
    // =========================
    if (!empty($oldImage)) {

        // convert URL → local path
        $oldPath = str_replace(
            'http://' . $_SERVER['HTTP_HOST'] . '/airport/',
            $_SERVER['DOCUMENT_ROOT'] . '/airport/',
            $oldImage
        );

        if (file_exists($oldPath)) {
            unlink($oldPath);
        }
    }

    // =========================
    // UPLOAD NEW FILE
    // =========================
    $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/airport/uploads/';

    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    $filename = uniqid() . '.' . $ext;

    $targetPath = $uploadDir . $filename;

    if (!move_uploaded_file($file['tmp_name'], $targetPath)) {
        throw new Exception('Failed to save file');
    }

    // =========================
    // FULL URL FOR DB
    // =========================
    $fullUrl = 'http://' . $_SERVER['HTTP_HOST'] . '/airport/uploads/' . $filename;

    // =========================
    // UPDATE DB
    // =========================
    $update = $conn->prepare("
        UPDATE reserved_slots 
        SET air_ticket_image_url = ?
        WHERE id = ?
    ");

    $update->execute([$fullUrl, $id]);

    echo json_encode([
        'success' => true,
        'url' => $fullUrl
    ]);

} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}