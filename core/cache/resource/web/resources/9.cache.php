<?php  return array (
  'resourceClass' => 'MODX\\Revolution\\modDocument',
  'resource' => 
  array (
    'id' => 9,
    'type' => 'document',
    'pagetitle' => 'Profile',
    'longtitle' => '',
    'description' => '',
    'alias' => 'profile',
    'link_attributes' => '',
    'published' => 1,
    'pub_date' => 0,
    'unpub_date' => 0,
    'parent' => 0,
    'isfolder' => 0,
    'introtext' => '',
    'content' => '[[!CustomerProfile]]',
    'richtext' => 1,
    'template' => 0,
    'menuindex' => 8,
    'searchable' => 1,
    'cacheable' => 1,
    'createdby' => 1,
    'createdon' => 1777012030,
    'editedby' => 1,
    'editedon' => 1777012062,
    'deleted' => 0,
    'deletedon' => 0,
    'deletedby' => 0,
    'publishedon' => 1777012062,
    'publishedby' => 1,
    'menutitle' => '',
    'content_dispo' => 0,
    'hidemenu' => 0,
    'class_key' => 'MODX\\Revolution\\modDocument',
    'context_key' => 'web',
    'content_type' => 1,
    'uri' => '',
    'uri_override' => 0,
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'properties' => NULL,
    'alias_visible' => 1,
    '_content' => '[[!CustomerProfile]]',
    '_isForward' => false,
  ),
  'contentType' => 
  array (
    'id' => 1,
    'name' => 'HTML',
    'description' => 'HTML content',
    'mime_type' => 'text/html',
    'file_extensions' => '.html',
    'icon' => '',
    'headers' => NULL,
    'binary' => 0,
  ),
  'policyCache' => 
  array (
  ),
  'sourceCache' => 
  array (
    'MODX\\Revolution\\modChunk' => 
    array (
    ),
    'MODX\\Revolution\\modSnippet' => 
    array (
      'CustomerProfile' => 
      array (
        'fields' => 
        array (
          'id' => 5,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'CustomerProfile',
          'description' => '',
          'editor_type' => 0,
          'category' => 0,
          'cache_type' => 0,
          'snippet' => 'session_start();

$myAccountPageId = 6;
$dashboardPageId = 7;
$bookingsPageId = 8;

if (!isset($_SESSION[\'customer_id\'])) {
    header("Location: " . $modx->makeUrl($myAccountPageId));
    exit;
}

if (isset($_POST[\'logout\'])) {
    session_destroy();
    header("Location: " . $modx->makeUrl($myAccountPageId));
    exit;
}

require_once MODX_BASE_PATH . \'assets/includes/db_connect.php\';

$customerId = (int)$_SESSION[\'customer_id\'];
$message = \'\';

if (isset($_POST[\'update_profile\'])) {
    $fullName = trim($_POST[\'full_name\'] ?? \'\');
    $phone = trim($_POST[\'phone\'] ?? \'\');

    if ($fullName === \'\') {
        $message = \'Name is required.\';
    } else {
        $stmt = $conn->prepare("
            UPDATE website_customer
            SET full_name = ?, phone = ?
            WHERE id = ?
        ");
        $stmt->execute([$fullName, $phone, $customerId]);

        $_SESSION[\'customer_name\'] = $fullName;
        $message = \'Profile updated successfully.\';
    }
}

$stmt = $conn->prepare("SELECT * FROM website_customer WHERE id = ?");
$stmt->execute([$customerId]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

$name = htmlspecialchars($user[\'full_name\'] ?? \'Customer\', ENT_QUOTES, \'UTF-8\');
$email = htmlspecialchars($user[\'email\'] ?? \'\', ENT_QUOTES, \'UTF-8\');
$phone = htmlspecialchars($user[\'phone\'] ?? \'\', ENT_QUOTES, \'UTF-8\');
$initial = strtoupper(substr($name, 0, 1));

return \'
<style>
.customer-dashboard-wrap{display:flex;min-height:80vh;background:#f4f6f8;font-family:Cambria,Cochin,Georgia,Times,"Times New Roman",serif}
.customer-sidebar{width:260px;background:#003272;color:#fff;padding:25px 20px}
.customer-logo{font-size:24px;font-weight:bold;margin-bottom:35px}
.customer-user{text-align:center;margin-bottom:30px}
.customer-avatar{width:75px;height:75px;background:#fff;color:#003272;border-radius:50%;margin:0 auto 12px;display:flex;align-items:center;justify-content:center;font-size:30px;font-weight:bold}
.customer-user-name{font-size:18px;font-weight:bold}
.customer-user-email{font-size:13px;opacity:.85;word-break:break-word}
.customer-menu a,.customer-menu button{display:block;width:100%;background:transparent;border:none;color:#fff;text-align:left;padding:12px 14px;border-radius:8px;margin-bottom:8px;text-decoration:none;cursor:pointer;font-size:15px}
.customer-menu a.active,.customer-menu a:hover,.customer-menu button:hover{background:rgba(255,255,255,.15)}
.customer-main{flex:1;padding:30px}
.profile-card{background:#fff;padding:25px;border-radius:14px;box-shadow:0 5px 18px rgba(0,0,0,.06);max-width:750px}
.profile-card h2{color:#003272;margin-top:0}
.form-group{margin-bottom:16px}
.form-group label{display:block;font-weight:bold;color:#003272;margin-bottom:6px}
.form-group input{width:100%;padding:12px;border:1px solid #ccd6e0;border-radius:8px}
.save-btn{background:#003272;color:#fff;border:none;padding:12px 20px;border-radius:8px;cursor:pointer;font-weight:bold}
.message{background:#e8f4ff;border-left:4px solid #003272;padding:10px;margin-bottom:15px;color:#003272}
@media(max-width:850px){.customer-dashboard-wrap{flex-direction:column}.customer-sidebar{width:100%}}
</style>

<div class="customer-dashboard-wrap">
    <aside class="customer-sidebar">
        <div class="customer-logo">Airport Parking</div>
        <div class="customer-user">
            <div class="customer-avatar">\'.$initial.\'</div>
            <div class="customer-user-name">\'.$name.\'</div>
            <div class="customer-user-email">\'.$email.\'</div>
        </div>

        <div class="customer-menu">
            <a href="\'.$modx->makeUrl($dashboardPageId).\'">Dashboard</a>
            <a href="\'.$modx->makeUrl($bookingsPageId).\'">My Bookings</a>
            <a href="#" class="active">Profile</a>
            <form method="post">
                <button type="submit" name="logout">Logout</button>
            </form>
        </div>
    </aside>

    <main class="customer-main">
        <div class="profile-card">
            <h2>My Profile</h2>

            \'.($message ? \'<div class="message">\'.htmlspecialchars($message, ENT_QUOTES, \'UTF-8\').\'</div>\' : \'\').\'

            <form method="post">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="full_name" value="\'.$name.\'" required>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" value="\'.$email.\'" readonly>
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="phone" value="\'.$phone.\'">
                </div>

                <button type="submit" name="update_profile" class="save-btn">Save Changes</button>
            </form>
        </div>
    </main>
</div>\';',
          'locked' => false,
          'properties' => 
          array (
          ),
          'moduleguid' => '',
          'static' => false,
          'static_file' => '',
          'content' => 'session_start();

$myAccountPageId = 6;
$dashboardPageId = 7;
$bookingsPageId = 8;

if (!isset($_SESSION[\'customer_id\'])) {
    header("Location: " . $modx->makeUrl($myAccountPageId));
    exit;
}

if (isset($_POST[\'logout\'])) {
    session_destroy();
    header("Location: " . $modx->makeUrl($myAccountPageId));
    exit;
}

require_once MODX_BASE_PATH . \'assets/includes/db_connect.php\';

$customerId = (int)$_SESSION[\'customer_id\'];
$message = \'\';

if (isset($_POST[\'update_profile\'])) {
    $fullName = trim($_POST[\'full_name\'] ?? \'\');
    $phone = trim($_POST[\'phone\'] ?? \'\');

    if ($fullName === \'\') {
        $message = \'Name is required.\';
    } else {
        $stmt = $conn->prepare("
            UPDATE website_customer
            SET full_name = ?, phone = ?
            WHERE id = ?
        ");
        $stmt->execute([$fullName, $phone, $customerId]);

        $_SESSION[\'customer_name\'] = $fullName;
        $message = \'Profile updated successfully.\';
    }
}

$stmt = $conn->prepare("SELECT * FROM website_customer WHERE id = ?");
$stmt->execute([$customerId]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

$name = htmlspecialchars($user[\'full_name\'] ?? \'Customer\', ENT_QUOTES, \'UTF-8\');
$email = htmlspecialchars($user[\'email\'] ?? \'\', ENT_QUOTES, \'UTF-8\');
$phone = htmlspecialchars($user[\'phone\'] ?? \'\', ENT_QUOTES, \'UTF-8\');
$initial = strtoupper(substr($name, 0, 1));

return \'
<style>
.customer-dashboard-wrap{display:flex;min-height:80vh;background:#f4f6f8;font-family:Cambria,Cochin,Georgia,Times,"Times New Roman",serif}
.customer-sidebar{width:260px;background:#003272;color:#fff;padding:25px 20px}
.customer-logo{font-size:24px;font-weight:bold;margin-bottom:35px}
.customer-user{text-align:center;margin-bottom:30px}
.customer-avatar{width:75px;height:75px;background:#fff;color:#003272;border-radius:50%;margin:0 auto 12px;display:flex;align-items:center;justify-content:center;font-size:30px;font-weight:bold}
.customer-user-name{font-size:18px;font-weight:bold}
.customer-user-email{font-size:13px;opacity:.85;word-break:break-word}
.customer-menu a,.customer-menu button{display:block;width:100%;background:transparent;border:none;color:#fff;text-align:left;padding:12px 14px;border-radius:8px;margin-bottom:8px;text-decoration:none;cursor:pointer;font-size:15px}
.customer-menu a.active,.customer-menu a:hover,.customer-menu button:hover{background:rgba(255,255,255,.15)}
.customer-main{flex:1;padding:30px}
.profile-card{background:#fff;padding:25px;border-radius:14px;box-shadow:0 5px 18px rgba(0,0,0,.06);max-width:750px}
.profile-card h2{color:#003272;margin-top:0}
.form-group{margin-bottom:16px}
.form-group label{display:block;font-weight:bold;color:#003272;margin-bottom:6px}
.form-group input{width:100%;padding:12px;border:1px solid #ccd6e0;border-radius:8px}
.save-btn{background:#003272;color:#fff;border:none;padding:12px 20px;border-radius:8px;cursor:pointer;font-weight:bold}
.message{background:#e8f4ff;border-left:4px solid #003272;padding:10px;margin-bottom:15px;color:#003272}
@media(max-width:850px){.customer-dashboard-wrap{flex-direction:column}.customer-sidebar{width:100%}}
</style>

<div class="customer-dashboard-wrap">
    <aside class="customer-sidebar">
        <div class="customer-logo">Airport Parking</div>
        <div class="customer-user">
            <div class="customer-avatar">\'.$initial.\'</div>
            <div class="customer-user-name">\'.$name.\'</div>
            <div class="customer-user-email">\'.$email.\'</div>
        </div>

        <div class="customer-menu">
            <a href="\'.$modx->makeUrl($dashboardPageId).\'">Dashboard</a>
            <a href="\'.$modx->makeUrl($bookingsPageId).\'">My Bookings</a>
            <a href="#" class="active">Profile</a>
            <form method="post">
                <button type="submit" name="logout">Logout</button>
            </form>
        </div>
    </aside>

    <main class="customer-main">
        <div class="profile-card">
            <h2>My Profile</h2>

            \'.($message ? \'<div class="message">\'.htmlspecialchars($message, ENT_QUOTES, \'UTF-8\').\'</div>\' : \'\').\'

            <form method="post">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="full_name" value="\'.$name.\'" required>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" value="\'.$email.\'" readonly>
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="phone" value="\'.$phone.\'">
                </div>

                <button type="submit" name="update_profile" class="save-btn">Save Changes</button>
            </form>
        </div>
    </main>
</div>\';',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
          'id' => 1,
          'name' => 'Filesystem',
          'description' => '',
          'class_key' => 'MODX\\Revolution\\Sources\\modFileMediaSource',
          'properties' => 
          array (
          ),
          'is_stream' => true,
        ),
      ),
    ),
    'MODX\\Revolution\\modTemplateVar' => 
    array (
    ),
  ),
);