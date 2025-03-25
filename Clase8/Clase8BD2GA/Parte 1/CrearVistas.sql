/*1. Vista de Empleados con Información de Cargo*/
CREATE VIEW vista_empleados_cargos AS
SELECT empleados.nombre_ga AS Nombre_Empleado,
       empleados.correo_ga AS Correo,
       cargos.nombre_ga AS Cargo
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos
ON cargos.id_cargo_ga = empleados.id_cargo_empleados;

/*2. Vista de Usuarios con Información de Empleado*/
CREATE VIEW vista_usuarios_empleados AS
SELECT usuarios.usuario_ga AS Login_Usuario,
       empleados.nombre_ga AS Nombre_Empleado
FROM tbl_usuarios_ga usuarios
JOIN tbl_empleados_ga empleados
ON empleados.id_usuario_empleados = usuarios.id_usuario_ga;

/*3. Vista de Sucursales con Número de Empleados*/
CREATE VIEW vista_sucursales_empleados AS
SELECT sucursales.ciudad_ga AS Ciudad,
       COUNT(empleados.id_empleado_ga) AS Total_Empleados
FROM tbl_sucursales_ga sucursales
JOIN tbl_empleados_ga empleados 
ON sucursales.id_sucursal_ga = empleados.id_sucursal_empleados
GROUP BY sucursales.ciudad_ga;

/*4. Vista de Empleados Masculinos con Cargo y Sucursal*/
CREATE VIEW vista_empleados_masculinos AS
SELECT empleados.nombre_ga AS Nombre,
       cargos.nombre_ga AS Cargo,
       sucursales.ciudad_ga AS Ciudad_Sucursal
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos ON empleados.id_cargo_empleados = cargos.id_cargo_ga
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga
WHERE empleados.genero_ga = 'Masculino';

/*5. Vista de Usuarios con Rol de Administrador*/
CREATE VIEW vista_usuarios_admin AS
SELECT usuario_ga AS Usuario,
       clave_ga AS Clave
FROM tbl_usuarios_ga
WHERE rol_ga = 'Admin';

/*6. Vista de Empleados con Salario Mayor a X*/
SELECT empleados.nombre_ga, cargos.sueldo_ga 
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos
ON cargos.id_cargo_ga = empleados.id_cargo_empleados
WHERE sueldo_ga > 3000;  

/*7. Vista de Empleados con Fecha de Ingreso Reciente*/
CREATE VIEW vista_empleados_recientes AS
SELECT nombre_ga AS Nombre,
       fechahgreso_ga AS Fecha_Ingreso
FROM tbl_empleados_ga
WHERE fechahgreso_ga >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

/*8. Vista de Empleados con Información de Usuario y Cargo*/
CREATE VIEW vista_empleados_usuario_cargo AS
SELECT empleados.nombre_ga AS Nombre_Empleado,
       usuarios.usuario_ga AS Usuario,
       cargos.nombre_ga AS Cargo
FROM tbl_empleados_ga empleados
JOIN tbl_usuarios_ga usuarios ON empleados.id_usuario_empleados = usuarios.id_usuario_ga
JOIN tbl_cargos_ga cargos ON empleados.id_cargo_empleados = cargos.id_cargo_ga;

/*9. Vista de Sucursales con Número de Usuarios*/
CREATE VIEW vista_sucursales_total_usuarios AS
SELECT sucursales.ciudad_ga AS Ciudad,
       COUNT(DISTINCT usuarios.id_usuario_ga) AS Total_Usuarios
FROM tbl_sucursales_ga sucursales
JOIN tbl_empleados_ga empleados ON sucursales.id_sucursal_ga = empleados.id_sucursal_empleados
JOIN tbl_usuarios_ga usuarios ON empleados.id_usuario_empleados = usuarios.id_usuario_ga
GROUP BY sucursales.ciudad_ga;

/*10. Vista de Empleados con Información de Sucursal y Salario*/
CREATE VIEW vista_empleados_sucursal_salario AS
SELECT empleados.nombre_ga, sucursales.ciudad_ga, cargos.sueldo_ga 
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos ON cargos.id_cargo_ga = empleados.id_cargo_empleados
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga; 

/*11. Vista de Usuarios con Información de Empleado y Sucursal*/
CREATE VIEW vista_usuarios_completa AS
SELECT usuarios.usuario_ga AS Usuario,
       empleados.nombre_ga AS Nombre_Empleado,
       sucursales.ciudad_ga AS Ciudad_Sucursal
FROM tbl_usuarios_ga usuarios
JOIN tbl_empleados_ga empleados ON usuarios.id_usuario_ga = empleados.id_usuario_empleados
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga;

/*12. Vista de Cargos con Número de Empleados*/
CREATE VIEW vista_cargos_empleados AS
SELECT cargos.nombre_ga AS Cargo,
       COUNT(empleados.id_empleado_ga) AS Total_Empleados
FROM tbl_cargos_ga cargos
LEFT JOIN tbl_empleados_ga empleados ON cargos.id_cargo_ga = empleados.id_cargo_empleados
GROUP BY cargos.nombre_ga;

/*13. Vista de Empleados con Cargo y Salario Ordenada*/
CREATE VIEW vista_salarios_descendentes AS
SELECT empleados.nombre_ga AS Nombre,
       cargos.sueldo_ga AS Salario
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos
ON cargos.id_cargo_ga = empleados.id_cargo_empleados
ORDER BY cargos.sueldo_ga DESC;

/*14. Vista Filtrada por Ciudad*/
CREATE VIEW vista_filtro_ciudad AS
SELECT usuarios.usuario_ga AS Usuario,
       empleados.nombre_ga AS Nombre,
       sucursales.ciudad_ga AS Ciudad
FROM tbl_usuarios_ga usuarios
JOIN tbl_empleados_ga empleados ON usuarios.id_usuario_ga = empleados.id_usuario_empleados
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga
WHERE sucursales.ciudad_ga = 'Caracas';

/*15. Vista con Salario Promedio por Cargo*/
CREATE VIEW vista_salarios_promedio AS
SELECT cargos.nombre_ga AS Cargo,
       AVG(cargos.sueldo_ga) AS Salario_Promedio
FROM tbl_cargos_ga cargos
LEFT JOIN tbl_empleados_ga empleados ON cargos.id_cargo_ga = empleados.id_cargo_empleados
GROUP BY cargos.nombre_ga;

/*16. Vista Filtrada por Género*/
CREATE VIEW vista_filtro_genero AS
SELECT usuarios.usuario_ga AS Usuario,
       empleados.nombre_ga AS Nombre,
       sucursales.ciudad_ga AS Ciudad
FROM tbl_usuarios_ga usuarios
JOIN tbl_empleados_ga empleados ON usuarios.id_usuario_ga = empleados.id_usuario_empleados
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga
WHERE empleados.genero_ga = 'Masculino';

SOURCE ./llamarvistas.sql
