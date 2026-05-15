<?php
session_start();

$myAccountPageId = 6;       // My Account page ID
$bookingsPageId  = 8;     

if (!isset($_SESSION['customer_id'])) {
    header("Location: " . $modx->makeUrl($myAccountPageId));
    exit;
}

if (isset($_POST['logout'])) {
    session_destroy();
    header("Location: " . $modx->makeUrl($myAccountPageId));
    exit;
}

require_once MODX_BASE_PATH . 'assets/includes/db_connect.php';

$name  = htmlspecialchars($_SESSION['customer_name'] ?? 'Customer', ENT_QUOTES, 'UTF-8');
$emailRaw = $_SESSION['customer_email'] ?? '';
$email = htmlspecialchars($emailRaw, ENT_QUOTES, 'UTF-8');
$initial = strtoupper(substr($name, 0, 1));

$totalBookings = 0;
$activeBookings = 0;
$totalReceipts = 0;

try {
    $stmt = $conn->prepare("
        SELECT COUNT(*) 
        FROM reserved_slots 
        WHERE email = ?
        AND is_trashed = 0
        AND is_no_show = 0
    ");
    $stmt->execute([$emailRaw]);
    $totalBookings = (int)$stmt->fetchColumn();

    $stmt = $conn->prepare("
        SELECT COUNT(*) 
        FROM reserved_slots 
        WHERE email = ?
        AND is_trashed = 0
        AND is_no_show = 0
        AND end_date >= NOW()
    ");
    $stmt->execute([$emailRaw]);
    $activeBookings = (int)$stmt->fetchColumn();

    $stmt = $conn->prepare("
        SELECT COUNT(pr.id)
        FROM payment_receipts pr
        INNER JOIN reserved_slots rs ON rs.id = pr.reserved_slot_id
        WHERE rs.email = ?
    ");
    $stmt->execute([$emailRaw]);
    $totalReceipts = (int)$stmt->fetchColumn();

} catch (PDOException $e) {
    $totalBookings = 0;
    $activeBookings = 0;
    $totalReceipts = 0;
}

return '
<style>
.customer-dashboard-wrap {
    display: flex;
    min-height: 80vh;
    background: #f4f6f8;
    font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
}

.customer-sidebar {
    width: 260px;
    background: #003272;
    color: #fff;
    padding: 25px 20px;
}

.customer-logo {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 35px;
}

.customer-user {
    text-align: center;
    margin-bottom: 30px;
}

.customer-avatar {
    width: 75px;
    height: 75px;
    background: #fff;
    color: #003272;
    border-radius: 50%;
    margin: 0 auto 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 30px;
    font-weight: bold;
}

.customer-user-name {
    font-size: 18px;
    font-weight: bold;
}

.customer-user-email {
    font-size: 13px;
    opacity: 0.85;
    word-break: break-word;
}

.customer-menu a,
.customer-menu button {
    display: block;
    width: 100%;
    background: transparent;
    border: none;
    color: #fff;
    text-align: left;
    padding: 12px 14px;
    border-radius: 8px;
    margin-bottom: 8px;
    text-decoration: none;
    cursor: pointer;
    font-size: 15px;
}

.customer-menu a.active,
.customer-menu a:hover,
.customer-menu button:hover {
    background: rgba(255,255,255,0.15);
}

.customer-main {
    flex: 1;
    padding: 30px;
}

.dashboard-header {
    background: #fff;
    padding: 22px 25px;
    border-radius: 14px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.06);
    margin-bottom: 25px;
}

.dashboard-header h2 {
    color: #003272;
    margin: 0 0 6px;
}

.dashboard-header p {
    margin: 0;
    color: #666;
}

.dashboard-cards {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 18px;
    margin-bottom: 25px;
}

.dashboard-card {
    background: #fff;
    padding: 22px;
    border-radius: 14px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.06);
}

.dashboard-card span {
    color: #777;
    font-size: 14px;
}

.dashboard-card h3 {
    margin: 8px 0 0;
    color: #003272;
    font-size: 28px;
}

.profile-panel {
    background: #fff;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.06);
}

.profile-panel h3 {
    margin-top: 0;
    color: #003272;
}

.profile-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
}

.profile-item {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    padding: 14px;
    border-radius: 10px;
}

.profile-item strong {
    display: block;
    color: #555;
    margin-bottom: 5px;
}

@media (max-width: 850px) {
    .customer-dashboard-wrap {
        flex-direction: column;
    }

    .customer-sidebar {
        width: 100%;
    }

    .dashboard-cards,
    .profile-grid {
        grid-template-columns: 1fr;
    }
}
</style>


    <title>Airport Parking | Booking Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">

<div class="customer-dashboard-wrap">
    <aside class="customer-sidebar">
        <div class="customer-logo">Airport Parking</div>

        <div class="customer-user">
            <div class="customer-avatar">' . $initial . '</div>
            <div class="customer-user-name">' . $name . '</div>
            <div class="customer-user-email">' . $email . '</div>
        </div>

        <div class="customer-menu">
            <a href="' . $modx->makeUrl($modx->resource->get("id")) . '" class="active">Dashboard</a>
            <a href="' . $modx->makeUrl($bookingsPageId) . '">My Bookings</a>
         
            <a href="#">Profile</a>

            <form method="post">
                <button type="submit" name="logout">Logout</button>
            </form>
        </div>
    </aside>

    <main class="customer-main">
        <div class="dashboard-header">
            <h2>Welcome back, ' . $name . '</h2>
            <p>Manage your bookings, receipts, and account details from your dashboard.</p>
        </div>

        <div class="dashboard-cards">
            <div class="dashboard-card">
                <span>Total Bookings</span>
                <h3>' . $totalBookings . '</h3>
            </div>

            <div class="dashboard-card">
                <span>Active Bookings</span>
                <h3>' . $activeBookings . '</h3>
            </div>

            <div class="dashboard-card">
                <span>Payment Receipts</span>
                <h3>' . $totalReceipts . '</h3>
            </div>
        </div>

        <div class="profile-panel">
            <h3>Account Details</h3>

            <div class="profile-grid">
                <div class="profile-item">
                    <strong>Name</strong>
                    ' . $name . '
                </div>

                <div class="profile-item">
                    <strong>Email</strong>
                    ' . $email . '
                </div>

                <div class="profile-item">
                    <strong>Account Status</strong>
                    Active
                </div>

                <div class="profile-item">
                    <strong>Member Type</strong>
                    Website Customer
                </div>
            </div>
        </div>
    </main>
</div>';
return;
