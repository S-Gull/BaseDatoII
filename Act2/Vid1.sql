CREATE DATABASE empleados_ga;

CREATE TABLE tbl_empleados_ga(
     id_empleado_ga INT NOT NULL AUTO_INCREMENT,
     primer_nombre_ga VARCHAR(20) NOT NULL,
     segundo_nombre_ga VARCHAR(20) NOT NULL,
     primer_apellido_ga VARCHAR(20) NOT NULL,
     segundo_apellido_ga VARCHAR(20) NOT NULL,
     celular_ga VARCHAR(12) NOT NULL,
     PRIMARY KEY(id_empleado_ga)
) ENGINE = INNODB;


INSERT INTO tbl_empleados_ga 
(primer_nombre_ga, segundo_nombre_ga, primer_apellido_ga, segundo_apellido_ga, celular_ga)
VALUES 
('Juan', 'Carlos', 'Perez', 'Lopez', '593987654321'),
('Pedro', 'Luis', 'Saenz', 'Gonzales', '583695752384'),
('María', 'Fernanda', 'Gomez', 'Torres', '593987123456');