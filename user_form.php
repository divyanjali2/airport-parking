<?php
session_start();
require_once __DIR__ . '/assets/includes/db_connect.php';

// Only admin users allowed
if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$error = "";
$id = $_GET['id'] ?? null;
$user = [
    'name' => '',
    'email' => '',
    'role' => 'user',
    'status' => 'active'
];

// If editing, fetch user data
if ($id) {
    $stmt = $conn->prepare("SELECT * FROM users WHERE id = :id LIMIT 1");
    $stmt->execute(['id' => $id]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$user) {
        die("User not found");
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $role = $_POST['role'];
    $status = $_POST['status'];
    $password = $_POST['password'] ?? '';

    if ($name && $email) {
        if ($id) {
            // EDIT mode
            $sql = "UPDATE users SET name=:name, email=:email, role=:role, status=:status, updated_at=NOW()";
            $params = ['name'=>$name,'email'=>$email,'role'=>$role,'status'=>$status,'id'=>$id];

            if (!empty($password)) {
                $sql .= ", password=:password";
                $params['password'] = password_hash($password, PASSWORD_DEFAULT);
            }
            $sql .= " WHERE id=:id";
            $stmt = $conn->prepare($sql);
            $stmt->execute($params);
        } else {
            // CREATE mode
            if (empty($password)) {
                $error = "Password is required for new user.";
            } else {
                $stmt = $conn->prepare("INSERT INTO users (name,email,password,role,status,created_at) VALUES (:name,:email,:password,:role,:status,NOW())");
                $stmt->execute([
                    'name'=>$name,
                    'email'=>$email,
                    'password'=>password_hash($password, PASSWORD_DEFAULT),
                    'role'=>$role,
                    'status'=>$status
                ]);
            }
        }

        if (!$error) {
            header("Location: users.php");
            exit;
        }
    } else {
        $error = "Please fill in all required fields.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Airport Parking| <?= $id ? 'Edit' : 'Add' ?> User</title>
<link rel="icon" type="image/png" href="assets/images/footer-logo.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { font-family: "Cambria"; background-color: #f4f6f8; font-size: 14px;}
</style>
</head>
<body>
<div class="d-flex">
    <!-- Sidebar -->
    <?php include __DIR__ . '/assets/includes/sidebar.php'; ?>

    <!-- Main content -->
    <div class="flex-grow-1 p-4">
        <div class="form-card">
            <h4 class="text-center fw-bold mb-4"><?= $id ? '<i class="bi bi-pencil-square"></i> Edit' : '<i class="bi bi-plus-circle"></i> Add' ?> User</h2>

            <?php if ($error): ?>
                <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
            <?php endif; ?>
            <form method="POST" action="">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="name" value="<?= htmlspecialchars($user['name']) ?>" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Email <span class="text-danger">*</span></label>
                        <input type="email" class="form-control" name="email" value="<?= htmlspecialchars($user['email']) ?>" required>
                    </div>

                    <div class="col-md-6 position-relative">
                        <label class="form-label">Password <span class="text-danger">*</span> <?= $id ? '(leave blank to keep current)' : '' ?></label>
                        <input type="password" class="form-control" name="password" id="password" <?= $id ? '' : 'required' ?>>
                        <span class="password-toggle" id="togglePassword" style="position:absolute; right:15px; top:72%; transform:translateY(-50%); cursor:pointer;">
                            <i class="bi bi-eye-fill"></i>
                        </span>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Role <span class="text-danger">*</span></label>
                        <select name="role" class="form-select" required>
                            <option value="admin" <?= ($user['role'] === 'admin') ? 'selected' : '' ?>>Admin</option>
                            <option value="gm" <?= ($user['role'] === 'gm') ? 'selected' : '' ?>>General Manager</option>
                            <option value="finance" <?= ($user['role'] === 'finance') ? 'selected' : '' ?>>Finance</option>
                            <option value="staff" <?= ($user['role'] === 'staff') ? 'selected' : '' ?>>Staff</option>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option value="active" <?= ($user['status'] === 'active') ? 'selected' : '' ?>>Active</option>
                            <option value="inactive" <?= ($user['status'] === 'inactive') ? 'selected' : '' ?>>Inactive</option>
                        </select>
                    </div>
                </div>

                <div class="mt-4 d-flex justify-content-end">
                    <a href="users.php" class="btn btn-secondary me-2">Cancel</a>
                    <button type="submit" class="btn btn-success"><?= $id ? 'Update' : 'Add' ?> User</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');
    togglePassword.addEventListener('click', () => {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        togglePassword.innerHTML = type === 'password' 
            ? '<i class="bi bi-eye-fill"></i>' 
            : '<i class="bi bi-eye-slash-fill"></i>';
    });
</script>
</body>
</html>
