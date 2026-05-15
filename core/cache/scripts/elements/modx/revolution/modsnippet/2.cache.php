<?php  return 'if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$dashboardPageId = 7;

$loginMessage = \'\';
$registerMessage = \'\';
$debugMessage = \'Snippet started. \';
$activeTab = \'loginTab\';
$prefillEmail = \'\';
$prefillPhone = \'\';

try {
    $possibleDbFiles = [
        MODX_BASE_PATH . \'assets/includes/db_connect.php\',
        MODX_BASE_PATH . \'../assets/includes/db_connect.php\',
        \'/home/airpor26/public_html/assets/includes/db_connect.php\',
        \'/home/airpor26/public_html/airport/assets/includes/db_connect.php\'
    ];

    $dbFile = \'\';

    foreach ($possibleDbFiles as $file) {
        if (file_exists($file)) {
            $dbFile = $file;
            break;
        }
    }

    if ($dbFile === \'\') {
        throw new Exception(\'DB file not found in checked paths.\');
    }

    require_once $dbFile;

    if (!isset($conn)) {
        throw new Exception(\'$conn not found in db_connect.php\');
    }

    if (!($conn instanceof PDO)) {
        throw new Exception(\'$conn is not PDO\');
    }

    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $debugMessage .= \'DB connected using: \' . $dbFile . \'. \';

    if ($_SERVER[\'REQUEST_METHOD\'] === \'POST\') {
        $debugMessage .= \'POST received. \';

        if (isset($_POST[\'register_submit\'])) {
            $activeTab = \'registerTab\';

            $name = trim($_POST[\'register_name\'] ?? \'\');
            $email = trim($_POST[\'register_email\'] ?? \'\');
            $phone = trim($_POST[\'register_phone\'] ?? \'\');
            $password = $_POST[\'register_password\'] ?? \'\';
            $confirm = $_POST[\'register_confirm_password\'] ?? \'\';

            $prefillEmail = $email;
            $prefillPhone = $phone;

            $debugMessage .= \'Register submitted. \';

            if ($name === \'\' || $email === \'\' || $phone === \'\' || $password === \'\' || $confirm === \'\') {
                $registerMessage = \'Please fill all required fields.\';
                $debugMessage .= \'Empty required field. \';
            } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $registerMessage = \'Please enter a valid email address.\';
                $debugMessage .= \'Invalid email. \';
            } elseif ($password !== $confirm) {
                $registerMessage = \'Passwords do not match.\';
                $debugMessage .= \'Passwords mismatch. \';
            } else {

                // Check email exists in reserved_slots first
                $bookingCheck = $conn->prepare("
                    SELECT id
                    FROM reserved_slots
                    WHERE email = ?
                    LIMIT 1
                ");
                $bookingCheck->execute([$email]);

                if (!$bookingCheck->fetch(PDO::FETCH_ASSOC)) {
                    $registerMessage = \'No booking record found for this email. Please register using the same email used for your booking.\';
                    $activeTab = \'registerTab\';
                    $debugMessage .= \'No reserved_slots record found for email: \' . $email . \'. \';
                } else {

                    // Check already registered
                    $check = $conn->prepare("
                        SELECT id 
                        FROM website_customer 
                        WHERE email = ?
                        LIMIT 1
                    ");
                    $check->execute([$email]);

                    if ($check->fetch(PDO::FETCH_ASSOC)) {
                        $registerMessage = \'This email is already registered. Please login.\';
                        $activeTab = \'loginTab\';
                        $debugMessage .= \'Email already exists in website_customer. \';
                    } else {
                        $hash = password_hash($password, PASSWORD_DEFAULT);

                        $stmt = $conn->prepare("
                            INSERT INTO website_customer 
                            (
                                full_name,
                                email,
                                phone,
                                password_hash,
                                created_at,
                                remember_token,
                                reset_token,
                                reset_expiry
                            )
                            VALUES 
                            (?, ?, ?, ?, NOW(), NULL, NULL, NULL)
                        ");

                        $stmt->execute([
                            $name,
                            $email,
                            $phone,
                            $hash
                        ]);

                        $loginMessage = \'Registration successful. Please login.\';
                        $activeTab = \'loginTab\';
                        $prefillEmail = $email;
                        $prefillPhone = \'\';

                        $debugMessage .= \'Insert successful. New customer ID: \' . $conn->lastInsertId() . \'. \';
                    }
                }
            }
        }

        if (isset($_POST[\'login_submit\'])) {
            $activeTab = \'loginTab\';

            $email = trim($_POST[\'login_email\'] ?? \'\');
            $password = $_POST[\'login_password\'] ?? \'\';

            $prefillEmail = $email;

            $debugMessage .= \'Login submitted. \';

            if ($email === \'\' || $password === \'\') {
                $loginMessage = \'Please enter email and password.\';
            } else {
                $stmt = $conn->prepare("
                    SELECT * 
                    FROM website_customer 
                    WHERE email = ?
                    LIMIT 1
                ");
                $stmt->execute([$email]);

                $user = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($user && password_verify($password, $user[\'password_hash\'])) {
                    $_SESSION[\'customer_id\'] = $user[\'id\'];
                    $_SESSION[\'customer_name\'] = $user[\'full_name\'];
                    $_SESSION[\'customer_email\'] = $user[\'email\'];

                    if (!empty($_POST[\'remember_me\'])) {
                        $token = bin2hex(random_bytes(32));

                        $updateToken = $conn->prepare("
                            UPDATE website_customer 
                            SET remember_token = ? 
                            WHERE id = ?
                        ");
                        $updateToken->execute([$token, $user[\'id\']]);

                        setcookie(
                            \'remember_token\',
                            $token,
                            time() + (86400 * 30),
                            \'/\',
                            \'\',
                            false,
                            true
                        );
                    }

                    header(\'Location: \' . $modx->makeUrl($dashboardPageId));
                    exit;
                } else {
                    $loginMessage = \'Invalid email or password.\';
                    $debugMessage .= \'Invalid login. \';
                }
            }
        }
    }

} catch (Throwable $e) {
    $registerMessage = \'System error. Check debug message.\';
    $debugMessage .= \'ERROR: \' . $e->getMessage();
}

$modx->setPlaceholder(\'loginMessage\', htmlspecialchars($loginMessage, ENT_QUOTES, \'UTF-8\'));
$modx->setPlaceholder(\'registerMessage\', htmlspecialchars($registerMessage, ENT_QUOTES, \'UTF-8\'));
$modx->setPlaceholder(\'debugMessage\', htmlspecialchars($debugMessage, ENT_QUOTES, \'UTF-8\'));
$modx->setPlaceholder(\'activeTab\', htmlspecialchars($activeTab, ENT_QUOTES, \'UTF-8\'));
$modx->setPlaceholder(\'prefillEmail\', htmlspecialchars($prefillEmail, ENT_QUOTES, \'UTF-8\'));
$modx->setPlaceholder(\'prefillPhone\', htmlspecialchars($prefillPhone, ENT_QUOTES, \'UTF-8\'));

return \'\';
return;
';