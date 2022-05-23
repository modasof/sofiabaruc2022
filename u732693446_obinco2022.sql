-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-05-2022 a las 14:37:42
-- Versión del servidor: 10.5.12-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u732693446_obinco2022`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apu`
--

CREATE TABLE `apu` (
  `id` int(11) NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `vr_equipo` int(11) NOT NULL,
  `vr_material` int(11) NOT NULL,
  `vr_transporte` int(11) NOT NULL,
  `vr_mdo` int(11) NOT NULL,
  `vr_aiu` int(11) NOT NULL,
  `m1` int(11) NOT NULL,
  `p1` float NOT NULL,
  `m2` int(11) NOT NULL,
  `p2` float NOT NULL,
  `m3` int(11) NOT NULL,
  `p3` float NOT NULL,
  `m4` int(11) NOT NULL,
  `p4` float NOT NULL,
  `m5` int(11) NOT NULL,
  `p5` float NOT NULL,
  `m6` int(11) NOT NULL,
  `p6` float NOT NULL,
  `m7` int(11) NOT NULL,
  `p7` float NOT NULL,
  `m8` int(11) NOT NULL,
  `p8` float NOT NULL,
  `m9` int(11) NOT NULL,
  `p9` float NOT NULL,
  `m10` int(11) NOT NULL,
  `p10` float NOT NULL,
  `soporte` varchar(1200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id_caja` int(11) NOT NULL,
  `nombre_caja` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `saldo_inicial` int(11) NOT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `estado_caja` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `caja_publicada` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `creada_por` int(11) NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campamento`
--

CREATE TABLE `campamento` (
  `id_campamento` int(11) NOT NULL,
  `nombre_campamento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad_campamento` varchar(400) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion_campamento` varchar(400) COLLATE utf8_spanish_ci DEFAULT NULL,
  `responsable_campamento` varchar(400) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_cargo` int(11) NOT NULL,
  `cargo_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `nombre_cargo`, `estado_cargo`, `cargo_publicado`) VALUES
(1, 'Administrativo', 1, 1),
(2, 'Operador minicargador', 1, 1),
(3, 'Conductor volqueta Sencilla', 1, 1),
(4, 'Conductor  Volqueta Doble troque', 1, 1),
(5, 'Ayudante de equipos', 1, 1),
(6, 'Jefe de equipos', 1, 1),
(7, 'Ayudante de planta de Asfalto', 1, 1),
(8, 'Operador de planta', 1, 1),
(9, 'Conductor tractomula', 1, 1),
(10, 'Director de planta', 1, 1),
(11, 'Asistente administrativo', 1, 1),
(12, 'Contador', 1, 1),
(13, 'Cordinador financiero', 1, 1),
(14, 'Gerente general', 1, 1),
(15, 'Operador Pajarita', 1, 1),
(16, 'Operador Retro', 1, 1),
(17, 'Vigilante', 1, 1),
(18, 'Soldador', 1, 1),
(19, 'Operador Trituradora', 1, 1),
(20, 'Auxiliar SISO', 1, 1),
(21, 'Operador de Cargador', 1, 1),
(22, 'Operador Clasificadora', 1, 1),
(23, 'Ayudante de Trituradora', 1, 1),
(24, 'Ayudante de Clasificadora', 1, 1),
(25, 'Operador Bascula', 1, 1),
(26, 'Mecanico', 1, 1),
(27, 'Relaciones Publicas', 1, 1),
(28, 'Abogado', 1, 1),
(29, 'Auditoria', 1, 1),
(30, 'Oficios Varios', 1, 1),
(31, 'Auxiliar Contable', 1, 1),
(32, 'Coordinador HSE', 1, 1),
(33, 'Auxiliar HSE', 1, 1),
(36, 'Operador Maquinaria Pesada', 1, 1),
(37, 'Trabajador Social', 1, 1),
(39, 'Director de Obra', 1, 1),
(40, 'Ingeniero Residente', 1, 1),
(41, 'Jefe Logistica', 1, 1),
(42, 'Jefe Mantenimientos', 1, 1),
(43, 'Almacenista', 1, 1),
(44, 'Revisor Fiscal', 1, 1),
(45, 'Electrico', 1, 1),
(46, 'Rastrillero', 1, 1),
(47, 'Auxiliar de Logistica', 1, 1),
(48, 'Ingeniero de Sistemas', 1, 1),
(49, 'Jefe de Recursos Humanos', 1, 1),
(50, 'Conductor NPR', 1, 1),
(51, 'Asistente Administrativo y Financiero', 1, 1),
(52, 'Conductor', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriainsumos`
--

CREATE TABLE `categoriainsumos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoriainsumos`
--

INSERT INTO `categoriainsumos` (`id`, `nombre`, `publicado`) VALUES
(3, 'ACERO', 1),
(4, 'ADITIVO', 1),
(5, 'AGREGADOS', 1),
(6, 'AGUA', 1),
(7, 'CAL', 1),
(8, 'CEMENTANTE', 1),
(9, 'CLAVOS Y PUNTILLAS', 1),
(10, 'COMBUSTIBLE', 1),
(11, 'DOTACIÓN', 1),
(12, 'ELEMENTOS DE ASEO Y CAFETERIA', 1),
(13, 'ELEMENTOS DE BIOSEGURIDAD', 1),
(14, 'ELEMENTOS DE SEGURIDAD', 1),
(15, 'EPP', 1),
(16, 'EQUIPOS DE COMPUTACION', 1),
(17, 'EQUIPOS DE OFICINA', 1),
(18, 'EQUIPOS MENORES', 1),
(19, 'FILTROS', 1),
(20, 'FILTROS ', 1),
(21, 'HERRAMIENTAS MENORES', 1),
(22, 'LAMINA', 1),
(23, 'LLANTAS ', 1),
(24, 'LUBRICANTES ', 1),
(25, 'MADERA', 1),
(26, 'MANGUERAS ', 1),
(27, 'METALMECANICA', 1),
(28, 'PAPELERIA', 1),
(29, 'POLISOMBRA', 1),
(30, 'PREFABRICADOS', 1),
(31, 'REFRIGERIOS', 1),
(32, 'REPUESTO PLANTA', 1),
(33, 'REPUESTOS EQUIPO LIVIANO ', 1),
(34, 'REPUESTOS EQUIPOS PESADOS ', 1),
(35, 'REPUESTOS MAQUINARIA AMARILLA ', 1),
(36, 'SENALIZACION', 1),
(37, 'TORNILLERIA', 1),
(38, 'TORNILLERIA ', 1),
(39, 'TUBERIA DE ALCANTARILLADO', 1),
(40, 'TUBERIA DE PRESION', 1),
(41, 'TUBERIA SANITARIA', 1),
(42, 'ZINC', 1),
(43, 'Total general', 1),
(44, 'REPUESTOS VOLQUETA', 1),
(45, 'ELECTRICO', 1),
(46, 'CABLES', 1),
(47, 'ALAMBRE', 1),
(48, 'PINTURAS', 1),
(49, 'PREFABRICADO', 1),
(50, 'ACTIVO FIJO', 1),
(51, 'REFRIGERACION', 1),
(52, 'REPARACION DE SCANER', 1),
(53, 'CO2', 1),
(54, 'SERVICIO LATONERIA', 1),
(55, 'SERVICIO AIROLOGIA', 1),
(56, 'SELLOS', 1),
(57, 'SERVICIO TRANSPORTE', 0),
(58, 'INYECTOR', 1),
(59, 'FRENO', 1),
(60, 'SACO', 1),
(61, 'POLIETILENO', 1),
(62, 'PITA', 1),
(63, 'GATO HIDRAULICO', 1),
(64, 'FORMALETA', 1),
(65, 'CORREAS', 1),
(66, 'ADITIVOS', 1),
(67, 'ACEITE', 1),
(68, 'CAÑAMO', 1),
(69, 'REPUESTO EQ.MENORES', 1),
(70, 'PEGANTE', 1),
(71, 'CUBIERTA', 1),
(72, 'PERFILERIA', 1),
(73, 'SOLDADURA', 1),
(74, 'EQUIPO HIDRATACION', 1),
(75, 'SIKA', 1),
(76, 'ZUNCHOS', 1),
(77, 'BIENESTAR Y SALUD', 1),
(78, 'TANQUE', 1),
(79, 'BANDA', 1),
(80, 'ACTIVO FIJO', 1),
(81, 'HIDRATACION (AGUA)', 1),
(82, 'CONCRETOS', 1),
(83, 'ACCESORIO EQUIPO MEN', 1),
(84, 'CHAPA', 1),
(85, 'TUBERIA GALVANIZADA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_folder`
--

CREATE TABLE `categorias_folder` (
  `id` int(11) NOT NULL,
  `categoria_ppal` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_folder` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_folder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias_folder`
--

INSERT INTO `categorias_folder` (`id`, `categoria_ppal`, `nombre_folder`, `estado_folder`) VALUES
(1, 'Recursos Humanos', 'RECURSOS HUMANOS', 1),
(2, 'Recursos Humanos', 'SEGURIDAD Y SALUD EN EL TRABAJO', 1),
(3, 'Recursos Humanos', 'CARSUCRE', 1),
(4, 'Recursos Humanos', 'MINISTERIO DE TRABAJO', 1),
(5, 'Recursos Humanos', 'AGENCIA NACIONAL DE MINERIA', 1),
(6, 'Recursos Humanos', 'DOCUMENTOS VARIOS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheques`
--

CREATE TABLE `cheques` (
  `id_cheque` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `numero_cheque` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_cheque` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `concepto_cheque` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `valor_cheque` int(11) NOT NULL,
  `fecha_cheque` date NOT NULL,
  `cheque_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_cheque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `estado_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_precios`
--

CREATE TABLE `clientes_precios` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `origen_id` int(11) NOT NULL,
  `destino_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `canal_venta` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `valor_m3km` int(11) NOT NULL,
  `km_ruta` float NOT NULL,
  `valor_producto` int(11) NOT NULL,
  `valor_horamq` int(11) NOT NULL,
  `estado_precio` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `fecha_precio` date NOT NULL,
  `precio_publicado` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones_item`
--

CREATE TABLE `cotizaciones_item` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `proveedor_id_proveedor` int(11) NOT NULL,
  `cotizacion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `medio_pago` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `valor_cot` int(11) NOT NULL,
  `requisicion_id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `usuario_creador` int(11) NOT NULL,
  `usuario_aprobador` int(11) NOT NULL,
  `estado_cotizacion` int(11) NOT NULL,
  `ordencompra_num` int(11) NOT NULL,
  `insumo_id_insumo` int(11) NOT NULL,
  `servicio_id_servicio` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `vr_unitario` int(11) NOT NULL,
  `cantidadcot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id_cuenta` int(11) NOT NULL,
  `nombre_cuenta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cc_cuenta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `numero_cuenta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_cuenta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `banco` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `representante` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `saldo_inicial` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `estado_cuenta` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `cuenta_publicada` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id_cuenta`, `nombre_cuenta`, `cc_cuenta`, `numero_cuenta`, `tipo_cuenta`, `banco`, `representante`, `saldo_inicial`, `observaciones`, `estado_cuenta`, `creado_por`, `marca_temporal`, `cuenta_publicada`) VALUES
(5, 'CTA OBINCO', '901015115', 'Pendiente', 'Pendiente', 'Pendiente', 'JOSE DANIEL MEZA', '0', 'CUENTA PRINCIPAL', 1, 1, '2021-08-16 14:39:55', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id_destino` int(11) NOT NULL,
  `nombre_destino` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_entrada_ins`
--

CREATE TABLE `detalle_entrada_ins` (
  `id` int(11) NOT NULL,
  `cotizacion_item_id` int(11) NOT NULL,
  `oc_id` int(11) NOT NULL,
  `insumo_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `entrada_id` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado_detalle_entrada` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `entrada_por` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pagos_ordenescompra`
--

CREATE TABLE `detalle_pagos_ordenescompra` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `egreso_id` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado_pago` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_salida_ins`
--

CREATE TABLE `detalle_salida_ins` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `requisicion_id` int(11) NOT NULL,
  `insumo_id` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `valor_entregado` int(11) NOT NULL,
  `salida_id` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado_detalle_salida` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado_recibido` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `salida_por` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL,
  `modulo_id_modulo` int(11) NOT NULL,
  `nombre_documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id_documento`, `modulo_id_modulo`, `nombre_documento`, `estado_documento`) VALUES
(3, 1, 'EJEMPLO', 0),
(4, 4, 'Cedula de Ciudadania', 1),
(5, 1, 'RUT', 1),
(6, 1, 'Cedula Representante Legal', 1),
(7, 1, 'Cedula Representante Legal Suplente', 1),
(8, 1, 'Cedula del Contador publico', 1),
(9, 1, 'RUP', 1),
(10, 1, 'Certificacion Bancaria', 1),
(11, 1, 'Estados Financieros', 1),
(12, 1, 'Certificado de existencia y representacion legal', 1),
(13, 1, 'Declaracion de Renta', 1),
(14, 2, 'Contrato Arrendamiento', 1),
(15, 2, 'Soat', 1),
(16, 2, 'Tarjeta de Propiedad', 1),
(17, 2, 'Factura', 1),
(18, 2, 'CONTRATO LEASING Y/O CESION', 1),
(19, 2, 'DECLARACION DE IMPORTACION', 1),
(20, 2, 'POLIZA', 1),
(21, 2, 'TECNOMECANICA', 1),
(22, 1, 'Acuerdo consorcial', 1),
(23, 1, 'Brochure', 1),
(24, 1, 'Acta de inicio', 1),
(25, 2, 'CONTRATO DE COMPRA-VENTA', 1),
(26, 3, 'Hoja de vida', 1),
(27, 3, 'Documento Identidad', 1),
(28, 3, 'Contrato', 1),
(29, 3, 'Certificacion Bancaria', 1),
(30, 3, 'ARL', 1),
(31, 3, 'EPS', 1),
(32, 3, 'Capacitacion Seguridad e higiene', 0),
(33, 3, 'Examen de Ingreso', 1),
(34, 3, 'CERTIFICACION PENSION', 0),
(35, 1, 'composicion accionaria', 1),
(36, 1, 'estatutos', 1),
(37, 1, 'Registro mercantil', 1),
(38, 5, 'RUT', 1),
(39, 5, 'CERTIFICACION BANCARIA', 1),
(40, 6, 'RUT', 1),
(41, 6, 'CAMARA Y COMERCIO', 1),
(42, 2, 'LICENCIA CONDUCTOR', 1),
(43, 2, 'HOJA DE VIDA EQUIPO', 1),
(44, 3, 'Licencia de Conduccion', 1),
(45, 3, 'Caja de compensacion familiar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_varios`
--

CREATE TABLE `documentos_varios` (
  `id_midocumento` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `id_folder` int(11) NOT NULL,
  `nombre_documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expira` date NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_midocumento` int(11) NOT NULL,
  `midocumento_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_variosemp`
--

CREATE TABLE `documentos_variosemp` (
  `id_midocumento` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `id_folder` int(11) NOT NULL,
  `nombre_documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expira` date NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_midocumento` int(11) NOT NULL,
  `midocumento_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_varioseq`
--

CREATE TABLE `documentos_varioseq` (
  `id_midocumento` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `nombre_documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expira` date NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_midocumento` int(11) NOT NULL,
  `midocumento_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_variosprov`
--

CREATE TABLE `documentos_variosprov` (
  `id_midocumento` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `nombre_documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expira` date NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_midocumento` int(11) NOT NULL,
  `midocumento_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos_caja`
--

CREATE TABLE `egresos_caja` (
  `id_egreso_caja` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `tipo_beneficiario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_egreso` date NOT NULL,
  `caja_ppal` int(11) NOT NULL,
  `caja_id_caja` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `beneficiario` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `identificacion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_rubro` int(11) DEFAULT NULL,
  `id_subrubro` int(11) DEFAULT NULL,
  `valor_egreso` int(11) NOT NULL,
  `observaciones` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `egreso_publicado` int(11) NOT NULL,
  `estado_egreso` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `aplica_equipo` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos_cuenta`
--

CREATE TABLE `egresos_cuenta` (
  `id_egreso_cuenta` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `tipo_egreso` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cuenta_beneficiada` int(11) NOT NULL,
  `proveedor_id_proveedor` int(11) NOT NULL,
  `beneficiario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_rubro` int(11) NOT NULL,
  `id_subrubro` int(11) NOT NULL,
  `caja_beneficiada` int(11) NOT NULL,
  `egreso_en` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cheque_id_cheque` int(11) NOT NULL,
  `valor_egreso` int(11) NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `estado_egreso` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `egreso_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `fecha_egreso` date NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_ins`
--

CREATE TABLE `entradas_ins` (
  `id_entrada_ins` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `tipo_entrada` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `nombre_equipo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `marca_equipo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `serial_equipo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `unidad_trabajo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_equipo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `placa` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `propietario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `valor_activo` float NOT NULL,
  `motor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `peso` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_adquisicion` date NOT NULL,
  `estado_equipo` int(11) NOT NULL,
  `equipo_publicado` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `modulo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `comision` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipostemporales`
--

CREATE TABLE `equipostemporales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `unidadmedida_id` int(11) NOT NULL,
  `publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipotipomantenimiento`
--

CREATE TABLE `equipotipomantenimiento` (
  `id` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `tipomantenimiento_id_tipomantenimiento` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE `estaciones` (
  `id_estacion` int(11) NOT NULL,
  `nombre_estacion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_estacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosreq`
--

CREATE TABLE `estadosreq` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `publicado` int(11) NOT NULL,
  `color` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `prioridad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas_compras`
--

CREATE TABLE `facturas_compras` (
  `id` int(11) NOT NULL,
  `proveedor_id_proveedor` int(11) NOT NULL,
  `facturanum` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `valor_total` int(11) NOT NULL,
  `valor_ret` int(11) NOT NULL,
  `valor_iva` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_factura` int(11) NOT NULL,
  `factura_publicada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formatos`
--

CREATE TABLE `formatos` (
  `id_midocumento` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `nombre_documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expira` date NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_midocumento` int(11) NOT NULL,
  `midocumento_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_funcionario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `tipo_contrato` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cargo_id_cargo` int(11) NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `creado_por` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `funcionario_publicado` int(11) NOT NULL,
  `estado_funcionario` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `arl` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `eps` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `salario` int(11) NOT NULL,
  `ciudad` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_documental`
--

CREATE TABLE `gestion_documental` (
  `id_registro` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `documento_id_documento` int(11) NOT NULL,
  `modulo_id_modulo` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `gestion_estado` int(11) NOT NULL,
  `gestion_publicado` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_documentalemp`
--

CREATE TABLE `gestion_documentalemp` (
  `id_registro` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `documento_id_documento` int(11) NOT NULL,
  `modulo_id_modulo` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `gestion_estado` int(11) NOT NULL,
  `gestion_publicado` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_documentaleq`
--

CREATE TABLE `gestion_documentaleq` (
  `id_registro` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `documento_id_documento` int(11) NOT NULL,
  `modulo_id_modulo` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `gestion_estado` int(11) NOT NULL,
  `gestion_publicado` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_documentalprov`
--

CREATE TABLE `gestion_documentalprov` (
  `id_registro` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `documento_id_documento` int(11) NOT NULL,
  `modulo_id_modulo` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `gestion_estado` int(11) NOT NULL,
  `gestion_publicado` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos_caja`
--

CREATE TABLE `ingresos_caja` (
  `id_ingreso_caja` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `tipo_beneficiario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `caja_ppal` int(11) NOT NULL,
  `caja_id_caja` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `beneficiario` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `identificacion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_rubro` int(11) DEFAULT NULL,
  `id_subrubro` int(11) DEFAULT NULL,
  `valor_ingreso` int(11) NOT NULL,
  `observaciones` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `ingreso_publicado` int(11) NOT NULL,
  `estado_ingreso` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `ingreso_por_cuentas` int(11) NOT NULL,
  `ingreso_por_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos_cuenta`
--

CREATE TABLE `ingresos_cuenta` (
  `id_ingreso_cuenta` int(11) NOT NULL,
  `cuenta_id_cuenta` int(11) NOT NULL,
  `cuenta_aportante` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `concepto` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `ingreso_por` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `factura_num` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `valor_ingreso` bigint(20) NOT NULL,
  `ingreso_en` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `num_cheque` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `concepto_cheque` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_ingreso` int(11) NOT NULL,
  `ingreso_publicado` int(11) NOT NULL,
  `ingreso_por_cuentas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id_insumo` int(11) NOT NULL,
  `nombre_insumo` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `estado_insumo` int(11) NOT NULL,
  `unidadmedida_id` int(11) DEFAULT NULL,
  `categoriainsumo_id` int(11) NOT NULL,
  `parametrizado` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `cantidadminima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumoscampamento`
--

CREATE TABLE `insumoscampamento` (
  `id` int(11) NOT NULL,
  `insumo_id_insumo` int(11) NOT NULL,
  `campamento_id_campamento` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `fecha_modificado` datetime NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumoscampamentohistorial`
--

CREATE TABLE `insumoscampamentohistorial` (
  `id` int(11) NOT NULL,
  `insumo_id_insumo` int(11) NOT NULL,
  `campamento_id_campamento` int(11) NOT NULL,
  `movimiento_inventario_id` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `observacion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `tipo_movimiento` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_usuarios`
--

CREATE TABLE `log_usuarios` (
  `id` int(11) NOT NULL,
  `usuario_creador` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `log_detalle` longtext COLLATE utf8_spanish_ci NOT NULL,
  `log_modulo` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `m_clientes` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_productos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_insumos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_proveedores` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_carpetas` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_usuarios` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_funcionarios` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_documentos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_rubros` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_subrubro` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_destinos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_proyectos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_estaciones` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_empleados` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_gdocempleados` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_novedades` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_cuentas` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_gdoccuentas` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_cajas` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_consolidadocajas` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_equipos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_gdocequipos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_campamentos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_mantenimientos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_ventas` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_ventasalquiler` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_cuentasxpagar` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_compras` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_comprainsumos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_despachos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_combustible` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_horas` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_horasmq` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_informe1` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `m_concreto` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `m_categoriains` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `m_cotizaciones` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_rq` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_rqentrada` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_rqsalida` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_cargos` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_crucecuentas` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_egresoscajacontador` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_ingresoscajacontador` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_entradasinv` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_entradasdetalleinv` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_salidasinv` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_salidasdetalleinv` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_inventario` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `m_cuentasxpagarusuario` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `id_rol`, `id_usuario`, `m_clientes`, `m_productos`, `m_insumos`, `m_proveedores`, `m_carpetas`, `m_usuarios`, `m_funcionarios`, `m_documentos`, `m_rubros`, `m_subrubro`, `m_destinos`, `m_proyectos`, `m_estaciones`, `m_empleados`, `m_gdocempleados`, `m_novedades`, `m_cuentas`, `m_gdoccuentas`, `m_cajas`, `m_consolidadocajas`, `m_equipos`, `m_gdocequipos`, `m_campamentos`, `m_mantenimientos`, `m_ventas`, `m_ventasalquiler`, `m_cuentasxpagar`, `m_compras`, `m_comprainsumos`, `m_despachos`, `m_combustible`, `m_horas`, `m_horasmq`, `m_informe1`, `m_concreto`, `m_categoriains`, `m_cotizaciones`, `m_rq`, `m_rqentrada`, `m_rqsalida`, `m_cargos`, `m_crucecuentas`, `m_egresoscajacontador`, `m_ingresoscajacontador`, `m_entradasinv`, `m_entradasdetalleinv`, `m_salidasinv`, `m_salidasdetalleinv`, `m_inventario`, `m_cuentasxpagarusuario`) VALUES
(137, 1, 151, 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si'),
(219, 1, 233, 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si'),
(220, 5, 234, 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(221, 5, 235, 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'Si', 'Si', 'Si', 'No', 'No', 'No', 'No', 'Si', 'Si', 'No', 'Si', 'No', 'No', 'No', 'No', 'No', 'Si', 'Si', 'Si', 'Si', 'No', 'No', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misdocumentos`
--

CREATE TABLE `misdocumentos` (
  `id_midocumento` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_expira` date NOT NULL,
  `alerta` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_midocumento` int(11) NOT NULL,
  `midocumento_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id_modulo` int(11) NOT NULL,
  `nombre_modulo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id_modulo`, `nombre_modulo`, `estado_modulo`) VALUES
(1, 'Cuentas', 1),
(2, 'Equipos', 1),
(3, 'Empleados', 1),
(4, 'Personal', 1),
(5, 'Proveedores', 1),
(6, 'Clientes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo_alertas`
--

CREATE TABLE `modulo_alertas` (
  `id` int(11) NOT NULL,
  `usuario_creador` int(11) NOT NULL,
  `accion` int(11) NOT NULL,
  `usuario_receptor` int(11) NOT NULL,
  `rol_receptor` int(11) NOT NULL,
  `estado_alerta` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `fecha_leida` date NOT NULL,
  `marca_leida` datetime NOT NULL,
  `detalle` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientositem`
--

CREATE TABLE `movimientositem` (
  `id` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `estado_mov_item` int(11) NOT NULL,
  `insumo_id_insumo` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `id` int(11) NOT NULL,
  `tipo_movimiento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `id` int(11) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  `reportado_por` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_novedad` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_novedad` date NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_novedad` int(11) NOT NULL,
  `novedad_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenescompra`
--

CREATE TABLE `ordenescompra` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `imagen_cot` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `valor_total` int(11) NOT NULL,
  `valor_retenciones` int(11) NOT NULL,
  `valor_iva` int(11) NOT NULL,
  `estado_orden` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `proveedor_id_proveedor` int(11) NOT NULL,
  `medio_pago` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `usuario_creador` int(11) NOT NULL,
  `rubro_id` int(11) NOT NULL,
  `subrubro_id` int(11) NOT NULL,
  `vencimiento` int(11) NOT NULL,
  `factura` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_recibido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `compra_de` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `estado_producto` int(11) NOT NULL,
  `insumos_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosinsumos`
--

CREATE TABLE `productosinsumos` (
  `id` int(11) NOT NULL,
  `insumo_id_insumo` int(11) NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `fecha_modificado` datetime NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_proveedor` int(11) NOT NULL,
  `nit` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `contacto` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `telefonos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id_proyecto` int(11) NOT NULL,
  `nombre_proyecto` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_abonos`
--

CREATE TABLE `reporte_abonos` (
  `id` int(11) NOT NULL,
  `fecha_abono` date NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `reporte_id_factura` int(11) NOT NULL,
  `reporte_id_prestamo` int(11) NOT NULL,
  `reporte_id_cuentaxpagar` int(11) NOT NULL,
  `valor_abono` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_bandas_trituradora`
--

CREATE TABLE `reporte_bandas_trituradora` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `distribucion` float NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_combustibles`
--

CREATE TABLE `reporte_combustibles` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `proyecto_id_proyecto` int(11) NOT NULL,
  `despachado_por` int(11) NOT NULL,
  `punto_despacho` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `recibido_por` int(11) NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `indicador` float NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `autorizado` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_compras`
--

CREATE TABLE `reporte_compras` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `insumo_id_insumo` int(11) NOT NULL,
  `id_rubro` int(11) NOT NULL,
  `id_subrubro` int(11) NOT NULL,
  `proveedor_id_proveedor` int(11) NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `vence` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `pago_con` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `beneficiario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_comprasinsumos`
--

CREATE TABLE `reporte_comprasinsumos` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `insumo_id_insumo` int(11) NOT NULL,
  `proveedor_id_proveedor` int(11) NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `vence` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `campamento_id_campamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_despachos`
--

CREATE TABLE `reporte_despachos` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `despachado_por` int(11) NOT NULL,
  `transportado_por` int(11) NOT NULL,
  `despachador_tm` int(11) NOT NULL,
  `tipo_despacho` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `viajes` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_despachosclientes`
--

CREATE TABLE `reporte_despachosclientes` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `remision` int(11) NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `despachado_por` int(11) NOT NULL,
  `transporte` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `kilometraje` float NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `valor_material` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `viajes` int(11) NOT NULL,
  `radicada` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_radicada` date NOT NULL,
  `factura` int(11) NOT NULL,
  `pagado` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `campamento_id_campamento` int(11) DEFAULT NULL,
  `id_destino_origen` int(11) NOT NULL,
  `id_destino_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_despachosconcreto`
--

CREATE TABLE `reporte_despachosconcreto` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `remision` int(11) NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `despachado_por` int(11) NOT NULL,
  `transporte` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `kilometraje` float NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `valor_material` int(11) NOT NULL,
  `contador1` int(11) NOT NULL,
  `contador2` int(11) NOT NULL,
  `puntos` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `viajes` int(11) NOT NULL,
  `radicada` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_radicada` date NOT NULL,
  `factura` int(11) NOT NULL,
  `pagado` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `campamento_id_campamento` int(11) DEFAULT NULL,
  `id_destino_origen` int(11) NOT NULL,
  `id_destino_destino` int(11) NOT NULL,
  `proyecto_id_proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_despachosconcretodetalle`
--

CREATE TABLE `reporte_despachosconcretodetalle` (
  `id` int(11) NOT NULL,
  `reporte_despachosconcreto_id` int(11) DEFAULT NULL,
  `puntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_equipos`
--

CREATE TABLE `reporte_equipos` (
  `id_reporte` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL,
  `valor_reporte` int(11) NOT NULL,
  `num_trabajado` float NOT NULL,
  `dias_trabajados` int(11) NOT NULL,
  `unidad_trabajo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `num_galones` float NOT NULL,
  `valor_combustible` int(11) NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `actividad` longtext COLLATE utf8_spanish_ci NOT NULL,
  `repuesto` longtext COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `creado_por` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `num_factura` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_estado_equipos`
--

CREATE TABLE `reporte_estado_equipos` (
  `id` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `estado_sel` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tiempo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado_publicado` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_facturas`
--

CREATE TABLE `reporte_facturas` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `valor_total` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_horas`
--

CREATE TABLE `reporte_horas` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `despachado_por` int(11) NOT NULL,
  `punto_despacho` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `recibido_por` int(11) NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `indicador` float NOT NULL,
  `hora_inactiva` float NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_horasmq`
--

CREATE TABLE `reporte_horasmq` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `despachado_por` int(11) NOT NULL,
  `punto_despacho` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `recibido_por` int(11) NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `valor_hora_operador` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `indicador` float NOT NULL,
  `hora_inactiva` float NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `proyecto_id_proyecto` int(11) NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `equipo_adicional` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_equipo_adicional` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_prestamos`
--

CREATE TABLE `reporte_prestamos` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `fecha_final` date NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `valor_prestamo` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `estado_pago` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_ventas`
--

CREATE TABLE `reporte_ventas` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `valor_m3` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_reporte` int(11) NOT NULL,
  `reporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `estado_pago` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `cantidaddespachos` int(11) DEFAULT NULL,
  `num_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisiciones`
--

CREATE TABLE `requisiciones` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `solicitado_por` int(11) NOT NULL,
  `requisicion_num` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `proyecto_id_proyecto` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `usuario_creador` int(11) NOT NULL,
  `requisicion_publicada` int(11) NOT NULL,
  `estado_id_requisicion` int(11) NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `tipo_requisicion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rq_area` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rubro_id` int(11) NOT NULL,
  `subrubro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisiciones_items`
--

CREATE TABLE `requisiciones_items` (
  `id` int(11) NOT NULL,
  `actividad` longtext COLLATE utf8_spanish_ci NOT NULL,
  `insumo_id_insumo` int(11) NOT NULL,
  `servicio_id_servicio` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `cantidad` float NOT NULL,
  `fecha_entrega` date NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `requisicion_id` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `usuario_creador` int(11) NOT NULL,
  `estado_item` int(11) NOT NULL,
  `item_publicado` int(11) NOT NULL,
  `tipo_req` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `ordencompra_num` int(11) NOT NULL,
  `duplicado_de` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Super Admin'),
(2, 'Equipos'),
(4, 'Conductor Dobletroque'),
(5, 'Siso'),
(6, 'Cliente'),
(7, 'Admin Volquetas'),
(8, 'Jefe Planta'),
(10, 'Operador Maquinaria'),
(11, 'Asistente Administrativo y contable'),
(12, 'Asistente Contable'),
(13, 'Almacen'),
(14, 'Requisiciones'),
(15, 'Director de Obra'),
(16, 'Conductor Tractomula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE `rubros` (
  `id_rubro` int(11) NOT NULL,
  `nombre_rubro` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rubros`
--

INSERT INTO `rubros` (`id_rubro`, `nombre_rubro`) VALUES
(1, 'GASTOS DE MAQUINARIA'),
(2, 'GASTOS DE VOLQUETA'),
(3, 'GASTOS DE OBRA'),
(4, 'GASTOS ADMINISTRATIVOS'),
(5, 'OTROS'),
(6, 'MOVIMIENTOS FINANCIEROS'),
(7, 'GASTOS PLANTA DE CONCRETO'),
(8, 'IMPUESTOS'),
(9, 'GASTOS EQUIPOS MENORES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas_ins`
--

CREATE TABLE `salidas_ins` (
  `id_salida_ins` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `proyecto_id_proyecto` int(11) NOT NULL,
  `aplica_equipo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `requisicion_id` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `solicitado_por` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `recibido_por` int(11) NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `tipo_salida` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `valor_salida` int(11) NOT NULL,
  `estado_salida` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_recepcion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `unidadmedida_id` int(11) NOT NULL,
  `publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `unidadmedida_id`, `publicado`) VALUES
(1, 'MÉCANICO DIESEL', 6, 1),
(2, 'AYUDANTE ', 6, 1),
(3, 'AUXILIAR', 6, 1),
(4, 'ELECTRICISTA', 6, 1),
(5, 'PLOMERO', 6, 1),
(6, 'OFICIOS VARIOS', 6, 1),
(7, 'JARDINERO', 6, 1),
(8, 'TOPOGRAFIA', 6, 1),
(9, 'ALQUILER DE VEHICULO', 6, 1),
(10, 'SUPERVISORES DE EMPRESAS PUBLICAS', 6, 1),
(11, 'AUXILIAR DE SOLDADURA ', 6, 1),
(12, 'SOLDADURA ESPECIALIZADA Y TORNO ', 6, 1),
(13, 'LLANTERIA ', 6, 1),
(14, 'LABORATORIO DIESEL', 6, 1),
(15, 'REPARACION GATOS HIDRAULICOS', 6, 1),
(16, 'REPARACION RADIADORES ', 6, 1),
(17, 'INGENIERO DE SISTEMAS', 6, 1),
(18, 'MANTENIMIENTO AIRE ACONDICIONADO', 6, 1),
(19, 'MANTENIMIENTO CAMARAS', 6, 1),
(20, 'AYUDANTE PLANTA DE CONCRETO', 6, 1),
(21, 'AUXILIAR DE CARGUE Y DESCARGUE DE CEMENTO (COTERO)', 6, 1),
(22, 'TECNICO DE AIRE COMPRIMIDO (AIROLOGO)', 6, 1),
(23, 'EXAMEN DE SALUD OCUPACIONAL', 6, 1),
(24, 'RECARGA DE EXTINTORES', 6, 1),
(25, 'MANTENIMIENTO LOCATIVO INSTALACIONES FISICAS', 6, 1),
(26, 'CAPACITACIONES Y JORNADAS EDUCATIVAS', 6, 1),
(27, 'BORDADO', 6, 1),
(28, 'otro', 1, 1),
(29, 'SERVICIO DE TRANSPORTE', 6, 1),
(30, 'MENSAJERIA', 6, 1),
(31, 'EXAMEN DE MANEJO DEFENSIVO', 6, 1),
(32, 'MANO DE OBRA', 6, 1),
(33, 'REPARACION LIMPIA VIDRIOS', 6, 1),
(34, 'CERTIFICACION MAQUINARIA', 6, 1),
(35, 'DIA DOMINICAL', 20, 1),
(36, 'VIATICOS CERETE CORDOBA', 6, 1),
(37, 'REPARACION MODULO INTER 7600', 6, 1),
(38, 'REPARACION Y CALIBRACION BOMBA DE INYECCION MECAN', 6, 1),
(39, 'FABRICACION TUBOS', 6, 1),
(40, 'FABRICACION TERMINALES TIPO A', 6, 1),
(41, 'FABRICACION TUERCAS TIPO A', 6, 1),
(42, 'FABRICACION CONOS TERMINALES', 6, 1),
(43, 'FABRICACION DE IRON MAN', 6, 1),
(44, 'SERVICIO DE REPARACION', 6, 1),
(45, 'SERVICIO DE PARQUEADERO', 6, 1),
(46, 'PRUEBA HIDROSTATICA A CULATAS', 6, 1),
(47, 'LAVADO', 6, 1),
(48, 'CAMBIO DE PINONES Y EMPAQUES BOMBA TRIPLE CUERPO', 6, 1),
(49, 'MANTENIMIENTO Y REPARACION', 6, 1),
(50, 'SERVICIO DE SOAT', 6, 1),
(51, 'SERVICIO DE CARGA DE BATERIA', 6, 1),
(52, 'GEOLOGICO Y GEOTECNICO', 6, 1),
(53, 'ESTUDIO DE TRANSITO', 6, 1),
(54, 'ESTUDIO DE PAVIMENTO', 6, 1),
(55, 'ESTUDIO HIDROLOGICO E HIDRAULICO', 6, 1),
(56, 'DISEÑO GEOMETRICO', 6, 1),
(57, 'DISEÑO DE SEÑALIZACION', 6, 1),
(58, 'PMA', 6, 1),
(59, 'PAGA', 6, 1),
(60, 'ANALISIS DE RIESGO', 6, 1),
(61, 'DISEÑO ESTRUCTURAL', 6, 1),
(62, 'ESTUDIO FORESTAL', 6, 1),
(63, 'DISEÑO ELECTRICO', 6, 1),
(64, 'DISEÑO ELECTRICO', 6, 1),
(65, 'SERVICIO DE TOPOGRAFIA', 6, 1),
(66, 'REPARACION DE TANQUE 5000 LTS', 6, 1),
(67, 'ASESORIA TECNOLOGICA', 6, 1),
(68, 'ARRIENDO LOTE', 21, 1),
(69, 'SERVICIO DE CORTE  EN TRAMOS PARA FORMALETAS', 6, 1),
(70, 'SERVICIO DE INSPECCION SCANNER DE MOTOR', 6, 1),
(71, 'MANO DE OBRA REPARACION DE EQUIPO MENOR CORTADORA', 6, 1),
(72, 'FLACEO DE CILINDRO', 6, 1),
(73, 'EXTRACCIÓN DE POLEA', 6, 1),
(74, 'ELABORACION DE CANASTILLAS PARA PAVIMENTO', 6, 1),
(75, 'SERVICIOS DE TOPOGRAFÍAS', 22, 1),
(76, 'JORNAL/OPERARIO BOMBEO', 22, 1),
(77, 'ALQUILER DE MOTOBOMBA', 22, 1),
(78, 'SERVICIO MOTOCIERRA/JORNAL DE REPIQUE ARBOLES', 23, 1),
(79, 'CORTE DE LISTÓN 4*4  A  VARETA 4*1', 6, 1),
(80, 'FABRICACION E INSTALACIÓN DE VALLA', 4, 1),
(81, 'SERVICIO REVISIÓN ESTUDIO Y DISEÑO', 6, 1),
(82, 'CONSTRUCCION MURO INFRAESTRUCTURA NÓMADAS', 4, 1),
(83, 'SUMINISTRO DE BRUNIDOR DE CILINDROS', 6, 1),
(84, 'ESPECIALISTA HSQ', 6, 1),
(85, 'ACOMPAÑAMIENTO REPORTE AUTROEVALUCION DEL SG-SST', 6, 1),
(86, 'SERVICIO DE TRANSFERENCIA', 6, 1),
(87, 'CAMBIO DE MORDAZA', 6, 1),
(88, 'CAMBIO DE SISTEMA DE AIRE', 6, 1),
(89, 'SERVICIO DE FABRICACION', 6, 1),
(90, 'SERVICIO DE FABRICACION', 6, 1),
(91, 'TRASLADO DE TUBERIA ALCANTARILLADO (INTERNO)', 6, 1),
(92, 'TRASLADO DE TUBERIA ALCALTARILLADO EXTERNO(C Y D )', 6, 1),
(93, 'MANTENIMIENTO A EQUIPOS MENORES', 6, 1),
(94, 'CAMBIO DE ACEITE A EQUIPOS MENORES', 6, 1),
(95, 'MANTENIMIENTO BODEGA CAMPAMENTO ( PATIO)', 6, 1),
(96, 'MANTENIMIENTO A PATIO/CAMPAMENTO', 6, 1),
(97, 'MANTENIMIENTO A MAQUINARIA PESADA', 6, 1),
(98, 'HECHURA DE FLANCHE DE 8 X 7 GRUESO CON 6 PERF.', 6, 1),
(99, 'MANTENIMIENTO Y CAMBIO DE ACEITE A EQUIPOS MENORES', 23, 1),
(100, 'REPARACION  DE CARPA', 6, 1),
(101, 'REPARACION Y AJUSTE DE VARILLAS', 6, 1),
(102, 'CILINDRADO PARA FORMALETA DE MANHOL', 6, 1),
(103, 'MANTENIMIENTO EQUIPOS DE OFICINA', 6, 1),
(104, 'RECARGA DE TONNER  IMPRESORA  HP M102W', 6, 1),
(105, 'SERVICIO REPARACION DE GENERADOR ELECTRICA PLAT#2', 6, 1),
(106, 'MANENIMIENTO Y REPARACIÓN DE TANQUES  OT-SOLCO--SM', 6, 1),
(107, 'MANTENIMIENTO Y REPARACION DE TANQUE OT-SOLCO-SMRT', 6, 1),
(108, 'FABRICACION PIEZAS', 6, 1),
(109, 'SERVICIO DE TRAMITE DE TRANSITO', 6, 1),
(110, 'INSTALACION DE EQUIPO DE AIRE ACONDICIONADO TURBO', 6, 1),
(111, 'MANTENIMIENTO Y PINTURA DE EXTINTOR', 6, 1),
(112, 'CAMBIO CULATA', 6, 1),
(113, 'CAMBIO GOBERNADOR AIRE', 6, 1),
(114, 'MANTENIMIENTO BOMBA', 6, 1),
(115, 'CAMBIO DE VALVULAS SECADOR  AIRE', 6, 1),
(116, 'CAMBIO DE VALVULAS SECADOR  AIRE', 6, 1),
(117, 'CAMBIO RACOR', 6, 1),
(118, 'CAMBIO RACOR AIRE', 6, 1),
(119, 'DESTAPE Y TAPE DE MOTOBOMBA SUMERGIBLE 3&quot;', 6, 1),
(120, 'MANTENIMIENTO Y REPARACION  MAQUINARIA PESADA', 6, 1),
(121, 'MANTENIMIENTO Y REPARACION EQUIPOS MENORES', 6, 1),
(122, 'CAMBIO DE CAMPANA', 6, 1),
(123, 'ARREGLO LLANTAS', 6, 1),
(124, 'REPARACION VALVULA', 6, 1),
(125, 'CAMBIO DE LLANTAS', 6, 1),
(126, 'JUEGO DE PASTILLAS DE FRENO', 6, 1),
(127, 'ESCALIFER COMPLETO', 6, 1),
(128, 'CILINDROS TRASEROS Y EMPASTADA', 6, 1),
(129, 'ENCAMISAR CILINDRO', 6, 1),
(130, 'CAMBIAR JUEGO DE BUJES DE LEVA', 6, 1),
(131, 'CAMBIAR ASIENTOS', 6, 1),
(132, 'CAMBIAR GUIAS', 6, 1),
(133, 'RECTIFICAR BUJES DE BIELA', 6, 1),
(134, 'ALQUILER DE LAMINAS METÁLICAS PARA ENTIBADO', 22, 1),
(135, 'ALQUILER DE VOLQUETA', 6, 1),
(136, 'REA DE TAPIZADO', 6, 1),
(137, 'ALQUILER DE VOLQUETA DOBLE TROQUE', 21, 1),
(138, 'FABRICACION DE BUJES PARA ESLAVON DE PASO DE CADEN', 6, 1),
(139, 'CAMBIO DE SELLOS BOMBA HIDRAULICA', 6, 1),
(140, 'ALQUILER DE REGLA VIBRATORIA', 22, 1),
(141, 'ARREGLO TABLERO', 6, 1),
(142, 'ENCAMISAR POLEA', 6, 1),
(143, 'SOND, MANT Y REP DE FUGAS DE RADIADOR', 6, 1),
(144, 'SOND Y MANT  RADIADOR MAQUINARIA', 6, 1),
(145, 'REP Y MANT DE ENFRIADOR DE ACEITE MAQUINARIA', 6, 1),
(146, 'HECHURA DE CUÑERO A BOLANTA S/M', 6, 1),
(147, 'ARMADO DE CULATA', 6, 1),
(148, 'CAMISAS PARA BLOQUE', 6, 1),
(149, 'MONTE DE NEUMÁTICO A LLANTA', 6, 1),
(150, 'ARREGLO DE ENVARILLADO Y RECORTADA', 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte_nomina`
--

CREATE TABLE `soporte_nomina` (
  `id` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_soporte` date NOT NULL,
  `tipo_soporte` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado_soporte` int(11) NOT NULL,
  `soporte_publicado` int(11) NOT NULL,
  `marca_temporal` datetime NOT NULL,
  `funcionario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrubros`
--

CREATE TABLE `subrubros` (
  `id_subrubro` int(11) NOT NULL,
  `rubro_id_rubro` int(11) NOT NULL,
  `nombre_subrubro` longtext COLLATE utf8_spanish_ci NOT NULL,
  `estado_subrubro` int(11) NOT NULL,
  `activado_cxp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `subrubros`
--

INSERT INTO `subrubros` (`id_subrubro`, `rubro_id_rubro`, `nombre_subrubro`, `estado_subrubro`, `activado_cxp`) VALUES
(41, 1, 'REPUESTOS', 1, 0),
(42, 1, 'ACEITES Y FILTROS', 1, 0),
(43, 1, 'SERVICIO DE MENSAJERIA', 1, 0),
(44, 1, 'LAVADO DE MAQUINARIA Y EQUIPO', 1, 0),
(45, 1, 'NOMINA', 1, 0),
(46, 1, 'COMBUSTIBLE', 1, 0),
(47, 1, 'SERVICIOS PRESTADOS POR EXTERNOS', 1, 0),
(48, 1, 'OTROS', 0, 0),
(49, 2, 'ALIMENTACION', 1, 1),
(50, 2, 'HOSPEDAJE', 1, 0),
(51, 2, 'PEAJES ', 1, 0),
(52, 2, 'MANTENIMIENTO Y REPARACIONES', 1, 0),
(53, 2, 'NOMINA', 1, 0),
(54, 2, 'COMBUSTIBLES', 1, 0),
(55, 2, 'SEGUROS (SOAT) Y TECNOMECANICA', 1, 0),
(56, 2, 'LAVADA DE VOLQUETAS', 1, 0),
(57, 2, 'COMPROMISOS', 1, 0),
(58, 2, 'OTROS', 0, 0),
(59, 3, 'PROYECTO CONSTRUARQUING: VENADOS - CAMPANITO', 1, 1),
(60, 3, 'PROYECTO CONSTRUCSION: PRADO - MARCELITAS', 1, 1),
(61, 3, 'PEAJES Y PARQUEADEROS', 0, 0),
(62, 3, 'TRANSPORTE, FLETES Y ACARREO', 0, 0),
(63, 3, 'MATERIALES DE OBRA', 0, 0),
(64, 3, 'NOMINA', 0, 0),
(65, 3, 'DOTACION Y EPP', 0, 0),
(66, 3, 'ALIMENTACION Y REFRIGERIO', 0, 0),
(67, 3, 'ARRENDAMIENTO', 0, 0),
(68, 3, 'MANTENIMIENTO Y REPARACIONES', 0, 0),
(69, 3, 'SERVICIOS PRESTADOS', 0, 0),
(70, 3, 'COMPROMISOS', 0, 0),
(71, 3, 'OTROS', 0, 0),
(72, 4, 'NOMINA', 1, 1),
(73, 4, 'SERVICIOS PRESTADOS POR EXTERNOS', 1, 1),
(74, 4, 'PAPELERIA', 1, 1),
(75, 4, 'ALIMENTACION Y REFRIGERIO', 1, 0),
(76, 4, 'ASEO', 1, 0),
(77, 4, 'MENSAJERIA', 1, 0),
(78, 4, 'MANTENIMIENTO Y REPARACIONES', 1, 0),
(79, 4, 'SERVICIOS PUBLICOS', 1, 1),
(80, 4, 'DOTACION Y EPP', 1, 0),
(81, 4, 'COMPROMISOS Y OTROS', 0, 0),
(82, 5, 'COMPRA DE HERRAMIENTAS MENORES', 1, 0),
(83, 1, 'LLANTERIA', 1, 0),
(84, 1, 'HOSPEDAJE', 1, 0),
(85, 1, 'ALIMENTACION', 1, 1),
(86, 1, 'PEAJES', 1, 0),
(87, 1, 'PARQUEADEROS', 1, 0),
(88, 1, 'DOTACION Y EPP', 1, 0),
(89, 1, 'OTROS', 1, 0),
(90, 2, 'PARQUEADEROS', 1, 0),
(91, 2, 'REPUESTOS', 1, 0),
(92, 2, 'ACEITES Y FILTROS', 1, 0),
(93, 2, 'SERVICIOS DE MENSAJERIA', 1, 0),
(94, 2, 'LLANTERIA', 1, 0),
(95, 2, 'SERVICIOS PRESTADOS POR EXTERNOS', 1, 0),
(96, 2, 'DOTACION Y EPP', 1, 0),
(97, 2, 'OTROS', 1, 0),
(98, 7, 'CEMENTO', 1, 0),
(99, 7, 'ADITIVO', 1, 0),
(100, 7, 'AGUA', 1, 0),
(101, 7, 'TRITURADO', 1, 0),
(102, 7, 'ARENA', 1, 0),
(103, 7, 'CARGUE Y DESCARGUE', 1, 0),
(104, 7, 'AYUDANTES DE PLANTA DE CONCRETO', 1, 1),
(105, 7, 'ACPM', 1, 0),
(106, 7, 'ACEITES Y FILTROS', 1, 0),
(107, 7, 'REPUESTOS', 1, 0),
(108, 7, 'LLANTERIA', 1, 0),
(109, 7, 'LAVADO DE PLANTA DE CONCRETO', 1, 0),
(110, 7, 'NOMINA', 1, 0),
(111, 7, 'ALIMENTACION', 1, 0),
(112, 7, 'HOSPEDAJE', 1, 0),
(113, 7, 'DOTACION Y EPP', 1, 0),
(114, 7, 'SERVICIOS PRESTADOS POR EXTERNOS', 1, 0),
(115, 7, 'OTROS', 1, 0),
(116, 4, 'EVENTOS', 1, 0),
(117, 4, 'CERTIFICADOS', 1, 0),
(118, 4, 'TRAMITES', 1, 0),
(119, 4, 'PAGOS DE SEGURIDAD SOCIAL', 1, 1),
(120, 4, 'CAPACITACIONES', 1, 0),
(121, 4, 'HONORARIOS', 1, 1),
(122, 4, 'COMPROMISOS Y OTROS', 1, 0),
(123, 5, 'COMPRA DE ACTIVOS FIJOS', 1, 0),
(124, 5, 'PAGOS A TERCEROS', 1, 0),
(125, 3, 'ALCANTARILLADO Z5', 1, 1),
(126, 2, 'TURNO ADICIONAL', 1, 0),
(127, 2, 'COMPROMISO - CARRETERA', 1, 0),
(128, 4, 'LIQUIDACIONES', 1, 1),
(129, 4, 'BONOS', 1, 1),
(130, 7, 'REPUESTOS', 1, 0),
(131, 2, 'MANIFIESTOS DE CARGA', 0, 0),
(132, 1, 'GUIAS DE MOVILIZACION', 1, 0),
(133, 1, 'MANTENIMIENTO', 1, 0),
(134, 4, 'IMPUESTOS', 1, 0),
(135, 6, 'GASTOS BANCARIOS', 1, 0),
(136, 5, 'OTRAS COMPRAS', 1, 0),
(137, 6, 'ABONOS INTERESES AHORROS', 1, 0),
(138, 4, 'LICENCIAS Y DOCUMENTOS CONTABLES', 1, 0),
(139, 4, 'COMBUSTIBLE', 0, 0),
(140, 4, 'MOVILIZACION', 1, 0),
(141, 1, 'MANIFIESTO DE CARGA', 1, 0),
(142, 2, 'POLIZA', 1, 0),
(143, 1, 'POLIZA', 1, 0),
(144, 3, 'OBRA VIAS DE CERETE - MATEO GOMEZ', 1, 1),
(145, 3, 'PROYECTO URE', 1, 1),
(146, 7, 'PEAJES', 1, 0),
(147, 3, 'CERRAMIENTO OFICINA NOMADA', 1, 1),
(148, 8, 'IMPUESTO DE RENTA', 1, 1),
(149, 8, 'RETENCION EN LA FUENTE', 1, 1),
(150, 8, 'IVA', 1, 1),
(151, 8, 'ICA', 1, 1),
(152, 8, 'IMPUESTO VEHICULAR', 1, 1),
(153, 8, 'OTROS', 1, 1),
(154, 4, 'PRODUCCION DE VOLQUETAS', 1, 1),
(155, 4, 'HORAS MAQUINA', 1, 1),
(156, 4, 'DOMINGOS Y FESTIVOS LABORADOS', 1, 1),
(157, 4, 'PRESTACIONES SOCIALES', 1, 1),
(158, 4, 'TURNOS ADICIONALES - NOCHE', 1, 1),
(159, 9, 'REPUESTOS', 1, 1),
(160, 9, 'SERVICIOS PRESTADOS POR EXTERNOS', 1, 1),
(161, 9, 'COMBUSTIBLE', 1, 1),
(162, 9, 'MANTENIMIENTO', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomantenimiento`
--

CREATE TABLE `tipomantenimiento` (
  `id_tipomantenimiento` int(11) NOT NULL,
  `nombre_tipomantenimiento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_tipomantenimiento` varchar(400) COLLATE utf8_spanish_ci DEFAULT NULL,
  `frecuencia_tipomantenimiento` varchar(400) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazabilidad_items`
--

CREATE TABLE `trazabilidad_items` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `usuario_creador` int(11) NOT NULL,
  `estadoreq_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `observaciones` longtext COLLATE utf8_spanish_ci NOT NULL,
  `marca_temporal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuarios_activos`
--

CREATE TABLE `t_usuarios_activos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `codigo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `otros` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `start` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `expire` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `navegador` longtext COLLATE utf8_spanish_ci NOT NULL,
  `sistemaoperativo` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `abreviatura` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidades_medida`
--

INSERT INTO `unidades_medida` (`id`, `nombre`, `abreviatura`, `publicado`) VALUES
(1, 'Galon', 'Gl', 1),
(2, 'Metro cubico', 'M3', 1),
(4, 'Metro Cuadrado', 'M2', 1),
(5, 'Litros', 'Lt', 1),
(6, 'Unidades', 'Und', 1),
(7, 'Metro Lineal', 'Ml', 1),
(8, 'Bulto', 'Bul', 1),
(9, 'Kilogramo', 'Kg', 1),
(10, 'Bolsa', 'Bol', 1),
(11, 'Caneca', 'Can', 1),
(12, 'Metros', 'Mt', 1),
(13, 'Caja', 'Cj', 1),
(14, 'Cuñete', 'Cñ', 1),
(15, 'Paquete', 'Pq', 1),
(16, 'Rollo', 'Rll', 1),
(17, 'Taco', 'Tc', 1),
(18, 'Tambor', 'Tam', 1),
(19, 'Tarro', 'Trr', 1),
(20, 'Hora', 'Hr', 1),
(21, 'MES', 'MES', 1),
(22, 'DIAS', 'DIA', 1),
(23, 'GLOBAL', 'GLB', 1),
(24, 'PAQUETE', 'PAQ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadmedida`
--

CREATE TABLE `unidadmedida` (
  `id_unidadmedida` int(11) NOT NULL,
  `nombre_unidadmedida` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `estado_unidadmedida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidadmedida`
--

INSERT INTO `unidadmedida` (`id_unidadmedida`, `nombre_unidadmedida`, `estado_unidadmedida`) VALUES
(1, 'Gl', 1),
(2, 'M3', 1),
(3, 'M2', 1),
(4, 'Lt', 1),
(5, 'Und', 1),
(6, 'Ml', 1),
(7, 'Bulto', 1),
(8, 'Kilos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `imagen` longtext COLLATE utf8_spanish_ci NOT NULL,
  `nombre_usuario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `documento` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rol_id_rol` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `estado_usuario` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `imagen`, `nombre_usuario`, `telefono`, `email`, `celular`, `documento`, `rol_id_rol`, `username`, `pass`, `estado_usuario`, `cod_cliente`, `cod_proveedor`) VALUES
(151, 'images/usuarios/391638689-logoTek.png', 'Ing. Fredy Gonzalez', '3166976701', 'fredyg', '3166976701', '80761478', 1, 'fredyg', '5e66a117d80a7c5efc3825272f401bdb', 1, 0, 0),
(233, 'images/usuarios/9075Captura de Pantalla 2022-04-01 a la(s) 1.37.56 a. m..png', 'Milena Marquez', '3116822776', 'MMARQUEZ', '3116822776', '64588701', 1, 'MMARQUEZ', '4161950754d02ea8d8a8210a9b003c20', 1, 0, 0),
(234, 'images/usuarios/32958default.jpg', 'KATIA MARCELA ALVAREZ GONZALEZ', '3222060238', 'katiaalvarez25602@gmail.com', '3222060238', '1102828579', 5, 'katiaalvarez25602@gmail.com', '61c4ffa00d916a2cc7133e7b594c88a3', 0, 0, 0),
(235, 'images/usuarios/52127FOTO KATIA.jpeg', 'KATIA MARCELA ALVAREZ GONZALEZ', '3222060238', 'KALVAREZ', '3222060238', '1102828579', 5, 'KALVAREZ', '61c4ffa00d916a2cc7133e7b594c88a3', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_rubros`
--

CREATE TABLE `usuarios_rubros` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `rubro_id_autorizado` int(11) NOT NULL,
  `usuariorubro_publicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios_rubros`
--

INSERT INTO `usuarios_rubros` (`id`, `id_rol`, `id_usuario`, `rubro_id_autorizado`, `usuariorubro_publicado`) VALUES
(4, 1, 16, 4, 1),
(7, 1, 16, 1, 1),
(8, 1, 16, 3, 1),
(9, 1, 16, 2, 1),
(10, 1, 16, 7, 1),
(11, 1, 16, 8, 1),
(12, 1, 16, 6, 1),
(13, 1, 16, 5, 1),
(15, 2, 31, 2, 1),
(17, 2, 31, 2, 1),
(18, 2, 31, 1, 1),
(19, 1, 33, 4, 1),
(20, 1, 33, 1, 1),
(21, 1, 33, 3, 1),
(22, 1, 33, 2, 1),
(23, 1, 33, 7, 1),
(24, 1, 33, 8, 1),
(25, 1, 33, 6, 1),
(26, 1, 33, 5, 1),
(27, 1, 151, 4, 1),
(28, 1, 151, 1, 1),
(29, 1, 151, 3, 1),
(30, 1, 151, 2, 1),
(31, 1, 151, 7, 1),
(32, 1, 151, 8, 1),
(33, 1, 151, 6, 1),
(34, 1, 151, 5, 1),
(35, 2, 32, 1, 1),
(36, 2, 32, 2, 1),
(37, 4, 36, 2, 1),
(38, 4, 37, 2, 1),
(39, 4, 38, 2, 1),
(40, 1, 39, 4, 1),
(41, 1, 39, 1, 1),
(42, 1, 39, 3, 1),
(43, 1, 39, 2, 1),
(44, 1, 39, 7, 1),
(45, 1, 39, 8, 1),
(46, 1, 39, 6, 1),
(47, 1, 39, 5, 1),
(48, 4, 40, 2, 1),
(49, 4, 41, 2, 1),
(50, 16, 44, 2, 1),
(51, 4, 45, 2, 1),
(52, 16, 46, 2, 1),
(53, 4, 48, 2, 1),
(54, 4, 48, 1, 1),
(55, 10, 50, 1, 1),
(56, 13, 144, 4, 1),
(57, 13, 144, 1, 1),
(58, 13, 144, 3, 1),
(59, 13, 144, 2, 1),
(60, 13, 144, 7, 1),
(61, 13, 144, 8, 1),
(62, 13, 144, 6, 1),
(63, 13, 144, 5, 1),
(64, 13, 144, 1, 1),
(65, 13, 144, 2, 1),
(66, 13, 144, 3, 1),
(67, 13, 144, 4, 1),
(68, 13, 144, 5, 1),
(69, 13, 68, 1, 1),
(70, 13, 68, 2, 1),
(71, 13, 68, 3, 1),
(72, 13, 68, 4, 1),
(73, 13, 68, 5, 1),
(74, 13, 87, 1, 1),
(75, 13, 87, 2, 1),
(76, 13, 87, 3, 1),
(77, 13, 87, 4, 1),
(78, 13, 87, 5, 1),
(79, 13, 112, 1, 1),
(80, 13, 112, 2, 1),
(81, 13, 112, 3, 1),
(82, 13, 112, 4, 1),
(83, 13, 112, 5, 1),
(84, 13, 143, 1, 1),
(85, 13, 143, 2, 1),
(86, 13, 143, 3, 1),
(87, 13, 143, 4, 1),
(88, 13, 143, 5, 1),
(89, 13, 150, 1, 1),
(90, 13, 150, 2, 1),
(91, 13, 150, 3, 1),
(92, 13, 150, 4, 1),
(93, 13, 150, 5, 1),
(94, 2, 31, 4, 1),
(95, 2, 31, 3, 1),
(96, 2, 31, 7, 1),
(97, 2, 31, 5, 1),
(98, 1, 151, 9, 1),
(99, 14, 107, 3, 1),
(100, 14, 173, 3, 1),
(101, 5, 137, 3, 1),
(102, 5, 137, 4, 1),
(104, 15, 93, 3, 1),
(105, 1, 16, 9, 1),
(106, 1, 144, 9, 1),
(107, 13, 68, 9, 1),
(108, 5, 80, 3, 1),
(109, 5, 181, 3, 1),
(110, 5, 80, 4, 1),
(111, 5, 181, 4, 1),
(112, 1, 233, 4, 1),
(113, 1, 233, 1, 1),
(114, 1, 233, 3, 1),
(115, 1, 233, 2, 1),
(116, 1, 233, 9, 1),
(117, 1, 233, 7, 1),
(118, 1, 233, 8, 1),
(119, 1, 233, 6, 1),
(120, 1, 233, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_despachos`
--

CREATE TABLE `ventas_despachos` (
  `id` int(11) NOT NULL,
  `reporteventa_id` int(11) NOT NULL,
  `reportedespachocliente_id` int(11) NOT NULL,
  `fecha_modificado` datetime NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `webservice_distracom`
--

CREATE TABLE `webservice_distracom` (
  `id` int(11) NOT NULL,
  `Control` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Placa` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `EntregadoA` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Centrocosto` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `EstacionID` int(11) NOT NULL,
  `Estacion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `FechaFinal` datetime NOT NULL,
  `Volumen` float(18,10) NOT NULL,
  `Kilometraje` int(11) NOT NULL,
  `Valor` float(19,7) NOT NULL,
  `ValorTotal` float(38,14) NOT NULL,
  `Combustible` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Cedula` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `vale` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `Empleado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Centro` int(11) NOT NULL,
  `Subcentro` int(11) NOT NULL,
  `KilometrosGPS` int(11) NOT NULL,
  `Tarjeta` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apu`
--
ALTER TABLE `apu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `campamento`
--
ALTER TABLE `campamento`
  ADD PRIMARY KEY (`id_campamento`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `categoriainsumos`
--
ALTER TABLE `categoriainsumos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_folder`
--
ALTER TABLE `categorias_folder`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cheques`
--
ALTER TABLE `cheques`
  ADD PRIMARY KEY (`id_cheque`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `clientes_precios`
--
ALTER TABLE `clientes_precios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cotizaciones_item`
--
ALTER TABLE `cotizaciones_item`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id_cuenta`);

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id_destino`);

--
-- Indices de la tabla `detalle_entrada_ins`
--
ALTER TABLE `detalle_entrada_ins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pagos_ordenescompra`
--
ALTER TABLE `detalle_pagos_ordenescompra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_salida_ins`
--
ALTER TABLE `detalle_salida_ins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `documentos_varios`
--
ALTER TABLE `documentos_varios`
  ADD PRIMARY KEY (`id_midocumento`);

--
-- Indices de la tabla `documentos_variosemp`
--
ALTER TABLE `documentos_variosemp`
  ADD PRIMARY KEY (`id_midocumento`);

--
-- Indices de la tabla `documentos_varioseq`
--
ALTER TABLE `documentos_varioseq`
  ADD PRIMARY KEY (`id_midocumento`);

--
-- Indices de la tabla `documentos_variosprov`
--
ALTER TABLE `documentos_variosprov`
  ADD PRIMARY KEY (`id_midocumento`);

--
-- Indices de la tabla `egresos_caja`
--
ALTER TABLE `egresos_caja`
  ADD PRIMARY KEY (`id_egreso_caja`);

--
-- Indices de la tabla `egresos_cuenta`
--
ALTER TABLE `egresos_cuenta`
  ADD PRIMARY KEY (`id_egreso_cuenta`);

--
-- Indices de la tabla `entradas_ins`
--
ALTER TABLE `entradas_ins`
  ADD PRIMARY KEY (`id_entrada_ins`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `equipostemporales`
--
ALTER TABLE `equipostemporales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipotipomantenimiento`
--
ALTER TABLE `equipotipomantenimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`id_estacion`);

--
-- Indices de la tabla `estadosreq`
--
ALTER TABLE `estadosreq`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas_compras`
--
ALTER TABLE `facturas_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `formatos`
--
ALTER TABLE `formatos`
  ADD PRIMARY KEY (`id_midocumento`);

--
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Indices de la tabla `gestion_documental`
--
ALTER TABLE `gestion_documental`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indices de la tabla `gestion_documentalemp`
--
ALTER TABLE `gestion_documentalemp`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indices de la tabla `gestion_documentaleq`
--
ALTER TABLE `gestion_documentaleq`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indices de la tabla `gestion_documentalprov`
--
ALTER TABLE `gestion_documentalprov`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indices de la tabla `ingresos_caja`
--
ALTER TABLE `ingresos_caja`
  ADD PRIMARY KEY (`id_ingreso_caja`);

--
-- Indices de la tabla `ingresos_cuenta`
--
ALTER TABLE `ingresos_cuenta`
  ADD PRIMARY KEY (`id_ingreso_cuenta`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `insumoscampamento`
--
ALTER TABLE `insumoscampamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insumoscampamentohistorial`
--
ALTER TABLE `insumoscampamentohistorial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `log_usuarios`
--
ALTER TABLE `log_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `misdocumentos`
--
ALTER TABLE `misdocumentos`
  ADD PRIMARY KEY (`id_midocumento`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `modulo_alertas`
--
ALTER TABLE `modulo_alertas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientositem`
--
ALTER TABLE `movimientositem`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenescompra`
--
ALTER TABLE `ordenescompra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `productosinsumos`
--
ALTER TABLE `productosinsumos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id_proyecto`);

--
-- Indices de la tabla `reporte_abonos`
--
ALTER TABLE `reporte_abonos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_bandas_trituradora`
--
ALTER TABLE `reporte_bandas_trituradora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_combustibles`
--
ALTER TABLE `reporte_combustibles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_compras`
--
ALTER TABLE `reporte_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_comprasinsumos`
--
ALTER TABLE `reporte_comprasinsumos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_despachos`
--
ALTER TABLE `reporte_despachos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_despachosclientes`
--
ALTER TABLE `reporte_despachosclientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_despachosconcreto`
--
ALTER TABLE `reporte_despachosconcreto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_despachosconcretodetalle`
--
ALTER TABLE `reporte_despachosconcretodetalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_equipos`
--
ALTER TABLE `reporte_equipos`
  ADD PRIMARY KEY (`id_reporte`);

--
-- Indices de la tabla `reporte_estado_equipos`
--
ALTER TABLE `reporte_estado_equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_facturas`
--
ALTER TABLE `reporte_facturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_horas`
--
ALTER TABLE `reporte_horas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_horasmq`
--
ALTER TABLE `reporte_horasmq`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_prestamos`
--
ALTER TABLE `reporte_prestamos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_ventas`
--
ALTER TABLE `reporte_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `requisiciones`
--
ALTER TABLE `requisiciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `requisiciones_items`
--
ALTER TABLE `requisiciones_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rubros`
--
ALTER TABLE `rubros`
  ADD PRIMARY KEY (`id_rubro`);

--
-- Indices de la tabla `salidas_ins`
--
ALTER TABLE `salidas_ins`
  ADD PRIMARY KEY (`id_salida_ins`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `soporte_nomina`
--
ALTER TABLE `soporte_nomina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subrubros`
--
ALTER TABLE `subrubros`
  ADD PRIMARY KEY (`id_subrubro`);

--
-- Indices de la tabla `tipomantenimiento`
--
ALTER TABLE `tipomantenimiento`
  ADD PRIMARY KEY (`id_tipomantenimiento`);

--
-- Indices de la tabla `trazabilidad_items`
--
ALTER TABLE `trazabilidad_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_usuarios_activos`
--
ALTER TABLE `t_usuarios_activos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD PRIMARY KEY (`id_unidadmedida`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuarios_rubros`
--
ALTER TABLE `usuarios_rubros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas_despachos`
--
ALTER TABLE `ventas_despachos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `webservice_distracom`
--
ALTER TABLE `webservice_distracom`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apu`
--
ALTER TABLE `apu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `campamento`
--
ALTER TABLE `campamento`
  MODIFY `id_campamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `categoriainsumos`
--
ALTER TABLE `categoriainsumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `categorias_folder`
--
ALTER TABLE `categorias_folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cheques`
--
ALTER TABLE `cheques`
  MODIFY `id_cheque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes_precios`
--
ALTER TABLE `clientes_precios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizaciones_item`
--
ALTER TABLE `cotizaciones_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id_destino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_entrada_ins`
--
ALTER TABLE `detalle_entrada_ins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pagos_ordenescompra`
--
ALTER TABLE `detalle_pagos_ordenescompra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_salida_ins`
--
ALTER TABLE `detalle_salida_ins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `documentos_varios`
--
ALTER TABLE `documentos_varios`
  MODIFY `id_midocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_variosemp`
--
ALTER TABLE `documentos_variosemp`
  MODIFY `id_midocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_varioseq`
--
ALTER TABLE `documentos_varioseq`
  MODIFY `id_midocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_variosprov`
--
ALTER TABLE `documentos_variosprov`
  MODIFY `id_midocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `egresos_caja`
--
ALTER TABLE `egresos_caja`
  MODIFY `id_egreso_caja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `egresos_cuenta`
--
ALTER TABLE `egresos_cuenta`
  MODIFY `id_egreso_cuenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas_ins`
--
ALTER TABLE `entradas_ins`
  MODIFY `id_entrada_ins` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipostemporales`
--
ALTER TABLE `equipostemporales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipotipomantenimiento`
--
ALTER TABLE `equipotipomantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  MODIFY `id_estacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadosreq`
--
ALTER TABLE `estadosreq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas_compras`
--
ALTER TABLE `facturas_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formatos`
--
ALTER TABLE `formatos`
  MODIFY `id_midocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gestion_documental`
--
ALTER TABLE `gestion_documental`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gestion_documentalemp`
--
ALTER TABLE `gestion_documentalemp`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gestion_documentaleq`
--
ALTER TABLE `gestion_documentaleq`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gestion_documentalprov`
--
ALTER TABLE `gestion_documentalprov`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos_caja`
--
ALTER TABLE `ingresos_caja`
  MODIFY `id_ingreso_caja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos_cuenta`
--
ALTER TABLE `ingresos_cuenta`
  MODIFY `id_ingreso_cuenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id_insumo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insumoscampamento`
--
ALTER TABLE `insumoscampamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insumoscampamentohistorial`
--
ALTER TABLE `insumoscampamentohistorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `log_usuarios`
--
ALTER TABLE `log_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT de la tabla `misdocumentos`
--
ALTER TABLE `misdocumentos`
  MODIFY `id_midocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `modulo_alertas`
--
ALTER TABLE `modulo_alertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientositem`
--
ALTER TABLE `movimientositem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenescompra`
--
ALTER TABLE `ordenescompra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productosinsumos`
--
ALTER TABLE `productosinsumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_abonos`
--
ALTER TABLE `reporte_abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_bandas_trituradora`
--
ALTER TABLE `reporte_bandas_trituradora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_combustibles`
--
ALTER TABLE `reporte_combustibles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_compras`
--
ALTER TABLE `reporte_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_comprasinsumos`
--
ALTER TABLE `reporte_comprasinsumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_despachos`
--
ALTER TABLE `reporte_despachos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_despachosclientes`
--
ALTER TABLE `reporte_despachosclientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_despachosconcreto`
--
ALTER TABLE `reporte_despachosconcreto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_despachosconcretodetalle`
--
ALTER TABLE `reporte_despachosconcretodetalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_equipos`
--
ALTER TABLE `reporte_equipos`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_estado_equipos`
--
ALTER TABLE `reporte_estado_equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_facturas`
--
ALTER TABLE `reporte_facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_horas`
--
ALTER TABLE `reporte_horas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_horasmq`
--
ALTER TABLE `reporte_horasmq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_prestamos`
--
ALTER TABLE `reporte_prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_ventas`
--
ALTER TABLE `reporte_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `requisiciones`
--
ALTER TABLE `requisiciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `requisiciones_items`
--
ALTER TABLE `requisiciones_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `rubros`
--
ALTER TABLE `rubros`
  MODIFY `id_rubro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `salidas_ins`
--
ALTER TABLE `salidas_ins`
  MODIFY `id_salida_ins` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `soporte_nomina`
--
ALTER TABLE `soporte_nomina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subrubros`
--
ALTER TABLE `subrubros`
  MODIFY `id_subrubro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT de la tabla `tipomantenimiento`
--
ALTER TABLE `tipomantenimiento`
  MODIFY `id_tipomantenimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trazabilidad_items`
--
ALTER TABLE `trazabilidad_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_usuarios_activos`
--
ALTER TABLE `t_usuarios_activos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  MODIFY `id_unidadmedida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT de la tabla `usuarios_rubros`
--
ALTER TABLE `usuarios_rubros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `ventas_despachos`
--
ALTER TABLE `ventas_despachos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `webservice_distracom`
--
ALTER TABLE `webservice_distracom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
