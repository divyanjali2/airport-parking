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
            id,
            reference_number,
            slot_number,
            vehicle_type,
            flight_number,
            start_date,
            end_date,
            total_price,
            pdf_path,
            name AS customer_name,
            email,
            booking_type,
            whatsapp_number,
            total_price_final,
            status
        FROM reserved_slots
        WHERE is_trashed = 0
        AND is_no_show = 0
        ORDER BY 
            CASE WHEN status = 'pending' THEN 0 ELSE 1 END,
            created_at DESC
    ");

    $bookings = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . $e->getMessage() . '</div>');
}


try {
    $stmtPrev = $conn->query("
        SELECT 
            id,
            vehicle_type,
            start_date,
            end_date,
            name,
            whatsapp_number,
            days,
            price_per_day,
            total_price
        FROM previous_bookings
        ORDER BY start_date DESC
    ");
    $previousBookings = $stmtPrev->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die('<div style="color:red;">Database error (previous_bookings): ' . $e->getMessage() . '</div>');
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
                        <!-- <a href="add-invoices.php" class="btn btn-warning text-dark me-2">
                            Add Invoices
                        </a> -->
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#directBookingModal">
                            Add Direct Booking
                        </button>
                    </div>
                    <h2 class="text-center fw-bold">🚘 Booking Dashboard</h2>
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
                                    <!-- <th>Status</th> -->
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
                                        <!-- <?php
                                            $status = strtolower($b['status']);

                                            $badgeClass = match ($status) {
                                                'pending' => 'bg-warning text-dark',
                                                'send_to_finance' => 'bg-info text-dark',
                                                'accepted' => 'bg-success text-white',
                                                default => 'bg-secondary text-white'
                                            };
                                            ?>
                                            <td>
                                                <span class="badge <?= $badgeClass ?> p-2">
                                                    <?= htmlspecialchars(ucwords(str_replace('_', ' ', $b['status']))) ?>
                                                </span>
                                            </td>                                        -->
                                        <td class="d-flex gap-1">
                                            <!-- <button
                                                class="btn btn-sm btn-outline-primary payment-receipt-btn"
                                                data-id="<?= $b['id'] ?>"
                                            >
                                                Receipt
                                            </button> -->

                                            <!-- Edit button -->
                                            <!-- <button class="btn btn-sm btn-outline-success edit-booking" data-id="<?= $b['id'] ?>">Edit</button> -->

                                            <button type="button" class="btn btn-sm btn-danger no-show-btn" data-id="<?= $b['id'] ?>" data-reference="<?= htmlspecialchars($b['reference_number']) ?>" title="Mark as No Show" >
                                                <i class="bi bi-person-x"></i>
                                            </button>

                                            <!-- <?php if (!empty($b['whatsapp_number']) && !empty($b['pdf_path'])): 
                                                $waNumber = preg_replace('/\D+/', '', $b['whatsapp_number']);
                                                $pdfPath = '/' . ltrim(str_replace('\\', '/', str_replace($_SERVER['DOCUMENT_ROOT'], '', $b['pdf_path'])), '/');
                                                $pdfUrl  = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://{$_SERVER['HTTP_HOST']}$pdfPath";
                                                $waLink  = "https://wa.me/{$waNumber}?text=" . urlencode(
                                                    "Hello {$b['customer_name']}, this is your booking invoice from Airport Parking. Your reference number is {$b['reference_number']}. View your invoice here: {$pdfUrl}"
                                                );
                                            ?>
                                                <a href="<?= $waLink ?>" target="_blank" class="btn btn-sm btn-outline-success">
                                                    <i class="bi bi-whatsapp"></i>
                                                </a> -->
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>

                    <!-- Previous Bookings Table -->
                    <hr class="my-4">
                    <h4 class="text-center fw-bold">Previous Bookings</h4>
                    <div class="mb-3 d-flex align-items-end gap-3 justify-content-end">
                        <div>
                            <label for="vehicleTypeFilterPrev" class="form-label">Filter by Vehicle Type:</label>
                            <select id="vehicleTypeFilterPrev" class="form-select w-auto">
                                <option value="">All</option>
                                <option value="car">Car</option>
                                <option value="van">Van</option>
                                <option value="bus">Bus</option>
                            </select>
                        </div>
                        <div>
                            <label for="dateFilterPrev" class="form-label">Filter by Date:</label>
                            <input type="date" id="dateFilterPrev" class="form-control" style="width:160px;">
                        </div>
                        <div class="align-self-end">
                            <button id="clearDateFilterPrev" class="btn btn-danger">Clear</button>
                        </div>
                        <div class="align-self-end">
                            <button id="exportCSVPrev" class="btn btn-info">Export CSV</button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table id="previousBookingsTable" class="table table-bordered table-striped align-middle">
                            <thead>
                                <tr class="table-dark">
                                    <th>#</th>
                                    <th>Vehicle Type</th>
                                    <th>Customer Name</th>
                                    <th>WhatsApp</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Days</th>
                                    <th>Price per Day (LKR)</th>
                                    <th>Total Price (LKR)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach($previousBookings as $i => $b): ?>
                                <tr>
                                    <td><?= $i + 1 ?></td>
                                    <td><?= htmlspecialchars($b['vehicle_type']) ?></td>
                                    <td><?= htmlspecialchars($b['name']) ?></td>
                                    <td><?= htmlspecialchars($b['whatsapp_number']) ?></td>
                                    <td data-order="<?= $b['start_date'] ?>"><?= date('d M Y', strtotime($b['start_date'])) ?></td>
                                    <td data-order="<?= $b['end_date'] ?>"><?= date('d M Y', strtotime($b['end_date'])) ?></td>
                                    <td><?= number_format($b['days'],0) ?></td>
                                    <td><?= number_format($b['price_per_day'],2) ?></td>
                                    <td><?= number_format($b['total_price'],2) ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="directBookingModal" tabindex="-1" aria-labelledby="directBookingLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form id="direct-booking-form">
                            <div class="modal-header">
                                <h5 class="fw-bold modal-title" id="directBookingLabel">Add Direct Booking</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row g-3">
                                    <!-- Slot Dropdown -->
                                    <div class="col-md-4">
                                        <label>Slot Number <span class="text-danger">*</span></label>
                                        <select id="slot-number" class="form-select" required>
                                            <option value="">Select Slot</option>
                                            <option value="A1">A1</option>
                                            <option value="A2">A2</option>
                                            <option value="B1">B1</option>
                                            <option value="B2">B2</option>
                                            <option value="C1">C1</option>
                                        </select>
                                    </div>

                                    <!-- Vehicle Type -->
                                    <div class="col-md-4">
                                        <label>Vehicle Type <span class="text-danger">*</span></label>
                                        <select id="vehicle-type" class="form-select" required>
                                            <option value="">Select vehicle</option>
                                            <option value="car">Car</option>
                                            <option value="van">Van</option>
                                            <option value="bus">Bus</option>
                                        </select>
                                    </div>

                                     <div class="col-md-4">
                                        <label>Vehicle Number <span class="text-danger">*</span></label>
                                        <input type="text" id="vehicle_number" class="form-control" required placeholder="Enter vehicle number">
                                    </div>

                                    <!-- Flight Number -->
                                    <div class="col-md-4">
                                        <label>Flight Number <span class="text-danger">*</span></label>
                                        <input type="text" id="flight-number" class="form-control" required placeholder="Enter flight number">
                                    </div>

                                    <!-- Dates -->
                                    <div class="col-md-4">
                                        <label>Start Date & Time <span class="text-danger">*</span></label>
                                        <input type="datetime-local" id="start-date" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label>End Date & Time <span class="text-danger">*</span></label>
                                        <input type="datetime-local" id="end-date" class="form-control" required>
                                    </div>

                                    <!-- Customer Info -->
                                    <div class="col-md-4">
                                        <label>Name <span class="text-danger">*</span></label>
                                        <input type="text" id="user-name" class="form-control" required placeholder="Enter customer name">
                                    </div>
                                    <div class="col-md-4">
                                        <label>Hometown <span class="text-danger">*</span></label>
                                        <input type="text" id="hometown" class="form-control" required placeholder="Enter hometown">
                                    </div>
                                    <div class="col-md-4">
                                        <label>Email <span class="text-danger">*</span></label>
                                        <input type="email" id="user-email" class="form-control" required placeholder="Enter email address">
                                    </div>
                                    <div class="col-md-4">
                                        <label>WhatsApp Number <span class="text-danger">*</span></label>
                                        <input type="number" id="whatsapp-number" class="form-control" required placeholder="94771234567 (without + or spaces)">
                                    </div>

                                    <div class="col-md-4">
                                        <label>Air Ticket Image <span class="text-danger">*</span></label>
                                        <input type="file" id="air_ticket_image_url"  class="form-control" name="air_ticket_image_url" accept="image/*" required>
                                    </div>

                                    <div class="col-md-4">
                                        <label>Passport Copy Image <span class="text-danger">*</span></label>
                                        <input type="file" id="passport_copy_image_url"  class="form-control" name="passport_copy_image_url" accept="image/*" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Passenger Count <span class="text-danger">*</span></label>
                                        <input type="number" id="passenger_count" name="passenger_count" class="form-control" min="1" placeholder="Enter Passenger Count" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="receiver_name">Received By <span class="text-danger">*</span></label>
                                        <select id="receiver_name" class="form-select" required>
                                            <option value="">Select Receiver</option>
                                            <option value="Primali">Primali</option>
                                            <option value="Gayan">Gayan</option>
                                            <option value="Tharindu">Tharindu</option>
                                        </select>
                                    </div>

                                    <hr>

                                    <!-- Extra Services -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>Extra Services</strong></p>
                                            <label><input type="checkbox" class="extra-service" value="Body Wash & Vacuum" data-price="1000"> Body Wash & Vacuum (LKR 1,000)</label><br>
                                            <label><input type="checkbox" class="extra-service mt-2" value="Shuttle One Way" data-price="500"> Shuttle One Way (LKR 500)</label><br>
                                            <label><input type="checkbox" class="extra-service mt-2" value="Shuttle Two Way" data-price="1000"> Shuttle Two Way (LKR 1,000)</label>
                                        </div>
                    
                                        <!-- Calculated Total -->
                                        <div class="col-md-6 mt-3">
                                            <label><strong>Total Price (LKR):</strong></label>
                                            <div id="calculated-price" class="fw-bold fs-5">0</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Save Booking</button>
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
        $(function () {
            const table = $('#bookingsTable').DataTable({
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

            $('#direct-booking-form').on('submit', function(e) {
                e.preventDefault();

                const $saveBtn = $(this).find('button[type="submit"]');
                $saveBtn.prop('disabled', true).text('Saving...');

                const startVal = $('#start-date').val();
                const endVal = $('#end-date').val();
                if (!startVal || !endVal) {
                    alert("Please select both start and end dates.");
                    $saveBtn.prop('disabled', false).text('Save Booking');
                    return;
                }

                const extras = $('.extra-service:checked').map(function(){ return this.value; }).get();
                const daysFraction = (new Date(endVal) - new Date(startVal)) / (1000*60*60*24);
                const totalPrice = calculateTotal(); 

                const formData = new FormData();
                formData.append('slot', $('#slot-number').val());
                formData.append('vehicleType', $('#vehicle-type').val());
                formData.append('flightNumber', $('#flight-number').val());
                formData.append('vehicleNumber', $('#vehicle_number').val());
                formData.append('startDate', startVal);
                formData.append('endDate', endVal);
                formData.append('name', $('#user-name').val());
                formData.append('hometown', $('#hometown').val());
                formData.append('receiver_name', $('#receiver_name').val());
                formData.append('email', $('#user-email').val());
                formData.append('whatsapp', $('#whatsapp-number').val());
                formData.append('pricePerDay', 1000);
                formData.append('days', daysFraction);
                formData.append('passenger_count', $('#passenger_count').val());
                formData.append('totalPrice', calculateTotal());
                formData.append('remarks', '');
                formData.append('receiverName', '');
                formData.append('booking_type', 'direct booking');

                // Append extras as array
                extras.forEach(extra => formData.append('extras[]', extra));

                // Append image files
                const airTicketFile = $('#air_ticket_image_url')[0].files[0];
                const passportFile = $('#passport_copy_image_url')[0].files[0];
                if (airTicketFile) formData.append('air_ticket_image_url', airTicketFile);
                if (passportFile) formData.append('passport_copy_image_url', passportFile);

                $.ajax({
                    url: 'assets/includes/save-booking.php',
                    type: 'POST',
                    data: formData,
                    processData: false,  
                    contentType: false,  
                    success: function(res) {
                        if (res.success) {
                            const modalEl = document.getElementById('directBookingModal');
                            const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                            modal.hide();

                            setTimeout(function() {
                                alert("Booking saved successfully: " + res.reference);
                                location.reload();
                            }, 200);
                        } else {
                            alert("Error: " + res.detail);
                            $saveBtn.prop('disabled', false).text('Save Booking');
                        }
                    },
                    error: function() {
                        alert("Server error. Please try again.");
                        $saveBtn.prop('disabled', false).text('Save Booking');
                    }
                });
            });

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
</body>
</html>