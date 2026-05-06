<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

try {
    $reservationsCount = $conn->query("SELECT COUNT(*) FROM reserved_slots")->fetchColumn();
    $usersCount = $conn->query("SELECT COUNT(*) FROM users")->fetchColumn();

    $pendingCount = $conn->query("SELECT COUNT(*) FROM reserved_slots WHERE status = 'pending' AND is_trashed = 0")->fetchColumn();
    $financeCount = $conn->query("SELECT COUNT(*) FROM reserved_slots WHERE status = 'send_to_finance' AND is_trashed = 0")->fetchColumn();
    $acceptedCount = $conn->query("SELECT COUNT(*) FROM reserved_slots WHERE status = 'accepted' AND is_trashed = 0")->fetchColumn();

} catch (PDOException $e) {
    die('<div style="color:red;">Database error: ' . htmlspecialchars($e->getMessage()) . '</div>');
}

$userName = $_SESSION['user_name'] ?? 'User';
$userRole = $_SESSION['user_role'] ?? '';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Airport Parking | Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="assets/images/footer-logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            font-family: "Cambria", sans-serif;
            background: #f4f6f8;
            font-size: 14px;
        }

        .dashboard-container {
            max-width: 96%;
            margin-top: 35px;
            margin-bottom: 35px;
        }

        .welcome-card {
            background: linear-gradient(135deg, #0a277d, #163baf);
            color: #fff;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
            margin-bottom: 24px;
        }

        .welcome-card h2 {
            font-weight: 700;
            margin-bottom: 8px;
        }

        .welcome-card p {
            margin-bottom: 0;
            opacity: 0.95;
        }

        .dashboard-card {
            border: none;
            border-radius: 18px;
            padding: 24px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            height: 100%;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 26px rgba(0,0,0,0.12);
        }

        .dashboard-card .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 14px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin-bottom: 16px;
        }

        .dashboard-card h3 {
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .dashboard-card p {
            margin-bottom: 0;
            font-weight: 600;
            color: #555;
        }

        .bg-soft-primary { background: #eef4ff; }
        .bg-soft-success { background: #edf9f0; }
        .bg-soft-warning { background: #fff8e6; }
        .bg-soft-info    { background: #ebf8ff; }
        .bg-soft-dark    { background: #f1f3f5; }

        .icon-primary { background: #dbe8ff; color: #0a58ca; }
        .icon-success { background: #dff5e5; color: #198754; }
        .icon-warning { background: #fff0c2; color: #d39e00; }
        .icon-info    { background: #d9f2ff; color: #0dcaf0; }
        .icon-dark    { background: #e9ecef; color: #495057; }

        .section-title {
            font-weight: 700;
            color: #0a277d;
            margin-bottom: 16px;
        }

        .quick-links .btn {
            border-radius: 12px;
            padding: 12px 18px;
            font-weight: 600;
        }

        .info-panel {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            padding: 24px;
            margin-top: 24px;
        }

        .mini-stat {
            padding: 14px 16px;
            border-radius: 14px;
            background: #f8f9fa;
            font-weight: 600;
        }

        .role-badge {
            display: inline-block;
            background: rgba(255,255,255,0.18);
            color: #fff;
            padding: 6px 12px;
            border-radius: 999px;
            font-size: 13px;
            font-weight: 600;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="d-flex">
    <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

    <div class="flex-grow-1">
        <div class="container-fluid dashboard-container">

            <div class="welcome-card">
                <h2>Welcome back, <?= htmlspecialchars($userName) ?> 👋</h2>
                <p>Here’s a quick overview of your Airport Parking system.</p>
                <div class="role-badge">
                    Role: <?= htmlspecialchars(ucfirst($userRole)) ?>
                </div>
            </div>

            <h4 class="section-title">Overview</h4>

            <div class="row g-4">
                <div class="col-md-6 col-xl-4">
                    <div class="dashboard-card bg-soft-primary">
                        <div class="card-icon icon-primary">
                            <i class="bi bi-calendar-check"></i>
                        </div>
                        <h3><?= (int)$reservationsCount ?></h3>
                        <p>Total Reservations</p>
                    </div>
                </div>

                <div class="col-md-6 col-xl-4">
                    <div class="dashboard-card bg-soft-success">
                        <div class="card-icon icon-success">
                            <i class="bi bi-people"></i>
                        </div>
                        <h3><?= (int)$usersCount ?></h3>
                        <p>Registered Users</p>
                    </div>
                </div>

                <div class="col-md-6 col-xl-4">
                    <div class="dashboard-card bg-soft-warning">
                        <div class="card-icon icon-warning">
                            <i class="bi bi-hourglass-split"></i>
                        </div>
                        <h3><?= (int)$pendingCount ?></h3>
                        <p>Pending Reservations</p>
                    </div>
                </div>

                <div class="col-md-6 col-xl-6">
                    <div class="dashboard-card bg-soft-info">
                        <div class="card-icon icon-info">
                            <i class="bi bi-send-check"></i>
                        </div>
                        <h3><?= (int)$financeCount ?></h3>
                        <p>Sent to Finance</p>
                    </div>
                </div>

                <div class="col-md-6 col-xl-6">
                    <div class="dashboard-card bg-soft-dark">
                        <div class="card-icon icon-dark">
                            <i class="bi bi-patch-check"></i>
                        </div>
                        <h3><?= (int)$acceptedCount ?></h3>
                        <p>Accepted Reservations</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>