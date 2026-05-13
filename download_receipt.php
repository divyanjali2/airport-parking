<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/assets/includes/db_connect.php';

use Dompdf\Dompdf;
use Dompdf\Options;

date_default_timezone_set('Asia/Colombo');

$receiptId = $_GET['receipt_id'] ?? null;
if (!$receiptId) exit('Invalid receipt');

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

$companyName = 'Airport Parking';
$companyAddress = 'No. 371/5, Negombo Road, Seeduwa, Sri Lanka';
$companyContact = 'info@airportparking.lk | +94 76 141 4557';

// change this to your actual logo file path
$logoPath = __DIR__ . '/assets/images/logo.png';
$logoDataUri = '';

if (file_exists($logoPath)) {
    $logoType = pathinfo($logoPath, PATHINFO_EXTENSION);
    $logoData = file_get_contents($logoPath);
    $logoDataUri = 'data:image/' . $logoType . ';base64,' . base64_encode($logoData);
}

$receiptNo = $r['receipt_no'] ?? '';
$referenceNo = $r['reference_number'] ?? '';
$generatedAt = date('d M Y, h:i A');
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

ob_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receipt <?= h($receiptNo) ?></title>
    <style>
        @page {
            size: A4 portrait;
            margin: 10mm;
        }

        body {
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            color: #1f2937;
            font-size: 12px;
            margin: 0;
            padding: 0;
            background: #ffffff;
        }

        .receipt {
            border: 1px solid #d1d5db;
            border-radius: 10px;
            overflow: hidden;
        }

.header {
    background: #e5e3df;
    border-bottom: 3px solid #0b0833;
    padding: 18px 22px;
}

.header-table {
    width: 100%;
    border-collapse: collapse;
}

.header-table td {
    border: none;
    vertical-align: middle;
    padding: 0;
}

.left-block {
    width: 58%;
}

.right-block {
    width: 42%;
    text-align: right;
}

.logo-box {
    margin-bottom: 6px;
}

.logo-box img {
    width: 190px;
    height: auto;
}

.company-line {
    font-size: 11px;
    color: #4b5563;
    line-height: 1.5;
    margin: 2px 0;
}

.receipt-title {
    font-size: 28px;
    font-weight: bold;
    color: #0b0833;
    letter-spacing: 1px;
    margin: 0;
    line-height: 1;
    white-space: nowrap;
}

.receipt-sub {
    font-size: 11px;
    color: #6b7280;
    margin-top: 6px;
}

        .body {
            padding: 14px 18px 16px;
        }

        .meta-wrap {
            width: 100%;
            border-collapse: separate;
            border-spacing: 10px 0;
            margin-bottom: 12px;
        }

        .meta-card {
            width: 25%;
            border: 1px solid #e5e7eb;
            background: #f8fafc;
            border-radius: 8px;
            padding: 10px;
        }

        .meta-label {
            font-size: 10px;
            text-transform: uppercase;
            color: #64748b;
            font-weight: bold;
            margin-bottom: 4px;
        }

        .meta-value {
            font-size: 12px;
            font-weight: bold;
            color: #111827;
            word-break: break-word;
        }

        .amount-panel {
            width: 100%;
            border-collapse: collapse;
            margin: 12px 0 14px;
            border: 1px solid #dbeafe;
            background: #eff6ff;
            border-radius: 8px;
            overflow: hidden;
        }

        .amount-panel td {
            border: none;
            padding: 14px 16px;
            vertical-align: middle;
        }

        .amount-left-title {
            font-size: 14px;
            font-weight: bold;
            color: #1e3a8a;
            margin-bottom: 4px;
        }

        .amount-left-sub {
            font-size: 11px;
            color: #475569;
        }

        .amount-right {
            text-align: right;
            width: 220px;
        }

        .amount-label {
            font-size: 10px;
            text-transform: uppercase;
            color: #64748b;
            font-weight: bold;
            margin-bottom: 3px;
        }

        .amount-value {
            font-size: 26px;
            font-weight: bold;
            color: #111827;
        }

        .paid-badge {
            display: inline-block;
            padding: 5px 10px;
            font-size: 10px;
            font-weight: bold;
            color: #166534;
            background: #dcfce7;
            border: 1px solid #bbf7d0;
            border-radius: 20px;
            margin-top: 6px;
        }

        .section-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 12px 0;
            margin-top: 6px;
        }

        .section-box {
            width: 50%;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
        }

        .section-title {
            background: #f3f4f6;
            color: #111827;
            font-size: 11px;
            font-weight: bold;
            text-transform: uppercase;
            padding: 9px 12px;
            border-bottom: 1px solid #e5e7eb;
            letter-spacing: 0.5px;
        }

        .details {
            width: 100%;
            border-collapse: collapse;
        }

        .details td {
            border: none;
            border-bottom: 1px solid #f1f5f9;
            padding: 8px 10px;
            vertical-align: top;
            font-size: 11px;
        }

        .details tr:last-child td {
            border-bottom: none;
        }

        .details td:first-child {
            width: 42%;
            font-weight: bold;
            color: #374151;
            background: #fafafa;
        }

        .footer {
            margin-top: 14px;
            border-top: 1px dashed #cbd5e1;
            padding-top: 10px;
        }

        .footer-table {
            width: 100%;
            border-collapse: collapse;
        }

        .footer-table td {
            border: none;
            vertical-align: bottom;
            padding: 0;
        }

        .footer-note {
            font-size: 10px;
            color: #6b7280;
            line-height: 1.5;
            width: 60%;
        }

        .signature-box {
            width: 220px;
            text-align: center;
        }

        .signature-line {
            border-top: 1px solid #111827;
            margin-top: 34px;
            margin-bottom: 5px;
        }

        .signature-name {
            font-size: 11px;
            font-weight: bold;
            color: #111827;
        }

        .signature-role {
            font-size: 10px;
            color: #6b7280;
        }
    </style>
</head>
<body>
    <div class="receipt">
        <div class="header">
            <table class="header-table">
                <tr>
                    <td class="left-block">

                        <?php if ($logoDataUri): ?>
                            <div class="logo-box">
                                <img src="<?= $logoDataUri ?>" alt="Logo">
                            </div>
                        <?php endif; ?>

                        <div class="company-line">
                            <?= h($companyAddress) ?>
                        </div>

                        <div class="company-line">
                            <?= h($companyContact) ?>
                        </div>

                    </td>

                    <td class="right-block">

                        <div class="receipt-title">
                            PAYMENT RECEIPT
                        </div>

                        <div class="receipt-sub">
                            Official payment and transaction
                        </div>

                    </td>

                </tr>
            </table>
        </div>

        <div class="body">
            <table class="meta-wrap">
                <tr>
                    <td class="meta-card">
                        <div class="meta-label">Receipt No</div>
                        <div class="meta-value"><?= h($receiptNo) ?></div>
                    </td>
                    <td class="meta-card">
                        <div class="meta-label">Booking Ref</div>
                        <div class="meta-value"><?= h($referenceNo) ?></div>
                    </td>
                    <td class="meta-card">
                        <div class="meta-label">Generated At</div>
                        <div class="meta-value"><?= h($generatedAt) ?></div>
                    </td>
                    <td class="meta-card">
                        <div class="meta-label">Generated By</div>
                        <div class="meta-value"><?= h($generatedBy) ?></div>
                    </td>
                </tr>
            </table>

            <table class="amount-panel">
                <tr>
                    <td>
                        <div class="amount-left-title">Payment successfully collected</div>
                        <div class="amount-left-sub">
                            This receipt confirms the collected amount for the related Airport Parking booking.
                        </div>
                        <div class="paid-badge"><?= h($paymentStatus) ?></div>
                    </td>
                    <td class="amount-right">
                        <div class="amount-label">Payment Amount</div>
                        <div class="amount-value">LKR <?= number_format($paymentAmount, 2) ?></div>
                    </td>
                </tr>
            </table>

            <table class="section-table">
                <tr>
                    <td class="section-box">
                        <div class="section-title">Customer Details</div>
                        <table class="details">
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
                            <!-- <tr>
                                <td>Parking Location</td>
                                <td><?= h($parkingLocation) ?></td>
                            </tr> -->
                        </table>
                    </td>

                    <td class="section-box">
                        <div class="section-title">Receipt Details</div>
                        <table class="details">
                            <tr>
                                <td>Receipt Number</td>
                                <td><?= h($receiptNo) ?></td>
                            </tr>
                            <tr>
                                <td>Booking Reference</td>
                                <td><?= h($referenceNo) ?></td>
                            </tr>
                            <tr>
                                <td>Parking Duration</td>
                                <td><?= h($expectedParkingDuration) ?></td>
                            </tr>
                            <tr>
                                <td>System Date & Time</td>
                                <td><?= h($generatedAt) ?></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <div class="footer">
                <table class="footer-table">
                    <tr>
                        <td class="footer-note">
                            This is a system-generated receipt issued by <?= h($companyName) ?>.
                            Please retain this document for your records and future reference.
                        </td>
                        <td class="signature-box">
                            <div class="signature-line"></div>
                            <div class="signature-name"><?= h($companyName) ?></div>
                            <div class="signature-role">Authorized Signature</div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
<?php
$html = ob_get_clean();

$options = new Options();
$options->set('isRemoteEnabled', true);

$dompdf = new Dompdf($options);
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream("receipt_{$receiptId}.pdf", ["Attachment" => true]);