-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-02-2025 a las 17:21:44
-- Versión del servidor: 8.0.41-0ubuntu0.24.10.1
-- Versión de PHP: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_GA`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `horarios_alumnos_vista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `horarios_alumnos_vista` (
`hora_ga` time
,`materia` varchar(100)
,`nombre_ga` varchar(12)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_alumnos_GA`
--

CREATE TABLE `tbl_alumnos_GA` (
  `id_alumno_ga` int NOT NULL,
  `nombre_ga` varchar(12) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `fecha_ingreso_ga` date NOT NULL,
  `nota_ga` int NOT NULL,
  `id_salon_alumnos` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_alumnos_GA`
--

INSERT INTO `tbl_alumnos_GA` (`id_alumno_ga`, `nombre_ga`, `fecha_ingreso_ga`, `nota_ga`, `id_salon_alumnos`) VALUES
(1, 'Juan', '2020-01-01', 8, 1),
(2, 'Maria', '2020-01-02', 7, 1),
(3, 'Toño', '2019-01-01', 10, 2),
(4, 'Tere', '2020-01-04', 6, 2),
(5, 'Eva', '2020-03-02', 10, 3),
(6, 'Andres', '2019-11-28', 10, 4),
(7, 'Jean', '2020-01-04', 8, NULL),
(8, 'Victor', '2019-11-28', 9, NULL);

--
-- Disparadores `tbl_alumnos_GA`
--
DELIMITER $$
CREATE TRIGGER `logs_notas` AFTER UPDATE ON `tbl_alumnos_GA` FOR EACH ROW BEGIN
    INSERT INTO tbl_logs_GA (log_ga) 
    VALUES (CONCAT('Se actualizó la nota del alumno ID: ', NEW.id_alumno_ga, 
                    ', Nota anterior: ', OLD.nota_ga, 
                    ', Nueva nota: ', NEW.nota_ga))$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clases_GA`
--

CREATE TABLE `tbl_clases_GA` (
  `id_clase_ga` int NOT NULL,
  `id_alumno_clase` int NOT NULL,
  `id_materia_clase` int NOT NULL,
  `hora_ga` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_clases_GA`
--

INSERT INTO `tbl_clases_GA` (`id_clase_ga`, `id_alumno_clase`, `id_materia_clase`, `hora_ga`) VALUES
(1, 1, 1, '08:00:00'),
(2, 1, 2, '09:00:00'),
(3, 1, 3, '10:00:00'),
(4, 1, 4, '11:00:00'),
(5, 2, 5, '12:00:00'),
(6, 2, 1, '08:00:00'),
(7, 2, 2, '09:00:00'),
(8, 2, 3, '10:00:00'),
(9, 2, 4, '11:00:00'),
(10, 2, 5, '12:00:00'),
(11, 3, 1, '08:00:00'),
(12, 3, 2, '09:00:00'),
(13, 3, 3, '10:00:00'),
(14, 3, 4, '11:00:00'),
(15, 3, 5, '12:00:00'),
(16, 4, 1, '08:00:00'),
(17, 4, 2, '09:00:00'),
(18, 4, 3, '10:00:00'),
(19, 4, 4, '11:00:00'),
(20, 4, 5, '12:00:00'),
(21, 5, 1, '08:00:00'),
(22, 5, 2, '09:00:00'),
(23, 5, 3, '10:00:00'),
(24, 5, 4, '11:00:00'),
(25, 5, 5, '12:00:00'),
(26, 6, 1, '08:00:00'),
(27, 6, 2, '09:00:00'),
(28, 6, 3, '10:00:00'),
(29, 6, 4, '11:00:00'),
(30, 6, 5, '12:00:00'),
(31, 7, 1, '08:00:00'),
(32, 7, 2, '09:00:00'),
(33, 7, 3, '10:00:00'),
(34, 7, 4, '11:00:00'),
(35, 7, 5, '12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_logs_GA`
--

CREATE TABLE `tbl_logs_GA` (
  `id_log_ga` int NOT NULL,
  `log_ga` text COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_logs_GA`
--

INSERT INTO `tbl_logs_GA` (`id_log_ga`, `log_ga`) VALUES
(1, 'Se actualizó la nota del alumno ID: 5, Nota anterior: 5, Nueva nota: 10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_maestros_GA`
--

CREATE TABLE `tbl_maestros_GA` (
  `id_maestro_ga` int NOT NULL,
  `nombre_ga` varchar(12) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `grado_ga` varchar(4) COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_maestros_GA`
--

INSERT INTO `tbl_maestros_GA` (`id_maestro_ga`, `nombre_ga`, `grado_ga`) VALUES
(1, 'Mario', 'LIC'),
(2, 'Tere', 'DOC'),
(3, 'Alba', 'MC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_materias_GA`
--

CREATE TABLE `tbl_materias_GA` (
  `id_materia_ga` int NOT NULL,
  `nombre_ga` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_materias_GA`
--

INSERT INTO `tbl_materias_GA` (`id_materia_ga`, `nombre_ga`) VALUES
(1, 'Matematicas'),
(2, 'Español'),
(3, 'Ingles'),
(4, 'Sociales'),
(5, 'Naturales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_salones_GA`
--

CREATE TABLE `tbl_salones_GA` (
  `id_salon_ga` int NOT NULL,
  `grupo_ga` varchar(2) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `grado_ga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_salones_GA`
--

INSERT INTO `tbl_salones_GA` (`id_salon_ga`, `grupo_ga`, `grado_ga`) VALUES
(1, 'A', 1),
(2, 'B', 1),
(3, 'C', 1),
(4, 'D', 2),
(5, 'E', 2);

-- --------------------------------------------------------

--
-- Estructura para la vista `horarios_alumnos_vista`
--
DROP TABLE IF EXISTS `horarios_alumnos_vista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `horarios_alumnos_vista`  AS SELECT `alumnos`.`nombre_ga` AS `nombre_ga`, `clases`.`hora_ga` AS `hora_ga`, `materias`.`nombre_ga` AS `materia` FROM ((`tbl_clases_GA` `clases` join `tbl_alumnos_GA` `alumnos` on((`alumnos`.`id_alumno_ga` = `clases`.`id_alumno_clase`))) join `tbl_materias_GA` `materias` on((`materias`.`id_materia_ga` = `clases`.`id_materia_clase`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_alumnos_GA`
--
ALTER TABLE `tbl_alumnos_GA`
  ADD PRIMARY KEY (`id_alumno_ga`),
  ADD KEY `id_salon_alumnos` (`id_salon_alumnos`);

--
-- Indices de la tabla `tbl_clases_GA`
--
ALTER TABLE `tbl_clases_GA`
  ADD PRIMARY KEY (`id_clase_ga`),
  ADD KEY `id_alumno_clase` (`id_alumno_clase`),
  ADD KEY `id_materia_clase` (`id_materia_clase`);

--
-- Indices de la tabla `tbl_logs_GA`
--
ALTER TABLE `tbl_logs_GA`
  ADD PRIMARY KEY (`id_log_ga`);

--
-- Indices de la tabla `tbl_maestros_GA`
--
ALTER TABLE `tbl_maestros_GA`
  ADD PRIMARY KEY (`id_maestro_ga`);

--
-- Indices de la tabla `tbl_materias_GA`
--
ALTER TABLE `tbl_materias_GA`
  ADD PRIMARY KEY (`id_materia_ga`);

--
-- Indices de la tabla `tbl_salones_GA`
--
ALTER TABLE `tbl_salones_GA`
  ADD PRIMARY KEY (`id_salon_ga`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_alumnos_GA`
--
ALTER TABLE `tbl_alumnos_GA`
  MODIFY `id_alumno_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_clases_GA`
--
ALTER TABLE `tbl_clases_GA`
  MODIFY `id_clase_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `tbl_logs_GA`
--
ALTER TABLE `tbl_logs_GA`
  MODIFY `id_log_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_maestros_GA`
--
ALTER TABLE `tbl_maestros_GA`
  MODIFY `id_maestro_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_materias_GA`
--
ALTER TABLE `tbl_materias_GA`
  MODIFY `id_materia_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_salones_GA`
--
ALTER TABLE `tbl_salones_GA`
  MODIFY `id_salon_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_alumnos_GA`
--
ALTER TABLE `tbl_alumnos_GA`
  ADD CONSTRAINT `tbl_alumnos_GA_ibfk_1` FOREIGN KEY (`id_salon_alumnos`) REFERENCES `tbl_salones_GA` (`id_salon_ga`);

--
-- Filtros para la tabla `tbl_clases_GA`
--
ALTER TABLE `tbl_clases_GA`
  ADD CONSTRAINT `tbl_clases_GA_ibfk_1` FOREIGN KEY (`id_alumno_clase`) REFERENCES `tbl_alumnos_GA` (`id_alumno_ga`),
  ADD CONSTRAINT `tbl_clases_GA_ibfk_2` FOREIGN KEY (`id_materia_clase`) REFERENCES `tbl_materias_GA` (`id_materia_ga`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
