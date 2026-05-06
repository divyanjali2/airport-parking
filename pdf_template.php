<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Balance Sheet - Airport Parking</title>
        <style>
            body { font-family: Cambria, serif; font-size: 14px; margin: 0; padding: 0; }
            .sheet-container { padding: 10px; border: 2px solid #000; }
            .sheet-header { text-align: center; border-bottom: 2px solid #000; padding-bottom: 10px; margin-bottom: 15px; }
            .sheet-header img { max-height: 60px; margin-bottom: 5px; }
            .period-row { margin-bottom: 15px; text-align: center; }
            table { width: 100%; border-collapse: collapse; font-size: 13px; margin-bottom: 5px; }
            table th, table td { border: 1px solid #000; padding: 4px 6px; }
            table th { background: #e9ecef; text-align: center; font-weight: bold; }
            .text-end { text-align: right; }
            .total-profit { margin-top: 10px; padding-top: 5px; border-top: 2px solid #000; text-align: right; font-weight: bold; font-size: 14px; }
        </style>
    </head>
    <body>
        <div class="sheet-container">
            <!-- Header -->
            <div class="sheet-header">
                <?php
                    $logoPath = __DIR__ . '/assets/images/footer-logo.png';
                    $logoData = base64_encode(file_get_contents($logoPath));
                ?>
                <img src="data:image/png;base64,<?= $logoData ?>" style="max-height:70px;">
                <div>No. 371/5, Negombo Road, Seeduwa, Sri Lanka</div>
                <div>+94 76 141 4557 | info@airportparking.lk</div>
            </div>

            <!-- Period -->
            <div class="period-row text-center">
                <strong>BALANCE SHEET AS PER
                
                    <?= htmlspecialchars($fromDate) ?> &nbsp;–&nbsp; <?= htmlspecialchars($toDate) ?>
                </strong>
            </div>

            <hr>
            <table style="width: 100%; border: none;">
                <tr>
                    <td style="width: 50%; vertical-align: top; border: none; padding-right: 10px;">
                        <h4 class="text-center fw-bold mb-2">INCOME</h6>
                        <table>
                            <thead>
                                <tr>
                                    <th>Ref No</th>
                                    <th>Date</th>
                                    <th>Category</th>
                                    <th>Description</th>
                                    <th>Amount (LKR)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $totalIncome = 0;
                                    $extraServicePrice = 1000;

                                    foreach ($incomes as $row):
                                    $referenceNo = $row['reference_number'];

                                    // Parse extra services
                                    $extras = [];
                                    if (!empty($row['extra_services'])) {
                                        $extras = array_filter(array_map('trim', explode(',', $row['extra_services'])));
                                    }

                                    $extrasCount = count($extras);
                                    $extrasTotal = $extrasCount * $extraServicePrice;
                                    $baseParkingFee = $row['total_price'] - $extrasTotal;

                                    $rowspan = ($baseParkingFee > 0 ? 1 : 0) + $extrasCount;

                                    // Parking Fee row
                                    if ($baseParkingFee > 0): $totalIncome += $baseParkingFee;
                                ?>
                                <tr>
                                    <td rowspan="<?= $rowspan ?>"><?= htmlspecialchars($referenceNo) ?></td>
                                    <td><?= htmlspecialchars($row['start_date']) ?></td>
                                    <td>Parking Fee</td>
                                    <td><?= htmlspecialchars(ucfirst($row['vehicle_type'])) ?></td>
                                    <td class="text-end"><?= number_format($baseParkingFee, 2) ?></td>
                                </tr>
                                <?php
                                    endif;
                                    foreach ($extras as $service):
                                        $totalIncome += $extraServicePrice;
                                ?>
                                <tr>
                                    <td><?= htmlspecialchars($row['start_date']) ?></td>
                                    <td>Extra Service</td>
                                    <td><?= htmlspecialchars($service) ?></td>
                                    <td class="text-end"><?= number_format($extraServicePrice, 2) ?></td>
                                </tr>
                                <?php endforeach; ?>

                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="4" class="text-end">TOTAL INCOME</th>
                                    <th class="text-end"><?= number_format($totalIncome, 2) ?></th>
                                </tr>
                            </tfoot>
                        </table>
                    </td>

                    <!-- Expenses Table -->
                    <td style="width: 50%; vertical-align: top; border: none; padding-left: 10px;">
                        <h4 class="text-center fw-bold mb-2">EXPENSES</h4>
                        <table>
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Category</th>
                                    <th>Name</th>
                                    <th>Amount (LKR)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $totalExpense = 0;
                                    foreach ($expenses as $row): $totalExpense += $row['price'];
                                ?>
                                <tr>
                                    <td><?= htmlspecialchars($row['expense_date']) ?></td>
                                    <td><?= htmlspecialchars($row['category']) ?></td>
                                    <td><?= htmlspecialchars($row['name']) ?></td>
                                    <td class="text-end"><?= number_format($row['price'], 2) ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="3" class="text-end">TOTAL EXPENSE</th>
                                    <th class="text-end"><?= number_format($totalExpense, 2) ?></th>
                                </tr>
                            </tfoot>
                        </table>
                    </td>
                </tr>
            </table>

            <!-- Net Profit -->
            <div class="total-profit">
                NET PROFIT : LKR <?= number_format($totalIncome - $totalExpense, 2) ?>
            </div>
        </div>
    </body>
</html>
