CREATE DATABASE db_centro_cita_ga
    CHARACTER SET utf8
    COLLATE utf8_spanish2_ci;

USE db_centro_cita_ga;

CREATE TABLE tbl_pacientes_ga(
    id_paciente_ga INT NOT NULL,
    nombre_ga VARCHAR(12) NOT NULL,
    apellido_ga VARCHAR(12) NOT NULL,
    fecha_nacimiento_ga DATE NOT NULL,
    direccion_ga TEXT NOT NULL,
    telefono_ga VARCHAR(12) NOT NULL,
    correo_ga VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_paciente_ga)   
) ENGINE = INNODB;

CREATE TABLE tbl_medicos_ga(
    id_medico_ga INT NOT NULL,
    nombre_ga VARCHAR(12) NOT NULL,
    apellido_ga VARCHAR(12) NOT NULL,
    especialidad_ga VARCHAR(20) NOT NULL,
    telefono_ga VARCHAR(12) NOT NULL,
    correo_ga VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_medico_ga)   
) ENGINE = INNODB;

CREATE TABLE tbl_citas_ga(
    id_cita_ga INT NOT NULL AUTO_INCREMENT,
    fecha_ga DATE NOT NULL,
    hora_ga TIME NOT NULL,
    id_paciente_citas INT NOT NULL,
    id_medico_citas INT NOT NULL,
    FOREIGN KEY(id_paciente_citas) REFERENCES tbl_pacientes_ga(id_paciente_ga),
    FOREIGN KEY(id_medico_citas) REFERENCES tbl_medicos_ga(id_medico_ga),
    PRIMARY KEY(id_cita_ga)   
) ENGINE = INNODB;

CREATE TABLE tbl_historiales_medicos_ga (
    id_historial_medico_ga INT NOT NULL AUTO_INCREMENT,
    descripcion_ga TEXT NOT NULL,
    fecha_ga DATE NOT NULL,
    id_paciente_historiales INT NOT NULL,
    id_medico_historiales INT NOT NULL,
    PRIMARY KEY (id_historial_medico_ga),
    FOREIGN KEY (id_paciente_historiales) REFERENCES tbl_pacientes_ga(id_paciente_ga),
    FOREIGN KEY (id_medico_historiales) REFERENCES tbl_medicos_ga(id_medico_ga)
) ENGINE = INNODB;


CREATE TABLE tbl_recetas_ga (
    id_receta_ga INT NOT NULL AUTO_INCREMENT,
    medicamento_ga VARCHAR(20) NOT NULL,
    dosis_ga TEXT NOT NULL,
    id_cita_recetas INT NOT NULL,
    PRIMARY KEY (id_receta_ga),
    FOREIGN KEY (id_cita_recetas) REFERENCES tbl_citas_ga(id_cita_ga)
) ENGINE = INNODB;

CREATE TABLE tbl_diagnosticos_ga (
    id_diagnostico_ga INT NOT NULL AUTO_INCREMENT,
    descripcion_ga TEXT NOT NULL,
    id_cita_diagnosticos INT NOT NULL,
    PRIMARY KEY (id_diagnostico_ga),
    FOREIGN KEY (id_cita_diagnosticos) REFERENCES tbl_citas_ga(id_cita_ga)
) ENGINE = INNODB;
