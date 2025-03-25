DELIMITER $$

-- 1. Procedimiento para agregar un nuevo paciente
CREATE PROCEDURE agregar_paciente(
    IN p_id_paciente INT,
    IN p_nombre VARCHAR(12),
    IN p_apellido VARCHAR(12),
    IN p_fecha_nacimiento DATE,
    IN p_direccion TEXT,
    IN p_telefono VARCHAR(12),
    IN p_correo VARCHAR(60)
)
BEGIN
    INSERT INTO tbl_pacientes_ga (id_paciente_ga, nombre_ga, apellido_ga, fecha_nacimiento_ga, direccion_ga, telefono_ga, correo_ga)
    VALUES (p_id_paciente, p_nombre, p_apellido, p_fecha_nacimiento, p_direccion, p_telefono, p_correo);
END $$

-- 2. Procedimiento para actualizar la especialidad de un médico
CREATE PROCEDURE actualizar_especialidad_medico(
    IN p_id_medico INT,
    IN p_nueva_especialidad VARCHAR(20)
)
BEGIN
    UPDATE tbl_medicos_ga
    SET especialidad_ga = p_nueva_especialidad
    WHERE id_medico_ga = p_id_medico;
END $$

-- 3. Procedimiento para eliminar una cita por su ID
CREATE PROCEDURE eliminar_cita(
    IN p_id_cita INT
)
BEGIN
    DELETE FROM tbl_citas_ga
    WHERE id_cita_ga = p_id_cita;
END $$

-- 4. Procedimiento para listar todas las recetas de un paciente por su ID
CREATE PROCEDURE listar_recetas_por_paciente(
    IN p_id_paciente INT
)
BEGIN
    SELECT r.id_receta_ga, r.medicamento_ga, r.dosis_ga
    FROM tbl_recetas_ga r
    JOIN tbl_citas_ga c ON r.id_cita_recetas = c.id_cita_ga
    WHERE c.id_paciente_citas = p_id_paciente;
END $$

DELIMITER ;
