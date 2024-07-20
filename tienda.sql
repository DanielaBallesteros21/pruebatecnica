-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2024 a las 18:38:33
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
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `documento` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf16_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `documento`, `nombres`, `apellidos`) VALUES
(1, '7679456', 'John', 'Rodriguez'),
(2, '9923588', 'Alice', 'Smith'),
(3, '7579572', 'Michael', 'Johnson'),
(4, '7127098', 'Emily', 'Davis'),
(5, '2896773', 'David', 'Brown'),
(6, '1102573', 'Sarah', 'Wilson'),
(7, '4822544', 'James', 'Moore'),
(8, '1805005', 'Jessica', 'Taylor'),
(9, '2557392', 'Daniel', 'Anderson'),
(10, '6371947', 'Laura', 'Thomas'),
(11, '5187561', 'Matthew', 'Jackson'),
(12, '5821962', 'Megan', 'White'),
(13, '3547129', 'Anthony', 'Harris'),
(14, '8269758', 'Sophia', 'Martin'),
(15, '2707403', 'Christopher', 'Thompson'),
(16, '5727743', 'Olivia', 'Martinez'),
(17, '1516508', 'Joshua', 'Garcia'),
(18, '7399313', 'Chloe', 'Martinez'),
(19, '4447039', 'Andrew', 'Martinez'),
(20, '8037259', 'Emma', 'Martinez'),
(21, '12312123123', 'Daniela', 'Ballesteros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf16_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `tipo`, `cantidad`, `valor_unitario`) VALUES
(1, 'Detergente Líquido', 'Limpieza', 22, '15500.00'),
(2, 'Shampoo', 'Cosmeticos', 74, '25000.00'),
(3, 'Carne de Res', 'Carnes', 45, '100000.00'),
(4, 'Leche Entera', 'Lacteos', 64, '10000.00'),
(5, 'Zanahorias', 'Verduras', 82, '5000.00'),
(6, 'Jabón de Manos', 'Limpieza', 40, '12000.00'),
(7, 'Crema Hidratante', 'Cosmeticos', 91, '30000.00'),
(8, 'Pollo', 'Carnes', 74, '80000.00'),
(9, 'Yogur Natural', 'Lacteos', 76, '8000.00'),
(10, 'Tomates', 'Verduras', 61, '7000.00'),
(11, 'Desinfectante', 'Limpieza', 53, '20000.00'),
(12, 'Labial', 'Cosmeticos', 64, '18000.00'),
(13, 'Chuletas de Cerdo', 'Carnes', 59, '90000.00'),
(14, 'Queso', 'Lacteos', 84, '15000.00'),
(15, 'Lechuga', 'Verduras', 61, '4000.00'),
(16, 'Limpiavidrios', 'Limpieza', 32, '14000.00'),
(17, 'Base de Maquillaje', 'Cosmeticos', 36, '35000.00'),
(18, 'Pescado', 'Carnes', 64, '85000.00'),
(19, 'Mantequilla', 'Lacteos', 31, '12000.00'),
(20, 'Pepinos', 'Verduras', 24, '6000.00'),
(21, 'Detergente en Polvo', 'Limpieza', 84, '13000.00'),
(22, 'Perfume', 'Cosmeticos', 91, '50000.00'),
(23, 'Salchichas', 'Carnes', 99, '70000.00'),
(24, 'Crema para Café', 'Lacteos', 44, '11000.00'),
(25, 'Espinacas', 'Verduras', 64, '5500.00'),
(26, 'Limpiador Multiusos', 'Limpieza', 85, '22000.00'),
(27, 'Rímel', 'Cosmeticos', 51, '22000.00'),
(28, 'Tocino', 'Carnes', 61, '95000.00'),
(29, 'Helado', 'Lacteos', 51, '18000.00'),
(30, 'Cebollas', 'Verduras', 53, '6500.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` int(11) NOT NULL,
  `valor_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `id_producto`, `cantidad`, `precio_unitario`, `valor_total`) VALUES
(1, 1, 1, 1, 15500, 108500),
(2, 2, 2, 1, 25000, 75000),
(3, 3, 3, 2, 100000, 900000),
(4, 4, 4, 1, 10000, 60000),
(5, 5, 5, 8, 5000, 10000),
(6, 6, 6, 6, 12000, 24000),
(7, 7, 7, 1, 30000, 270000),
(8, 8, 8, 10, 80000, 160000),
(9, 9, 9, 10, 8000, 16000),
(10, 10, 10, 2, 7000, 28000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
