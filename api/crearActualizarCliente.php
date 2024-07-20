<?php

header('Content-Type: application/json');

require 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $documento = $_POST['documento'] ?? '';
    $nombres = $_POST['nombres'] ?? '';
    $apellidos = $_POST['apellidos'] ?? '';

    if (!empty($documento) && !empty($nombres) && !empty($apellidos)) {
        if (isset($_GET['documento'])) {
            $documento = $_GET['documento'];
            
            try {
                $stmt = $pdo->prepare('UPDATE clientes SET nombres = :nombres, apellidos = :apellidos WHERE documento = :documento');
                $stmt->bindParam(':documento', $documento, PDO::PARAM_STR);
                $stmt->bindParam(':nombres', $nombres, PDO::PARAM_STR);
                $stmt->bindParam(':apellidos', $apellidos, PDO::PARAM_STR);
                
                if ($stmt->execute()) {
                    echo json_encode(['success' => true, 'message' => 'Cliente actualizado exitosamente.']);
                } else {
                    echo json_encode(['success' => false, 'message' => 'Error al actualizar el cliente.']);
                }
            } catch (PDOException $e) {
                echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
            }
        } else {
            try {
                $stmt = $pdo->prepare('INSERT INTO clientes (documento, nombres, apellidos) VALUES (:documento, :nombres, :apellidos)');
                $stmt->bindParam(':documento', $documento, PDO::PARAM_STR);
                $stmt->bindParam(':nombres', $nombres, PDO::PARAM_STR);
                $stmt->bindParam(':apellidos', $apellidos, PDO::PARAM_STR);
                
                if ($stmt->execute()) {
                    echo json_encode(['success' => true, 'message' => 'Cliente creado exitosamente.']);
                } else {
                    echo json_encode(['success' => false, 'message' => 'Error al crear el cliente.']);
                }
            } catch (PDOException $e) {
                echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
            }
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Todos los campos son obligatorios.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método no permitido.']);
}
?>
