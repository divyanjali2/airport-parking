<?php

header("Content-Type: application/json");

require_once __DIR__ . '/../assets/includes/db_connect.php';

$data = json_decode(file_get_contents("php://input"), true);

/*
|--------------------------------------------------------------------------
| REQUEST DATA
|--------------------------------------------------------------------------
*/

$reference_number  = $data['reference_number'] ?? '';
$check_out_by_name = $data['check_out_by_name'] ?? '';

$total_price_final = $data['total_price_final'] ?? 0;

$end_date_edited   = $data['end_date_edited'] ?? '';

$late_fee_amount   = $data['late_fee_amount'] ?? 0;

/*
|--------------------------------------------------------------------------
| VALIDATION
|--------------------------------------------------------------------------
*/

if (
    !$reference_number ||
    !$check_out_by_name
) {

    exit(json_encode([
        'status' => false,
        'message' => 'reference_number and check_out_by_name are required'
    ]));
}

try {

    $conn->beginTransaction();

    /*
    |--------------------------------------------------------------------------
    | UPDATE customer_handling TABLE
    |--------------------------------------------------------------------------
    */

    $customer_status = 'check_out';

    $sql1 = "UPDATE customer_handling
            SET
                check_out_datetime = NOW(),
                check_out_by_name = :check_out_by_name,
                status = :status,
                updated_at = NOW()
            WHERE reference_number = :reference_number";

    $stmt1 = $conn->prepare($sql1);

    $stmt1->execute([
        ':check_out_by_name' => $check_out_by_name,
        ':status' => $customer_status,
        ':reference_number' => $reference_number
    ]);

    $sql2 = "UPDATE reserved_slots
            SET
                total_price_final = :total_price_final,
                end_date_edited = :end_date_edited,
                vehicle_status = 'completed',
                payment_status = 'Paid Fully',
                late_fee_amount = :late_fee_amount
            WHERE reference_number = :reference_number";

    $stmt2 = $conn->prepare($sql2);

    $stmt2->execute([
        ':total_price_final' => $total_price_final,
        ':end_date_edited' => $end_date_edited,
        ':late_fee_amount' => $late_fee_amount,
        ':reference_number' => $reference_number
    ]);

    $conn->commit();

    echo json_encode([
        'status' => true,
        'customer_status' => $customer_status,
        'vehicle_status' => 'completed',
        'reference_number' => $reference_number,
        'total_price_final' => $total_price_final,
        'end_date_edited' => $end_date_edited,
        'late_fee_amount' => $late_fee_amount,
        'message' => 'Customer checked out successfully'
    ]);

} catch (Exception $e) {

    $conn->rollBack();

    echo json_encode([
        'status' => false,
        'message' => $e->getMessage()
    ]);
}