CREATE DATABASE biblioteca_GA;

CREATE TABLE biblioteca_GA.tbl_libro_GA (
    id_libro INT NOT NULL AUTO_INCREMENT, 
    titulo VARCHAR(12) NOT NULL, 
    editorial VARCHAR(8) NOT NULL, 
    fecha_public DATE NOT NULL, 
    genero TEXT NOT NULL, 
    n_ejemplar INT NOT NULL, 
    isbn INT NOT NULL, 
    PRIMARY KEY (id_libro)
) ENGINE = InnoDB; 

CREATE TABLE biblioteca_GA.tbl_autores_GA(
    id_autor INT NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(16) NOT NULL, 
    apellido VARCHAR(16) NOT NULL, 
    nacionalidad  VARCHAR(20), 
    fecha_nac DATETIME NOT NULL, 
    PRIMARY KEY (id_autor)
) ENGINE = InnoDB;

ALTER TABLE biblioteca_GA.tbl_libro_GA
ADD COLUMN id_autor INT NOT NULL,
ADD FOREIGN KEY (id_autor) REFERENCES biblioteca_GA.tbl_autores_GA(id_autor);

CREATE TABLE biblioteca_GA.tbl_prestamos_GA (
    id_prestamo INT NOT NULL AUTO_INCREMENT,
    fecha_prestamo DATETIME NOT NULL,
    fecha_devolucion DATETIME NOT NULL,
    id_libro INT NOT NULL,
    PRIMARY KEY (id_prestamo),
    FOREIGN KEY (id_libro) REFERENCES biblioteca_GA.tbl_libro_GA(id_libro) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE biblioteca_GA.tbl_tipos_usuarios_GA(
    id_tipo_usuario INT NOT NULL AUTO_INCREMENT,
    tipo_usuario VARCHAR(16) NOT NULL,
    PRIMARY KEY (id_tipo_usuario)
) ENGINE = INNODB;

CREATE TABLE biblioteca_GA.tbl_usuarios_GA (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    id_prestamo INT NOT NULL,
    nombre VARCHAR(16) NOT NULL,
    apellido VARCHAR(16) NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(12),
    correo VARCHAR(60) NOT NULL,
    id_tipo_usuario INT NOT NULL,
    fecha_inscripcion DATETIME NOT NULL,
    PRIMARY KEY (id_usuario),
    FOREIGN KEY (id_prestamo) REFERENCES biblioteca_GA.tbl_prestamos_GA(id_prestamo),
    FOREIGN KEY (id_tipo_usuario) REFERENCES biblioteca_GA.tbl_tipos_usuarios_GA(id_tipo_usuario)
) ENGINE = INNODB;

CREATE TABLE biblioteca_GA.tbl_generos_GA (
    id_genero INT NOT NULL AUTO_INCREMENT,
    genero VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_genero)
) ENGINE = INNODB;

CREATE TABLE biblioteca_GA.tbl_estados_GA (
    id_estado INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_estado)
) ENGINE = INNODB;

ALTER TABLE biblioteca_GA.tbl_libro_GA
ADD COLUMN id_genero INT NOT NULL,
ADD FOREIGN KEY (id_genero) REFERENCES biblioteca_GA.tbl_generos_GA(id_genero);

ALTER TABLE biblioteca_GA.tbl_libro_GA
ADD COLUMN id_estado INT NOT NULL,
ADD FOREIGN KEY (id_estado) REFERENCES biblioteca_GA.tbl_estados_GA(id_estado);

ALTER TABLE biblioteca_GA.tbl_prestamos_GA
ADD COLUMN id_usuario INT NOT NULL,
ADD FOREIGN KEY (id_usuario) REFERENCES biblioteca_GA.tbl_usuarios_GA(id_usuario);
