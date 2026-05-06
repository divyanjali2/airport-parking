<?php
header('Content-Type: application/json');
require_once __DIR__ . '/db_connect.php';

try {
    $data = json_decode(file_get_contents('php://input'), true);
    if (!$data) throw new Exception('Invalid JSON');

    $id            = $data['id'] ?? null;
    $remark        = $data['remark'] ?? '';
    $isTrashed     = isset($data['is_trashed']) ? (int)$data['is_trashed'] : 0;
    $meterReading  = $data['meter_reading'] ?? null;
    $imagesData    = $data['images'] ?? [];
    $editedEndDate = $data['edited_end_date'] ?? null;
    $vehicleStatus = $data['vehicle_status'] ?? null;

    if (!$id) throw new Exception('Missing booking ID');

    // Helpers
    $toTs = function (?string $dt): ?int {
        if (!$dt) return null;
        $dt = str_replace(['T', '/'], [' ', '-'], $dt);
        $ts = strtotime($dt);
        return $ts !== false ? $ts : null;
    };

    $surchargePct = function (int $lateMinAfterGrace): int {
        if ($lateMinAfterGrace <= 0) return 0;
        if ($lateMinAfterGrace <= 120) return 25;  // 2–4h after grace
        if ($lateMinAfterGrace <= 240) return 50;  // 4–6h after grace
        if ($lateMinAfterGrace <= 360) return 75;  // 6–8h after grace
        return 100;                                // >8h after grace
    };

    // Fetch booking
    $stmt = $conn->prepare("SELECT images, reference_number, end_date, total_price FROM reserved_slots WHERE id = ?");
    $stmt->execute([$id]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$row) throw new Exception('Booking not found');

    $existingImages  = $row['images'] ? json_decode($row['images'], true) : [];
    if (!is_array($existingImages)) $existingImages = [];

    $referenceNumber = $row['reference_number'];
    $originalEndDate = $row['end_date'] ?? null;
    $baseTotalPrice  = (float)($row['total_price'] ?? 0);

    // Save images (base64)
    $uploadedImages = [];
    if (!empty($imagesData)) {
        $uploadDir = __DIR__ . "/uploads/{$referenceNumber}/";
        if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);

        foreach ($imagesData as $i => $base64) {
            if (!preg_match('/^data:image\/(\w+);base64,/', $base64, $m)) continue;

            $bin = base64_decode(substr($base64, strpos($base64, ',') + 1));
            if ($bin === false) continue;

            $ext  = strtolower($m[1]);
            $file = $uploadDir . "image_{$i}." . $ext;

            file_put_contents($file, $bin);
            $uploadedImages[] = realpath($file);
        }
    }

    $allImages = array_merge($existingImages, $uploadedImages);

    // Defaults (Option B: always store final total)
    $endDateEditedSql   = null;
    $endDateEditedAtSql = null;
    $lateFeePercent     = 0;
    $lateFeeAmount      = 0.00;
    $totalPriceFinal    = $baseTotalPrice;

    // Late fee calc if end date edited
    if (!empty($editedEndDate)) {
        $origTs = $toTs($originalEndDate);
        $editTs = $toTs($editedEndDate);

        if (!$origTs) throw new Exception('Original end date is invalid in DB');
        if (!$editTs) throw new Exception('Edited end date is invalid');

        $endDateEditedSql   = date('Y-m-d H:i:s', $editTs);
        $endDateEditedAtSql = date('Y-m-d H:i:s');

        $graceEndTs = $origTs + (2 * 60 * 60); // 2 hours
        $lateMinAfterGrace = (int)ceil(($editTs - $graceEndTs) / 60);

        $lateFeePercent  = $surchargePct($lateMinAfterGrace);
        $lateFeeAmount   = round($baseTotalPrice * ($lateFeePercent / 100), 2);
        $totalPriceFinal = round($baseTotalPrice + $lateFeeAmount, 2);
    }

    // Update
    $stmt = $conn->prepare("
        UPDATE reserved_slots
        SET remarks = ?,
            is_trashed = ?,
            meter_reading = ?,
            images = ?,
            end_date_edited = ?,
            late_fee_percent = ?,
            late_fee_amount = ?,
            total_price_final = ?,
            end_date_edited_at = ?,
            vehicle_status = ?
        WHERE id = ?
    ");

    $stmt->execute([
        $remark,
        $isTrashed,
        $meterReading,
        json_encode($allImages, JSON_UNESCAPED_SLASHES),
        $endDateEditedSql,
        $lateFeePercent,
        $lateFeeAmount,
        $totalPriceFinal,
        $endDateEditedAtSql,
        $vehicleStatus,
        $id
    ]);

    echo json_encode([
        'success' => true,
        'late_fee_percent' => $lateFeePercent,
        'late_fee_amount' => $lateFeeAmount,
        'total_price_final' => $totalPriceFinal
    ]);

} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}
