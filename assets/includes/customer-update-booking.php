<?php
session_start();
header('Content-Type: application/json');

require_once __DIR__ . '/db_connect.php';

$id = $_POST['id'] ?? null;
$editedEndDate = $_POST['edited_end_date'] ?? null;
$reason = trim($_POST['reason'] ?? '');
$customerId = $_SESSION['customer_id'] ?? ($_POST['customer_id'] ?? null);

if (!$id || !$editedEndDate || !$customerId) {
    echo json_encode([
        'success' => false,
        'message' => 'Invalid request'
    ]);
    exit;
}

try {
    $userStmt = $conn->prepare("SELECT email FROM website_customer WHERE id = ?");
    $userStmt->execute([$customerId]);
    $customer = $userStmt->fetch(PDO::FETCH_ASSOC);

    if (!$customer) {
        echo json_encode([
            'success' => false,
            'message' => 'Customer not found'
        ]);
        exit;
    }

    $customerEmail = $customer['email'];

    $toTs = function (?string $dt): ?int {
        if (!$dt) return null;
        $dt = str_replace(['T', '/'], [' ', '-'], $dt);
        $ts = strtotime($dt);
        return $ts !== false ? $ts : null;
    };

    $surchargePct = function (int $lateMinAfterGrace): int {
        if ($lateMinAfterGrace <= 0) return 0;
        if ($lateMinAfterGrace <= 120) return 25;
        if ($lateMinAfterGrace <= 240) return 50;
        if ($lateMinAfterGrace <= 360) return 75;
        return 100;
    };

    $stmt = $conn->prepare("
        SELECT id, email, end_date, total_price
        FROM reserved_slots
        WHERE id = ?
        AND email = ?
        AND is_trashed = 0
        AND is_no_show = 0
        AND (vehicle_status IS NULL OR vehicle_status != 'completed')
    ");
    $stmt->execute([$id, $customerEmail]);
    $b = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$b) {
        echo json_encode([
            'success' => false,
            'message' => 'Booking not found or cannot be edited'
        ]);
        exit;
    }

    $origTs = $toTs($b['end_date']);
    $editTs = $toTs($editedEndDate);

    if (!$origTs || !$editTs) {
        echo json_encode([
            'success' => false,
            'message' => 'Invalid date'
        ]);
        exit;
    }

    $baseTotalPrice = (float)$b['total_price'];

    $graceEndTs = $origTs + (2 * 60 * 60);
    $lateMinAfterGrace = (int)ceil(($editTs - $graceEndTs) / 60);

    $lateFeePercent = $surchargePct($lateMinAfterGrace);
    $lateFeeAmount = round($baseTotalPrice * ($lateFeePercent / 100), 2);
    $totalPriceFinal = round($baseTotalPrice + $lateFeeAmount, 2);

    $stmt = $conn->prepare("
        UPDATE reserved_slots
        SET end_date_edited = ?,
            late_fee_percent = ?,
            late_fee_amount = ?,
            total_price_final = ?,
            end_date_edit_reason = ?,
            end_date_edited_at = NOW()
        WHERE id = ?
        AND email = ?
    ");

    $stmt->execute([
        date('Y-m-d H:i:s', $editTs),
        $lateFeePercent,
        $lateFeeAmount,
        $totalPriceFinal,
        $reason,
        $id,
        $customerEmail
    ]);

    echo json_encode([
        'success' => true,
        'message' => 'Booking updated successfully',
        'late_fee_percent' => $lateFeePercent,
        'late_fee_amount' => $lateFeeAmount,
        'total_price_final' => $totalPriceFinal
    ]);

} catch (Throwable $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Server error while updating booking'
    ]);
}