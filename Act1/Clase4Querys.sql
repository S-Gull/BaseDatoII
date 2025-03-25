CREATE DATABASE salud_terapias_ga;

CREATE TABLE medicos_ga (
cedula_medico_ga INT NOT NULL,
nombre_ga VARCHAR(12) NOT NULL,
PRIMARY KEY (cedula_medico_ga)
) ENGINE = InnoDB; 


CREATE TABLE terapias_ga (
 id_terapia_ga INT NOT NULL AUTO_INCREMENT,
 nombre_ga VARCHAR(45) NOT NULL,
 precio_ga INT NOT NULL,
 cedula_medico_terapias INT NOT NULL,
 PRIMARY KEY (id_terapia_ga),
 FOREIGN KEY (cedula_medico_terapias) REFERENCES medicos_ga(cedula_medico_ga) 



) ENGINE = InnoDB; 

INSERT INTO terapias_ga (nombre_ga, precio_ga, cedula_medico_terapias)
VALUES
('Terapia cognitiva', 50.00, 12345678),
('Terapia conductual', 60.00, 98765432),
('Masaje relajante', 40.00, 11111111),
('Acupuntura', 70.00, 22222222),
('Yoga terapéutico', 45.00, 33333333),
('Hipnosis clínica', 80.00, 12345678),
('Terapia familiar', 90.00, 98765432),
('Reflexología podal', 55.00, 11111111);

INSERT INTO medicos_ga (cedula_medico_ga, nombre_ga) VALUES
     (12345678, 'Juan'),
     (98765432, 'María'),
     (11111111, 'Carlos'),
     (22222222, 'Ana'),
     (33333333, 'Pedro');

CREATE PROCEDURE sp1_ga (porcentaje_ga REAL) SELECT nombre_ga,(terapias_ga.precio_ga + (terapias_ga.precio_ga * porcentaje_ga)) FROM terapias_ga;

-- sp1 significa stored Procedure 1
CALL sp1_ga(0.10);

--video 2
CREATE TABLE pacientes_ga (
    cedula_paciente_ga INT NOT NULL,
    nombre_ga VARCHAR(50) NOT NULL,
    PRIMARY KEY (cedula_paciente_ga)
) ENGINE = InnoDB;

ALTER TABLE terapias_ga
ADD COLUMN cedula_paciente_terapia INT;

ALTER TABLE terapias_ga
ADD FOREIGN KEY (cedula_paciente_terapia) REFERENCES pacientes_ga(cedula_paciente_ga);


INSERT INTO pacientes_ga (cedula_paciente_ga, nombre_ga) VALUES
(10000001, 'Luis'),
(10000002, 'Sofía'),
(10000003, 'Miguel'),
(10000004, 'Laura'),
(10000005, 'Javier');

UPDATE terapias_ga
SET cedula_paciente_terapia = 10000001
WHERE id_terapia_ga = 1;

UPDATE terapias_ga
SET cedula_paciente_terapia = 10000002
WHERE id_terapia_ga = 2;

UPDATE terapias_ga
SET cedula_paciente_terapia = 10000003
WHERE id_terapia_ga = 3;

UPDATE terapias_ga
SET cedula_paciente_terapia = 10000004
WHERE id_terapia_ga = 4;

UPDATE terapias_ga
SET cedula_paciente_terapia = 10000005
WHERE id_terapia_ga = 5;

DELIMITER //

CREATE PROCEDURE AddTerapia_ga(
    IN _nombre_ga VARCHAR(45),
    IN _precio_ga INT,
    IN _cedula_medico_terapias INT,
    IN _cedula_paciente_terapia INT)
BEGIN
    INSERT INTO terapias_ga (nombre_ga, precio_ga, cedula_medico_terapias, cedula_paciente_terapia)
    VALUES (_nombre_ga, _precio_ga, _cedula_medico_terapias, _cedula_paciente_terapia);
END //

DELIMITER ;

CALL AddTerapia_ga('Terapia de relajación', 65, 12345678, 10000001);