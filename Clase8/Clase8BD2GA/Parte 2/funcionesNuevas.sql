use escuela_GA;


-- 1. Obtener nombre del alumno por ID
DELIMITER $$
CREATE FUNCTION fn_get_nombre_alumno(id_alumno INT) 
RETURNS VARCHAR(12) DETERMINISTIC
BEGIN
    RETURN (SELECT nombre_ga FROM tbl_alumnos_GA WHERE id_alumno_ga = id_alumno);
END$$
DELIMITER ;

-- 2. Obtener nombre de materia por ID
DELIMITER $$
CREATE FUNCTION fn_get_nombre_materia(id_materia INT) 
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    RETURN (SELECT nombre_ga FROM tbl_materias_GA WHERE id_materia_ga = id_materia);
END$$
DELIMITER ;

-- 3. Obtener nombre del salón por ID
DELIMITER $$
CREATE FUNCTION fn_get_nombre_salon(id_salon INT) 
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    RETURN (
        SELECT CONCAT(grado_ga, grupo_ga) 
        FROM tbl_salones_GA 
        WHERE id_salon_ga = id_salon
    );
END$$
DELIMITER ;

-- 4. Calcular promedio de notas por salón (requiere tabla de notas)
DELIMITER $$
CREATE FUNCTION fn_promedio_salon(id_salon INT) 
RETURNS FLOAT DETERMINISTIC
BEGIN
    RETURN (
        SELECT AVG(nota_ga) 
        FROM tbl_alumnos_GA 
        WHERE id_salon_alumnos = id_salon
    );
END$$
DELIMITER ;

-- 5. Contar alumnos por materia (asumiendo tabla clases)
DELIMITER $$
CREATE FUNCTION fn_total_alumnos_materia(id_materia INT) 
RETURNS INT DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT id_alumno_clase) 
        FROM tbl_clases_GA 
        WHERE id_materia_clase = id_materia
    );
END$$
DELIMITER ;

-- 6. Verificar si alumno pertenece a salón
DELIMITER $$
CREATE FUNCTION fn_verificar_salon(id_alumno INT, id_salon INT) 
RETURNS BOOLEAN DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(*) > 0 
        FROM tbl_alumnos_GA 
        WHERE id_alumno_ga = id_alumno 
        AND id_salon_alumnos = id_salon
    );
END$$
DELIMITER ;

-- 7. Obtener nota máxima (requiere tabla de notas por materia)
DELIMITER $$
CREATE FUNCTION fn_nota_maxima(id_alumno INT) 
RETURNS FLOAT DETERMINISTIC
BEGIN
    RETURN (
        SELECT MAX(nota_ga) 
        FROM tbl_notas_GA  -- Requiere crear esta tabla
        WHERE id_alumno_ga = id_alumno
    );
END$$
DELIMITER ;

-- 8. Formatear fecha de ingreso
DELIMITER $$
CREATE FUNCTION fn_formatear_fecha(fecha DATE) 
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    RETURN DATE_FORMAT(fecha, '%d/%m/%Y');
END$$
DELIMITER ;