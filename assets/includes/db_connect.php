<?php
    $host = "localhost";      
    $db_name = "airport--parking"; 
    $username = "root";       
    $password = "";       
    $port = 3307;   

    try {
        $conn = new PDO("mysql:host=$host;dbname=$db_name;port=$port;charset=utf8", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // echo "Database connected successfully!";
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        exit;
    }
?>