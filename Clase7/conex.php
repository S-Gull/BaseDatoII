<?php
#Crear BaseDeDatos
$database_GA = "Agenda_GA.db";
$conex_GA = new SQLite3($database_GA);
if (!$conex_GA) die ("Error al conectar con la base de datos");
echo    "BD creada\n";
// Crear Tabla

$creacion_tbl_contactos = "CREATE TABLE IF NOT EXISTS tbl_contactos_ga(
    id_contacto_ga INTEGER PRIMARY KEY AUTOINCREMENT,
    cedula_ga INTEGER NOT NULL,
    nombre_ga TEXT NOT NULL,
    apellido_ga TEXT NOT NULL,
    telefono_ga TEXT NOT NULL,
    correo_ga TEXT NOT NULL
)";

$conex_GA -> exec($creacion_tbl_contactos);
echo    "tbl creada contactos\n";

$creacion_tbl_datos = "CREATE TABLE IF NOT EXISTS tbl_datos_ga (
    id_dato_ga INTEGER PRIMARY KEY AUTOINCREMENT,
    id_contacto_datos INTEGER,
    peso_ga REAL NOT NULL,
    altura_ga REAL NOT NULL,
    afinidad_ga TEXT NOT NULL,
    cumpleaños_ga TEXT NOT NULL,
    correo_ga TEXT NOT NULL,
    FOREIGN KEY (id_contacto_datos) REFERENCES tbl_contactos_ga(id_contacto_ga)
)";


$conex_GA -> exec($creacion_tbl_datos);
echo    "tbl creada datos\n";

//funciones crud

function InsertContactos_GA($cedula, $nombre, $apellido, $telefono, $correo){
    global $conex_GA;
    $state_ga = $conex_GA -> prepare("INSERT INTO  tbl_contactos_ga (cedula_ga, nombre_ga, apellido_ga, telefono_ga, correo_ga) VALUES (
    :cedula_ga,
    :nombre_ga,
    :apellido_ga,
    :telefono_ga,
    :correo_ga)");
    $state_ga -> bindValue(':cedula_ga', $cedula, SQLITE3_FLOAT);
    $state_ga -> bindValue(':nombre_ga', $nombre, SQLITE3_TEXT);
    $state_ga -> bindValue(':apellido_ga', $apellido, SQLITE3_TEXT);
    $state_ga -> bindValue(':telefono_ga', $telefono, SQLITE3_TEXT);
    $state_ga -> bindValue(':correo_ga', $correo, SQLITE3_TEXT);

    $result_ga = $state_ga -> execute();
    return $result_ga;
};

function ObtenerContacto_GA ($cedula) {
    global $conex_GA;
    $state = $conex_GA -> prepare('SELECT * FROM tbl_contactos_ga WHERE cedula_ga LIKE :cedula');
    $state -> bindValue(':cedula',$cedula, SQLITE3_INTEGER);
    $result = $state -> execute();
    $contacto = $result -> fetchArray(SQLITE3_ASSOC);
    return $contacto;
}function ActualizarContacto_GA ($id_contacto, $cedula, $nombre, $apellido, $telefono, $correo) {
    global $conex_GA;
    $state_ga = $conex_GA -> prepare("UPDATE  tbl_contactos_ga SET cedula_ga = :cedula_ga, nombre_ga = :nombre_ga, apellido_ga = :apellido_ga, telefono_ga = :telefono_ga, correo_ga = :correo_ga WHERE id_contacto_ga = :id_contacto_ga");
        $state_ga -> bindValue(':id_contacto_ga', $id_contacto, SQLITE3_INTEGER);
        $state_ga -> bindValue(':cedula_ga', $cedula, SQLITE3_INTEGER);
        $state_ga -> bindValue(':nombre_ga', $nombre, SQLITE3_TEXT);
        $state_ga -> bindValue(':apellido_ga', $apellido, SQLITE3_TEXT);
        $state_ga -> bindValue(':telefono_ga', $telefono, SQLITE3_TEXT);
        $state_ga -> bindValue(':correo_ga', $correo, SQLITE3_TEXT);
    
        $result_ga = $state_ga -> execute();
        return $result_ga; 
}
function BorrarrContacto_GA ($cedula) {
    global $conex_GA;
    $state = $conex_GA -> prepare(' DELETE FROM tbl_contactos_ga WHERE cedula_ga LIKE :cedula');
    $state -> bindValue(':cedula',$cedula, SQLITE3_INTEGER);
    $result = $state -> execute();
    $contacto = $result -> fetchArray(SQLITE3_ASSOC);
    return $contacto;

}

// USO DE FUNCIONES




//INSERTAR CONTACTO
$nuevoContacto_GA = InsertContactos_GA(30165318,'Guillermo','Alvarez','04242875397','guillermoalejandro0906@gmail.con');
$nuevoContacto2_GA = InsertContactos_GA(30520132,'Victor','UNE','04242875307','vector@gmail.con');

$buscarGuillem_insert  = obtenerContacto_GA(30165318);
$buscarVictor_insert  = obtenerContacto_GA(30520132);

$actualizarContacto_GA = ActualizarContacto_GA(1,30165318,'Guillermo','Alvarez','04242875397','guillermo090603@gmail.com');

$buscarGuillermo_update  = obtenerContacto_GA(30165318);


$borrarContacto  = BorrarrContacto_GA(30165318);
$buscarGuillem_delete  = obtenerContacto_GA(30165318);


















if ($nuevoContacto2_GA) echo "Se creo el nuevo contacto Victor \n";

if(!empty($buscarVictor_insert))
print_r($buscarVictor_insert);
 else echo ("No existe Victor \n");

if ($nuevoContacto_GA) echo "Se creo el nuevo contacto Guillermo \n";


if(!empty($buscarGuillem_insert))
print_r($buscarGuillem_insert);
 else echo ("No existe Guillermo ");


 if ($actualizarContacto_GA) echo  "Se actualizo el contacto \n";
if(!empty($buscarGuillermo_update))
print_r($buscarGuillermo_update);
 else echo ("No existe");

 if ($borrarContacto);
if(!empty($buscarGuillem_delete))
print_r($buscarGuillem_delete);
 else echo ("El contacto se elimino ");
  
$conex_GA->close();