
<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

date_default_timezone_set('Asia/Colombo');

try {
    $stmt = $conn->prepare("
        SELECT 
            si.batch_id,
            MAX(si.sent_at) AS sent_date,
            MAX(si.batch_total_amount) AS batch_total_amount,
            COUNT(*) AS invoice_count
        FROM sent_invoices si
        INNER JOIN reserved_slots rs ON rs.id = si.reserved_slot_id
        WHERE rs.status = 'send_to_finance'
        GROUP BY si.batch_id
        ORDER BY MAX(si.sent_at) DESC
    ");
    $stmt->execute();
    $batches = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Invoice Batches</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css">
    <style>
        body {
            font-family: "Cambria", sans-serif;
            background-color: #f4f6f8;
            font-size: 12px;
        }
        .page-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            padding: 24px;
            margin-top: 40px;
        }
        h3 {
            color: #0a277d;
            font-weight: 700;
        }
        table thead {
            background: #000;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

        <div class="flex-grow-1">
            <div class="container-fluid">
                <div class="page-card">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="mb-0">Uploaded Invoice Batches</h3>
                        <!-- <a href="add-invoices.php" class="btn btn-secondary">Back</a> -->
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered table-striped align-middle">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Batch ID</th>
                                    <th>Uploaded Date</th>
                                    <th>Uploaded Time</th>
                                    <th>No. of Invoices</th>
                                    <th>Total Amount (LKR)</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($batches)): ?>
                                    <?php foreach ($batches as $i => $batch): ?>
                                        <tr>
                                            <td><?= $i + 1 ?></td>
                                            <td><?= htmlspecialchars($batch['batch_id']) ?></td>
                                            <td><?= date('d M Y', strtotime($batch['sent_date'])) ?></td>
                                            <td><?= date('h:i A', strtotime($batch['sent_date'])) ?></td>
                                            <td><?= (int)$batch['invoice_count'] ?></td>
                                            <td><?= number_format((float)$batch['batch_total_amount'], 2) ?></td>
                                           <td class="d-flex gap-2">
    <button 
        type="button"
        class="btn btn-sm btn-primary view-batch-btn"
        data-batch-id="<?= htmlspecialchars($batch['batch_id']) ?>"
        data-bs-toggle="modal"
        data-bs-target="#batchViewModal"
    >
        View
    </button>

    <button 
        type="button"
        class="btn btn-sm btn-success accept-batch-btn"
        data-batch-id="<?= htmlspecialchars($batch['batch_id']) ?>"
        data-bs-toggle="modal"
        data-bs-target="#acceptBatchModal"
    >
        Accept
    </button>
</td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr>
                                        <td colspan="7" class="text-center text-muted">No invoice batches found.</td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="batchViewModal" tabindex="-1" aria-labelledby="batchViewModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title fw-bold" id="batchViewModalLabel">Batch Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body" id="batchViewModalBody">
                    <div class="text-center py-4">Loading...</div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="acceptBatchModal" tabindex="-1" aria-labelledby="acceptBatchModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title fw-bold" id="acceptBatchModalLabel">Confirm Accept</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p class="mb-2">Are you sure you want to accept this batch?</p>
                <p class="mb-0"><strong>Batch ID:</strong> <span id="acceptBatchIdText"></span></p>
            </div>
            <div class="modal-footer">
                <form method="post" action="accept-invoice-batch.php" class="m-0">
                    <input type="hidden" name="batch_id" id="acceptBatchIdInput">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-success">Yes, Accept</button>
                </form>
            </div>
        </div>
    </div>
</div>
<?php if (!empty($_SESSION['toast_message'])): ?>
    <div class="toast-container position-fixed top-0 end-0 p-3">
        <div 
            id="statusToast" 
            class="toast align-items-center text-white border-0 <?= !empty($_SESSION['toast_type']) && $_SESSION['toast_type'] === 'success' ? 'bg-success' : 'bg-danger' ?>" 
            role="alert"
            aria-live="assertive"
            aria-atomic="true"
        >
            <div class="d-flex">
                <div class="toast-body">
                    <?= htmlspecialchars($_SESSION['toast_message']) ?>
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
            </div>
        </div>
    </div>
    <?php unset($_SESSION['toast_message'], $_SESSION['toast_type']); ?>
<?php endif; ?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('view-batch-btn')) {
            const batchId = e.target.getAttribute('data-batch-id');
            const modalBody = document.getElementById('batchViewModalBody');
            const modalTitle = document.getElementById('batchViewModalLabel');

            modalTitle.textContent = 'Batch Details - ' + batchId;
            modalBody.innerHTML = '<div class="text-center py-4">Loading...</div>';

            fetch('invoice-batch-modal.php?batch_id=' + encodeURIComponent(batchId))
                .then(response => response.text())
                .then(html => {
                    modalBody.innerHTML = html;
                })
                .catch(() => {
                    modalBody.innerHTML = '<div class="alert alert-danger">Failed to load batch details.</div>';
                });
        }

        if (e.target.classList.contains('accept-batch-btn')) {
            const batchId = e.target.getAttribute('data-batch-id');
            document.getElementById('acceptBatchIdText').textContent = batchId;
            document.getElementById('acceptBatchIdInput').value = batchId;
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        const toastEl = document.getElementById('statusToast');
        if (toastEl) {
            const toast = new bootstrap.Toast(toastEl, { delay: 4000 });
            toast.show();
        }
    });
</script>
</body>
</html>