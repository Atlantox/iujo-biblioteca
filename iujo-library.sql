-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2024 a las 20:05:31
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.2.34

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
(18, 1, 'Borró el libro Berserk Vol. 2', '2024-05-07 11:46:43');

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
  `state` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `call_number`, `author`, `title`, `editorial`, `pages`, `shelf`, `description`, `created_at`, `state`) VALUES
(2, 'BE-01', 'Kentaro Miura', 'Berserk Vol. 1', 'Shizuka', 26, 'A2', '', '2024-05-07 09:25:33', 2);

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
(3, 2, 1),
(4, 2, 3);

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
(1, 'Comedia'),
(7, 'Crecimiento personal'),
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
  `return_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(16, '', 'Super'),
(17, '', 'Super');

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
(9, 'El pepito8', 'Editor', '$argon2id$v=19$m=65536,t=3,p=4$vQfLmfv2+sGfhhFgruSzfA$PgYiH9XFyggzKsZA4P7tZozj32u8NXi0pPhpvd/RLtY', '$argon2id$v=19$m=65536,t=3,p=4$8vf2Q2qT5OoGFfOpMcCC1A$D9CvCFc2PBJI51YAW4uW8ZswGEgJZWVmCzy7VlLGi68', '45ec7c08-aca4-4c1a-9cdf-cbb9c54ff128-27f6b3b2-50c9-48ac-ba63-3103b995561c', 1);

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
  ADD PRIMARY KEY (`id`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisson`
--
ALTER TABLE `permisson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
