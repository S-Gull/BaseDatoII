-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-03-2025 a las 18:51:10
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
-- Base de datos: `empresa2_ga`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cargos_ga`
--

CREATE TABLE `tbl_cargos_ga` (
  `id_cargo_ga` int NOT NULL,
  `nombre_ga` varchar(50) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `sueldo_ga` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_cargos_ga`
--

INSERT INTO `tbl_cargos_ga` (`id_cargo_ga`, `nombre_ga`, `sueldo_ga`) VALUES
(1, 'Gerente', 5000),
(2, 'Analista', 3000),
(3, 'Desarrollador', 4000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleados_ga`
--

CREATE TABLE `tbl_empleados_ga` (
  `id_empleado_ga` int NOT NULL,
  `id_usuario_empleados` int NOT NULL,
  `id_cargo_empleados` int NOT NULL,
  `id_sucursal_empleados` int NOT NULL,
  `nombre_ga` varchar(59) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `fechahgreso_ga` date DEFAULT NULL,
  `correo_ga` varchar(50) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `genero_ga` enum('Femenino','Masculino') COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `estado_ga` enum('0','1') COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `codigo_empleado` varchar(50) COLLATE utf8mb3_spanish2_ci GENERATED ALWAYS AS (concat(`id_usuario_empleados`,_utf8mb3'0',`id_cargo_empleados`,_utf8mb3'0',`id_sucursal_empleados`,_utf8mb3'0',`estado_ga`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_empleados_ga`
--

INSERT INTO `tbl_empleados_ga` (`id_empleado_ga`, `id_usuario_empleados`, `id_cargo_empleados`, `id_sucursal_empleados`, `nombre_ga`, `fechahgreso_ga`, `correo_ga`, `genero_ga`, `estado_ga`) VALUES
(1, 1, 3, 1, 'Guillermo Alvarez', '2023-01-15', 'guillem@une.com', 'Masculino', '1'),
(2, 2, 3, 2, 'Jean Coffi', '2023-02-20', 'jcoffis@une.com', 'Masculino', '1'),
(3, 3, 2, 3, 'Luis Da Silva', '2023-03-10', 'Luis@une.com', 'Masculino', '1'),
(4, 4, 1, 2, 'Jesus Parra', '2023-01-10', 'jparra@une.com', 'Masculino', '1'),
(5, 5, 1, 2, 'Victor Contreras', '2024-06-10', 'vector@une.com', 'Masculino', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sucursales_ga`
--

CREATE TABLE `tbl_sucursales_ga` (
  `id_sucursal_ga` int NOT NULL,
  `ciudad_ga` text COLLATE utf8mb3_spanish2_ci NOT NULL,
  `direccion_ga` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono_ga` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_sucursales_ga`
--

INSERT INTO `tbl_sucursales_ga` (`id_sucursal_ga`, `ciudad_ga`, `direccion_ga`, `telefono_ga`) VALUES
(1, 'Caracas', 'el hatillo', '910000000'),
(2, 'Caracas', 'el marques', '930000000'),
(3, 'Anzoategui', 'Puerto la cruz', '960000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios_ga`
--

CREATE TABLE `tbl_usuarios_ga` (
  `id_usuario_ga` int NOT NULL,
  `usuario_ga` varchar(15) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `clave_ga` varchar(60) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `rol_ga` enum('Admin','Usuario') COLLATE utf8mb3_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios_ga`
--

INSERT INTO `tbl_usuarios_ga` (`id_usuario_ga`, `usuario_ga`, `clave_ga`, `rol_ga`) VALUES
(1, 'Guillem', '1234', 'Admin'),
(2, 'Jcoffi', '4321', 'Admin'),
(3, 'LuiSilva', '7485', 'Usuario'),
(4, 'Japarr', '7974', 'Usuario'),
(5, 'Vector', '5469', 'Usuario');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_cargos_empleados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_cargos_empleados` (
`Cargo` varchar(50)
,`Total_Empleados` bigint
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleados_cargos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleados_cargos` (
`Nombre_Empleado` varchar(59)
,`Correo` varchar(50)
,`Cargo` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleados_masculinos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleados_masculinos` (
`Nombre` varchar(59)
,`Cargo` varchar(50)
,`Ciudad_Sucursal` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleados_recientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleados_recientes` (
`Nombre` varchar(59)
,`Fecha_Ingreso` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleados_sucursal_salario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleados_sucursal_salario` (
`nombre_ga` varchar(59)
,`ciudad_ga` text
,`sueldo_ga` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleados_usuario_cargo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleados_usuario_cargo` (
`Nombre_Empleado` varchar(59)
,`Usuario` varchar(15)
,`Cargo` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_filtro_ciudad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_filtro_ciudad` (
`Usuario` varchar(15)
,`Nombre` varchar(59)
,`Ciudad` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_filtro_genero`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_filtro_genero` (
`Usuario` varchar(15)
,`Nombre` varchar(59)
,`Ciudad` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_salarios_descendentes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_salarios_descendentes` (
`Nombre` varchar(59)
,`Salario` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_salarios_promedio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_salarios_promedio` (
`Cargo` varchar(50)
,`Salario_Promedio` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_sucursales_empleados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_sucursales_empleados` (
`Ciudad` text
,`Total_Empleados` bigint
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_sucursales_total_usuarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_sucursales_total_usuarios` (
`Ciudad` text
,`Total_Usuarios` bigint
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuarios_admin`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuarios_admin` (
`Usuario` varchar(15)
,`Clave` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuarios_completa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuarios_completa` (
`Usuario` varchar(15)
,`Nombre_Empleado` varchar(59)
,`Ciudad_Sucursal` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuarios_empleados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuarios_empleados` (
`Login_Usuario` varchar(15)
,`Nombre_Empleado` varchar(59)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cargos_empleados`
--
DROP TABLE IF EXISTS `vista_cargos_empleados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cargos_empleados`  AS SELECT `cargos`.`nombre_ga` AS `Cargo`, count(`empleados`.`id_empleado_ga`) AS `Total_Empleados` FROM (`tbl_cargos_ga` `cargos` left join `tbl_empleados_ga` `empleados` on((`cargos`.`id_cargo_ga` = `empleados`.`id_cargo_empleados`))) GROUP BY `cargos`.`nombre_ga` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleados_cargos`
--
DROP TABLE IF EXISTS `vista_empleados_cargos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados_cargos`  AS SELECT `empleados`.`nombre_ga` AS `Nombre_Empleado`, `empleados`.`correo_ga` AS `Correo`, `cargos`.`nombre_ga` AS `Cargo` FROM (`tbl_empleados_ga` `empleados` join `tbl_cargos_ga` `cargos` on((`cargos`.`id_cargo_ga` = `empleados`.`id_cargo_empleados`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleados_masculinos`
--
DROP TABLE IF EXISTS `vista_empleados_masculinos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados_masculinos`  AS SELECT `empleados`.`nombre_ga` AS `Nombre`, `cargos`.`nombre_ga` AS `Cargo`, `sucursales`.`ciudad_ga` AS `Ciudad_Sucursal` FROM ((`tbl_empleados_ga` `empleados` join `tbl_cargos_ga` `cargos` on((`empleados`.`id_cargo_empleados` = `cargos`.`id_cargo_ga`))) join `tbl_sucursales_ga` `sucursales` on((`empleados`.`id_sucursal_empleados` = `sucursales`.`id_sucursal_ga`))) WHERE (`empleados`.`genero_ga` = 'Masculino') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleados_recientes`
--
DROP TABLE IF EXISTS `vista_empleados_recientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados_recientes`  AS SELECT `tbl_empleados_ga`.`nombre_ga` AS `Nombre`, `tbl_empleados_ga`.`fechahgreso_ga` AS `Fecha_Ingreso` FROM `tbl_empleados_ga` WHERE (`tbl_empleados_ga`.`fechahgreso_ga` >= (curdate() - interval 6 month)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleados_sucursal_salario`
--
DROP TABLE IF EXISTS `vista_empleados_sucursal_salario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados_sucursal_salario`  AS SELECT `empleados`.`nombre_ga` AS `nombre_ga`, `sucursales`.`ciudad_ga` AS `ciudad_ga`, `cargos`.`sueldo_ga` AS `sueldo_ga` FROM ((`tbl_empleados_ga` `empleados` join `tbl_cargos_ga` `cargos` on((`cargos`.`id_cargo_ga` = `empleados`.`id_cargo_empleados`))) join `tbl_sucursales_ga` `sucursales` on((`empleados`.`id_sucursal_empleados` = `sucursales`.`id_sucursal_ga`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleados_usuario_cargo`
--
DROP TABLE IF EXISTS `vista_empleados_usuario_cargo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados_usuario_cargo`  AS SELECT `empleados`.`nombre_ga` AS `Nombre_Empleado`, `usuarios`.`usuario_ga` AS `Usuario`, `cargos`.`nombre_ga` AS `Cargo` FROM ((`tbl_empleados_ga` `empleados` join `tbl_usuarios_ga` `usuarios` on((`empleados`.`id_usuario_empleados` = `usuarios`.`id_usuario_ga`))) join `tbl_cargos_ga` `cargos` on((`empleados`.`id_cargo_empleados` = `cargos`.`id_cargo_ga`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_filtro_ciudad`
--
DROP TABLE IF EXISTS `vista_filtro_ciudad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_filtro_ciudad`  AS SELECT `usuarios`.`usuario_ga` AS `Usuario`, `empleados`.`nombre_ga` AS `Nombre`, `sucursales`.`ciudad_ga` AS `Ciudad` FROM ((`tbl_usuarios_ga` `usuarios` join `tbl_empleados_ga` `empleados` on((`usuarios`.`id_usuario_ga` = `empleados`.`id_usuario_empleados`))) join `tbl_sucursales_ga` `sucursales` on((`empleados`.`id_sucursal_empleados` = `sucursales`.`id_sucursal_ga`))) WHERE (`sucursales`.`ciudad_ga` = 'Caracas') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_filtro_genero`
--
DROP TABLE IF EXISTS `vista_filtro_genero`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_filtro_genero`  AS SELECT `usuarios`.`usuario_ga` AS `Usuario`, `empleados`.`nombre_ga` AS `Nombre`, `sucursales`.`ciudad_ga` AS `Ciudad` FROM ((`tbl_usuarios_ga` `usuarios` join `tbl_empleados_ga` `empleados` on((`usuarios`.`id_usuario_ga` = `empleados`.`id_usuario_empleados`))) join `tbl_sucursales_ga` `sucursales` on((`empleados`.`id_sucursal_empleados` = `sucursales`.`id_sucursal_ga`))) WHERE (`empleados`.`genero_ga` = 'Masculino') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_salarios_descendentes`
--
DROP TABLE IF EXISTS `vista_salarios_descendentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_salarios_descendentes`  AS SELECT `empleados`.`nombre_ga` AS `Nombre`, `cargos`.`sueldo_ga` AS `Salario` FROM (`tbl_empleados_ga` `empleados` join `tbl_cargos_ga` `cargos` on((`cargos`.`id_cargo_ga` = `empleados`.`id_cargo_empleados`))) ORDER BY `cargos`.`sueldo_ga` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_salarios_promedio`
--
DROP TABLE IF EXISTS `vista_salarios_promedio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_salarios_promedio`  AS SELECT `cargos`.`nombre_ga` AS `Cargo`, avg(`cargos`.`sueldo_ga`) AS `Salario_Promedio` FROM (`tbl_cargos_ga` `cargos` left join `tbl_empleados_ga` `empleados` on((`cargos`.`id_cargo_ga` = `empleados`.`id_cargo_empleados`))) GROUP BY `cargos`.`nombre_ga` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_sucursales_empleados`
--
DROP TABLE IF EXISTS `vista_sucursales_empleados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_sucursales_empleados`  AS SELECT `sucursales`.`ciudad_ga` AS `Ciudad`, count(`empleados`.`id_empleado_ga`) AS `Total_Empleados` FROM (`tbl_sucursales_ga` `sucursales` join `tbl_empleados_ga` `empleados` on((`sucursales`.`id_sucursal_ga` = `empleados`.`id_sucursal_empleados`))) GROUP BY `sucursales`.`ciudad_ga` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_sucursales_total_usuarios`
--
DROP TABLE IF EXISTS `vista_sucursales_total_usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_sucursales_total_usuarios`  AS SELECT `sucursales`.`ciudad_ga` AS `Ciudad`, count(distinct `usuarios`.`id_usuario_ga`) AS `Total_Usuarios` FROM ((`tbl_sucursales_ga` `sucursales` join `tbl_empleados_ga` `empleados` on((`sucursales`.`id_sucursal_ga` = `empleados`.`id_sucursal_empleados`))) join `tbl_usuarios_ga` `usuarios` on((`empleados`.`id_usuario_empleados` = `usuarios`.`id_usuario_ga`))) GROUP BY `sucursales`.`ciudad_ga` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuarios_admin`
--
DROP TABLE IF EXISTS `vista_usuarios_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuarios_admin`  AS SELECT `tbl_usuarios_ga`.`usuario_ga` AS `Usuario`, `tbl_usuarios_ga`.`clave_ga` AS `Clave` FROM `tbl_usuarios_ga` WHERE (`tbl_usuarios_ga`.`rol_ga` = 'Admin') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuarios_completa`
--
DROP TABLE IF EXISTS `vista_usuarios_completa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuarios_completa`  AS SELECT `usuarios`.`usuario_ga` AS `Usuario`, `empleados`.`nombre_ga` AS `Nombre_Empleado`, `sucursales`.`ciudad_ga` AS `Ciudad_Sucursal` FROM ((`tbl_usuarios_ga` `usuarios` join `tbl_empleados_ga` `empleados` on((`usuarios`.`id_usuario_ga` = `empleados`.`id_usuario_empleados`))) join `tbl_sucursales_ga` `sucursales` on((`empleados`.`id_sucursal_empleados` = `sucursales`.`id_sucursal_ga`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuarios_empleados`
--
DROP TABLE IF EXISTS `vista_usuarios_empleados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuarios_empleados`  AS SELECT `usuarios`.`usuario_ga` AS `Login_Usuario`, `empleados`.`nombre_ga` AS `Nombre_Empleado` FROM (`tbl_usuarios_ga` `usuarios` join `tbl_empleados_ga` `empleados` on((`empleados`.`id_usuario_empleados` = `usuarios`.`id_usuario_ga`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_cargos_ga`
--
ALTER TABLE `tbl_cargos_ga`
  ADD PRIMARY KEY (`id_cargo_ga`);

--
-- Indices de la tabla `tbl_empleados_ga`
--
ALTER TABLE `tbl_empleados_ga`
  ADD PRIMARY KEY (`id_empleado_ga`),
  ADD KEY `id_usuario_empleados` (`id_usuario_empleados`),
  ADD KEY `id_cargo_empleados` (`id_cargo_empleados`),
  ADD KEY `id_sucursal_empleados` (`id_sucursal_empleados`);

--
-- Indices de la tabla `tbl_sucursales_ga`
--
ALTER TABLE `tbl_sucursales_ga`
  ADD PRIMARY KEY (`id_sucursal_ga`);

--
-- Indices de la tabla `tbl_usuarios_ga`
--
ALTER TABLE `tbl_usuarios_ga`
  ADD PRIMARY KEY (`id_usuario_ga`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_cargos_ga`
--
ALTER TABLE `tbl_cargos_ga`
  MODIFY `id_cargo_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_empleados_ga`
--
ALTER TABLE `tbl_empleados_ga`
  MODIFY `id_empleado_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_sucursales_ga`
--
ALTER TABLE `tbl_sucursales_ga`
  MODIFY `id_sucursal_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios_ga`
--
ALTER TABLE `tbl_usuarios_ga`
  MODIFY `id_usuario_ga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_empleados_ga`
--
ALTER TABLE `tbl_empleados_ga`
  ADD CONSTRAINT `tbl_empleados_ga_ibfk_1` FOREIGN KEY (`id_usuario_empleados`) REFERENCES `tbl_usuarios_ga` (`id_usuario_ga`),
  ADD CONSTRAINT `tbl_empleados_ga_ibfk_2` FOREIGN KEY (`id_cargo_empleados`) REFERENCES `tbl_cargos_ga` (`id_cargo_ga`),
  ADD CONSTRAINT `tbl_empleados_ga_ibfk_3` FOREIGN KEY (`id_sucursal_empleados`) REFERENCES `tbl_sucursales_ga` (`id_sucursal_ga`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
