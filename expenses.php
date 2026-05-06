<?php
    session_start();
    require_once __DIR__ . '/assets/includes/db_connect.php';

    if (!isset($_SESSION['user_id'])) {
        header("Location: login.php");
        exit;
    }

    // Fetch all expenses
    $stmt = $conn->query("SELECT * FROM expenses ORDER BY expense_date DESC");
    $expenses = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Airport Parking | Expenses</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <!-- Bootstrap 5 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body { font-family: Cambria, serif; background:#f4f6f8; font-size:12px; }
        .dashboard-card { background:#fff; padding:20px; margin-top:40px; border-radius:12px; }
        thead { background:#000; color:#fff; }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

        <!-- Main Content -->
        <div class="flex-grow-1">
            <div class="container">
                <div class="dashboard-card">
                    <h4 class="fw-bold mb-3">Expenses</h4>

                    <!-- Add Expense Form -->
                    <form id="expenseForm" class="row g-3 mb-4">
                        <div class="col-md-3">
                            <label class="fw-bold">Category<span class="text-danger">*</span></label>
                            <select name="category" class="form-select" required>
                                <option value="">Select</option>
                                <option>Vehicles</option>
                                <option>Other</option>
                            </select>
                        </div>

                        <div class="col-md-3">
                            <label class="fw-bold">Name<span class="text-danger">*</span></label>
                            <input type="text" name="name" class="form-control" required>
                        </div>

                        <div class="col-md-2">
                            <label class="fw-bold">Price (LKR)<span class="text-danger">*</span></label>
                            <input type="number" step="0.01" name="price" class="form-control" required>
                        </div>

                        <div class="col-md-2">
                            <label class="fw-bold">Date<span class="text-danger">*</span></label>
                            <input type="date" name="expense_date" class="form-control" required>
                        </div>

                        <div class="col-md-2">
                            <label class="fw-bold">Remarks</label>
                            <input type="text" name="remarks" class="form-control">
                        </div>

                        <div class="col-12 text-end">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-plus-circle"></i> Add Expense
                            </button>
                        </div>
                    </form>

                    <hr>

                    <!-- Expenses Table -->
                    <table id="expensesTable" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Category</th>
                                <th>Name</th>
                                <th class="text-end">Price(LKR)</th>
                                <th>Remarks</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($expenses as $e): ?>
                            <tr>
                                <td><?= htmlspecialchars($e['expense_date']) ?></td>
                                <td><?= htmlspecialchars($e['category']) ?></td>
                                <td><?= htmlspecialchars($e['name']) ?></td>
                                <td class="text-end"><?= number_format($e['price'],2) ?></td>
                                <td><?= htmlspecialchars($e['remarks']) ?></td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(function(){

            // Initialize DataTable
            $('#expensesTable').DataTable({
                order:[[0,'desc']],
                pageLength:25
            });

            // Handle Add Expense Form
            $('#expenseForm').on('submit', function(e){
                e.preventDefault();
                $.ajax({
                    url:'assets/includes/save-expense.php',
                    type:'POST',
                    data: $(this).serialize(),
                    dataType:'json',
                    success:function(res){
                        if(res.success){
                            location.reload();
                        } else {
                            alert(res.message || 'Failed to save expense');
                        }
                    },
                    error:function(xhr){
                        alert('Server error: ' + (xhr.responseJSON?.message || xhr.statusText));
                    }
                });
            });

        });
    </script>
</body>
</html>
