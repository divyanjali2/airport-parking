<?php
    session_start();
    require_once __DIR__ . '/db_connect.php';
    header('Content-Type: application/json');

    try {
        foreach (['category','name','price','expense_date'] as $f) {
            if (empty($_POST[$f])) throw new Exception("Missing field: $f");
        }

        // Insert into DB
        $stmt = $conn->prepare(
            "INSERT INTO expenses (category, name, price, expense_date, remarks)
            VALUES (:category, :name, :price, :date, :remarks)"
        );

        $stmt->execute([
            ':category' => $_POST['category'],
            ':name'     => $_POST['name'],
            ':price'    => $_POST['price'],
            ':date'     => $_POST['expense_date'],
            ':remarks'  => $_POST['remarks'] ?? null
        ]);

        echo json_encode(['success' => true]);

    } catch (Throwable $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => $e->getMessage()
        ]);
    }
