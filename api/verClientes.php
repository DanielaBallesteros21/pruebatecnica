<?php
header('Content-Type: application/json');

require 'db_connection.php';

try {
    if (isset($_GET['documento'])) {
        $documento = $_GET['documento'];

        $stmt = $pdo->prepare('SELECT documento, nombres, apellidos FROM clientes WHERE documento = :documento');
        $stmt->bindParam(':documento', $documento);
    } else {
        $stmt = $pdo->prepare('SELECT documento, nombres, apellidos FROM clientes');
    }

    $stmt->execute();

    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($resultados);

} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
