-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2022 a las 22:52:18
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qpdata`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `descripcion` varchar(250) NOT NULL,
  `idPaciente1` int(11) NOT NULL,
  `IdMedico1` int(11) NOT NULL,
  `colortexto` varchar(50) DEFAULT NULL,
  `colorfondo` varchar(50) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCita`, `titulo`, `inicio`, `fin`, `descripcion`, `idPaciente1`, `IdMedico1`, `colortexto`, `colorfondo`, `estado`) VALUES
(38, 'Daniel Pelaez', '2022-10-30 18:54:00', '2022-10-30 19:56:00', 'Funciona ahora', 1035438899, 100, '#000000', '#000000', 'activo'),
(39, 'Andres Andrade', '2022-11-01 20:55:00', '2022-11-01 21:29:00', 'Esta enfermo', 1035438869, 0, '#fb0909', '#67f906', 'activo'),
(43, '', '2022-11-01 00:00:00', '2022-11-01 00:00:00', '', 1035438869, 0, '', '', 'no'),
(44, '', '2022-11-01 00:00:00', '2022-11-01 00:00:00', '', 1035438869, 0, '', '', 'no'),
(45, 'Daniel Pelaez', '2022-11-01 00:00:00', '2022-11-01 00:00:00', '', 1035438869, 0, '', '', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `idMedico` int(11) NOT NULL,
  `tipoDocumento` varchar(20) NOT NULL,
  `nombreMedico` varchar(50) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `IdUsuario2` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`idMedico`, `tipoDocumento`, `nombreMedico`, `direccion`, `telefono`, `email`, `imagen`, `IdUsuario2`, `estado`) VALUES
(0, 'cedula', 'huali', 'asaddadaasd', '12312313', 'asadsasd', 'asdasdasdasda', 12345678, 'activo'),
(100, 'cedula', 'Gustavo', 'asdasd', 'asdasd', 'adasd', 'asdasd', 100, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `idPaciente` int(11) NOT NULL,
  `nombrePaciente` varchar(50) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`idPaciente`, `nombrePaciente`, `direccion`, `telefono`, `email`, `imagen`, `estado`) VALUES
(1035438869, 'Andrea Suarez Jaramillo', 'avenida', '498', 'adasdasd@gmail.com', 'Hola otra vez', 'Inactivo'),
(1035438899, 'Daniel', 'carrera Norte 9 #34-71', '887782422', 'asdasdadsa@as.com', 'asdasdasdasda', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idPermiso` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `tipoDocumento` varchar(20) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `tipoDocumento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `estado`) VALUES
(100, 'cedula', 'casdwdad', 'asdasdadasdasdasd', 'asdasdadsa@as.com', 'medico', 'asdasd', 'asdasda', 'adsadaasd', 'activo'),
(12345678, 'cedula', 'calle 20 #20 A', 'asdasdadasdasdasd', 'asdasdadsa@as.com', 'medico', 'asdasdasada', 'yyytttt1123', 'asdasdasdasda', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariopermiso`
--

CREATE TABLE `usuariopermiso` (
  `idUsuarioPermiso` int(11) NOT NULL,
  `IdPermiso1` int(11) NOT NULL,
  `IdUsuario1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idPaciente1` (`idPaciente1`),
  ADD KEY `IdMedico1` (`IdMedico1`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`idMedico`),
  ADD KEY `IdUsuario2` (`IdUsuario2`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idPaciente`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idPermiso`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `usuariopermiso`
--
ALTER TABLE `usuariopermiso`
  ADD PRIMARY KEY (`idUsuarioPermiso`),
  ADD KEY `IdUsuario1` (`IdUsuario1`),
  ADD KEY `IdPermiso1` (`IdPermiso1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`idPaciente1`) REFERENCES `paciente` (`idPaciente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`IdMedico1`) REFERENCES `medico` (`idMedico`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`IdUsuario2`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariopermiso`
--
ALTER TABLE `usuariopermiso`
  ADD CONSTRAINT `usuariopermiso_ibfk_1` FOREIGN KEY (`IdUsuario1`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuariopermiso_ibfk_2` FOREIGN KEY (`IdPermiso1`) REFERENCES `permiso` (`idPermiso`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
