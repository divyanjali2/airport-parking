<?php
$host = "localhost";
$user = "explore";
$pass = "k4p00Xy&9";
$db = "explores_";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    echo "Database connection failed: " . $conn->connect_error;
    exit;
}

echo "Database connection successful!";
echo "\nDatabase: " . $db;

$conn->close();
// $host = "localhost";
// $user = "root";
// $pass = "";
// $db = "explores_";

// $conn = new mysqli($host, $user, $pass, $db);

// if ($conn->connect_error) {
//     die("DB Connection failed: " . $conn->connect_error);
// }
