<?php

$reference = $_GET['reference'] ?? null;

if (!$reference) {
    die("Reference is required");
}

// Validate format
if (!preg_match('/^G\d+-AP-\d+$/', $reference)) {
    die("Invalid reference format");
}

$folderPath = __DIR__ . "/payment-receipts/$reference";

if (!is_dir($folderPath)) {
    die("Folder not found");
}


$files = glob($folderPath . "/*.pdf");

if (!$files) {
    die("No invoices found");
}

$latestFile = null;
$latestTime = 0;

foreach ($files as $file) {
    $fileTime = filemtime($file);

    if ($fileTime > $latestTime) {
        $latestTime = $fileTime;
        $latestFile = $file;
    }
}

if (!$latestFile) {
    die("No valid file found");
}

// Return PDF
header("Content-Type: application/pdf");
header("Content-Disposition: inline; filename=\"" . basename($latestFile) . "\"");
header("Content-Length: " . filesize($latestFile));

readfile($latestFile);
exit;