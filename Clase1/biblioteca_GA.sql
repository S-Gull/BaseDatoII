-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-01-2025 a las 20:10:29
-- Versión del servidor: 8.0.40-0ubuntu0.24.10.1
-- Versión de PHP: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca_GA`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_autores_GA`
--

CREATE TABLE `tbl_autores_GA` (
  `id_autor` int NOT NULL,
  `nombre` varchar(16) NOT NULL,
  `apellido` varchar(16) NOT NULL,
  `nacionalidad` varchar(20) DEFAULT NULL,
  `fecha_nac` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estados_GA`
--

CREATE TABLE `tbl_estados_GA` (
  `id_estado` int NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_generos_GA`
--

CREATE TABLE `tbl_generos_GA` (
  `id_genero` int NOT NULL,
  `genero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_libro_GA`
--

CREATE TABLE `tbl_libro_GA` (
  `id_libro` int NOT NULL,
  `titulo` varchar(12) NOT NULL,
  `editorial` varchar(8) NOT NULL,
  `fecha_public` date NOT NULL,
  `n_ejemplar` int NOT NULL,
  `isbn` int NOT NULL,
  `id_autor` int NOT NULL,
  `id_genero` int NOT NULL,
  `id_estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_prestamos_GA`
--

CREATE TABLE `tbl_prestamos_GA` (
  `id_prestamo` int NOT NULL,
  `fecha_prestamo` datetime NOT NULL,
  `fecha_devolucion` datetime NOT NULL,
  `id_libro` int NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipos_usuarios_GA`
--

CREATE TABLE `tbl_tipos_usuarios_GA` (
  `id_tipo_usuario` int NOT NULL,
  `tipo_usuario` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios_GA`
--

CREATE TABLE `tbl_usuarios_GA` (
  `id_usuario` int NOT NULL,
  `id_prestamo` int NOT NULL,
  `nombre` varchar(16) NOT NULL,
  `apellido` varchar(16) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `correo` varchar(60) NOT NULL,
  `id_tipo_usuario` int NOT NULL,
  `fecha_inscripcion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_autores_GA`
--
ALTER TABLE `tbl_autores_GA`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `tbl_estados_GA`
--
ALTER TABLE `tbl_estados_GA`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `tbl_generos_GA`
--
ALTER TABLE `tbl_generos_GA`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `tbl_libro_GA`
--
ALTER TABLE `tbl_libro_GA`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_autor` (`id_autor`),
  ADD KEY `id_genero` (`id_genero`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `tbl_prestamos_GA`
--
ALTER TABLE `tbl_prestamos_GA`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tbl_tipos_usuarios_GA`
--
ALTER TABLE `tbl_tipos_usuarios_GA`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `tbl_usuarios_GA`
--
ALTER TABLE `tbl_usuarios_GA`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_prestamo` (`id_prestamo`),
  ADD KEY `id_tipo_usuario` (`id_tipo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_autores_GA`
--
ALTER TABLE `tbl_autores_GA`
  MODIFY `id_autor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_estados_GA`
--
ALTER TABLE `tbl_estados_GA`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_generos_GA`
--
ALTER TABLE `tbl_generos_GA`
  MODIFY `id_genero` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_libro_GA`
--
ALTER TABLE `tbl_libro_GA`
  MODIFY `id_libro` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_prestamos_GA`
--
ALTER TABLE `tbl_prestamos_GA`
  MODIFY `id_prestamo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_tipos_usuarios_GA`
--
ALTER TABLE `tbl_tipos_usuarios_GA`
  MODIFY `id_tipo_usuario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios_GA`
--
ALTER TABLE `tbl_usuarios_GA`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_libro_GA`
--
ALTER TABLE `tbl_libro_GA`
  ADD CONSTRAINT `tbl_libro_GA_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `tbl_autores_GA` (`id_autor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_libro_GA_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `tbl_generos_GA` (`id_genero`),
  ADD CONSTRAINT `tbl_libro_GA_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estados_GA` (`id_estado`);

--
-- Filtros para la tabla `tbl_prestamos_GA`
--
ALTER TABLE `tbl_prestamos_GA`
  ADD CONSTRAINT `tbl_prestamos_GA_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `tbl_libro_GA` (`id_libro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_prestamos_GA_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios_GA` (`id_usuario`);

--
-- Filtros para la tabla `tbl_usuarios_GA`
--
ALTER TABLE `tbl_usuarios_GA`
  ADD CONSTRAINT `tbl_usuarios_GA_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `tbl_prestamos_GA` (`id_prestamo`),
  ADD CONSTRAINT `tbl_usuarios_GA_ibfk_2` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tbl_tipos_usuarios_GA` (`id_tipo_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
