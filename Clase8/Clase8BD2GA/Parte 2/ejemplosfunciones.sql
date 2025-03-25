use escuela_GA;


SELECT fn_get_nombre_alumno(3) AS Nombre_Alumno;
SELECT fn_get_nombre_materia(1) AS Materia;
SELECT fn_get_nombre_salon(1) AS Salon;
SELECT fn_promedio_salon(1) AS Promedio_Salon;
SELECT fn_total_alumnos_materia(1) AS Alumnos_Matematicas;
SELECT fn_verificar_salon(5, 3) AS Pertenece;
SELECT fn_nota_maxima(3) AS Nota_Maxima;
SELECT fn_formatear_fecha('2020-01-01') AS Fecha_Formateada;