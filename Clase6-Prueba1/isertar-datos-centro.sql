USE db_centro_cita_ga;

INSERT INTO tbl_medicos_ga (id_medico_ga, nombre_ga, apellido_ga, especialidad_ga, telefono_ga, correo_ga) 
VALUES 
(1010101010, 'Carlos', 'Martínez', 'Gastroenterología', '584141234567', 'carlos.martinez@hospital.com'),
(1020202020, 'Ana', 'González', 'Pediatría', '584122345678', 'ana.gonzalez@hospital.com'),
(1030303030, 'Luis', 'Rodríguez', 'Cardiología', '584243456789', 'luis.rodriguez@hospital.com'),
(1040404040, 'Patricia', 'Sánchez', 'Dermatología', '584164567890', 'patricia.sanchez@hospital.com'),
(1050505050, 'José', 'López', 'Neurología', '584125678901', 'jose.lopez@hospital.com');

INSERT INTO tbl_pacientes_ga (id_paciente_ga, nombre_ga, apellido_ga, fecha_nacimiento_ga, direccion_ga, telefono_ga, correo_ga) 
VALUES 
(1234567890, 'Juan', 'Pérez', '1985-04-15', 'Calle Falsa 123', '584149876543', 'juan.perez@mail.com'),
(1234567891, 'María', 'López', '1990-08-22', 'Avenida Siempre Viva 456', '584128765432', 'maria.lopez@mail.com'),
(1234567892, 'Carlos', 'Ramírez', '1982-03-10', 'Calle Principal 789', '584147654321', 'carlos.ramirez@mail.com'),
(1234567893, 'Laura', 'González', '1995-12-05', 'Calle Secundaria 101', '584266543210', 'laura.gonzalez@mail.com'),
(1234567894, 'José', 'Torres', '1978-06-15', 'Carrera 42 205', '584145432109', 'jose.torres@mail.com'),
(1234567895, 'Elena', 'Martínez', '1989-11-25', 'Avenida del Sol 90', '584124321098', 'elena.martinez@mail.com'),
(1234567896, 'Fernando', 'Hernández', '1992-09-30', 'Calle Larga 567', '584143210987', 'fernando.hernandez@mail.com'),
(1234567897, 'Luisa', 'Pérez', '1987-07-20', 'Calle de la Luna 234', '584262109876', 'luisa.perez@mail.com'),
(1234567898, 'Ricardo', 'Sánchez', '1980-01-18', 'Calle 40 300', '584141098765', 'ricardo.sanchez@mail.com'),
(1234567899, 'Marta', 'Ruiz', '1993-10-05', 'Carrera 15 12', '584149876543', 'marta.ruiz@mail.com'),
(1234567900, 'Miguel', 'Jiménez', '1991-08-12', 'Avenida Siempre Viva 654', '584128765432', 'miguel.jimenez@mail.com'),
(1234567901, 'Sofía', 'Martínez', '1984-05-09', 'Calle El Sol 123', '584147654321', 'sofia.martinez@mail.com'),
(1234567902, 'Javier', 'García', '1975-12-30', 'Calle del Parque 456', '584166543210', 'javier.garcia@mail.com'),
(1234567903, 'Raúl', 'Álvarez', '1988-02-17', 'Avenida de la Paz 789', '584145432109', 'raul.alvarez@mail.com');

INSERT INTO tbl_citas_ga (fecha_ga, hora_ga, id_paciente_citas, id_medico_citas) 
VALUES
('2025-03-01', '09:00:00', 1234567890, 1010101010), 
('2025-03-01', '10:00:00', 1234567891, 1020202020),
('2025-03-02', '11:00:00', 1234567892, 1030303030),
('2025-03-02', '12:00:00', 1234567893, 1040404040),
('2025-03-03', '13:00:00', 1234567894, 1050505050),
('2025-03-03', '14:00:00', 1234567895, 1010101010),
('2025-03-04', '15:00:00', 1234567896, 1020202020),
('2025-03-04', '16:00:00', 1234567897, 1030303030),
('2025-03-05', '17:00:00', 1234567898, 1040404040),
('2025-03-05', '18:00:00', 1234567899, 1050505050),
('2025-03-06', '09:00:00', 1234567900, 1010101010),
('2025-03-06', '10:00:00', 1234567901, 1020202020),
('2025-03-07', '11:00:00', 1234567902, 1030303030),
('2025-03-07', '12:00:00', 1234567903, 1040404040);


INSERT INTO tbl_historiales_medicos_ga (descripcion_ga, fecha_ga, id_paciente_historiales, id_medico_historiales) 
VALUES
('Diagnóstico de hipertensión', '2025-03-01', 1234567890, 1010101010),
('Alergia al polen', '2025-03-01', 1234567891, 1020202020),
('Dolores musculares crónicos', '2025-03-02', 1234567892, 1030303030),
('Examen de piel', '2025-03-02', 1234567893, 1040404040),
('Control neurológico', '2025-03-03', 1234567894, 1050505050),
('Revisión de migrañas', '2025-03-03', 1234567895, 1010101010),
('Tratamiento para anemia', '2025-03-04', 1234567896, 1020202020),
('Consulta por fiebre persistente', '2025-03-04', 1234567897, 1030303030),
('Revisión anual', '2025-03-05', 1234567898, 1040404040),
('Chequeo de presión arterial', '2025-03-05', 1234567899, 1050505050),
('Tratamiento para insomnio', '2025-03-06', 1234567900, 1010101010),
('Evaluación psicológica', '2025-03-06', 1234567901, 1020202020),
('Evaluación cardiovascular', '2025-03-07', 1234567902, 1030303030),
('Consulta dermatológica', '2025-03-07', 1234567903, 1040404040);


INSERT INTO tbl_recetas_ga (medicamento_ga, dosis_ga, id_cita_recetas) 
VALUES
('Losartán', '50 mg diarios', 1),
('Difenhidramina', '25 mg antes de dormir', 2),
('Ibuprofeno', '400 mg cada 8 horas', 3),
('Clindamicina', '300 mg cada 8 horas', 4),
('Paracetamol', '500 mg cada 6 horas', 5),
('Metformina', '500 mg dos veces al día', 6),
('Hierro', '50 mg diarios', 7),
('Amoxicilina', '500 mg cada 8 horas', 8),
('Lisinopril', '10 mg diarios', 9),
('Atorvastatina', '20 mg diarios', 10),
('Fluoxetina', '20 mg diarios', 11),
('Aspirina', '100 mg diarios', 12),
('Prednisona', '20 mg diarios', 13),
('Antihistamínico', '10 mg antes de dormir', 14);


INSERT INTO tbl_diagnosticos_ga (descripcion_ga, id_cita_diagnosticos) 
VALUES
('Hipertensión leve', 1),
('Rinitis alérgica', 2),
('Fibromialgia', 3),
('Dermatitis', 4),
('Migraña crónica', 5),
('Anemia', 6),
('Fiebre persistente de origen desconocido', 7),
('Hipertensión arterial', 8),
('Insomnio', 9),
('Colesterol alto', 10),
('Ansiedad', 11),
('Dolores articulares', 12),
('Dermatitis atópica', 13),
('Resfriado común', 14);