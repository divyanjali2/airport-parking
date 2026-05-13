<?php
    session_start();
    require_once __DIR__ . '/assets/includes/db_connect.php';

    date_default_timezone_set('Asia/Colombo');

    $receiptId = $_GET['receipt_id'] ?? null;
    if (!$receiptId) exit('Invalid receipt request');

    try {
        $stmt = $conn->prepare("
            SELECT 
                pr.*,
                rs.reference_number,
                rs.slot_number,
                rs.vehicle_number,
                u.name AS generated_by_name
            FROM payment_receipts pr
            LEFT JOIN reserved_slots rs ON rs.id = pr.reserved_slot_id
            LEFT JOIN users u ON u.id = pr.generated_by
            WHERE pr.id = ?
        ");
        $stmt->execute([$receiptId]);
        $r = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$r) exit('Receipt not found');
    } catch (PDOException $e) {
        exit('Database error');
    }

    $companyName = 'Airport Parking';
    $companyAddress = 'No. 371/5, Negombo Road, Seeduwa, Sri Lanka';
    $companyContact = 'info@airportparking.lk | +94 76 141 4557';
    $companyLogo = 'assets/images/logo.png'; 

    $receiptNo = $r['receipt_no'] ?? '';
    $referenceNo = $r['reference_number'] ?? '';
    $generatedAt = $r['generated_at'] ?? date('d M Y, h:i A'); 
    $customerName = $r['customer_name'] ?? '-';
    $contactNumber = $r['contact_number'] ?? '-';
    $vehicleNumber = $r['vehicle_number'] ?? '-';
    $parkingLocation = $r['parking_location'] ?? ($r['slot_number'] ?? '-');
    $expectedParkingDuration = $r['expected_parking_duration'] ?? '-';
    $paymentAmount = (float)($r['payment_amount'] ?? 0);
    $paymentStatus = $r['payment_status'] ?? 'Paid Fully';
    $generatedBy = $r['generated_by_name'] ?? ('User ID ' . ($r['generated_by'] ?? '-'));

    function h($value) {
        return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8');
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Receipt - <?= h($receiptNo) ?></title>
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 10px;
            background: #f3f4f6;
            font-family: Cambria, serif, sans-serif;
            color: #111827;
            font-size: 12px;
        }

        .top-actions {
            max-width: 820px;
            margin: 0 auto 10px auto;
            text-align: right;
        }

        .top-actions button {
            border: none;
            border-radius: 6px;
            padding: 8px 14px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 600;
            margin-left: 6px;
        }

        .print-btn {
            background: #0d6efd;
            color: #fff;
        }

        .download-btn {
            background: #198754;
            color: #fff;
        }

        .receipt {
            max-width: 820px;
            margin: 0 auto;
            background: #fff;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            overflow: hidden;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 24px;
            background: #e5e3df;
            border-bottom: 3px solid #0b0833;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .logo-box {
            width: 170px;
            display: flex;
            align-items: center;
        }

        .logo-box img {
            width: 100%;
            height: auto;
            object-fit: contain;
        }

        .company-details {
            margin-top: 6px;
        }

        .company-line {
            margin: 2px 0;
            color: #0c032e;
            font-size: 12px;
            line-height: 1.4;
        }

        .header-right {
            text-align: right;
        }

        .receipt-title {
            font-size: 38px;
            font-weight: 800;
            color: #0b0833;
            letter-spacing: 1px;
            margin: 0;
            line-height: 1;
            text-transform: uppercase;
        }

        .receipt-subtitle {
            font-size: 11px;
            color: #6b7280;
            margin-top: 6px;
            letter-spacing: 0.5px;
        }

        .receipt-meta {
            margin: 2px 0;
            font-size: 12px;
            color: #374151;
        }

        .content {
            padding: 14px 18px 16px;
        }

        .amount-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 14px;
            border: 1px solid #d1d5db;
            background: #f9fafb;
            border-radius: 8px;
            margin-bottom: 12px;
        }

        .amount-bar .left {
            font-size: 12px;
            color: #374151;
        }

        .amount-bar .right {
            text-align: right;
        }

        .amount-label {
            font-size: 11px;
            color: #6b7280;
            text-transform: uppercase;
            font-weight: 700;
            margin-bottom: 2px;
        }

        .amount-value {
            font-size: 24px;
            font-weight: 800;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 999px;
            font-size: 11px;
            font-weight: 700;
            background: #dcfce7;
            color: #166534;
            border: 1px solid #bbf7d0;
        }

        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .box {
            border: 1px solid #d1d5db;
            border-radius: 8px;
            overflow: hidden;
        }

        .box-title {
            background: #f3f4f6;
            padding: 8px 10px;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            border-bottom: 1px solid #d1d5db;
            letter-spacing: 0.5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 8px 10px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: top;
            font-size: 12px;
        }

        tr:last-child td {
            border-bottom: none;
        }

        td:first-child {
            width: 42%;
            font-weight: 700;
            color: #374151;
            background: #fafafa;
        }

        .footer {
            margin-top: 12px;
            border-top: 1px dashed #9ca3af;
            padding-top: 10px;
            display: flex;
            justify-content: space-between;
            gap: 20px;
            align-items: end;
        }

        .footer-note {
            font-size: 11px;
            color: #4b5563;
            line-height: 1.5;
            max-width: 60%;
        }

        .signature {
            text-align: center;
            min-width: 180px;
        }

        .signature-line {
            border-top: 1px solid #111827;
            margin-top: 32px;
            margin-bottom: 4px;
        }

        .signature-name {
            font-size: 12px;
            font-weight: 700;
        }

        .signature-role {
            font-size: 11px;
            color: #6b7280;
        }

        @page {
            size: A4 portrait;
            margin: 8mm;
        }

        @media print {
            body {
                background: #fff;
                padding: 0;
                font-size: 11px;
            }

            .top-actions {
                display: none;
            }

            .receipt {
                max-width: 100%;
                border: none;
                border-radius: 0;
            }

            .header,
            .content {
                padding-left: 10px;
                padding-right: 10px;
            }

            .amount-value {
                font-size: 22px;
            }

            td {
                padding: 6px 8px;
                font-size: 11px;
            }

            .company-name {
                font-size: 20px;
            }

            .receipt-title {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
    <div class="top-actions">
        <button class="print-btn" onclick="window.print()">Print</button>
        <button class="download-btn"
            onclick="window.open('download_receipt.php?receipt_id=<?= $receiptId ?>', '_blank')">
            Download PDF
        </button>
    </div>

    <div class="receipt">
       <div class="header">

        <div class="header-left">
            <div>
                <div class="logo-box">
                    <img src="assets/images/logo.png" alt="Airport Parking Logo">
                </div>

                <div class="company-details">
                    <div class="company-line">
                        <?= h($companyAddress) ?>
                    </div>

                    <div class="company-line">
                        <?= h($companyContact) ?>
                    </div>
                </div>
            </div>
        </div>

    <div class="header-right">
        <h1 class="receipt-title">PAYMENT RECEIPT</h1>

        <div class="receipt-subtitle">
            Office payment and transaction
        </div>
    </div>

</div>

        <div class="content">
            <div class="amount-bar">
                <div class="left">
                    Receipt issued for collected parking payment<br>
                    <span class="status-badge"><?= h($paymentStatus) ?></span>
                </div>
                <div class="right">
                    <div class="amount-label">Payment Amount</div>
                    <div class="amount-value">LKR <?= number_format($paymentAmount, 2) ?></div>
                </div>
            </div>

            <div class="grid">
                <div class="box">
                    <div class="box-title">Customer & Vehicle Details</div>
                    <table>
                        <tr>
                            <td>Customer Name</td>
                            <td><?= h($customerName) ?></td>
                        </tr>
                        <tr>
                            <td>Contact Number</td>
                            <td><?= h($contactNumber) ?></td>
                        </tr>
                        <tr>
                            <td>Vehicle Number</td>
                            <td><?= h($vehicleNumber) ?></td>
                        </tr>
                    </table>
                </div>

                <div class="box">
                    <div class="box-title">Receipt Details</div>
                    <table>
                        <tr>
                            <td>Booking Reference</td>
                            <td><?= h($referenceNo) ?></td>
                        </tr>
                        <tr>
                            <td>Expected Duration</td>
                            <td><?= h($expectedParkingDuration) ?></td>
                        </tr>
                        <tr>
                            <td>Generated By</td>
                            <td><?= h($generatedBy) ?></td>
                        </tr>
                        <tr>
                            <td>Generated Date & Time</td>
                            <td><?= h($generatedAt) ?></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="footer">
                <div class="footer-note">
                    This is a system-generated payment receipt issued by <?= h($companyName) ?>.
                    Please keep this receipt for your records.
                </div>

                <div class="signature">
                    <div class="signature-line"></div>
                    <div class="signature-name"><?= h($companyName) ?></div>
                    <div class="signature-role">Authorized Signature</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>