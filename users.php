<?php
    session_start();
    require_once __DIR__ . '/assets/includes/db_connect.php';

    if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'admin') {
        header("Location: login.php");
        exit;
    }

    // Handle delete request
    if (isset($_GET['delete'])) {
        $deleteId = intval($_GET['delete']);

        // Prevent deleting self
        if ($deleteId == $_SESSION['user_id']) {
            $errorMsg = "You cannot delete your own account.";
        } else {
            $stmt = $conn->prepare("DELETE FROM users WHERE id = :id");
            $stmt->execute(['id' => $deleteId]);
            header("Location: users.php");
            exit;
        }
    }

    // Fetch all users
    $stmt = $conn->query("SELECT id, name, email, role, status, created_at, updated_at FROM users ORDER BY id ASC");
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Airport Parking| Users Dashboard</title>
<link rel="icon" type="image/png" href="assets/images/footer-logo.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { font-family: "Cambria"; background-color: #f4f6f8; font-size: 12px;}
</style>
</head>
<body>
<div class="d-flex">
    <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>
    <div class="flex-grow-1 p-4">
        <h3 class="text-center mb-4">Users Management</h2>

        <?php if (isset($_GET['deleted'])): ?>
            <div class="alert alert-success">User deleted successfully.</div>
        <?php elseif (isset($errorMsg)): ?>
            <div class="alert alert-danger"><?= htmlspecialchars($errorMsg) ?></div>
        <?php endif; ?>

        <a href="user_form.php" class="btn btn-success mb-3"><i class="bi bi-plus-circle"></i> Add User</a>

        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <?php foreach ($users as $i => $user): ?>
                <tr>
                    <td><?= htmlspecialchars($user['name']) ?></td>
                    <td><?= htmlspecialchars($user['email']) ?></td>
                    <td><?= htmlspecialchars($user['role']) ?></td>
                    <td>
                        <a href="user_form.php?id=<?= $user['id'] ?>" class="btn btn-sm btn-primary" title="Edit"><i class="bi bi-pencil"></i></a>
                        <a href="?delete=<?= $user['id'] ?>" class="btn btn-sm btn-danger" 
                           onclick="return confirm('Are you sure you want to delete this user?');" 
                           title="Delete"><i class="bi bi-trash"></i></a>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
