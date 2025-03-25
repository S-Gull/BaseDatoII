
USE empresa2_ga;


INSERT INTO tbl_usuarios_ga (usuario_ga, clave_ga, rol_ga) VALUES
('Guillem', '1234','Admin'),
('Jcoffi', '4321','Admin'),
('LuiSilva', '7485','Usuario'),
('Japarr', '7974','Usuario'),
('Vector', '5469','Usuario');

select "usuarios";

-- Inserción en tbl_cargos_ga
INSERT INTO tbl_cargos_ga (nombre_ga, sueldo_ga) VALUES
('Gerente', 5000.00),
('Analista', 3000.00),
('Desarrollador', 4000.00);

select "cargos";

-- Inserción en tbl_sucursales_ga
INSERT INTO tbl_sucursales_ga (ciudad_ga, direccion_ga, telefono_ga) VALUES
('Caracas', 'el hatillo', '910000000'),
('Caracas', 'el marques', '930000000'),
('Anzoategui', 'Puerto la cruz', '960000000');
 
select "sucursales";

-- Inserción en tbl_empleados_ga
INSERT INTO tbl_empleados_ga 
  (id_usuario_empleados, id_cargo_empleados, id_sucursal_empleados, nombre_ga, fechahgreso_ga, correo_ga, genero_ga, estado_ga)
VALUES
  (1, 3, 1, 'Guillermo Alvarez', '2023-01-15', 'guillem@une.com', 'Masculino', '1'),
  (2, 3, 2, 'Jean Coffi', '2023-02-20', 'jcoffis@une.com', 'Masculino', '1'),
  (3, 2, 3, 'Luis Da Silva', '2023-03-10', 'Luis@une.com', 'Masculino', '1'),
  (4, 1, 2, 'Jesus Parra', '2023-01-10', 'jparra@une.com', 'Masculino', '1'),
  (5, 1, 2, 'Victor Contreras', '2024-06-10', 'vector@une.com', 'Masculino', '1');

select "empleados";

SOURCE ./CrearVistas.sql
