USE empresa2_ga;

/*1. Vista de Empleados con Información de Cargo: Diseña una vista que muestre el nombre del empleado, su correo electrónico y el nombre del cargo que ocupa.*/
SELECT empleados.nombre_ga, empleados.correo_ga, cargos.nombre_ga FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos
ON cargos.id_cargo_ga = empleados.id_cargo_empleados;

/*2. Vista de Usuarios con Información de Empleado: Crea una vista que muestre el login del usuario y el nombre completo del empleado asociado.*/
SELECT usuarios.usuario_ga, usuarios.clave_ga, empleados.nombre_ga FROM tbl_usuarios_ga usuarios
JOIN tbl_empleados_ga  empleados
ON empleados.id_usuario_empleados = usuarios.id_usuario_ga;

/*3. Vista de Sucursales con Número de Empleados: Genera una vista que muestre la ciudad de la sucursal y el número total de empleados que trabajan en ella.*/
SELECT sucursales.ciudad_ga ,sucursales.direccion_ga, COUNT(empleados.nombre_ga) 'Cantidad de empleados' FROM tbl_sucursales_ga sucursales
JOIN  tbl_empleados_ga empleados 
ON sucursales.id_sucursal_ga = empleados.id_sucursal_empleados
WHERE sucursales.id_sucursal_ga =2
GROUP BY sucursales.ciudad_ga;

/*4. Vista de Empleados Masculinos con Cargo y Sucursal*/
SELECT empleados.nombre_ga, cargos.nombre_ga, sucursales.ciudad_ga 
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos ON empleados.id_cargo_empleados = cargos.id_cargo_ga
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga
WHERE empleados.genero_ga = 'Masculino';

/*5. Vista de Usuarios con Rol de Administrador*/
SELECT usuario_ga, clave_ga 
FROM tbl_usuarios_ga
WHERE rol_ga = 'Admin';  

/*6. Vista de Empleados con Salario Mayor a X*/
SELECT empleados.nombre_ga, cargos.sueldo_ga 
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos
ON cargos.id_cargo_ga = empleados.id_cargo_empleados
WHERE sueldo_ga > 3000;  

/*7. Vista de Empleados con Fecha de Ingreso Reciente*/
SELECT nombre_ga, fechahgreso_ga 
FROM tbl_empleados_ga
WHERE fechahgreso_ga >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

/*8. Vista de Empleados con Información de Usuario y Cargo*/
SELECT empleados.nombre_ga, usuarios.usuario_ga, cargos.nombre_ga 
FROM tbl_empleados_ga empleados
JOIN tbl_usuarios_ga usuarios ON empleados.id_usuario_empleados = usuarios.id_usuario_ga
JOIN tbl_cargos_ga cargos ON empleados.id_cargo_empleados = cargos.id_cargo_ga;

/*9. Vista de Sucursales con Número de Usuarios*/
SELECT sucursales.ciudad_ga, COUNT(usuarios.id_usuario_ga) AS total_usuarios
FROM tbl_sucursales_ga sucursales
JOIN tbl_empleados_ga empleados ON sucursales.id_sucursal_ga = empleados.id_sucursal_empleados
JOIN tbl_usuarios_ga usuarios ON empleados.id_usuario_empleados = usuarios.id_usuario_ga
GROUP BY sucursales.ciudad_ga;

/*10. Vista de Empleados con Información de Sucursal y Salario*/
SELECT empleados.nombre_ga, sucursales.ciudad_ga, cargos.sueldo_ga 
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos ON cargos.id_cargo_ga = empleados.id_cargo_empleados
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga; 

/*11. Vista de Usuarios con Información de Empleado y Sucursal*/
SELECT usuarios.usuario_ga, empleados.nombre_ga, sucursales.ciudad_ga 
FROM tbl_usuarios_ga usuarios
JOIN tbl_empleados_ga empleados ON usuarios.id_usuario_ga = empleados.id_usuario_empleados
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga;

/*12. Vista de Cargos con Número de Empleados*/
SELECT cargos.nombre_ga, COUNT(empleados.id_empleado_ga) AS total_empleados
FROM tbl_cargos_ga cargos
LEFT JOIN tbl_empleados_ga empleados ON cargos.id_cargo_ga = empleados.id_cargo_empleados
GROUP BY cargos.nombre_ga;

/*13. Vista de Empleados con Cargo y Salario Ordenada por Salario Descendente*/
SELECT empleados.nombre_ga, cargos.sueldo_ga 
FROM tbl_empleados_ga empleados
JOIN tbl_cargos_ga cargos
ON cargos.id_cargo_ga = empleados.id_cargo_empleados
ORDER BY cargos.sueldo_ga DESC; 

/*14. Vista Filtrada por Ciudad (ej: Caracas)*/
SELECT usuarios.usuario_ga, empleados.nombre_ga, sucursales.ciudad_ga 
FROM tbl_usuarios_ga usuarios
JOIN tbl_empleados_ga empleados ON usuarios.id_usuario_ga = empleados.id_usuario_empleados
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga
WHERE sucursales.ciudad_ga = 'Caracas';  

/*15. Vista con Salario Promedio por Cargo*/
SELECT cargos.nombre_ga, AVG(cargos.sueldo_ga) salario_promedio
FROM tbl_cargos_ga cargos
LEFT JOIN tbl_empleados_ga empleados ON cargos.id_cargo_ga = empleados.id_cargo_empleados
GROUP BY cargos.nombre_ga

/*16. Vista Filtrada por Género (ej: Masculino)*/
SELECT usuarios.usuario_ga, empleados.nombre_ga, sucursales.ciudad_ga 
FROM tbl_usuarios_ga usuarios
JOIN tbl_empleados_ga empleados ON usuarios.id_usuario_ga = empleados.id_usuario_empleados
JOIN tbl_sucursales_ga sucursales ON empleados.id_sucursal_empleados = sucursales.id_sucursal_ga
WHERE empleados.genero_ga = 'Masculino'; 
