<?php
require_once __DIR__ . '/assets/includes/db_connect.php';
require_once __DIR__ . '/vendor/autoload.php'; 

use Dompdf\Dompdf;

$fromDate = $_POST['from'] ?? date('Y-m-d');
$toDate   = $_POST['to'] ?? date('Y-m-d');

/* Fetch Incomes */
$incomeStmt = $conn->prepare("
    SELECT reference_number, vehicle_type, start_date, name, total_price, extra_services
    FROM reserved_slots
    WHERE is_trashed = 0
      AND start_date BETWEEN :from AND :to
");
$incomeStmt->execute([':from' => $fromDate, ':to' => $toDate]);
$incomes = $incomeStmt->fetchAll(PDO::FETCH_ASSOC);

/* Fetch Expenses */
$expenseStmt = $conn->prepare("
    SELECT expense_date, category, name, price
    FROM expenses
    WHERE expense_date BETWEEN :from AND :to
");
$expenseStmt->execute([':from' => $fromDate, ':to' => $toDate]);
$expenses = $expenseStmt->fetchAll(PDO::FETCH_ASSOC);

ob_start();
include __DIR__ . '/pdf_template.php'; 
$html = ob_get_clean();

$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();
$dompdf->stream("Balance_Sheet_{$fromDate}_to_{$toDate}.pdf", ["Attachment" => true]);
exit;
