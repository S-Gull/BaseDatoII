DROP DATABASE empresa2_ga;

CREATE DATABASE empresa2_ga
CHARACTER SET utf8mb3 
COLLATE utf8mb3_spanish2_ci;
 
SELECT '✅ Base de datos creada';


USE empresa2_ga;

CREATE TABLE tbl_usuarios_ga (
    id_usuario_ga INT(11) NOT NULL AUTO_INCREMENT,
    usuario_ga VARCHAR(15) NOT NULL,
    clave_ga VARCHAR(60) NOT NULL,
    rol_ga  ENUM('Admin', 'Usuario'),
    PRIMARY KEY (id_usuario_ga)
) ENGINE = INNODB;

SELECT '✅ Tabla usuarios creada';

CREATE TABLE tbl_cargos_ga (
    id_cargo_ga INT(11) NOT NULL AUTO_INCREMENT,
    nombre_ga VARCHAR(50) NOT NULL,
    sueldo_ga FLOAT NOT NULL,
    PRIMARY KEY (id_cargo_ga)
) ENGINE = INNODB;

SELECT '✅ Tabla cargos creada';

CREATE TABLE tbl_sucursales_ga (
    id_sucursal_ga  INT(11)  NOT NULL AUTO_INCREMENT,
    ciudad_ga  TEXT NOT NULL,
    direccion_ga  VARCHAR(100) NOT NULL,
    telefono_ga  VARCHAR(100) NOT NULL, 
    PRIMARY KEY (id_sucursal_ga)
) ENGINE = INNODB;

SELECT '✅ Tabla sucursales creada';

CREATE TABLE tbl_empleados_ga (
    id_empleado_ga INT(15) NOT NULL AUTO_INCREMENT,
    id_usuario_empleados INT(11) NOT NULL,
    id_cargo_empleados INT(11) NOT NULL,
    id_sucursal_empleados INT(11) NOT NULL,
    nombre_ga VARCHAR(59),
    fechahgreso_ga DATE,
    correo_ga VARCHAR(50),
    genero_ga ENUM('Femenino', 'Masculino'),
    estado_ga ENUM('0','1'),
    codigo_empleado VARCHAR(50) GENERATED ALWAYS AS (CONCAT(id_usuario_empleados, '0', id_cargo_empleados, '0', id_sucursal_empleados, '0', estado_ga)) STORED,
    PRIMARY KEY (id_empleado_ga),
    FOREIGN KEY (id_usuario_empleados) REFERENCES tbl_usuarios_ga(id_usuario_ga),
    FOREIGN KEY (id_cargo_empleados) REFERENCES tbl_cargos_ga(id_cargo_ga),
    FOREIGN KEY (id_sucursal_empleados) REFERENCES tbl_sucursales_ga(id_sucursal_ga)
    
) ENGINE = INNODB;


SELECT '✅ Tabla empleados creada';

SOURCE ./InsertarDatos.sql

