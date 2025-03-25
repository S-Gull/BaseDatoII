use escuela_GA;

CREATE TABLE tbl_notas_GA (
    id_nota_ga INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno_ga INT,
    id_materia_ga INT,
    nota_ga FLOAT,
    FOREIGN KEY (id_alumno_ga) REFERENCES tbl_alumnos_GA(id_alumno_ga),
    FOREIGN KEY (id_materia_ga) REFERENCES tbl_materias_GA(id_materia_ga)
);



INSERT INTO tbl_notas_GA (id_alumno_ga, id_materia_ga, nota_ga) VALUES
(1, 1, 8.5),  -- Juan - Matemáticas
(1, 2, 7.0),  -- Juan - Español
(2, 1, 9.0),  -- Maria - Matemáticas
(3, 5, 10.0), -- Toño - Naturales
(5, 3, 9.5);  -- Eva - Inglés
