-- 1. Insertar Nuevo Alumno
CALL sp_insertar_alumno('Carlos', '2024-02-01', 9, 3);
SELECT * FROM  tbl_alumnos_GA;
-- 2. Actualizar Nota de Alumno
CALL sp_actualizar_nota(5, 10);
SELECT * FROM tbl_alumnos_GA;
-- 3. Eliminar Alumno por ID
CALL sp_eliminar_alumno(8);
SELECT * FROM  tbl_alumnos_GA;

-- 4. Inscribir Alumno en Materia
CALL sp_inscribir_materia(7, 3, '13:00:00');
SELECT * FROM tbl_clases_GA;
-- 5. Cambiar Alumno de Salón
CALL sp_cambiar_salon(7, 4);
SELECT * FROM  tbl_alumnos_GA;

-- 6. Crear Nueva Materia
CALL sp_crear_materia('Programación');
SELECT * FROM  tbl_materias_GA;

-- 7. Crear Nuevo Salón
CALL sp_crear_salon('F', 2);
SELECT * FROM  tbl_salones_GA;

-- 8. Obtener Alumnos por Salón
CALL sp_alumnos_por_salon(2);
SELECT * FROM  tbl_alumnos_GA;
