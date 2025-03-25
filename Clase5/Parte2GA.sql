
SHOW DATABASES;

CREATE DATABASE empresa_ga;

USE empresa_ga;

CREATE TABLE tbl_departamentos_ga(
    id_departamento_ga INT NOT NULL AUTO_INCREMENT,
    nombre_ga VARCHAR(80) NOT NULl,
    PRIMARY KEY(id_departamento_ga)
) ENGINE = INNODB;

CREATE TABLE tbl_empleados_ga(
    id_empleado_ga INT NOT NULL AUTO_INCREMENT,
    id_departamento_empleados INT NOT NULL,
    primer_nombre_ga VARCHAR(12) NOT NULL,
    segundo_nombre_ga VARCHAR(12) NOT NULL,
    primer_apellido_ga VARCHAR(12) NOT NULL,
    segundo_apellido_ga VARCHAR(12) NOT NULL,
     nombre_completo VARCHAR(50) GENERATED ALWAYS AS (CONCAT(primer_nombre_ga, ' ', segundo_nombre_ga, ' ', primer_apellido_ga, ' ', segundo_apellido_ga)) STORED,
    fecha_nacimiento_ga DATE NOT NULL,
    fecha_registro_ga DATE NOT NULL,
    FOREIGN KEY(id_departamento_empleados) REFERENCES tbl_departamentos_ga(id_departamento_ga),
    PRIMARY KEY(id_empleado_ga)
)ENGINE = INNODB;

CREATE TABLE tbl_accesos_ga(
    id_acceso_ga INT NOT NULL AUTO_INCREMENT,
    id_empleado_accesos INT NOT NULL,
    usuario_ga VARCHAR(8) NOT NULL,
    clave_ga VARCHAR(8) NOT NULL,
    PRIMARY KEY(id_acceso_ga),
    FOREIGN KEY(id_empleado_accesos) REFERENCES tbl_empleados_ga(id_empleado_ga)
)ENGINE = INNODB;

INSERT INTO tbl_departamentos_ga (nombre_ga) VALUES 
('Recursos Humanos'),
('Tecnología'),
('Ventas'),
('Finanzas');
SELECT * from tbl_departamentos_ga;

INSERT INTO tbl_empleados_ga (id_departamento_empleados, primer_nombre_ga, segundo_nombre_ga, primer_apellido_ga, segundo_apellido_ga, fecha_nacimiento_ga, fecha_registro_ga) VALUES
(1, 'Juan', 'Carlos', 'Pérez', 'Gómez', '1990-05-15', CURDATE()),
(2, 'Ana', 'María', 'Rodríguez', 'López', '1985-08-22', CURDATE()),
(3, 'Luis', 'Fernando', 'García', 'Díaz', '1992-11-10', CURDATE()),
(4, 'Marta', 'Isabel', 'Fernández', 'Ruiz', '1988-03-25', CURDATE());
SELECT * from tbl_empleados_ga;

INSERT INTO tbl_accesos_ga (id_empleado_accesos, usuario_ga, clave_ga) VALUES
(1, 'juan123', 'pass1234'),
(2, 'ana456', 'clave456'),
(3, 'luis789', 'seguro12'),
(4, 'marta55', 'admin987');
SELECT * from tbl_accesos_ga;

SELECT /* * */ accesos.id_acceso_ga, accesos.usuario_ga, accesos.clave_ga, empleados.nombre_completo FROM tbl_accesos_ga accesos
JOIN tbl_empleados_ga empleados
ON empleados.id_empleado_ga = accesos.id_empleado_accesos;

DELIMITER //

CREATE TRIGGER after_insert_empleado
AFTER INSERT ON tbl_empleados_ga
FOR EACH ROW
BEGIN
    INSERT INTO tbl_accesos_ga (id_empleado_accesos, usuario_ga, clave_ga)
    VALUES (NEW.id_empleado_ga, CONCAT(NEW.primer_nombre_ga, NEW.id_empleado_ga), CONCAT(NEW.primer_nombre_ga, NEW.id_empleado_ga));
END//

DELIMITER ;


INSERT INTO tbl_empleados_ga (id_departamento_empleados, primer_nombre_ga, segundo_nombre_ga, primer_apellido_ga, segundo_apellido_ga, fecha_nacimiento_ga, fecha_registro_ga) VALUES
(3, 'Guillem', 'Alejandro', 'Alvarez', 'Sanchez', '2003-06-09', CURDATE());

SELECT /* * */ accesos.id_acceso_ga, accesos.usuario_ga, accesos.clave_ga, empleados.nombre_completo FROM tbl_accesos_ga accesos
JOIN tbl_empleados_ga empleados
ON empleados.id_empleado_ga = accesos.id_empleado_accesos;
