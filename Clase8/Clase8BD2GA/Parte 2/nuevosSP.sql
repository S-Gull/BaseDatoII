-- 1. Insertar Nuevo Alumno
DELIMITER $$
CREATE PROCEDURE sp_insertar_alumno(
    IN p_nombre VARCHAR(12),
    IN p_fecha_ingreso DATE,
    IN p_nota INT,
    IN p_id_salon INT
)
BEGIN
    INSERT INTO tbl_alumnos_GA (
        nombre_ga, 
        fecha_ingreso_ga, 
        nota_ga, 
        id_salon_alumnos
    ) VALUES (
        p_nombre, 
        p_fecha_ingreso, 
        p_nota, 
        p_id_salon
    );
END$$
DELIMITER ;

-- 2. Actualizar Nota de Alumno
DELIMITER $$
CREATE PROCEDURE sp_actualizar_nota(
    IN p_id_alumno INT,
    IN p_nueva_nota INT
)
BEGIN
    UPDATE tbl_alumnos_GA 
    SET nota_ga = p_nueva_nota 
    WHERE id_alumno_ga = p_id_alumno;
END$$
DELIMITER ;

-- 3. Eliminar Alumno por ID (con limpieza de dependencias)
DELIMITER $$
CREATE PROCEDURE sp_eliminar_alumno(
    IN p_id_alumno INT
)
BEGIN
    -- Eliminar registros relacionados primero
    DELETE FROM tbl_clases_GA WHERE id_alumno_clase = p_id_alumno;
    DELETE FROM tbl_notas_GA WHERE id_alumno_ga = p_id_alumno;
    -- Eliminar al alumno
    DELETE FROM tbl_alumnos_GA WHERE id_alumno_ga = p_id_alumno;
END$$
DELIMITER ;

-- 4. Inscribir Alumno en Materia
DELIMITER $$
CREATE PROCEDURE sp_inscribir_materia(
    IN p_id_alumno INT,
    IN p_id_materia INT,
    IN p_hora TIME
)
BEGIN
    INSERT INTO tbl_clases_GA (
        id_alumno_clase, 
        id_materia_clase, 
        hora_ga
    ) VALUES (
        p_id_alumno, 
        p_id_materia, 
        p_hora
    );
END$$
DELIMITER ;

-- 5. Cambiar Alumno de Salón
DELIMITER $$
CREATE PROCEDURE sp_cambiar_salon(
    IN p_id_alumno INT,
    IN p_nuevo_salon INT
)
BEGIN
    UPDATE tbl_alumnos_GA 
    SET id_salon_alumnos = p_nuevo_salon 
    WHERE id_alumno_ga = p_id_alumno;
END$$
DELIMITER ;

-- 6. Crear Nueva Materia
DELIMITER $$
CREATE PROCEDURE sp_crear_materia(
    IN p_nombre_materia VARCHAR(100)
)
BEGIN
    INSERT INTO tbl_materias_GA (nombre_ga) 
    VALUES (p_nombre_materia);
END$$
DELIMITER ;

-- 7. Crear Nuevo Salón
DELIMITER $$
CREATE PROCEDURE sp_crear_salon(
    IN p_grupo VARCHAR(2),
    IN p_grado INT
)
BEGIN
    INSERT INTO tbl_salones_GA (grupo_ga, grado_ga) 
    VALUES (p_grupo, p_grado);
END$$
DELIMITER ;

-- 8. Obtener Alumnos por Salón
DELIMITER $$
CREATE PROCEDURE sp_alumnos_por_salon(
    IN p_id_salon INT
)
BEGIN
    SELECT 
        id_alumno_ga AS ID,
        nombre_ga AS Nombre,
        nota_ga AS Nota
    FROM tbl_alumnos_GA 
    WHERE id_salon_alumnos = p_id_salon;
END$$
DELIMITER ;