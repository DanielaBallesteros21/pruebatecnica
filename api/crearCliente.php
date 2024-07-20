<?php
// crearCliente.php

header('Content-Type: application/json');

// Incluir el archivo de conexión
require 'db_connection.php';

// Verificar si se recibió una solicitud POST con los datos necesarios
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $documento = $_POST['documento'] ?? '';
    $nombres = $_POST['nombres'] ?? '';
    $apellidos = $_POST['apellidos'] ?? '';

    // Validar que todos los campos sean proporcionados
    if (!empty($documento) && !empty($nombres) && !empty($apellidos)) {
        try {
            // Preparar y ejecutar la consulta de inserción
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
    } else {
        echo json_encode(['success' => false, 'message' => 'Todos los campos son obligatorios.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método no permitido.']);
}
?>
