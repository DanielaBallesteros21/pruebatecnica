<?php
header('Content-Type: application/json');

require 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $documento = $_GET['documento'] ?? '';

    if (!empty($documento)) {
        try {
            $stmt = $pdo->prepare('DELETE FROM clientes WHERE documento = :documento');
            $stmt->bindParam(':documento', $documento, PDO::PARAM_STR);

            if ($stmt->execute()) {
                if ($stmt->rowCount() > 0) {
                    echo json_encode(['success' => true, 'message' => 'Cliente eliminado exitosamente.']);
                } else {
                    echo json_encode(['success' => false, 'message' => 'Cliente no encontrado.']);
                }
            } else {
                echo json_encode(['success' => false, 'message' => 'Error al eliminar el cliente.']);
            }
        } catch (PDOException $e) {
            echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Falta el parámetro de documento.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Método no permitido.']);
}
?>
