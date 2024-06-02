-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2024 a las 01:48:37
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

--
-- Volcado de datos para la tabla `binnacle`
--

INSERT INTO `binnacle` (`id`, `user`, `action`, `date`) VALUES
(1, 1, 'Atlantox7 Ha creado al usuario El pepito5', '2024-04-30 10:03:08'),
(2, 1, 'Atlantox7 Ha creado al usuario El pepito6', '2024-04-30 10:11:46'),
(3, 1, 'Atlantox7 Ha creado al usuario El pepito7', '2024-04-30 10:12:11'),
(4, 1, 'Atlantox7 Ha creado al usuario El pepito8', '2024-04-30 10:13:45'),
(5, 1, 'Creó la categoría Comedia', '2024-05-07 09:15:18'),
(6, 1, 'Creó la categoría Romance', '2024-05-07 09:15:21'),
(7, 1, 'Creó la categoría Terror', '2024-05-07 09:15:25'),
(8, 1, 'Creó la categoría Fantasía', '2024-05-07 09:15:29'),
(9, 1, 'Creó la categoría Historia', '2024-05-07 09:15:35'),
(10, 1, 'Creó la categoría Acción', '2024-05-07 09:15:45'),
(11, 1, 'Creó la categoría Crecimiento personal', '2024-05-07 09:15:50'),
(12, 1, 'Creó la categoría Enciclopedia', '2024-05-07 09:15:58'),
(13, 1, 'Creó la categoría Normativo', '2024-05-07 09:16:02'),
(14, 1, 'Creó el Libro Berserk Vol. 1', '2024-05-07 09:18:06'),
(15, 1, 'Creó el Libro Berserk Vol. 1', '2024-05-07 09:25:33'),
(16, 1, 'Editó el Libro 1', '2024-05-07 09:28:29'),
(17, 1, 'Editó el Libro 1', '2024-05-07 09:44:58'),
(18, 1, 'Borró el libro Berserk Vol. 2', '2024-05-07 11:46:43'),
(19, 1, 'Creó el Libro Berserk Vol. 3', '2024-05-09 08:07:56'),
(20, 1, 'Creó el Libro Berserk Vol. 4', '2024-05-09 08:31:38'),
(21, 1, 'Renombró la categoría \"Comedia\" por \"Comediante\" ', '2024-05-09 10:15:03'),
(22, 1, 'Renombró la categoría \"{\'name\': \'Comediante\'}\" por \"Comedia\" ', '2024-05-09 10:16:21'),
(23, 1, 'Creó la categoría Mamador', '2024-05-09 10:16:34'),
(24, 1, 'Eliminó la categoría \"Comedia\"', '2024-05-09 10:29:53'),
(25, 1, 'Creó la categoría comedia', '2024-05-09 10:30:11'),
(26, 1, 'Creó la categoría Adult', '2024-05-09 14:30:27'),
(27, 1, 'Creó al lector Gabriel Alberto de cédula 28019228', '2024-05-09 14:37:40'),
(28, 1, 'Creó al lector Jessica de cédula 28672717', '2024-05-09 14:39:28'),
(29, 1, 'Editó los campos phone del lector de id 1', '2024-05-09 17:45:26'),
(30, 1, 'Borró al lector Gabriel Alberto de cédula 28019228 y id 1', '2024-05-09 18:06:05'),
(31, 1, 'Creó un préstamo 1 al lector 2 y el libro 2', '2024-05-10 09:31:43'),
(32, 1, 'Creó un préstamo 2 al lector 2 y el libro 3', '2024-05-10 09:50:33'),
(33, 1, 'Se devolvió el libro 2 del lector 2 del préstamo 1', '2024-05-10 11:13:10'),
(34, 1, 'Creó un préstamo 3 al lector 2 y el libro 2', '2024-05-12 10:41:25'),
(35, 1, 'Creó al lector Gabriel Alberto de cédula 28019228', '2024-05-12 11:39:37'),
(36, 1, 'Creó al lector Pepito Fracisco de cédula 7474747', '2024-05-12 11:40:54'),
(37, 1, 'Creó al lector Magda de cédula 85967412', '2024-05-12 11:57:47'),
(38, 1, 'Creó el Libro \"¿Cómo ser tu propio jefe?\"', '2024-05-12 12:15:27'),
(39, 1, 'Creó la categoría Curso', '2024-05-12 12:17:29'),
(40, 1, 'Creó el Libro \"Curso de PHP 2\"', '2024-05-12 12:17:59'),
(41, 1, 'Creó un préstamo 4 al lector 5 y el libro 6', '2024-05-12 12:20:45'),
(42, 1, 'Creó un préstamo 5 al lector 5 y el libro 5', '2024-05-12 12:20:53'),
(43, 1, 'Creó un préstamo 6 al lector 4 y el libro 4', '2024-05-12 12:34:34'),
(44, 1, 'Se devolvió el libro 4 del lector 4 del préstamo 6', '2024-05-12 12:56:46'),
(45, 1, 'Creó al lector Jaime Pedro de cédula 12345678', '2024-05-12 13:10:10'),
(46, 1, 'Atlantox7 ha creado al usuario Atlantox', '2024-05-21 20:03:39'),
(47, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:04:07'),
(48, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:04:27'),
(49, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:05:05'),
(50, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:24:24'),
(51, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:27:37'),
(52, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:28:30'),
(53, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:29:06'),
(54, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:29:29'),
(55, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:29:59'),
(56, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:30:28'),
(57, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:31:19'),
(58, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:31:34'),
(59, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:31:57'),
(60, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:33:08'),
(61, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:34:19'),
(62, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:36:27'),
(63, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:37:01'),
(64, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:45:55'),
(65, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:46:40'),
(66, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:55:15'),
(67, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:56:53'),
(68, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 21:01:23'),
(69, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 21:08:33'),
(70, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 21:09:30'),
(71, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 21:38:39'),
(72, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 17:51:40'),
(73, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 17:52:07'),
(74, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 17:59:12'),
(75, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:00:42'),
(76, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:01:18'),
(77, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:02:17'),
(78, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:08:23'),
(79, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:09:31'),
(80, 10, 'Atlantox ha ingresado al sistema', '2024-05-29 19:05:40'),
(81, 10, 'Atlantox ha ingresado al sistema', '2024-06-02 19:45:41'),
(82, 10, 'Atlantox ha ingresado al sistema', '2024-06-02 19:48:12');

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
  `shelf` varchar(10) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `call_number`, `author`, `title`, `editorial`, `pages`, `shelf`, `description`, `created_at`, `state`) VALUES
(2, 'BE-01', 'Kentaro Miura', 'Berserk Vol. 1', 'Shizuka', 26, 'A2', '', '2024-05-07 09:25:33', 'Prestado'),
(3, 'BE3-01', 'Kentaro Miura', 'Berserk Vol. 3', 'Shizuka', 25, 'A2', '', '2024-05-09 08:07:56', 'Prestado'),
(4, 'BE4-01', 'Kentaro Miura', 'Berserk Vol. 4', 'Shizuka', 22, 'A2', '', '2024-05-09 08:31:38', 'En biblioteca'),
(5, 'IFA-115', 'Atlantox', '¿Cómo ser tu propio jefe?', 'El EteSechu', 409, 'A6', 'Trata sobre como estafar personas sin que estas se den cuenta así mismo explica como lidiar con los clientes difíciles dándoles una muerte inmediata y secreta', '2024-05-12 12:15:27', 'Prestado'),
(6, 'PHP2-1', 'Nadie', 'Curso de PHP 2', 'Editorial vieja', 596, 'A2', '', '2024-05-12 12:17:59', 'Prestado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_category`
--

CREATE TABLE `book_category` (
  `id` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `book_category`
--

INSERT INTO `book_category` (`id`, `book`, `category`) VALUES
(4, 2, 3),
(6, 3, 3),
(8, 4, 3),
(9, 5, 6),
(10, 5, 8),
(11, 6, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(6, 'Acción'),
(15, 'Comedia'),
(7, 'Crecimiento personal'),
(17, 'Curso'),
(8, 'Enciclopedia'),
(4, 'Fantasía'),
(5, 'Historia'),
(9, 'Normativo'),
(2, 'Romance'),
(3, 'Terror');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `loan`
--

INSERT INTO `loan` (`id`, `book`, `reader`, `observation`, `deliver_date`, `return_date`, `created_at`, `active`) VALUES
(1, 2, 2, '', '2024-01-10 00:00:00', '2024-05-10 11:13:10', '2024-05-10 09:31:43', 0),
(2, 3, 2, 'Será usado para una clase', '2024-01-10 00:00:00', NULL, '2024-05-10 09:50:33', 1),
(3, 2, 2, 'Ninguna', '2024-05-10 00:00:00', NULL, '2024-05-12 10:41:25', 1),
(4, 6, 5, '', '2024-05-12 00:00:00', NULL, '2024-05-12 12:20:45', 1),
(5, 5, 5, '', '2024-05-12 00:00:00', NULL, '2024-05-12 12:20:53', 1),
(6, 4, 4, '', '2024-05-08 00:00:00', '2024-05-12 12:56:46', '2024-05-12 12:34:34', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisson`
--

CREATE TABLE `permisson` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(18, 'Categorías', 'Editor');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reader`
--

INSERT INTO `reader` (`id`, `cedula`, `names`, `surnames`, `gender`, `birthdate`, `phone`, `is_teacher`) VALUES
(2, '28672717', 'Jessica', 'Ruíz', 'F', '2001-08-12', '0416-0509548', 0),
(3, '28019228', 'Gabriel Alberto', 'Silva Montilla', 'M', '2001-03-02', '04163567008', 0),
(4, '7474747', 'Pepito Fracisco', 'Gallegos Arroyo', 'M', '2014-03-02', '04163567008', 0),
(5, '85967412', 'Magda', 'Perozo', 'F', '1989-04-09', '04163567008', 1),
(6, '12345678', 'Jaime Pedro', 'Altozano Rajoy', 'M', '1975-08-26', '04168759225', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE `state` (
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `token` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nickname`, `level`, `username`, `password`, `token`, `active`) VALUES
(1, 'Atlantox7', 'Admin', '$argon2id$v=19$m=65536,t=3,p=4$3AS4idk0Vww0t4Sb01WeTA$jGz2iJeNl6gDxT2fMeWDqSoxQFQDGMiKysTEl77zrtE', '$argon2id$v=19$m=65536,t=3,p=4$ZdHbxL0d8wcfNPlDgenj+A$fl4pfvgOkUwHLCjxIAP5d794CGpc13YWcDrOWgrvtak', 'd4239cd0-77e5-4d73-bb73-7ba3e9ecbc00-b4828893-f47d-47fe-a5f0-128b13e8a786', 1),
(2, 'El pepito', 'Editor', '$argon2id$v=19$m=65536,t=3,p=4$sp8mhZbVtyUACABltP8eCg$XlidoVZSzekOnHySDnU/kRYAKs8Ud8B4N/HMyxLQCuE', '$argon2id$v=19$m=65536,t=3,p=4$rQF6bSodODC/FDhfDiAsyw$tmoSw54ricWjwJdTi2wjuox93J5FEt9JHDly3tcDFco', '9559e961-3d82-4013-ac43-1071ae4bbea9-48f22212-d27f-439d-a32e-9c7facdc62c2', 1),
(3, 'El pepito2', 'Admin', '$argon2id$v=19$m=65536,t=3,p=4$sC68eq03u8/8VvWIlE7V2w$8zFKttxeLrzFfxzoCv38GzAnNGEdln7SamRwOV+1GRY', '$argon2id$v=19$m=65536,t=3,p=4$bHwiNX9DS0r6cPzgUELkUA$XBm8tql9z9n6rvaSX1YAcbyI5ht97u8lLTnFczr4uak', '73361c62-9340-4c9e-9dd3-33a73547d761-029002f7-f5a7-4c99-bdd4-2d179f024977', 1),
(4, 'El pepito3', 'Editor', '$argon2id$v=19$m=65536,t=3,p=4$LpxdH78OEo+g1pjBUaK04Q$HqgbgCdtTM4GaXFZ2ZqLmQv6gMs46Ot5c3Y5Am9LMsY', '$argon2id$v=19$m=65536,t=3,p=4$pkySPKBSNnOnewqZdy67Ww$gUgbBU6aqv5xEtiSdWYRDqoYcBVxCVafxysh4vvxnaY', '08bc0ff1-132b-40b4-ad58-c196890dee56-2ded1689-f8da-4534-9abe-67247860d3ab', 1),
(5, 'El pepito4', 'Editor', '$argon2id$v=19$m=65536,t=3,p=4$cpWY38BOtU9Obhe3DR3bhA$XLJGqZHPj1WwsM9OL6JMR2yxTWkzjXwPO1Mw6KP1t2I', '$argon2id$v=19$m=65536,t=3,p=4$Wlmnwt6OoPS40ziRz3qwAQ$yFOrGDhX1sE5VjMiOzZgPz+fbwDBGGIwRWl/DkgL8vY', '876bbab3-5890-457b-888b-69c2acfc8a00-c0938fd2-a87d-4451-a865-fe8405df6122', 1),
(6, 'El pepito5', 'Editor', '$argon2id$v=19$m=65536,t=3,p=4$jXGc7XJH4hQT3EOUnaG1uA$1x+TERIFqhg2mZshTx2l+mju0tkap4gSoJ1wFnu7j20', '$argon2id$v=19$m=65536,t=3,p=4$3ibE1pMM3ILiSFWS0bvLYg$Xq6xfDW7TdzXaGCd7KGQcMTclfiR6djZ0kZey/iKmsI', 'c6d08108-8771-46b0-adac-f5ce0c03f8ba-3972822d-3b25-4f54-9f43-c9f134eb266a', 1),
(7, 'El pepito6', 'Editor', '$argon2id$v=19$m=65536,t=3,p=4$NqtGczl0CGAQlsjt55K79g$NdQWA4SWVJ/h+I14AA6CWZOJ0sBs6asyrNzPJpK8N0U', '$argon2id$v=19$m=65536,t=3,p=4$TMNXWRrkjSqdYirkW/q7DQ$1JXU038KTPR6PX0LBZuf9FtEbJ9P7J6a79NKi5tSoco', '1ccd1e8a-8272-49a9-a93b-af486ec03a8b-e33f60bc-38b5-4811-a889-04fec04acc4a', 1),
(8, 'El pepito7', 'Editor', '$argon2id$v=19$m=65536,t=3,p=4$wkHf2sGs7rzpZr8NnxVpCg$qEP5Xdq2Ug2woLQZGgsVYr/ZcO7rm5jaP3SR0P37UGE', '$argon2id$v=19$m=65536,t=3,p=4$0oU/JC3TILOLMY8MHLgQbg$fa5pLqaom4IjiaL6In8wM0BTCYcBEW3yiN5JuKJ1ny0', 'bc7b23dd-63e4-4624-83d4-e2deeb0f3b05-ec23053e-925d-4e4f-ba67-6eff9ea464b3', 1),
(9, 'El pepito8', 'Editor', '$argon2id$v=19$m=65536,t=3,p=4$vQfLmfv2+sGfhhFgruSzfA$PgYiH9XFyggzKsZA4P7tZozj32u8NXi0pPhpvd/RLtY', '$argon2id$v=19$m=65536,t=3,p=4$8vf2Q2qT5OoGFfOpMcCC1A$D9CvCFc2PBJI51YAW4uW8ZswGEgJZWVmCzy7VlLGi68', '45ec7c08-aca4-4c1a-9cdf-cbb9c54ff128-27f6b3b2-50c9-48ac-ba63-3103b995561c', 1),
(10, 'Atlantox', 'Admin', '$argon2id$v=19$m=65536,t=3,p=4$am1VC7JJtJEwA6YHympJfA$g7uf84pTXJKeq5QsUGqDacFoj54gR35J9uwf9KFsX7M', '$argon2id$v=19$m=65536,t=3,p=4$ISIMPRqNxz8MHYV3iuBYWg$tiPy3KFUbTTRqoormbEbXOcPnVogoDvwppMvGtUYjO8', 'dcd78902-70b4-40a2-9c17-b7a0486e9980-5f031834-7798-4cb4-a77b-114b3a7b8d6f', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_level`
--

CREATE TABLE `user_level` (
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- AUTO_INCREMENT de la tabla `binnacle`
--
ALTER TABLE `binnacle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `permisson`
--
ALTER TABLE `permisson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `book_state` FOREIGN KEY (`state`) REFERENCES `state` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
