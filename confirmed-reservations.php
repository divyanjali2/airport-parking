<?php
    session_start();
    require_once __DIR__ . '/assets/includes/db_connect.php';

    if (!isset($_SESSION['user_id'])) {
        header("Location: login.php");
        exit;
    }

    try {
        $stmt = $conn->query("
            SELECT
                rs.id,
                rs.reference_number,
                rs.slot_number,
                rs.vehicle_type,
                rs.flight_number,
                rs.start_date,
                rs.end_date,
                rs.total_price,
                rs.pdf_path,
                rs.name AS customer_name,
                rs.email,
                rs.booking_type,
                rs.whatsapp_number,
                rs.total_price_final,
                rs.booking_status,

                pr.receipt_path

            FROM reserved_slots rs

            LEFT JOIN payment_receipts pr
                ON pr.reserved_slot_id = rs.id

            WHERE rs.is_trashed = 0
            AND rs.is_no_show = 0
            AND rs.cash_handover = 0
            AND rs.booking_status = 'confirmed'

            ORDER BY rs.created_at DESC
        ");

        $bookings = $stmt->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e) {
        die('<div style="color:red;">Database error: ' . $e->getMessage() . '</div>');
    }

    try {
        $stmtCash = $conn->query("
            SELECT
                id,
                reference_number,
                name,
                total_price_final
            FROM reserved_slots
            WHERE payment_status = 'Paid Fully'
            AND cash_handover = 0
            AND booking_status = 'confirmed'
            AND is_trashed = 0
            AND is_no_show = 0
            ORDER BY created_at DESC
        ");

        $cashHandoverBookings = $stmtCash->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e) {
        die('<div style="color:red;">Database error (cash handover): ' . $e->getMessage() . '</div>');
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Airport Parking | Reservations Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.2/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css">

    <style>
        body { font-family: "Cambria", sans-serif; background-color: #f4f6f8; font-size: 12px; }
        .container { max-width: max-content; }
        .dashboard-card { background: #fff; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); padding: 20px; margin-top: 40px; }
        h2 { color: #0a277d; font-weight: 600; margin-bottom: 20px; }
        table thead { background-color: #000 !important; color: #fff !important; }
        table thead tr th { background-color: #000; color: #fff; }
        .dataTables_wrapper .dataTables_filter input { border-radius: 8px; border: 1px solid #ccc; padding: 4px 8px; }
        .dataTables_wrapper .dataTables_length select { border-radius: 8px; border: 1px solid #ccc; }
        #redirectMessage { margin-top: 15px; font-weight: 600; color: #dc3545; }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

        <!-- Main Content -->
        <div class="flex-grow-1">
            <div class="container-fluid">
                <div class="card dashboard-card">
                    <div class="d-flex justify-content-end">
                         <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#cashHandoverModal">
                            <i class="bi bi-cash-coin me-1"></i> Cash Handover
                        </button>
                    </div>
                    <h2 class="text-center fw-bold">🚘 Confirmed Booking Dashboard</h2>
                    <div id="redirectMessage" class="text-center"></div>
                    <div class="mb-3 d-flex align-items-end gap-3 justify-content-end">
                        <div>
                            <label for="bookingTypeFilter" class="form-label">Filter by Booking Type:</label>
                            <select id="bookingTypeFilter" class="form-select w-auto">
                                <option value="">All</option>
                                <option value="direct booking">Direct Booking</option>
                                <option value="website">Website</option>
                            </select>
                        </div>
                        <div>
                            <label for="commonDateFilter" class="form-label">Filter by Date:</label>
                            <input type="date" id="commonDateFilter" class="form-control" style="width:160px;">
                        </div>
                        <div class="align-self-end">
                            <button id="clearDateFilter" class="btn btn-danger">Clear</button>
                        </div>
                        <div class="align-self-end">
                            <button id="exportCSV" class="btn btn-info">Export CSV</button>
                        </div>
                        <?php if (!empty($_SESSION['user_role']) && strtolower($_SESSION['user_role']) === 'admin'): ?>
                            <div class="align-self-end">
                                <button id="openBalanceSheet" class="btn btn-secondary" style="display:none;">
                                    Balance Sheet
                                </button>
                            </div>
                        <?php endif; ?>
                    </div>
                    <div class="table-responsive">
                        <table id="bookingsTable" class="table table-bordered table-striped align-middle">
                           <thead>
                                <tr class="table-dark">
                                    <th>#</th>
                                    <th>Booking Type</th>
                                    <!-- <th>Reference No</th> -->
                                    <th>Customer</th>
                                    <th>WhatsApp</th>
                                    <th>Date</th>
                                    <th>Total Price (LKR)</th>
                                    <th>Invoice</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($bookings as $i => $b): ?>
                                    <tr>
                                        <td><?= $i + 1 ?></td>
                                        <td><?= ucfirst(htmlspecialchars($b['booking_type'])) ?></td>
                                        <!-- <td><?= htmlspecialchars($b['reference_number']) ?></td> -->
                                        <td><?= htmlspecialchars($b['customer_name']) ?></td>
                                        <td><?= htmlspecialchars($b['whatsapp_number']) ?></td>
                                        <td data-order="<?= $b['start_date'] ?>">
                                            <?= date('d M Y', strtotime($b['start_date'])) ?> - <?= date('d M Y', strtotime($b['end_date'])) ?>
                                        </td>
                                        <td><?= number_format(!empty($b['total_price_final']) ? $b['total_price_final'] : $b['total_price'], 2) ?></td>                                        <td>
                                            <?php if (!empty($b['pdf_path'])): ?>
                                                <?php 
                                                    $webPath = str_replace('\\', '/', $b['pdf_path']); 
                                                    $docRoot = str_replace('\\', '/', $_SERVER['DOCUMENT_ROOT']);
                                                    if (strpos($webPath, $docRoot) === 0) {
                                                        $webPath = substr($webPath, strlen($docRoot));
                                                    }
                                                ?>
                                                <a href="<?= htmlspecialchars($webPath) ?>" target="_blank" class="btn btn-sm btn-primary">
                                                    View PDF
                                                </a>
                                            <?php else: ?>
                                                N/A
                                            <?php endif; ?>
                                        </td>
                                                               
                                        <td class="d-flex gap-1">
                                            <?php if (!empty($b['receipt_path'])): ?>

                                                <?php
                                                    $receiptPath = str_replace('\\', '/', $b['receipt_path']);

                                                    $docRoot = str_replace('\\', '/', $_SERVER['DOCUMENT_ROOT']);

                                                    if (strpos($receiptPath, $docRoot) === 0) {
                                                        $receiptPath = substr($receiptPath, strlen($docRoot));
                                                    }
                                                ?>

                                                <a
                                                    href="<?= htmlspecialchars($receiptPath) ?>"
                                                    target="_blank"
                                                    class="btn btn-sm btn-outline-primary"
                                                >
                                                    View Receipt
                                                </a>

                                            <?php else: ?>

                                                <button
                                                    class="btn btn-sm btn-outline-secondary"
                                                    disabled
                                                >
                                                    View Receipt
                                                </button>

                                            <?php endif; ?>

                                            <!-- Edit button -->
                                            <button class="btn btn-sm btn-outline-success edit-booking" data-id="<?= $b['id'] ?>">Edit</button>

                                
                                            <?php if (!empty($b['whatsapp_number']) && !empty($b['pdf_path'])): 
                                                $waNumber = preg_replace('/\D+/', '', $b['whatsapp_number']);
                                                $pdfPath = '/' . ltrim(str_replace('\\', '/', str_replace($_SERVER['DOCUMENT_ROOT'], '', $b['pdf_path'])), '/');
                                                $pdfUrl  = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://{$_SERVER['HTTP_HOST']}$pdfPath";
                                                $waLink  = "https://wa.me/{$waNumber}?text=" . urlencode(
                                                    "Hello {$b['customer_name']}, this is your booking invoice from Airport Parking. Your reference number is {$b['reference_number']}. View your invoice here: {$pdfUrl}"
                                                );
                                            ?>
                                                <a href="<?= $waLink ?>" target="_blank" class="btn btn-sm btn-outline-success">
                                                    <i class="bi bi-whatsapp"></i>
                                                </a>

                                                                                            <button 
                                                type="button" 
                                                class="btn btn-sm btn-danger no-show-btn" 
                                                data-id="<?= $b['id'] ?>" 
                                                data-reference="<?= htmlspecialchars($b['reference_number']) ?>" 
                                                title="Mark as No Show">
                                                <i class="bi bi-person-x"></i>
                                            </button>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="editBookingModal" tabindex="-1">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content" id="editBookingContent">
                        <!-- Loaded via AJAX -->
                    </div>
                </div>
            </div>

            <div class="modal fade" id="paymentReceiptModal" tabindex="-1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" id="paymentReceiptContent">
                        <!-- Loaded via AJAX -->
                    </div>
                </div>
            </div>

            <div class="modal fade" id="cashHandoverModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form id="cashHandoverForm">
                            <div class="modal-header">
                                <h5 class="modal-title fw-bold">
                                    <i class="bi bi-cash-coin me-1"></i> Cash Handover
                                </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>

                            <div class="modal-body">
                                <?php if (!empty($cashHandoverBookings)): ?>
                                    <div class="table-responsive">
                                        <table class="table table-bordered align-middle" id="cashHandoverTable">
                                            <thead class="table-dark">
                                                <tr>
                                                    <th style="width:50px;">Select</th>
                                                    <th>Reference No</th>
                                                    <th>Customer</th>
                                                    <th class="text-end">Amount (LKR)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($cashHandoverBookings as $c): ?>
                                                    <tr>
                                                        <td class="text-center">
                                                           <input
                                                                type="checkbox"
                                                                class="form-check-input cash-handover-check"
                                                                name="booking_ids[]"
                                                                value="<?= $c['id'] ?>"
                                                                data-amount="<?= htmlspecialchars($c['total_price_final'] ?? 0) ?>"
                                                                data-reference="<?= htmlspecialchars($c['reference_number']) ?>"
                                                            >
                                                        </td>
                                                        <td><?= htmlspecialchars($c['reference_number']) ?></td>
                                                        <td><?= htmlspecialchars($c['name']) ?></td>
                                                        <td class="text-end">
                                                            <?= number_format((float)($c['total_price_final'] ?? 0), 2) ?>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="text-end mt-3">
                                        <h5>
                                            Total Selected :
                                            <span class="fw-bold text-danger">
                                                LKR <span id="cashHandoverTotal">0.00</span>
                                            </span>
                                        </h5>
                                    </div>
                                <?php else: ?>
                                    <div class="alert alert-info mb-0">
                                        No cash handovers at the moment.
                                    </div>
                                <?php endif; ?>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                    Close
                                </button>

                                <button type="submit" class="btn btn-warning" id="saveCashHandover">
                                    Save Handover
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="noShowModal" tabindex="-1" aria-labelledby="noShowModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="noShowForm">
                            <div class="modal-header">
                                <h5 class="modal-title" id="noShowModalLabel">Mark as No Show</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" id="no_show_booking_id">

                                <div class="mb-3">
                                    <label class="form-label">Reference No</label>
                                    <input type="text" id="no_show_reference" class="form-control" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="no_show_reason" class="form-label">Reason <span class="text-danger">*</span></label>
                                    <textarea id="no_show_reason" class="form-control" rows="4" placeholder="Enter reason" required></textarea>
                                </div>

                                <p class="mb-0 text-danger">This booking will be marked as no show and hidden from the active list.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-danger">Yes, Mark No Show</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/2.1.2/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.1.2/js/dataTables.bootstrap5.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>


    <script>
        $(document).on('click', '.no-show-btn', function () {
            $('#no_show_booking_id').val($(this).data('id'));
            $('#no_show_reference').val($(this).data('reference'));
            $('#no_show_reason').val('');

            bootstrap.Modal.getOrCreateInstance(
                document.getElementById('noShowModal')
            ).show();
        });

        $(document).on('submit', '#noShowForm', function (e) {
            e.preventDefault();

            const id = $('#no_show_booking_id').val();
            const reason = $('#no_show_reason').val().trim();

            if (!reason) {
                alert('Please enter a reason.');
                $('#no_show_reason').focus();
                return;
            }

            $.ajax({
                url: 'assets/includes/mark-no-show.php',
                type: 'POST',
                dataType: 'json',
                data: {
                    id: id,
                    reason: reason
                },
                success: function (res) {
                    if (res.success) {
                        bootstrap.Modal.getInstance(document.getElementById('noShowModal')).hide();
                        location.reload();
                    } else {
                        alert(res.message || 'Failed to mark as no show.');
                    }
                },
                error: function () {
                    alert('Server error while marking as no show.');
                }
            });
        });
    </script>

    <script>
        $(document).ready(function() {
            function setMinDateTime() {
                const now = new Date();

                const year  = now.getFullYear();
                const month = String(now.getMonth() + 1).padStart(2, '0');
                const day   = String(now.getDate()).padStart(2, '0');
                const hours = String(now.getHours()).padStart(2, '0');
                const mins  = String(now.getMinutes()).padStart(2, '0');

                const minDateTime = `${year}-${month}-${day}T${hours}:${mins}`;

                $('#start-date, #end-date').attr('min', minDateTime);
            }

            setMinDateTime();
        });
    </script>

    <script>
        $(function () {
            const table = $('#bookingsTable, #cashHandoverTable').DataTable({
                pageLength: 50,
                lengthMenu: [5, 10, 25, 50],
                // order: [[7, 'desc']],
                responsive: true,
                buttons: [{
                    extend: 'csvHtml5',
                    className: 'd-none',
                    text: 'Export CSV',
                    exportOptions: {
                        columns: ':not(:last-child):not(:nth-last-child(2))',
                        modifier: { search: 'applied' }
                    }
                }]
            });

            $('#exportCSV').on('click', () =>
                table.button('.buttons-csv').trigger()
            );

            $('#bookingTypeFilter').on('change', e =>
                table.column(1)
                    .search(e.target.value ? `^${e.target.value}$` : '', true, false)
                    .draw()
            );

            const normalizeDate = v => {
                const d = new Date(v);
                return isNaN(d) ? null : d.toISOString().slice(0, 10);
            };

            $.fn.dataTable.ext.search.push((_, data) => {
                const filterDate = $('#commonDateFilter').val();
                if (!filterDate) return true;

                const rowStart = normalizeDate(data[6]);
                const rowEnd   = normalizeDate(data[7]); 

                if (!rowStart || !rowEnd) return true;

                return filterDate >= rowStart && filterDate <= rowEnd;
            });

            $('#commonDateFilter').on('change', () => table.draw());

            $('#clearDateFilter').on('click', () => {
                location.reload();
            });
            
            $(function () {
                const $dateInput = $('#commonDateFilter');
                const $balanceBtn = $('#openBalanceSheet');

                function isValidDate(dateStr) {
                    if (!dateStr) return false;

                    const selected = new Date(dateStr);
                    selected.setHours(0,0,0,0);

                    const today = new Date();
                    today.setHours(0,0,0,0);

                    return selected <= today;
                }

                function toggleBalanceButton() {
                    const dateVal = $dateInput.val();

                    if (isValidDate(dateVal)) {
                        $balanceBtn.show();
                    } else {
                        $balanceBtn.hide();
                    }
                }

                // Toggle visibility when date changes
                $dateInput.on('change', toggleBalanceButton);

                // Navigate on click
                $balanceBtn.on('click', function () {
                    const date = $dateInput.val();
                    if (!isValidDate(date)) return;

                    window.location.href = `balance-sheet.php?from=${encodeURIComponent(date)}`;
                });
            });
        });
    </script>

    <script>
        $(document).ready(function() {
            function calculateTotal() {
                const startVal = $('#start-date').val();
                const endVal = $('#end-date').val();
                if (!startVal || !endVal) {
                    $('#calculated-price').text('');
                    return 0;
                }

                const start = new Date(startVal);
                const end = new Date(endVal);

                if (end <= start) {
                    $('#calculated-price').text('0');
                    return 0;
                }

                // Difference in milliseconds
                const diffMs = end - start;

                // Fractional days
                const daysFraction = diffMs / (1000 * 60 * 60 * 24); 

                const daysWhole = Math.floor(daysFraction);
                const hours = Math.round((daysFraction - daysWhole) * 24);
                const displayDuration = `${daysWhole} days${hours > 0 ? ' ' + hours + ' hours' : ''}`;

                // Price per day
                const pricePerDay = 1000;

                // Extras
                let extrasTotal = 0;
                $('.extra-service:checked').each(function() {
                    extrasTotal += parseInt($(this).data('price')) || 0;
                });

                // Total price including fractional days
                const totalPrice = Math.round(daysFraction * pricePerDay + extrasTotal);

                $('#calculated-price').text(totalPrice.toLocaleString() + ' ( ' + displayDuration + ' )');

                return totalPrice;
            }

            // Recalculate when inputs change
            $('#start-date, #end-date, .extra-service').on('change', calculateTotal);

        });
    </script>

    <script>
        $(document).on('click', '.edit-booking', function () {
            const id = $(this).data('id');

            $('#editBookingContent')
                .load(`assets/includes/edit-booking-modal.php?id=${id}`, () => {
                    bootstrap.Modal.getOrCreateInstance(
                        document.getElementById('editBookingModal')
                    ).show();
                });
        });

        $(document).on('click', '#saveRemark', function (e) {
            e.preventDefault();

            const isTrashChecked = $('#move-to-trash').is(':checked');
            const remark = $('#edit-remark').val().trim();
            const meterReading = $('#meter_reading').val().trim();
            const editedEndDate = $('#edited_end_date').val();
            const files = $('#images')[0].files;

            if (isTrashChecked && remark === '') {
                alert('Staff Remarks are required when moving a booking to trash.');
                $('#edit-remark').focus();
                return;
            }

            if (!meterReading) {
                alert('Meter reading is required.');
                $('#meter_reading').focus();
                return;
            }

            const hasExistingImages = <?= !empty($images) ? 'true' : 'false' ?>;
            if (!files.length && !hasExistingImages) {
                alert('Please upload booking images.');
                $('#images').focus();
                return;
            }

            const payload = {
                id: $(this).data('id'),
                remark: remark,
                is_trashed: isTrashChecked ? 1 : 0,
                meter_reading: meterReading,
                edited_end_date: editedEndDate,
                vehicle_status: 'completed',
                images: []
            };

            if (!files.length) {
                send(payload);
                return;
            }

            Promise.all([...files].map(readBase64))
                .then(images => {
                    payload.images = images;
                    send(payload);
                });

            function send(data) {
                $.ajax({
                    url: 'assets/includes/update-remark.php',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(data),
                    success(res) {
                        if (res.success) {
                            bootstrap.Modal
                                .getInstance(document.getElementById('editBookingModal'))
                                .hide();
                            location.reload();
                        } else {
                            alert(res.message || 'Failed to save changes');
                        }
                    },
                    error() {
                        alert('Server error while saving changes');
                    }
                });
            }

            function readBase64(file) {
                return new Promise(resolve => {
                    const reader = new FileReader();
                    reader.onload = e => resolve(e.target.result);
                    reader.readAsDataURL(file);
                });
            }
        });
    </script>

    <script>
        $(document).on('click', '.payment-receipt-btn', function () {
            const id = $(this).data('id');

            $('#paymentReceiptContent').load(`assets/includes/payment-receipt-modal.php?id=${id}`, function () {
                bootstrap.Modal.getOrCreateInstance(
                    document.getElementById('paymentReceiptModal')
                ).show();
            });
        });
    </script>

    <script>
        $(document).on('change', '.cash-handover-check', function () {
            let total = 0;

            $('.cash-handover-check:checked').each(function () {
                total += parseFloat($(this).data('amount')) || 0;
            });

            $('#cashHandoverTotal').text(
                total.toLocaleString(undefined, {
                    minimumFractionDigits: 2,
                    maximumFractionDigits: 2
                })
            );
        });

        $(document).on('submit', '#cashHandoverForm', function (e) {
            e.preventDefault();

            const bookingIds = [];
            $('.cash-handover-check:checked').each(function () {
                bookingIds.push($(this).val());
            });

            if (bookingIds.length === 0) {
                alert('Please select at least one booking.');
                return;
            }

            $('#saveCashHandover').prop('disabled', true).text('Saving...');

            $.ajax({
                url: 'assets/includes/save-cash-handover.php',
                type: 'POST',
                dataType: 'json',
                data: {
                    booking_ids: bookingIds
                },
                success: function (res) {
                    if (res.success) {
                        alert('Cash handover saved successfully.');
                        location.reload();
                    } else {
                        alert(res.message || 'Failed to save cash handover.');
                        $('#saveCashHandover').prop('disabled', false).text('Save Handover');
                    }
                },
                error: function () {
                    alert('Server error while saving cash handover.');
                    $('#saveCashHandover').prop('disabled', false).text('Save Handover');
                }
            });
        });
    </script>`

    
     <script>
    document.getElementById('paymentReceiptModal')
        .addEventListener('hidden.bs.modal', function () {
            location.reload();
        });
</script>                               
</body>
</html>