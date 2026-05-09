<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . "/../assets/includes/db_connect.php";


ini_set("display_errors", 0);
error_reporting(E_ALL);

function respond($success, $message, $data = null) {
    echo json_encode([
        "success" => $success,
        "message" => $message,
        "data" => $data
    ]);
    exit;
}

function writeLog($title, $data = null) {
    $file = __DIR__ . "/transport_sync_log.txt";
    $text = "[" . date("Y-m-d H:i:s") . "] " . $title . PHP_EOL;

    if ($data !== null) {
        $text .= print_r($data, true) . PHP_EOL;
    }

    $text .= str_repeat("-", 60) . PHP_EOL;
    file_put_contents($file, $text, FILE_APPEND);
}

function generateBookingNumber($type = "OFFICE") {
    $prefix = strtoupper($type);

    if ($prefix === "") {
        $prefix = "TRN";
    }

    $random = str_pad(rand(0, 99), 2, "0", STR_PAD_LEFT);

    return $prefix . "-" . $random;
}

function sendRentalToExploreDrive($payload) {
    $url = "https://srilankaautorentals.com/api/rental-sync";
    $secret = "123456789";

    writeLog("Sending rental sync request", [
        "url" => $url,
        "payload" => $payload
    ]);

    $ch = curl_init($url);

    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_HTTPHEADER => [
            "Content-Type: application/json",
            "Accept: application/json",
            "X-SYNC-SECRET: " . $secret
        ],
        CURLOPT_POSTFIELDS => json_encode($payload),
        CURLOPT_TIMEOUT => 20,
        CURLOPT_CONNECTTIMEOUT => 5,
    ]);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);

    curl_close($ch);

    $result = [
        "success" => $httpCode >= 200 && $httpCode < 300,
        "status" => $httpCode,
        "error" => $error,
        "raw" => $response,
        "decoded" => json_decode($response, true),
    ];

    writeLog("Rental sync response", $result);

    return $result;
}

if (($_SERVER["REQUEST_METHOD"] ?? "") !== "POST") {
    http_response_code(405);
    respond(false, "Method not allowed");
}

$raw = file_get_contents("php://input");
$body = json_decode($raw, true);

writeLog("Incoming request", [
    "raw" => $raw,
    "decoded" => $body
]);

if (!is_array($body)) {
    respond(false, "Invalid JSON");
}

// Required fields
$employee_id   = (int)($body["employee_id"] ?? 0);
$manager_id    = (int)($body["manager_id"] ?? 0);
$vehicle_no    = trim($body["vehicle_no"] ?? "");
$vehicle_id    = (int)($body["vehicle_id"] ?? 0);
$from_date     = trim($body["from_date"] ?? "");
$to_date       = trim($body["to_date"] ?? "");
$destination   = trim($body["destination"] ?? "");
$reason        = trim($body["reason"] ?? "Office Service");
$vehicle_type  = trim($body["vehicle_type"] ?? "-");
$chauffer_phone = trim($body["chauffer_phone"] ?? "");
$chauffer_name  = trim($body["chauffer_name"] ?? "");

// Optional fields
$passenger_count = (int)($body["passenger_count"] ?? 1);
$type = trim($body["type"] ?? "office");

// Validate
if ($employee_id <= 0) respond(false, "employee_id required");
if ($manager_id <= 0) respond(false, "manager_id required");
if ($vehicle_no === "") respond(false, "vehicle_no required");
if ($vehicle_id <= 0) respond(false, "vehicle_id required");
if ($from_date === "") respond(false, "from_date required");
if ($to_date === "") respond(false, "to_date required");
if ($destination === "") respond(false, "destination required");
if ($chauffer_phone === "") respond(false, "chauffer_phone required");
if ($chauffer_name === "") respond(false, "chauffer_name required");

// convert date-only to DATETIME
$assigned_start_at = $from_date . " 00:00:00";
$assigned_end_at   = $to_date . " 23:59:59";

// defaults because your form doesn't have pickup
$pickup_location  = "Head Office";
$dropoff_location = $destination;

// status
$status = "PENDING";

try {
	// Check if user already has a PENDING request
    $checkStmt = $conn->prepare("
        SELECT id FROM transport_services 
        WHERE employee_id = ? AND status = 'PENDING' AND type = 'office'
        LIMIT 1
    ");

    $checkStmt->bind_param("i", $employee_id);
    $checkStmt->execute();
    $result = $checkStmt->get_result();

    if ($result->num_rows > 0) {
        respond(false, "You already have a pending request. You can cancel your request or wait until it is completed.");
    }
	
	$checkStmt->close();
	
    $stmt = $conn->prepare("
        INSERT INTO transport_services
        (
            source_id, type, vehicle_type, vehicle_id, vehicle_no, chauffer_phone, chauffer_name,
            employee_id, manager_id, status,
            assigned_start_at, pickup_location, dropoff_location, assigned_end_at,
            passenger_count, trip_code, created_at, updated_at
        )
        VALUES
        (
            0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, NOW(), NOW()
        )
    ");

    if (!$stmt) {
        throw new Exception("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param(
        "ssisssissssssi",
        $type,
        $vehicle_type,
        $vehicle_id,
        $vehicle_no,
        $chauffer_phone,
        $chauffer_name,
        $employee_id,
        $manager_id,
        $status,
        $assigned_start_at,
        $pickup_location,
        $dropoff_location,
        $assigned_end_at,
        $passenger_count
    );

    if (!$stmt->execute()) {
        throw new Exception("Transport insert failed: " . $stmt->error);
    }

    $id = $stmt->insert_id;
    $stmt->close();

    writeLog("Transport created", [
        "transport_id" => $id,
        "vehicle_id" => $vehicle_id
    ]);

    $payload = [
        "booking_number" => generateBookingNumber($type),
        "vehicle_id" => $vehicle_id,
        "company_id" => 1,
        "driver_name" => $type,
        "arrival_date" => $assigned_start_at,
        "departure_date" => $assigned_end_at,
        "passengers" => $passenger_count,
        "status" => "booked",
        "created_by" => 1,
        "transport_id" => $id,
        "vehicle_no" => $vehicle_no,
        "reason" => $reason,
        "vehicle_type" => $vehicle_type
    ];

    $rentalResult = sendRentalToExploreDrive($payload);

    if (!$rentalResult["success"]) {
        writeLog("Rental sync failed", [
            "transport_id" => $id,
            "rental" => $rentalResult
        ]);

        respond(false, "Transport created, but rental sync failed", [
            "id" => $id,
            "rental" => $rentalResult
        ]);
    }

    writeLog("Final success", [
        "transport_id" => $id,
        "rental" => $rentalResult
    ]);

    respond(true, "Request created", [
        "id" => $id,
        "rental" => $rentalResult
    ]);

} catch (Throwable $e) {
    writeLog("Fatal error", [
        "message" => $e->getMessage(),
        "file" => $e->getFile(),
        "line" => $e->getLine()
    ]);

    http_response_code(500);
    respond(false, "Server error: " . $e->getMessage());
}