<?php
include('./conex.php');
$conexion = mysqli_connect($host, $user, $passwd);
$db ="biblioteca2_ga";

if ($conexion->connect_error) die ("Error de conexion ". $conexion->connect_error);

$query_eliminar_bd = " DROP DATABASE " . $db;
if($conexion->query($query_eliminar_bd) === true) {
    echo "La base de datos se elimino correctamente";
} else echo "Error al eliminar la base de datos" . $conexion->error;
$conexion->close();

echo("<a href='./crear.php'>Aqui se crea la bd</a>");

?>