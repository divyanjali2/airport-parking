<?php
    session_start();
    require_once __DIR__ . '/assets/includes/db_connect.php';

    $fromDate = $_GET['from'] ?? date('Y-m-d');
    $toDate   = date('Y-m-d');

    function fetchAllBetween($conn, $table, $fields, $from, $to, $trashed = false, $dateColumn = 'start_date') {
        $sql = "SELECT $fields FROM $table WHERE " . ($trashed ? "is_trashed = 0 AND " : "") . "$dateColumn BETWEEN :from AND :to";
        $stmt = $conn->prepare($sql);
        $stmt->execute([':from' => $from, ':to' => $to]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    $incomes  = fetchAllBetween($conn, 'reserved_slots', 'reference_number, vehicle_type, start_date, name, total_price, extra_services', $fromDate, $toDate, true, 'start_date');
    $expenses = fetchAllBetween($conn, 'expenses', 'expense_date, category, name, price', $fromDate, $toDate, false, 'expense_date');
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Balance Sheet - Airport Parking</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <style>
            body { font-family: Cambria, serif; background: #f4f6f8; font-size: 14px; }
            .sheet-container { background: #ffffff; border: 2px solid #000; padding: 25px; margin: 20px; }
            .sheet-header { text-align: center; border-bottom: 2px solid #000; padding-bottom: 15px; margin-bottom: 20px; }
            p { margin-bottom: 0; }
            .sheet-header img { max-height: 80px; }
            .sheet-header h4 { font-weight: bold; }
            .period-row { margin-bottom: 20px; }
            .period-row input { border: none; border-bottom: 1px solid #000; border-radius: 0; background: transparent; font-weight: bold; }
            .tables-wrapper { display: flex; gap: 20px; }
            table { width: 100%; border: 1px solid #000; }
            table th, table td { border: 1px solid #000; padding: 6px; }
            table thead th { background: #e9ecef; text-align: center; font-weight: bold; }
            .text-end { text-align: right; }
            .total-profit { border-top: 2px solid #000; margin-top: 25px; padding-top: 10px; text-align: right; font-size: 16px; font-weight: bold; }
            @media print {
                body { background: #fff; }
                .sheet-container { margin: 0; border: 2px solid #000; }
            }
        </style>
    </head>

    <body>
        <div class="d-flex">
            <!-- Sidebar -->
            <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

            <!-- Main Content -->
            <div class="flex-grow-1">
                <div class="sheet-container">
                    <!-- Header -->
                    <div class="sheet-header">
                        <img src="assets/images/footer-logo.png" alt="Airport Parking Logo">
                        <p>No. 371/5, Negombo Road, Seeduwa, Sri Lanka</p>
                        <p>+94 76 141 4557 | info@airportparking.lk</p>
                    </div>

                    <!-- Period -->
                    <div class="row period-row justify-content-end">
                        <div class="col-md-3">
                            <label class="fw-bold">From</label>
                            <input type="text" class="form-control" value="<?= htmlspecialchars($fromDate) ?>" readonly>                
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold">To</label>
                            <input type="text" class="form-control" value="<?= htmlspecialchars($toDate) ?>" readonly>
                        </div>
                    </div>

                    <hr>

                    <!-- Tables -->
                    <div class="tables-wrapper">
                        <!-- Incomes -->
                        <div class="w-50">
                            <h6 class="text-center fw-bold mb-2">INCOME</h6>
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

                                            /* Parse extra services */
                                            $extras = [];
                                            if (!empty($row['extra_services'])) {
                                                $extras = array_filter(array_map('trim', explode(',', $row['extra_services'])));
                                            }

                                            $extrasCount = count($extras);
                                            $extrasTotal = $extrasCount * $extraServicePrice;

                                            /* Base parking fee */
                                            $baseParkingFee = $row['total_price'] - $extrasTotal;

                                            /* Calculate rowspan */
                                            $rowspan = 0;
                                            if ($baseParkingFee > 0) {
                                                $rowspan++;
                                            }
                                            $rowspan += $extrasCount;

                                            /* --- Parking Fee Row --- */
                                            if ($baseParkingFee > 0):
                                                $totalIncome += $baseParkingFee;
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

                                        /* --- Extra Service Rows --- */
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
                        </div>

                        <!-- Expenses -->
                        <div class="w-50">
                            <h6 class="text-center fw-bold mb-2">EXPENSES</h6>
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

                                    foreach ($expenses as $row):
                                        $totalExpense += $row['price'];
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
                        </div>
                    </div>

                    <!-- Total Profit -->
                    <div class="total-profit">
                        NET PROFIT : LKR <?= number_format($totalIncome - $totalExpense, 2) ?>
                    </div>
                </div>
                <div class="d-flex justify-content-end gap-2 px-3">
                    <button type="button" class="btn btn-secondary mb-3" onclick="history.back();">
                        Back
                    </button>

                    <form method="post" action="export_pdf.php">
                        <input type="hidden" name="from" value="<?= htmlspecialchars($fromDate) ?>">
                        <input type="hidden" name="to" value="<?= htmlspecialchars($toDate) ?>">
                        <button type="submit" class="btn btn-primary mb-3">
                            Download PDF
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>