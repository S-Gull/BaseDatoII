
/*!Los querys estan ordenados en base al video, por eso se puede ver desordenado el .sql*/

CREATE DATABASE escuela_GA 
CHARACTER SET utf8mb3 
COLLATE utf8mb3_spanish2_ci;

CREATE TABLE escuela_GA.tbl_alumnos_GA (
    id_alumno_ga INT NOT NULL AUTO_INCREMENT, 
    nombre_ga VARCHAR(12) NOT NULL, 
    fecha_ingreso_ga DATE NOT NULL, 
    nota_ga INT NOT NULL, 
    PRIMARY KEY (id_alumno_ga)
) ENGINE = InnoDB;

INSERT INTO escuela_GA.tbl_alumnos_GA (nombre_ga, fecha_ingreso_ga, nota_ga) VALUES 
('Juan', '2020-01-01', 8),
('Maria', '2020-01-02', 7),
('Toño', '2019-01-01', 10);


CREATE TABLE escuela_GA.tbl_maestros_GA (
    id_maestro_ga INT NOT NULL AUTO_INCREMENT, 
    nombre_ga VARCHAR(12) NOT NULL, 
    grado_ga VARCHAR(4) NOT NULL, 
    PRIMARY KEY (id_maestro_ga)
) ENGINE = InnoDB; 

INSERT INTO escuela_GA.tbl_maestros_GA (nombre_ga, grado_ga) VALUES 
('Mario','LIC'),
('Tere','DOC'),
('Alba','MC');

CREATE TABLE escuela_GA.tbl_salones_GA (
        id_salon_ga INT NOT NULL AUTO_INCREMENT, 
        grupo_ga VARCHAR(2) NOT NULL, 
        grado_ga INT NOT NULL, 
        PRIMARY KEY (id_salon_ga)
    ) ENGINE = InnoDB;  
 
ALTER TABLE escuela_GA.tbl_alumnos_GA
ADD COLUMN id_salon_alumnos INT;

ALTER TABLE escuela_GA.tbl_alumnos_GA
ADD FOREIGN KEY (id_salon_alumnos) REFERENCES escuela_GA.tbl_salones_GA(id_salon_ga);
 



INSERT INTO escuela_GA.tbl_salones_GA(grupo_ga,grado_ga) VALUES
('A',1),
('B',1),
('C',1);

UPDATE escuela_GA.tbl_alumnos_GA
SET id_salon_alumnos = 1
WHERE id_alumno_ga IN (1, 2);

UPDATE escuela_GA.tbl_alumnos_GA
SET id_salon_alumnos = 2
WHERE id_alumno_ga = 3;

INSERT INTO escuela_GA.tbl_salones_GA(grupo_ga,grado_ga) VALUES
('D',2),
('E',2);

INSERT INTO escuela_GA.tbl_alumnos_GA (nombre_ga, fecha_ingreso_ga, nota_ga, id_salon_alumnos) VALUES 
('Tere', '2020-01-04', 6, 2),
('Eva', '2020-03-02', 5,3),
('Andres', '2019-11-28', 10,4);

INSERT INTO escuela_GA.tbl_alumnos_GA (nombre_ga, fecha_ingreso_ga, nota_ga) VALUES 
('Jean', '2020-01-04', 8),
('Victor', '2019-11-28', 9);

select * from tbl_alumnos_GA alumnos
join tbl_salones_GA salones 
on salones.id_salon_ga = alumnos.id_salon_alumnos;

select * from tbl_alumnos_GA alumnos
left join tbl_salones_GA salones 
on salones.id_salon_ga = alumnos.id_salon_alumnos;

select * from tbl_alumnos_GA alumnos
right join tbl_salones_GA salones 
on salones.id_salon_ga = alumnos.id_salon_alumnos;

select nombre_ga, grupo_ga,nombre_ga || 'Pertenece a' || grupo_ga from tbl_alumnos_GA alumnos
join tbl_salones_GA salones 
on salones.id_salon_ga = alumnos.id_salon_alumnos;

select * from tbl_alumnos_GA alumnos
join tbl_salones_GA salones 
on salones.id_salon_ga = alumnos.id_salon_alumnos
WHERE grupo_ga = 'A';

select * from tbl_alumnos_GA alumnos
join tbl_salones_GA salones 
on salones.id_salon_ga = alumnos.id_salon_alumnos
order by alumnos.nota_ga desc;

select min(alumnos.nota_ga) 'nota menor',max(alumnos.nota_ga) 'nota mayor' from tbl_alumnos_GA alumnos
join tbl_salones_GA salones 
on salones.id_salon_ga = alumnos.id_salon_alumnos;

select * from tbl_alumnos_GA alumnos
join tbl_salones_GA salones 
on salones.id_salon_ga = alumnos.id_salon_alumnos
limit 2;




CREATE TABLE escuela_GA.tbl_materias_GA (
    id_materia_ga INT(5) NOT NULL AUTO_INCREMENT, 
    nombre_ga VARCHAR(100) NOT NULL, 
    PRIMARY KEY (id_materia_ga)
) ENGINE = InnoDB; 

INSERT INTO escuela_GA.tbl_materias_GA (nombre_ga) VALUES
('Matematicas'),
('Español'),
('Ingles'),
('Sociales'),
('Naturales');

CREATE TABLE escuela_GA.tbl_clases_GA (
    id_clase_ga INT(5) NOT NULL AUTO_INCREMENT, 
    id_alumno_clase INT NOT NULL, 
    id_materia_clase INT NOT NULL, 
    PRIMARY KEY (id_clase_ga),
    FOREIGN KEY (id_alumno_clase) REFERENCES escuela_GA.tbl_alumnos_GA(id_alumno_ga),
    FOREIGN KEY (id_materia_clase) REFERENCES escuela_GA.tbl_materias_GA(id_materia_ga)
) ENGINE = InnoDB; 
ALTER TABLE escuela_GA.tbl_clases_GA
ADD COLUMN hora_ga TIME NOT NULL;


INSERT INTO escuela_GA.tbl_clases_GA (id_alumno_clase,id_materia_clase,hora_ga) VALUES
(1,1,'08:00:00'),
(1,2,'09:00:00'),
(1,3,'10:00:00'),
(1,4,'11:00:00'),
(2,5,'12:00:00'),
(2,1,'08:00:00'),
(2,2,'09:00:00'),
(2,3,'10:00:00'),
(2,4,'11:00:00'),
(2,5,'12:00:00'),
(3,1,'08:00:00'),
(3,2,'09:00:00'),
(3,3,'10:00:00'),
(3,4,'11:00:00'),
(3,5,'12:00:00'),
(4,1,'08:00:00'),
(4,2,'09:00:00'),
(4,3,'10:00:00'),
(4,4,'11:00:00'),
(4,5,'12:00:00'),
(5,1,'08:00:00'),
(5,2,'09:00:00'),
(5,3,'10:00:00'),
(5,4,'11:00:00'),
(5,5,'12:00:00'),
(6,1,'08:00:00'),
(6,2,'09:00:00'),
(6,3,'10:00:00'),
(6,4,'11:00:00'),
(6,5,'12:00:00'),
(7,1,'08:00:00'),
(7,2,'09:00:00'),
(7,3,'10:00:00'),
(7,4,'11:00:00'),
(7,5,'12:00:00');


select * from tbl_clases_GA clases
join  tbl_alumnos_GA alumnos 
on alumnos.id_alumno_ga = clases.id_alumno_clase
join tbl_materias_GA materias
on materias.id_materia_ga = clases.id_materia_clase;

/*a diferencia de los querys normales, en la vista es obligatorio poner AS*/
CREATE VIEW horarios_alumnos_vista AS
SELECT alumnos.nombre_ga, clases.hora_ga, materias.nombre_ga AS materia
FROM tbl_clases_GA AS clases
JOIN tbl_alumnos_GA AS alumnos 
ON alumnos.id_alumno_ga = clases.id_alumno_clase
JOIN tbl_materias_GA AS materias
ON materias.id_materia_ga = clases.id_materia_clase;


CREATE TABLE escuela_GA.tbl_logs_GA (
    id_log_ga INT(5) NOT NULL AUTO_INCREMENT, 
    PRIMARY KEY (id_log_ga)
) ENGINE = InnoDB; 
ALTER TABLE escuela_GA.tbl_logs_GA
ADD COLUMN log_ga TEXT NOT NULL;

DELIMITER //

CREATE TRIGGER logs_notas 
AFTER UPDATE ON tbl_alumnos_GA 
FOR EACH ROW
BEGIN
    INSERT INTO tbl_logs_GA (log_ga) 
    VALUES (CONCAT('Se actualizó la nota del alumno ID: ', NEW.id_alumno_ga, 
                    ', Nota anterior: ', OLD.nota_ga, 
                    ', Nueva nota: ', NEW.nota_ga));
END;
//DELIMITER ;
