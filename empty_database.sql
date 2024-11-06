-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2024 a las 13:15:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
-- Estructura de tabla para la tabla `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `binnacle`
--

CREATE TABLE `binnacle` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `action` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `call_number` varchar(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `editorial` int(11) DEFAULT NULL,
  `pages` int(4) NOT NULL,
  `shelf` varchar(10) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_author`
--

CREATE TABLE `book_author` (
  `id` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_category`
--

CREATE TABLE `book_category` (
  `id` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `return_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisson`
--

CREATE TABLE `permisson` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisson`
--

INSERT INTO `permisson` (`id`, `name`, `level`) VALUES
(1, 'Libros', 'Editor'),
(2, 'Categorías', 'Admin'),
(3, 'Lectores', 'Admin'),
(4, 'Préstamos', 'Admin'),
(5, 'Estados de libros', 'Admin'),
(6, 'Editor', 'Admin'),
(8, 'Libros', 'Admin'),
(9, 'Libros', 'Super'),
(10, 'Lectores', 'Super'),
(11, 'Categorías', 'Super'),
(12, 'Estados de libros', 'Super'),
(13, 'Editores', 'Super'),
(14, 'Admin', 'Super'),
(15, 'Préstamos', 'Super'),
(18, 'Categorías', 'Editor'),
(19, 'Editoriales', 'Editor'),
(20, 'Editoriales', 'Admin'),
(21, 'Editoriales', 'Super'),
(22, 'Autores', 'Editor'),
(23, 'Autores', 'Admin'),
(24, 'Autores', 'Super'),
(25, 'Estadísticas', 'Admin'),
(26, 'Estadísticas', 'Super'),
(27, 'Bitácora', 'Admin'),
(28, 'Bitácora', 'Super');

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
  `birthdate` date NOT NULL,
  `phone` varchar(16) NOT NULL,
  `is_teacher` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE `state` (
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`name`) VALUES
('En biblioteca'),
('Extraviado'),
('Prestado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `token` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nickname`, `level`, `created_at`, `username`, `password`, `token`, `active`) VALUES
(14, 'SuperBiblioteca', 'Super', '2024-07-26 08:07:00', '$argon2id$v=19$m=65536,t=3,p=4$H5QRUNQ1cKaCANACDAjBCg$HhicRyE9Opq0qHaFLJ257HMW0y4zCddGZmHtC/pGfe4', '$argon2id$v=19$m=65536,t=3,p=4$GkRS30Iy5uxTcdhaDvvehA$wtHRL3eqs04xtxOhGcFhoFyd+Y1A8bXCDdDUUrkOYvA', 'dcd78902-70b4-40a2-9c17-b7a0486e9980-5f031834-7798-4cb4-a77b-114s3a7b8d6f', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_level`
--

CREATE TABLE `user_level` (
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_level`
--

INSERT INTO `user_level` (`name`) VALUES
('Admin'),
('Editor'),
('Super');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

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
  ADD KEY `book_state` (`state`),
  ADD KEY `book_editorial` (`editorial`);

--
-- Indices de la tabla `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_author_book` (`book`),
  ADD KEY `book_author_author` (`author`);

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
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
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
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nickname` (`nickname`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_user_level` (`level`);

--
-- Indices de la tabla `user_level`
--
ALTER TABLE `user_level`
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `book_author`
--
ALTER TABLE `book_author`
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
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  ADD CONSTRAINT `book_editorial` FOREIGN KEY (`editorial`) REFERENCES `editorial` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `book_state` FOREIGN KEY (`state`) REFERENCES `state` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_author` FOREIGN KEY (`author`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_author_book` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `permisson_user_level` FOREIGN KEY (`level`) REFERENCES `user_level` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_user_level` FOREIGN KEY (`level`) REFERENCES `user_level` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
