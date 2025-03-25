<?php
include('./conex.php');
$conexion = mysqli_connect($host, $user, $passwd);
$db ="biblioteca2_ga";


$crear_bd_ga = ' CREATE  DATABASE IF NOT EXISTS biblioteca2_ga CHARSET  = utf8 COLLATE utf8_spanish2_ci';

if (mysqli_query($conexion, $crear_bd_ga)){
 mysqli_select_db($conexion, $db) or die ("no se pudo establecer la conexion con la bd");
     echo ('<h1 class="pintarS"> La BD fue creada  </h1>');
 } else {
     echo ('<h1 class="pintarE"> Error al crear la BD  </h1>');

 };


$crear_roles_ga =' CREATE TABLE tbl_roles_ga (
    `id_rol_ga` INT NOT NULL AUTO_INCREMENT,
    `rol_ga` VARCHAR(8) NOT NULL,

PRIMARY KEY (`id_rol_ga`)
)ENGINE = InnoDB  ';

if (mysqli_query($conexion, $crear_roles_ga)){
    echo ('<h1 class="pintarS"> La tabla roles  fue creada  </h1>');
} else {
    echo ('<h1 class="pintarE"> Error al crear la tabla roles   </h1>');
    
};

$crear_usuarios_ga =' CREATE TABLE tbl_usuarios_ga (
            `id_usuario_ga` INT NOT NULL AUTO_INCREMENT,
            `nick_ga` VARCHAR(8) NOT NULL,
            `clave_ga` INT(4) NOT NULL,
            `id_rol_usuarios` INT NOT NULL,
PRIMARY KEY (`id_usuario_ga`),
FOREIGN KEY (`id_rol_usuarios`) REFERENCES  tbl_roles_ga(`id_rol_ga`)
)ENGINE = InnoDB ';

if (mysqli_query($conexion, $crear_usuarios_ga)){
echo ('<h1 class="pintarS"> La tabla usuarios  fue creada  </h1>');
} else {
    echo ('<h1 class="pintarE"> Error al crear la tabla usuarios   </h1>');
    
};
//INSERTAR DATOS
$query_insertar_roles_ga = " INSERT INTO tbl_roles_ga (rol_ga) values('Profesor'),('Alumno'); ";
if (mysqli_query($conexion,$query_insertar_roles_ga)){
    echo("<h2>Los roles han sido insertado</h2>");

} else {
    echo ("<h2>no se insertaron roles</h2>");
}     

$query_insertar_alumnos_ga = " INSERT INTO tbl_usuarios_ga (nick_ga, clave_ga, id_rol_usuarios) VALUES ('Senpai', 2539, 1),('Guillem', 0369 ,2) ";

if (mysqli_query($conexion,$query_insertar_alumnos_ga)){
echo("<h2>Los alumnos han sido insertado</h2>");

} else {
echo ("<h2>no se insertaron alumnos</h2>");
}     
echo("<a href='./supr.php'>Aqui se borra la bd</a>");