<?php
header('Content-Type: application/json');

function api_error($message, $code = 400) {
    http_response_code($code);

    echo json_encode([
        "status" => "error",
        "message" => $message
    ]);

    exit;
}

$reference = $_GET['reference'] ?? null;

if (!$reference) {
    api_error("Reference number is required");
}

/*
|--------------------------------------------------------------------------
| SERVER FOLDER PATH
|--------------------------------------------------------------------------
*/

$baseDir = $_SERVER['DOCUMENT_ROOT'] . "/payment-receipts";

/*
|--------------------------------------------------------------------------
| PUBLIC URL
|--------------------------------------------------------------------------
*/

$baseUrl = "https://airportparking.lk/payment-receipts";

$folderPath = $baseDir . "/" . $reference;

/*
|--------------------------------------------------------------------------
| CHECK FOLDER
|--------------------------------------------------------------------------
*/

if (!is_dir($folderPath)) {

    echo json_encode([
        "status" => "success",
        "exists" => false,
        "message" => "No receipt folder found",
        "pdf_url" => null
    ]);

    exit;
}

/*
|--------------------------------------------------------------------------
| GET PDF FILES
|--------------------------------------------------------------------------
*/

$pdfFiles = glob($folderPath . "/*.pdf");

if (!$pdfFiles || count($pdfFiles) === 0) {

    echo json_encode([
        "status" => "success",
        "exists" => false,
        "message" => "Folder exists but no PDF found",
        "pdf_url" => null
    ]);

    exit;
}

/*
|--------------------------------------------------------------------------
| GET LATEST PDF
|--------------------------------------------------------------------------
*/

usort($pdfFiles, function($a, $b) {
    return filemtime($b) - filemtime($a);
});

$latestPdf = basename($pdfFiles[0]);

$pdfUrl = $baseUrl . "/" .
           rawurlencode($reference) . "/" .
           rawurlencode($latestPdf);

/*
|--------------------------------------------------------------------------
| RESPONSE
|--------------------------------------------------------------------------
*/

echo json_encode([
    "status" => "success",
    "exists" => true,
    "message" => "PDF receipt found",
    "reference" => $reference,
    "pdf_file" => $latestPdf,
    "pdf_url" => $pdfUrl
]);