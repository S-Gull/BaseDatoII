-- 1. Obtener todos los pacientes que tienen citas programadas para una fecha específica.
SELECT 
    pacientes.id_paciente_ga, 
    pacientes.nombre_ga, 
    pacientes.apellido_ga, 
    citas.fecha_ga, 
    citas.hora_ga 
FROM tbl_pacientes_ga pacientes
JOIN tbl_citas_ga citas ON pacientes.id_paciente_ga = citas.id_paciente_citas
WHERE citas.fecha_ga = '2025-03-01';  


-- 2. Listar todos los médicos con su especialidad y datos de contacto.
SELECT 
    medicos.id_medico_ga, 
    medicos.nombre_ga, 
    medicos.apellido_ga, 
    medicos.especialidad_ga, 
    medicos.telefono_ga, 
    medicos.correo_ga 
FROM tbl_medicos_ga medicos;


-- 3. Mostrar todas las citas de un paciente específico usando su ID.
SELECT 
    citas.id_cita_ga, 
    citas.fecha_ga, 
    citas.hora_ga, 
    medicos.nombre_ga AS medico_nombre, 
    medicos.apellido_ga AS medico_apellido
FROM tbl_citas_ga citas
JOIN tbl_medicos_ga medicos ON citas.id_medico_citas = medicos.id_medico_ga
WHERE citas.id_paciente_citas = 1234567890;  


-- 4. Obtener el historial médico completo de un paciente por su ID.
SELECT 
    historiales.id_historial_medico_ga, 
    historiales.descripcion_ga, 
    historiales.fecha_ga, 
    medicos.nombre_ga AS medico_nombre, 
    medicos.apellido_ga AS medico_apellido
FROM tbl_historiales_medicos_ga historiales
JOIN tbl_medicos_ga medicos ON historiales.id_medico_historiales = medicos.id_medico_ga
WHERE historiales.id_paciente_historiales = 1234567890;  

-- 5. Listar todas las recetas generadas en una fecha específica.
SELECT 
    recetas.id_receta_ga, 
    recetas.medicamento_ga, 
    recetas.dosis_ga, 
    citas.fecha_ga, 
    citas.hora_ga 
FROM tbl_recetas_ga recetas
JOIN tbl_citas_ga citas ON recetas.id_cita_recetas = citas.id_cita_ga
WHERE citas.fecha_ga = '2025-03-01'; 


-- 6. Encontrar todos los diagnósticos realizados durante una cita específica.
SELECT 
    diagnosticos.id_diagnostico_ga, 
    diagnosticos.descripcion_ga, 
    citas.fecha_ga, 
    citas.hora_ga
FROM tbl_diagnosticos_ga diagnosticos
JOIN tbl_citas_ga citas ON diagnosticos.id_cita_diagnosticos = citas.id_cita_ga
WHERE citas.id_cita_ga = 1;  



-- 9. Mostrar todos los pacientes que tienen un diagnóstico particular.
SELECT diagnosticos.descripcion_ga,
        pacientes.id_paciente_ga,
        pacientes.nombre_ga  
FROM tbl_diagnosticos_ga diagnosticos
JOIN tbl_citas_ga citas on citas.id_cita_ga = diagnosticos.id_cita_diagnosticos
JOIN tbl_pacientes_ga pacientes on citas.id_paciente_citas = pacientes.id_paciente_ga
WHERE diagnosticos.descripcion_ga = 'Anemia'



-- 10. Listar todas las citas y sus detalles para un médico en una fecha específica.
SELECT 
    citas.id_cita_ga, 
    citas.fecha_ga, 
    citas.hora_ga, 
    pacientes.nombre_ga AS paciente_nombre, 
    pacientes.apellido_ga AS paciente_apellido
FROM tbl_citas_ga citas
JOIN tbl_pacientes_ga pacientes ON citas.id_paciente_citas = pacientes.id_paciente_ga
WHERE citas.id_medico_citas = 1010101010  
AND citas.fecha_ga = '2025-03-01';  

