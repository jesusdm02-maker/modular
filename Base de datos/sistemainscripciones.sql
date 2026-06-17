-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2026 a las 16:59:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemainscripciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL,
  `id_representante` int(11) DEFAULT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fecha_nacimiento` varchar(50) DEFAULT NULL,
  `alergias_condiciones` text DEFAULT NULL,
  `id_documento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_alumno`, `id_representante`, `nombres`, `apellidos`, `fecha_nacimiento`, `alergias_condiciones`, `id_documento`) VALUES
(1, 1, 'Diego', 'Pérez', '2015-05-12', 'Ninguna', 1),
(2, 2, 'Sofía', 'López', '2016-08-20', 'Asma', 2),
(3, 3, 'Luis', 'Ruiz', '2014-01-30', 'Alergia al Maní', 3),
(4, 4, 'Elena', 'García', '2017-11-15', 'Ninguna', 4),
(5, 5, 'Mateo', 'Infante', '2013-03-10', 'Dermatitis', 5),
(6, 6, 'Valeria', 'Torres', '2018-06-05', 'Ninguna', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `avenida` varchar(50) DEFAULT NULL,
  `num_casa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `municipio`, `calle`, `avenida`, `num_casa`) VALUES
(1, 'Libertador', 'Calle 1', 'Av. Bolivar', '10-A'),
(2, 'Chacao', 'Calle San Juan', 'Av. Francisco de Miranda', 'S/N'),
(3, 'Sucre', 'Calle El Sol', 'Av. Principal', '22'),
(4, 'Baruta', 'Calle 5', 'Av. Las Mercedes', 'Edif. 4'),
(5, 'Hatillo', 'Calle Comercio', 'Av. Central', '15'),
(6, 'Libertador', 'Calle 9', 'Av. Urdaneta', '101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_usuario`
--

CREATE TABLE `direccion_usuario` (
  `id_direccion_usuario` int(11) NOT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `avenida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion_usuario`
--

INSERT INTO `direccion_usuario` (`id_direccion_usuario`, `calle`, `avenida`) VALUES
(1, 'Principal', 'Libertador'),
(2, 'Calle 2', 'Urdaneta'),
(3, 'Sector 3', 'Fuerzas Armadas'),
(4, 'C1', 'C2'),
(5, 'Norte', 'Sur'),
(6, 'Este', 'Oeste');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_documento` int(11) NOT NULL,
  `nombre_documentos` varchar(50) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `id_movimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_documento`, `nombre_documentos`, `id_status`, `id_movimiento`) VALUES
(1, 'Partida de Nacimiento', 2, 1),
(2, 'Certificado de Salud', 2, 2),
(3, 'Notas Certificadas', 4, 3),
(4, 'Carta de Conducta', 1, 1),
(5, 'Fotos Carnet', 2, 4),
(6, 'Cédula Escolar', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `id_grado` int(11) NOT NULL,
  `nombre_grado` varchar(50) NOT NULL,
  `cupos_disponibles` int(11) DEFAULT NULL,
  `id_seccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id_grado`, `nombre_grado`, `cupos_disponibles`, `id_seccion`) VALUES
(1, '1er Grado', 30, 1),
(2, '2do Grado', 25, 2),
(3, '3er Grado', 20, 3),
(4, '4to Grado', 30, 4),
(5, '5to Grado', 15, 5),
(6, '6to Grado', 10, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL,
  `nombre_modulo` varchar(50) DEFAULT NULL,
  `codigo_interno` varchar(50) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id_modulo`, `nombre_modulo`, `codigo_interno`, `orden`) VALUES
(1, 'Inscripciones', 'INS01', 1),
(2, 'Reportes', 'REP02', 2),
(3, 'Configuración', 'CONF03', 3),
(4, 'Seguridad', 'SEG04', 4),
(5, 'Alumnos', 'ALU05', 5),
(6, 'Pagos', 'PAG06', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_movimiento` int(11) NOT NULL,
  `nombre_movimiento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id_movimiento`, `nombre_movimiento`) VALUES
(1, 'Nuevo Ingreso'),
(2, 'Regular'),
(3, 'Traslado'),
(4, 'Repitiente'),
(5, 'Reingreso'),
(6, 'Egreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginas`
--

CREATE TABLE `paginas` (
  `id_paginas` int(11) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `nombre_pagina` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paginas`
--

INSERT INTO `paginas` (`id_paginas`, `url`, `nombre_pagina`) VALUES
(1, '/index', 'Inicio'),
(2, '/alumnos/lista', 'Lista Alumnos'),
(3, '/perfil', 'Mi Perfil'),
(4, '/settings', 'Ajustes'),
(5, '/report/daily', 'Reporte Diario'),
(6, '/logout', 'Salir');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `id_periodo` int(11) NOT NULL,
  `año_inicio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id_periodo`, `año_inicio`) VALUES
(1, '2021-2022'),
(2, '2022-2023'),
(3, '2023-2024'),
(4, '2024-2025'),
(5, '2025-2026'),
(6, '2026-2027');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permisos` int(11) NOT NULL,
  `accion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permisos`, `accion`) VALUES
(1, 'Leer'),
(2, 'Crear'),
(3, 'Editar'),
(4, 'Eliminar'),
(5, 'Exportar'),
(6, 'Imprimir');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripciones`
--

CREATE TABLE `preinscripciones` (
  `id_preinscripcion` int(11) NOT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `id_r_g_p` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preinscripciones`
--

INSERT INTO `preinscripciones` (`id_preinscripcion`, `id_alumno`, `id_r_g_p`, `id_user`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 2),
(4, 4, 4, 4),
(5, 5, 5, 1),
(6, 6, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `id_representante` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre_completo` varchar(150) NOT NULL,
  `parentesco` varchar(50) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `representantes`
--

INSERT INTO `representantes` (`id_representante`, `cedula`, `nombre_completo`, `parentesco`, `id_direccion`, `id_telefono`) VALUES
(1, 'V-12345678', 'Juan Pérez', 'Padre', 1, 1),
(2, 'V-87654321', 'María López', 'Madre', 2, 2),
(3, 'V-11223344', 'Carlos Ruiz', 'Tío', 3, 3),
(4, 'V-44332211', 'Ana García', 'Madre', 4, 4),
(5, 'V-55667788', 'Pedro Infante', 'Abuelo', 5, 5),
(6, 'V-99887766', 'Laura Torres', 'Representante Legal', 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `cargo`) VALUES
(1, 'Administrador'),
(2, 'Editor'),
(3, 'Consultor'),
(4, 'SuperUser'),
(5, 'Invitado'),
(6, 'Auditor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_g_p`
--

CREATE TABLE `r_g_p` (
  `id_r_g_p` int(11) NOT NULL,
  `id_grado` int(11) DEFAULT NULL,
  `id_periodo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `r_g_p`
--

INSERT INTO `r_g_p` (`id_r_g_p`, `id_grado`, `id_periodo`) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 3, 4),
(4, 4, 4),
(5, 5, 4),
(6, 6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_mp_per`
--

CREATE TABLE `r_mp_per` (
  `id_r_mp_per` int(11) NOT NULL,
  `id_permisos` int(11) DEFAULT NULL,
  `id_modulo_pagina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `r_mp_per`
--

INSERT INTO `r_mp_per` (`id_r_mp_per`, `id_permisos`, `id_modulo_pagina`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_m_p`
--

CREATE TABLE `r_m_p` (
  `id_r_m_p` int(11) NOT NULL,
  `id_usuario_rol` int(11) DEFAULT NULL,
  `id_modulo` int(11) DEFAULT NULL,
  `id_paginas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `r_m_p`
--

INSERT INTO `r_m_p` (`id_r_m_p`, `id_usuario_rol`, `id_modulo`, `id_paginas`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_u_r`
--

CREATE TABLE `r_u_r` (
  `id_r_u_r` int(11) NOT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `r_u_r`
--

INSERT INTO `r_u_r` (`id_r_u_r`, `id_usuarios`, `id_rol`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL,
  `nombre_seccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id_seccion`, `nombre_seccion`) VALUES
(1, 'Sección A'),
(2, 'Sección B'),
(3, 'Sección C'),
(4, 'Sección D'),
(5, 'Sección E'),
(6, 'Sección F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `nombre_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id_status`, `nombre_status`) VALUES
(1, 'Pendiente'),
(2, 'Aprobado'),
(3, 'Rechazado'),
(4, 'En Revisión'),
(5, 'Incompleto'),
(6, 'Vencido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id_telefono` int(11) NOT NULL,
  `numero_telefono` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`id_telefono`, `numero_telefono`) VALUES
(1, '0414-1111111'),
(2, '0424-2222222'),
(3, '0412-3333333'),
(4, '0416-4444444'),
(5, '0426-5555555'),
(6, '0212-6666666');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `nombre`, `apellido`, `correo`) VALUES
(1, 'Admin', 'Sistemas', 'admin@escuela.com'),
(2, 'Secretaria', 'Principal', 'recepcion@escuela.com'),
(3, 'Director', 'General', 'direccion@escuela.com'),
(4, 'User1', 'Prueba', 'test1@escuela.com'),
(5, 'User2', 'Prueba', 'test2@escuela.com'),
(6, 'Soporte', 'Tecnico', 'it@escuela.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_direccion_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nombre`, `id_direccion_usuario`) VALUES
(1, 'Carlos', 1),
(2, 'Marta', 2),
(3, 'Jose', 3),
(4, 'Ramon', 4),
(5, 'Lucia', 5),
(6, 'Kevin', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `id_representante` (`id_representante`),
  ADD KEY `id_documento` (`id_documento`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`);

--
-- Indices de la tabla `direccion_usuario`
--
ALTER TABLE `direccion_usuario`
  ADD PRIMARY KEY (`id_direccion_usuario`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_documento`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_movimiento` (`id_movimiento`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`id_grado`),
  ADD KEY `id_seccion` (`id_seccion`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `paginas`
--
ALTER TABLE `paginas`
  ADD PRIMARY KEY (`id_paginas`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permisos`);

--
-- Indices de la tabla `preinscripciones`
--
ALTER TABLE `preinscripciones`
  ADD PRIMARY KEY (`id_preinscripcion`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_r_g_p` (`id_r_g_p`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`id_representante`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD KEY `id_direccion` (`id_direccion`),
  ADD KEY `id_telefono` (`id_telefono`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `r_g_p`
--
ALTER TABLE `r_g_p`
  ADD PRIMARY KEY (`id_r_g_p`),
  ADD KEY `id_grado` (`id_grado`),
  ADD KEY `id_periodo` (`id_periodo`);

--
-- Indices de la tabla `r_mp_per`
--
ALTER TABLE `r_mp_per`
  ADD PRIMARY KEY (`id_r_mp_per`),
  ADD KEY `id_permisos` (`id_permisos`),
  ADD KEY `id_modulo_pagina` (`id_modulo_pagina`);

--
-- Indices de la tabla `r_m_p`
--
ALTER TABLE `r_m_p`
  ADD PRIMARY KEY (`id_r_m_p`),
  ADD KEY `id_modulo` (`id_modulo`),
  ADD KEY `id_paginas` (`id_paginas`),
  ADD KEY `id_usuario_rol` (`id_usuario_rol`);

--
-- Indices de la tabla `r_u_r`
--
ALTER TABLE `r_u_r`
  ADD PRIMARY KEY (`id_r_u_r`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id_seccion`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id_telefono`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD KEY `id_direccion_usuario` (`id_direccion_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `direccion_usuario`
--
ALTER TABLE `direccion_usuario`
  MODIFY `id_direccion_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `paginas`
--
ALTER TABLE `paginas`
  MODIFY `id_paginas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permisos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `preinscripciones`
--
ALTER TABLE `preinscripciones`
  MODIFY `id_preinscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `id_representante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `r_g_p`
--
ALTER TABLE `r_g_p`
  MODIFY `id_r_g_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `r_mp_per`
--
ALTER TABLE `r_mp_per`
  MODIFY `id_r_mp_per` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `r_m_p`
--
ALTER TABLE `r_m_p`
  MODIFY `id_r_m_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `r_u_r`
--
ALTER TABLE `r_u_r`
  MODIFY `id_r_u_r` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `id_telefono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`id_representante`) REFERENCES `representantes` (`id_representante`),
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`id_documento`) REFERENCES `documento` (`id_documento`);

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  ADD CONSTRAINT `documento_ibfk_2` FOREIGN KEY (`id_movimiento`) REFERENCES `movimiento` (`id_movimiento`);

--
-- Filtros para la tabla `grados`
--
ALTER TABLE `grados`
  ADD CONSTRAINT `grados_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id_seccion`);

--
-- Filtros para la tabla `preinscripciones`
--
ALTER TABLE `preinscripciones`
  ADD CONSTRAINT `preinscripciones_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  ADD CONSTRAINT `preinscripciones_ibfk_2` FOREIGN KEY (`id_r_g_p`) REFERENCES `r_g_p` (`id_r_g_p`),
  ADD CONSTRAINT `preinscripciones_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Filtros para la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `representantes_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `representantes_ibfk_2` FOREIGN KEY (`id_telefono`) REFERENCES `telefono` (`id_telefono`);

--
-- Filtros para la tabla `r_g_p`
--
ALTER TABLE `r_g_p`
  ADD CONSTRAINT `r_g_p_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`),
  ADD CONSTRAINT `r_g_p_ibfk_2` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`);

--
-- Filtros para la tabla `r_mp_per`
--
ALTER TABLE `r_mp_per`
  ADD CONSTRAINT `r_mp_per_ibfk_1` FOREIGN KEY (`id_permisos`) REFERENCES `permisos` (`id_permisos`),
  ADD CONSTRAINT `r_mp_per_ibfk_2` FOREIGN KEY (`id_modulo_pagina`) REFERENCES `r_m_p` (`id_r_m_p`);

--
-- Filtros para la tabla `r_m_p`
--
ALTER TABLE `r_m_p`
  ADD CONSTRAINT `r_m_p_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`),
  ADD CONSTRAINT `r_m_p_ibfk_2` FOREIGN KEY (`id_paginas`) REFERENCES `paginas` (`id_paginas`),
  ADD CONSTRAINT `r_m_p_ibfk_3` FOREIGN KEY (`id_usuario_rol`) REFERENCES `r_u_r` (`id_r_u_r`);

--
-- Filtros para la tabla `r_u_r`
--
ALTER TABLE `r_u_r`
  ADD CONSTRAINT `r_u_r_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `r_u_r_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_direccion_usuario`) REFERENCES `direccion_usuario` (`id_direccion_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
