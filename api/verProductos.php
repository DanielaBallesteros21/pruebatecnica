<?php
header('Content-Type: application/json');

require 'db_connection.php';

try {
    if (isset($_GET['id'])) {
        $id = $_GET['id'];

        $stmt = $pdo->prepare('SELECT id, nombre, tipo, cantidad, valor_unitario FROM productos WHERE id = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    } else {
        $stmt = $pdo->prepare('SELECT id, nombre, tipo, cantidad, valor_unitario FROM productos');
    }

    $stmt->execute();

    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($resultados);

} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
