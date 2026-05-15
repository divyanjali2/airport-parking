<?php
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    $currentPage = basename($_SERVER['PHP_SELF']);
    $role = $_SESSION['user_role'] ?? '';
?>

<div class="d-flex flex-column flex-shrink-0 p-3 bg-dark text-white">
    <?php if (isset($_SESSION['user_name'])): ?>
        <div class="text-white mb-4 ps-1">
            <i class="bi bi-person-circle me-2"></i>
            Welcome, <strong><?= htmlspecialchars($_SESSION['user_name']) ?></strong>
        </div>
    <?php endif; ?>

    <a href="./dashboard.php" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <img src="assets/images/header-logo.png" alt="Logo" style="width: 200px;">
    </a>
    <hr>

    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="./dashboard.php" class="nav-link text-white <?= $currentPage === 'dashboard.php' ? 'active' : '' ?>" aria-current="page">
                <i class="bi bi-journal-check me-2"></i> Dashboard
            </a>
        </li>

        <?php if (in_array($role, ['staff', 'admin'])): ?>
            <li class="nav-item">
                <a href="./reservations.php" class="nav-link text-white <?= $currentPage === 'reservations.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-calendar-check me-2"></i> Reservations <span class="badge bg-light text-dark ms-2">1</span>
                </a>
            </li>
        <?php endif; ?>

        <?php if (in_array($role, ['staff', 'admin'])): ?>
            <li class="nav-item">
                <a href="./confirmed-reservations.php" class="nav-link text-white <?= $currentPage === 'confirmed-reservations.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-calendar-check me-2"></i> Confirmed Reservations <span class="badge bg-light text-dark ms-2">2</span>
                </a>
            </li>
        <?php endif; ?>

        <?php if (in_array($role, ['finance', 'admin'])): ?>
            <li class="nav-item">
                <a href="./received-cash.php" class="nav-link text-white <?= $currentPage === 'received-cash.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-person-dash me-2"></i> Cash Collection <span class="badge bg-light text-dark ms-2">3</span>
                </a>
            </li>
        <?php endif; ?>

        <?php if (in_array($role, ['staff', 'admin','finance'])): ?>
            <li class="nav-item">
                <a href="./customer_handling_list.php" class="nav-link text-white <?= $currentPage === 'customer_handling_list.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-cash-stack me-2"></i> Customer Handling List
                </a>
            </li>
        <?php endif; ?>

        <?php if (in_array($role, ['gm', 'admin'])): ?>
            <li class="nav-item">
                <a href="./reservation-summary.php" class="nav-link text-white <?= $currentPage === 'reservation-summary.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-card-checklist me-2"></i> Reservation Summary
                </a>
            </li>
        <?php endif; ?> 

        <?php if (in_array($role, ['staff', 'admin','finance'])): ?>
            <li class="nav-item">
                <a href="./payment-receipts.php" class="nav-link text-white <?= $currentPage === 'payment-receipts.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-calendar-check me-2"></i> Payment Receipts
                </a>
            </li>
        <?php endif; ?>

        <?php if (in_array($role, ['staff', 'admin','finance'])): ?>
            <li class="nav-item">
                <a href="./vehicles-on-premises.php" class="nav-link text-white <?= $currentPage === 'vehicles-on-premises.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-car-front me-2"></i> Vehicles on Premises
                </a>
            </li>
        <?php endif; ?>

        <?php if (in_array($role, ['staff', 'admin'])): ?>
            <li class="nav-item">
                <a href="./no-show-bookings.php" class="nav-link text-white <?= $currentPage === 'no-show-bookings.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-person-dash me-2"></i> No Show Bookings
                </a>
            </li>
        <?php endif; ?>

        <?php if (in_array($role, ['staff', 'admin'])): ?>
            <li class="nav-item">
                <a href="./cash-handovers.php" class="nav-link text-white <?= $currentPage === 'cash-handovers.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-cash-stack me-2"></i> Cash Handover Details
                </a>
            </li>
        <?php endif; ?>



        <!-- <?php if (in_array($role, ['finance', 'admin'])): ?>
            <li class="nav-item">
                <a href="./invoice-batches.php" class="nav-link text-white <?= $currentPage === 'invoice-batches.php' ? 'active' : '' ?>" aria-current="page">
                    <i class="bi bi-receipt me-2"></i> Received Invoices
                </a>
            </li>
        <?php endif; ?> -->

        <li class="nav-item">
            <a href="./expenses.php" class="nav-link text-white <?= $currentPage === 'expenses.php' ? 'active' : '' ?>" aria-current="page">
                <i class="bi bi-cash-stack me-2"></i> Expenses
            </a>
        </li>

        <li class="nav-item">
            <a href="./trashed.php" class="nav-link text-white <?= $currentPage === 'trashed.php' ? 'active' : '' ?>" aria-current="page">
                <i class="bi bi-trash3 me-2"></i> Trashed Reservations
            </a>
        </li>

        <?php if ($role === 'admin'): ?>
            <li class="nav-item">
                <a href="./users.php" class="nav-link text-white <?= $currentPage === 'users.php' ? 'active' : '' ?>">
                    <i class="bi bi-people me-2"></i> Users
                </a>
            </li>
        <?php endif; ?>
    </ul>

    <hr>

    <div class="mt-auto">
        <a href="./logout.php" class="nav-link text-white">
            <i class="bi bi-box-arrow-right me-4"></i> Logout
        </a>
    </div>
</div>