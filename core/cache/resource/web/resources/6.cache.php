<?php  return array (
  'resourceClass' => 'MODX\\Revolution\\modDocument',
  'resource' => 
  array (
    'id' => 6,
    'type' => 'document',
    'pagetitle' => 'My Account',
    'longtitle' => '',
    'description' => '',
    'alias' => 'my-account',
    'link_attributes' => '',
    'published' => 1,
    'pub_date' => 0,
    'unpub_date' => 0,
    'parent' => 0,
    'isfolder' => 0,
    'introtext' => '',
    'content' => '[[!WebsiteCustomerAuth]]

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    overflow-x: hidden;
    background: #06172d;
}

.account-page {
    min-height: 100vh;
    width: 100%;
    background:
        linear-gradient(rgba(6, 23, 45, 0.45), rgba(6, 23, 45, 0.65)),
        url("https://i.pinimg.com/1200x/5e/92/33/5e9233e0a725f41ad938feb1bdf23864.jpg") center center / cover no-repeat;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px 16px;
}

.account-card {
    width: 490px;
    max-width: 100%;
    background: #ffffff;
    border-radius: 14px;
    padding: 28px 26px 22px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.45);
}

.account-tabs {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 22px;
}

.tab-btn {
    border: 1px solid #06172d;
    background: #ffffff;
    color: #06172d;
    padding: 8px 18px;
    border-radius: 20px;
    font-weight: 700;
    cursor: pointer;
    text-decoration: none;
    font-size: 13px;
}

.tab-btn.active,
.tab-btn:hover {
    background: #06172d;
    color: #ffffff;
}

.tab-panel {
    display: none;
}

.tab-panel.active {
    display: block;
}

.panel-grid {
    display: block;
}

.left-side {
    display: none;
}

.right-side {
    width: 100%;
}

.form-title {
    color: #06172d;
    font-size: 18px;
    font-weight: 800;
    text-transform: uppercase;
    margin-bottom: 6px;
}

.form-subtitle {
    color: #06172d;
    font-size: 13px;
    margin-bottom: 18px;
}

.form-message {
    background: #ffffff;
    border: 2px solid #f70606;
    color: #f90000;
    padding: 9px 10px;
    margin-bottom: 12px;
    font-size: 13px;
    border-radius: 6px;
}

.form-message:empty {
    display: none;
}

.booking-note {
    background: #ffffff;
    border: 2px solid #02922f;
    color: #02922f;
    padding: 9px 10px;
    margin-bottom: 12px;
    font-size: 12px;
    border-radius: 6px;
}

.form-group {
    margin-bottom: 12px;
}

.input-wrap {
    position: relative;
}

.input-wrap input {
    width: 100%;
    height: 38px;
    border: 1px solid #06172d;
    border-radius: 20px;
    padding: 0 42px;
    background: #ffffff;
    font-size: 13px;
    color: #06172d;
    outline: none;
}

.input-wrap input::placeholder {
    color: #06172d;
    opacity: 0.65;
}

.input-wrap input:focus {
    border-color: #06172d;
    box-shadow: 0 0 0 2px rgba(6, 23, 45, 0.15);
}

.input-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #06172d;
    font-size: 13px;
}

.password-wrap input {
    padding-right: 50px;
}

.password-toggle {
    position: absolute;
    right: 13px;
    top: 50%;
    transform: translateY(-50%);
    border: none;
    background: transparent;
    cursor: pointer;
    font-size: 15px;
    color: #06172d;
    padding: 4px;
}

.form-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 10px;
    margin: 4px 0 16px;
}

.remember-me {
    display: flex;
    align-items: center;
    gap: 6px;
    color: #06172d;
    font-size: 12px;
}

.remember-me input {
    width: 14px;
    height: 14px;
    accent-color: #06172d;
}

.form-link {
    color: #06172d;
    text-decoration: none;
    font-size: 12px;
    font-weight: 700;
}

.btn-primary {
    width: 145px;
    height: 38px;
    border: none;
    background: #06172d;
    color: #ffffff;
    font-size: 14px;
    font-weight: 800;
    border-radius: 20px;
    cursor: pointer;
    display: block;
    margin: 8px auto 0;
    transition: 0.2s ease;
}

.btn-primary:hover {
    background: #ffffff;
    color: #06172d;
    border: 1px solid #06172d;
}

.bottom-text {
    text-align: center;
    color: #06172d;
    font-size: 12px;
    margin-top: 14px;
}

.bottom-text a {
    color: #06172d;
    text-decoration: none;
    font-weight: 800;
}

.bottom-bar {
    text-align: center;
    margin-top: 18px;
    color: #06172d;
    font-size: 11px;
}

.active::after {
    display: none !important;
}

@media (max-width: 600px) {
    .account-page {
        padding: 30px 14px;
    }

    .account-card {
        padding: 24px 18px 20px;
    }

    .account-tabs {
        gap: 6px;
    }

    .tab-btn {
        padding: 8px 13px;
        font-size: 12px;
    }
}
</style>

<title>Airport Parking | Login Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="assets/images/footer-logo.png">

<div class="account-page">
    <div class="account-card">

        <div class="account-tabs">
            <a href="[[~1]]" class="tab-btn">Home</a>
            <button class="tab-btn" data-tab="loginTab">Login</button>
            <button class="tab-btn" data-tab="registerTab">Register</button>
        </div>

        <div class="tab-panel" id="loginTab">
            <div class="panel-grid">
                <div class="left-side">
                    <img src="assets/images/login-illustration.png" alt="Login Illustration">
                </div>

                <div class="right-side">
                    <div class="form-title">Login to your account</div>
                    <div class="form-subtitle">Login to continue</div>

                    <div class="form-message">[[+loginMessage]]</div>

                    <form method="post" action="">
                        <div class="form-group">
                            <div class="input-wrap">
                                <span class="input-icon">👤</span>
                                <input type="email" name="login_email" value="[[+prefillEmail]]" placeholder="Enter your email" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap password-wrap">
                                <span class="input-icon">🔒</span>
                                <input type="password" name="login_password" id="login_password" placeholder="Enter your password" required>
                                <button type="button" class="password-toggle" data-target="login_password">👁</button>
                            </div>
                        </div>

                        <button type="submit" name="login_submit" class="btn-primary">Login</button>

                        <div class="bottom-text">
                            New User? <a href="#" class="switch-tab" data-target="registerTab">Sign Up</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="tab-panel" id="registerTab">
            <div class="panel-grid">
                <div class="left-side">
                    <img src="assets/images/login-illustration.png" alt="Register Illustration">
                </div>

                <div class="right-side">
                    <div class="form-title">Create Account</div>
                    <div class="form-subtitle">Register to continue</div>

                    <div class="form-message">[[+registerMessage]]</div>

                    <div class="booking-note">
                        Please register with the same email and phone number you used when making bookings with us.
                    </div>

                    <form method="post" action="">
                        <div class="form-group">
                            <div class="input-wrap">
                                <span class="input-icon">👤</span>
                                <input type="text" name="register_name" placeholder="Full name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap">
                                <span class="input-icon">✉</span>
                                <input type="email" name="register_email" value="[[+prefillEmail]]" placeholder="Email address" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap">
                                <span class="input-icon">📞</span>
                                <input type="text" name="register_phone" value="[[+prefillPhone]]" placeholder="Phone number" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap password-wrap">
                                <span class="input-icon">🔒</span>
                                <input type="password" name="register_password" id="register_password" placeholder="Password" required>
                                <button type="button" class="password-toggle" data-target="register_password">👁</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap password-wrap">
                                <span class="input-icon">🔒</span>
                                <input type="password" name="register_confirm_password" id="register_confirm_password" placeholder="Confirm password" required>
                                <button type="button" class="password-toggle" data-target="register_confirm_password">👁</button>
                            </div>
                        </div>

                        <button type="submit" name="register_submit" class="btn-primary">Sign Up</button>

                        <div class="bottom-text">
                            Already have an account? <a href="#" class="switch-tab" data-target="loginTab">Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="bottom-bar">
            <div>Designed and Developed by Explore Vacations. © <span id="currentYear"></span></div>
        </div>
    </div>
</div>

<script>
const activeTabFromModx = \'[[+activeTab]]\' || \'loginTab\';

const tabs = document.querySelectorAll(\'.tab-btn[data-tab]\');
const panels = document.querySelectorAll(\'.tab-panel\');

function openTab(tabId) {
    tabs.forEach(btn => btn.classList.remove(\'active\'));
    panels.forEach(panel => panel.classList.remove(\'active\'));

    document.querySelector(`.tab-btn[data-tab="${tabId}"]`)?.classList.add(\'active\');
    document.getElementById(tabId)?.classList.add(\'active\');
}

tabs.forEach(button => {
    button.addEventListener(\'click\', function () {
        openTab(this.dataset.tab);
    });
});

document.querySelectorAll(\'.switch-tab\').forEach(link => {
    link.addEventListener(\'click\', function (e) {
        e.preventDefault();
        openTab(this.dataset.target);
    });
});

document.querySelectorAll(\'.password-toggle\').forEach(button => {
    button.addEventListener(\'click\', function () {
        const targetId = this.dataset.target;
        const input = document.getElementById(targetId);

        if (!input) return;

        if (input.type === \'password\') {
            input.type = \'text\';
            this.textContent = \'🙈\';
        } else {
            input.type = \'password\';
            this.textContent = \'👁\';
        }
    });
});

openTab(activeTabFromModx);

document.getElementById(\'currentYear\').textContent = new Date().getFullYear();
</script>',
    'richtext' => 1,
    'template' => 0,
    'menuindex' => 5,
    'searchable' => 1,
    'cacheable' => 1,
    'createdby' => 1,
    'createdon' => 1776947685,
    'editedby' => 1,
    'editedon' => 1777290337,
    'deleted' => 0,
    'deletedon' => 0,
    'deletedby' => 0,
    'publishedon' => 1776947640,
    'publishedby' => 1,
    'menutitle' => '',
    'content_dispo' => 0,
    'hidemenu' => 0,
    'class_key' => 'MODX\\Revolution\\modDocument',
    'context_key' => 'web',
    'content_type' => 1,
    'uri' => 'my-account.html',
    'uri_override' => 0,
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'properties' => NULL,
    'alias_visible' => 1,
    '_content' => '[[!WebsiteCustomerAuth]]

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    overflow-x: hidden;
    background: #06172d;
}

.account-page {
    min-height: 100vh;
    width: 100%;
    background:
        linear-gradient(rgba(6, 23, 45, 0.45), rgba(6, 23, 45, 0.65)),
        url("https://i.pinimg.com/1200x/5e/92/33/5e9233e0a725f41ad938feb1bdf23864.jpg") center center / cover no-repeat;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px 16px;
}

.account-card {
    width: 490px;
    max-width: 100%;
    background: #ffffff;
    border-radius: 14px;
    padding: 28px 26px 22px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.45);
}

.account-tabs {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 22px;
}

.tab-btn {
    border: 1px solid #06172d;
    background: #ffffff;
    color: #06172d;
    padding: 8px 18px;
    border-radius: 20px;
    font-weight: 700;
    cursor: pointer;
    text-decoration: none;
    font-size: 13px;
}

.tab-btn.active,
.tab-btn:hover {
    background: #06172d;
    color: #ffffff;
}

.tab-panel {
    display: none;
}

.tab-panel.active {
    display: block;
}

.panel-grid {
    display: block;
}

.left-side {
    display: none;
}

.right-side {
    width: 100%;
}

.form-title {
    color: #06172d;
    font-size: 18px;
    font-weight: 800;
    text-transform: uppercase;
    margin-bottom: 6px;
}

.form-subtitle {
    color: #06172d;
    font-size: 13px;
    margin-bottom: 18px;
}

.form-message {
    background: #ffffff;
    border: 2px solid #f70606;
    color: #f90000;
    padding: 9px 10px;
    margin-bottom: 12px;
    font-size: 13px;
    border-radius: 6px;
}

.form-message:empty {
    display: none;
}

.booking-note {
    background: #ffffff;
    border: 2px solid #02922f;
    color: #02922f;
    padding: 9px 10px;
    margin-bottom: 12px;
    font-size: 12px;
    border-radius: 6px;
}

.form-group {
    margin-bottom: 12px;
}

.input-wrap {
    position: relative;
}

.input-wrap input {
    width: 100%;
    height: 38px;
    border: 1px solid #06172d;
    border-radius: 20px;
    padding: 0 42px;
    background: #ffffff;
    font-size: 13px;
    color: #06172d;
    outline: none;
}

.input-wrap input::placeholder {
    color: #06172d;
    opacity: 0.65;
}

.input-wrap input:focus {
    border-color: #06172d;
    box-shadow: 0 0 0 2px rgba(6, 23, 45, 0.15);
}

.input-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #06172d;
    font-size: 13px;
}

.password-wrap input {
    padding-right: 50px;
}

.password-toggle {
    position: absolute;
    right: 13px;
    top: 50%;
    transform: translateY(-50%);
    border: none;
    background: transparent;
    cursor: pointer;
    font-size: 15px;
    color: #06172d;
    padding: 4px;
}

.form-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 10px;
    margin: 4px 0 16px;
}

.remember-me {
    display: flex;
    align-items: center;
    gap: 6px;
    color: #06172d;
    font-size: 12px;
}

.remember-me input {
    width: 14px;
    height: 14px;
    accent-color: #06172d;
}

.form-link {
    color: #06172d;
    text-decoration: none;
    font-size: 12px;
    font-weight: 700;
}

.btn-primary {
    width: 145px;
    height: 38px;
    border: none;
    background: #06172d;
    color: #ffffff;
    font-size: 14px;
    font-weight: 800;
    border-radius: 20px;
    cursor: pointer;
    display: block;
    margin: 8px auto 0;
    transition: 0.2s ease;
}

.btn-primary:hover {
    background: #ffffff;
    color: #06172d;
    border: 1px solid #06172d;
}

.bottom-text {
    text-align: center;
    color: #06172d;
    font-size: 12px;
    margin-top: 14px;
}

.bottom-text a {
    color: #06172d;
    text-decoration: none;
    font-weight: 800;
}

.bottom-bar {
    text-align: center;
    margin-top: 18px;
    color: #06172d;
    font-size: 11px;
}

.active::after {
    display: none !important;
}

@media (max-width: 600px) {
    .account-page {
        padding: 30px 14px;
    }

    .account-card {
        padding: 24px 18px 20px;
    }

    .account-tabs {
        gap: 6px;
    }

    .tab-btn {
        padding: 8px 13px;
        font-size: 12px;
    }
}
</style>

<title>Airport Parking | Login Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="assets/images/footer-logo.png">

<div class="account-page">
    <div class="account-card">

        <div class="account-tabs">
            <a href="index.php?id=1" class="tab-btn">Home</a>
            <button class="tab-btn" data-tab="loginTab">Login</button>
            <button class="tab-btn" data-tab="registerTab">Register</button>
        </div>

        <div class="tab-panel" id="loginTab">
            <div class="panel-grid">
                <div class="left-side">
                    <img src="assets/images/login-illustration.png" alt="Login Illustration">
                </div>

                <div class="right-side">
                    <div class="form-title">Login to your account</div>
                    <div class="form-subtitle">Login to continue</div>

                    <div class="form-message">[[+loginMessage]]</div>

                    <form method="post" action="">
                        <div class="form-group">
                            <div class="input-wrap">
                                <span class="input-icon">👤</span>
                                <input type="email" name="login_email" value="[[+prefillEmail]]" placeholder="Enter your email" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap password-wrap">
                                <span class="input-icon">🔒</span>
                                <input type="password" name="login_password" id="login_password" placeholder="Enter your password" required>
                                <button type="button" class="password-toggle" data-target="login_password">👁</button>
                            </div>
                        </div>

                        <button type="submit" name="login_submit" class="btn-primary">Login</button>

                        <div class="bottom-text">
                            New User? <a href="#" class="switch-tab" data-target="registerTab">Sign Up</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="tab-panel" id="registerTab">
            <div class="panel-grid">
                <div class="left-side">
                    <img src="assets/images/login-illustration.png" alt="Register Illustration">
                </div>

                <div class="right-side">
                    <div class="form-title">Create Account</div>
                    <div class="form-subtitle">Register to continue</div>

                    <div class="form-message">[[+registerMessage]]</div>

                    <div class="booking-note">
                        Please register with the same email and phone number you used when making bookings with us.
                    </div>

                    <form method="post" action="">
                        <div class="form-group">
                            <div class="input-wrap">
                                <span class="input-icon">👤</span>
                                <input type="text" name="register_name" placeholder="Full name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap">
                                <span class="input-icon">✉</span>
                                <input type="email" name="register_email" value="[[+prefillEmail]]" placeholder="Email address" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap">
                                <span class="input-icon">📞</span>
                                <input type="text" name="register_phone" value="[[+prefillPhone]]" placeholder="Phone number" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap password-wrap">
                                <span class="input-icon">🔒</span>
                                <input type="password" name="register_password" id="register_password" placeholder="Password" required>
                                <button type="button" class="password-toggle" data-target="register_password">👁</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-wrap password-wrap">
                                <span class="input-icon">🔒</span>
                                <input type="password" name="register_confirm_password" id="register_confirm_password" placeholder="Confirm password" required>
                                <button type="button" class="password-toggle" data-target="register_confirm_password">👁</button>
                            </div>
                        </div>

                        <button type="submit" name="register_submit" class="btn-primary">Sign Up</button>

                        <div class="bottom-text">
                            Already have an account? <a href="#" class="switch-tab" data-target="loginTab">Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="bottom-bar">
            <div>Designed and Developed by Explore Vacations. © <span id="currentYear"></span></div>
        </div>
    </div>
</div>

<script>
const activeTabFromModx = \'[[+activeTab]]\' || \'loginTab\';

const tabs = document.querySelectorAll(\'.tab-btn[data-tab]\');
const panels = document.querySelectorAll(\'.tab-panel\');

function openTab(tabId) {
    tabs.forEach(btn => btn.classList.remove(\'active\'));
    panels.forEach(panel => panel.classList.remove(\'active\'));

    document.querySelector(`.tab-btn[data-tab="${tabId}"]`)?.classList.add(\'active\');
    document.getElementById(tabId)?.classList.add(\'active\');
}

tabs.forEach(button => {
    button.addEventListener(\'click\', function () {
        openTab(this.dataset.tab);
    });
});

document.querySelectorAll(\'.switch-tab\').forEach(link => {
    link.addEventListener(\'click\', function (e) {
        e.preventDefault();
        openTab(this.dataset.target);
    });
});

document.querySelectorAll(\'.password-toggle\').forEach(button => {
    button.addEventListener(\'click\', function () {
        const targetId = this.dataset.target;
        const input = document.getElementById(targetId);

        if (!input) return;

        if (input.type === \'password\') {
            input.type = \'text\';
            this.textContent = \'🙈\';
        } else {
            input.type = \'password\';
            this.textContent = \'👁\';
        }
    });
});

openTab(activeTabFromModx);

document.getElementById(\'currentYear\').textContent = new Date().getFullYear();
</script>',
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
  'elementCache' => 
  array (
    '[[~1]]' => 'index.php?id=1',
  ),
  'sourceCache' => 
  array (
    'MODX\\Revolution\\modChunk' => 
    array (
    ),
    'MODX\\Revolution\\modSnippet' => 
    array (
      'WebsiteCustomerAuth' => 
      array (
        'fields' => 
        array (
          'id' => 2,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'WebsiteCustomerAuth',
          'description' => '',
          'editor_type' => 0,
          'category' => 0,
          'cache_type' => 0,
          'snippet' => 'if (session_status() === PHP_SESSION_NONE) {
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

return \'\';',
          'locked' => false,
          'properties' => 
          array (
          ),
          'moduleguid' => '',
          'static' => false,
          'static_file' => '',
          'content' => 'if (session_status() === PHP_SESSION_NONE) {
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

return \'\';',
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