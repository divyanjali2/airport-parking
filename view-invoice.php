<?php
require_once __DIR__ . '/assets/includes/db_connect.php';

$ref = $_GET['ref'] ?? '';
if (!$ref) {
    exit('Invalid reference');
}

// Look up the booking in DB
$stmt = $conn->prepare("SELECT pdf_path FROM reserved_slots WHERE reference_number = ?");
$stmt->execute([$ref]);
$booking = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$booking || empty($booking['pdf_path'])) {
    exit('Invoice not found');
}

// Redirect to actual PDF
$pdfPath = str_replace('\\', '/', $booking['pdf_path']);
$docRoot = str_replace('\\', '/', $_SERVER['DOCUMENT_ROOT']);
if (strpos($pdfPath, $docRoot) === 0) {
    $pdfPath = substr($pdfPath, strlen($docRoot));
}
if ($pdfPath[0] !== '/') $pdfPath = '/' . $pdfPath;

header("Location: $pdfPath");
exit;
