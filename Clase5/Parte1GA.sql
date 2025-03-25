SHOW DATABASES;

CREATE DATABASE empresas_ga;

SHOW DATABASES;

USE empresas_ga;

CREATE TABLE tbl_productos_ga (
    codigo_ga VARCHAR(3) NOT NULL,
    nombre_ga VARCHAR(30),
    precio_ga DECIMAL(6,2),
    fechaalta_ga DATE,
    PRIMARY KEY (codigo_ga)
) ENGINE = INNODB;

DESCRIBE tbl_productos_ga;

INSERT INTO tbl_productos_ga (codigo_ga, nombre_ga, precio_ga, fechaalta_ga) VALUES 
('A01', 'AFILADOR', 2.5, '2025-02-18'),
('A02', 'SILLA MOD. ZAZ', 25.5, '2025-02-13'),
('A03', 'SILLA MOD. XAX', 12.5, '2025-01-28');


SELECT * FROM tbl_productos_ga;
SELECT * FROM tbl_productos_ga WHERE nombre_ga = 'AFILADOR';
SELECT * FROM tbl_productos_ga WHERE codigo_ga = 'A02';
SELECT * FROM tbl_productos_ga WHERE nombre_ga LIKE 'S%';

SELECT nombre_ga, precio_ga 
FROM tbl_productos_ga 
WHERE precio_ga > 22;

SELECT AVG(precio_ga) 
FROM tbl_productos_ga 
WHERE LEFT(nombre_ga, 5) = 'SILLA';  

ALTER TABLE tbl_productos_ga ADD categoria_ga VARCHAR(10);

UPDATE tbl_productos_ga SET categoria_ga = 'utensilio';
SELECT * FROM tbl_productos_ga;

SELECT DISTINCT categoria_ga FROM tbl_productos_ga;

UPDATE tbl_productos_ga 
SET categoria_ga = 'silla' 
WHERE LEFT(nombre_ga, 5) = 'SILLA';  

SELECT * FROM tbl_productos_ga;
SELECT DISTINCT categoria_ga FROM tbl_productos_ga;

SELECT categoria_ga, COUNT(*) 
FROM tbl_productos_ga 
GROUP BY categoria_ga;


