<?php
// Define website settings
define('WEBSITE_NAME', 'Airport Parking');
define('WEBSITE_DESCRIPTION','Airport Parking provides secure, affordable, and convenient parking solutions near the airport. Reserve your parking slot in advance, enjoy 24/7 security, optional vehicle services, and reliable shuttle transfers for a stress-free travel experience.');
define('WEBSITE_KEYWORDS','airport parking, secure airport parking, long term parking, short term parking, airport car park, reserve parking slot, airport shuttle service, vehicle parking near airport, airport parking Sri Lanka');

// Define email Configuration
define('MAIL_MAILER', 'smtp');
define('SMTP_HOST', 'smtp.gmail.com');
define('SMTP_USERNAME', 'navodyadivyanjali2@gmail.com');
define('SMTP_PASSWORD', 'hmdn xouu ecxf vait');
define('SMTP_PORT', 587);
define('SMTP_FROM_EMAIL', 'navodyadivyanjali2@gmail.com');
define('MAIL_ENCRYPTION', 'tls');
define('SMTP_FROM_NAME', 'Airport Parking');

// Timezone
date_default_timezone_set('Asia/Colombo');
// Maximum allowed file size (in bytes)
define('MAX_FILE_SIZE', 3 * 1024 * 1024); // 3MB

//user input validation function
function test_input($data){
    $data = trim($data);
    $data = stripcslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
