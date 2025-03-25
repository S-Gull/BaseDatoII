<?php
include('./conex.php');
$conexion = mysqli_connect($host, $user, $passwd);

// Nombre de la base de datos
$db = "db_centro_cita_ga";

// Querys de la base de datos
$crear_bd_ga = 'CREATE DATABASE IF NOT EXISTS ' . $db . ' CHARACTER SET utf8 COLLATE utf8_spanish2_ci';


$crear_pacientes_ga = '
CREATE TABLE IF NOT EXISTS tbl_pacientes_ga (
    id_paciente_ga INT NOT NULL AUTO_INCREMENT,
    nombre_ga VARCHAR(12) NOT NULL,
    apellido_ga VARCHAR(12) NOT NULL,
    fecha_nacimiento_ga DATE NOT NULL,
    direccion_ga TEXT NOT NULL,
    telefono_ga VARCHAR(12) NOT NULL,
    correo_ga VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_paciente_ga)
    ) ENGINE = INNODB;';


    $crear_medicos_ga = '
CREATE TABLE IF NOT EXISTS tbl_medicos_ga (
    id_medico_ga INT NOT NULL AUTO_INCREMENT,
    nombre_ga VARCHAR(12) NOT NULL,
    apellido_ga VARCHAR(12) NOT NULL,
    especialidad_ga VARCHAR(20) NOT NULL,
    telefono_ga VARCHAR(12) NOT NULL,
    correo_ga VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_medico_ga)
    ) ENGINE = INNODB;';

    
    $crear_citas_ga = '
    CREATE TABLE IF NOT EXISTS tbl_citas_ga (
    id_cita_ga INT NOT NULL AUTO_INCREMENT,
    fecha_ga DATE NOT NULL,
    hora_ga TIME NOT NULL,
    id_paciente_citas INT NOT NULL,
    id_medico_citas INT NOT NULL,
    PRIMARY KEY(id_cita_ga),
    FOREIGN KEY(id_paciente_citas) REFERENCES tbl_pacientes_ga(id_paciente_ga),
    FOREIGN KEY(id_medico_citas) REFERENCES tbl_medicos_ga(id_medico_ga)
    ) ENGINE = INNODB;';
    
    
    $crear_historiales_ga = '
    CREATE TABLE IF NOT EXISTS tbl_historiales_medicos_ga (
        id_historial_medico_ga INT NOT NULL AUTO_INCREMENT,
        descripcion_ga TEXT NOT NULL,
        fecha_ga DATE NOT NULL,
        id_paciente_historiales INT NOT NULL,
    id_medico_historiales INT NOT NULL,
    PRIMARY KEY(id_historial_medico_ga),
    FOREIGN KEY(id_paciente_historiales) REFERENCES tbl_pacientes_ga(id_paciente_ga),
    FOREIGN KEY(id_medico_historiales) REFERENCES tbl_medicos_ga(id_medico_ga)
    ) ENGINE = INNODB;';
    
    
    $crear_recetas_ga = '
    CREATE TABLE IF NOT EXISTS tbl_recetas_ga (
        id_receta_ga INT NOT NULL AUTO_INCREMENT,
        medicamento_ga VARCHAR(20) NOT NULL,
        dosis_ga TEXT NOT NULL,
        id_cita_recetas INT NOT NULL,
        PRIMARY KEY(id_receta_ga),
    FOREIGN KEY(id_cita_recetas) REFERENCES tbl_citas_ga(id_cita_ga)
    ) ENGINE = INNODB;';
    
    
    $crear_diagnosticos_ga = '
CREATE TABLE IF NOT EXISTS tbl_diagnosticos_ga (
    id_diagnostico_ga INT NOT NULL AUTO_INCREMENT,
    descripcion_ga TEXT NOT NULL,
    id_cita_diagnosticos INT NOT NULL,
    PRIMARY KEY(id_diagnostico_ga),
    FOREIGN KEY(id_cita_diagnosticos) REFERENCES tbl_citas_ga(id_cita_ga)
    ) ENGINE = INNODB;';
    
// Ejecucion de los query

if (mysqli_query($conexion, $crear_bd_ga)) {
    mysqli_select_db($conexion, $db) or die("No se pudo establecer la conexión con la base de datos");
    echo ('<h1 class="pintarS">La base de datos fue creada correctamente.</h1>');
} else {
    echo ('<h1 class="pintarE">Error al crear la base de datos.</h1>');
}
    
if (mysqli_query($conexion, $crear_pacientes_ga)) {
    echo ('<h1 class="pintarS">La tabla de pacientes fue creada correctamente.</h1>');
} else {
    echo ('<h1 class="pintarE">Error al crear la tabla de pacientes.</h1>');
}
    
if (mysqli_query($conexion, $crear_medicos_ga)) {
    echo ('<h1 class="pintarS">La tabla de médicos fue creada correctamente.</h1>');
} else {
    echo ('<h1 class="pintarE">Error al crear la tabla de médicos.</h1>');
}
    
if (mysqli_query($conexion, $crear_citas_ga)) {
    echo ('<h1 class="pintarS">La tabla de citas fue creada correctamente.</h1>');
} else {
    echo ('<h1 class="pintarE">Error al crear la tabla de citas.</h1>');
}
    
if (mysqli_query($conexion, $crear_historiales_ga)) {
    echo ('<h1 class="pintarS">La tabla de historiales médicos fue creada correctamente.</h1>');
} else {
    echo ('<h1 class="pintarE">Error al crear la tabla de historiales médicos.</h1>');
}

if (mysqli_query($conexion, $crear_recetas_ga)) {
    echo ('<h1 class="pintarS">La tabla de recetas fue creada correctamente.</h1>');
} else {
    echo ('<h1 class="pintarE">Error al crear la tabla de recetas.</h1>');
}
if (mysqli_query($conexion, $crear_diagnosticos_ga)) {
    echo ('<h1 class="pintarS">La tabla de diagnósticos fue creada correctamente.</h1>');
} else {
    echo ('<h1 class="pintarE">Error al crear la tabla de diagnósticos.</h1>');
}
echo("<a href='./supr.php'>Aqui se borra la bd</a>");
