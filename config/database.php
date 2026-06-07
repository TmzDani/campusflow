<?php

$host = "localhost";
$banco = "campusflow";
$usuario = "root";
$senha = "";

try {

    $pdo = new PDO(
        "mysql:host=$host;dbname=$banco;charset=utf8",
        $usuario,
        $senha
    );

    echo "Conexão realizada com sucesso";

} catch (PDOException $e) {

    echo "Erro: " . $e->getMessage();

}