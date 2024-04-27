-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2024 a las 03:46:10
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iujo-library`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `binnacle`
--

CREATE TABLE `binnacle` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `action` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `call_number` varchar(8) NOT NULL,
  `author` varchar(100) NOT NULL,
  `title` varchar(150) NOT NULL,
  `editorial` varchar(100) NOT NULL,
  `pages` int(4) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `state` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_category`
--

CREATE TABLE `book_category` (
  `id` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan`
--

CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `reader` int(11) NOT NULL,
  `observation` text NOT NULL,
  `deliver_date` datetime NOT NULL,
  `return_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisson`
--

CREATE TABLE `permisson` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisson`
--

INSERT INTO `permisson` (`id`, `name`, `level`) VALUES
(1, 'Libros', 3),
(2, 'Categorías', 1),
(3, 'Lectores', 1),
(4, 'Préstamos', 1),
(5, 'Estados de libros', 1),
(6, 'Editores', 1),
(7, 'Administradores', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reader`
--

CREATE TABLE `reader` (
  `id` int(11) NOT NULL,
  `cedula` varchar(11) NOT NULL,
  `names` varchar(60) NOT NULL,
  `surnames` varchar(60) NOT NULL,
  `gender` char(1) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `teacher` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `name`) VALUES
(3, 'En biblioteca'),
(1, 'Extraviado'),
(2, 'Prestado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `token` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_level`
--

CREATE TABLE `user_level` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_level`
--

INSERT INTO `user_level` (`id`, `name`) VALUES
(1, 'admin'),
(3, 'editor'),
(2, 'super');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `binnacle`
--
ALTER TABLE `binnacle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binnacle_user` (`user`);

--
-- Indices de la tabla `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `call_number` (`call_number`),
  ADD KEY `book_state` (`state`);

--
-- Indices de la tabla `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book` (`book`),
  ADD KEY `book_category_category` (`category`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_reader` (`reader`),
  ADD KEY `loan_book` (`book`);

--
-- Indices de la tabla `permisson`
--
ALTER TABLE `permisson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permisson_user_level` (`level`);

--
-- Indices de la tabla `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nickname` (`nickname`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_user_level` (`level`);

--
-- Indices de la tabla `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `binnacle`
--
ALTER TABLE `binnacle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisson`
--
ALTER TABLE `permisson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `binnacle`
--
ALTER TABLE `binnacle`
  ADD CONSTRAINT `binnacle_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_state` FOREIGN KEY (`state`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_category_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_book` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loan_reader` FOREIGN KEY (`reader`) REFERENCES `reader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisson`
--
ALTER TABLE `permisson`
  ADD CONSTRAINT `permisson_user_level` FOREIGN KEY (`level`) REFERENCES `user_level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_user_level` FOREIGN KEY (`level`) REFERENCES `user_level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
