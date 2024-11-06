-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2024 a las 13:18:36
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

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`id`, `name`) VALUES
(20, 'Ezequiel Ander-Egg.'),
(22, 'Fidias. G. Arias'),
(16, 'H. P. Lovecraft'),
(18, 'Kentaro Miura'),
(21, 'Maria Jose Aguilar Idañez'),
(17, 'Miguel de Cervantes'),
(19, 'Oichiro Oda'),
(15, 'Sun Tzu');

--
-- Volcado de datos para la tabla `binnacle`
--

INSERT INTO `binnacle` (`id`, `user`, `action`, `date`, `ip_address`) VALUES
(1, 14, 'Insertó 4 libros mediante un excel', '2024-11-05 15:36:09', '127.0.0.1'),
(2, 14, 'Insertó 25 libros mediante un excel', '2024-11-06 08:01:26', '127.0.0.1'),
(3, 14, 'Creó un préstamo 1 al lector 2 y el libro 34', '2024-11-06 08:07:27', '127.0.0.1');

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `call_number`, `title`, `editorial`, `pages`, `shelf`, `description`, `created_at`, `state`) VALUES
(30, '001.20 HREW e.1', 'El arte de la guerra', 12, 40, 'A1', 'Explica diversas estrategias para persuadir personas y ganar batallas o discusiones con el poder de la elocuencia y la mente', '2024-11-05 15:36:09', 'En biblioteca'),
(31, '001.22 RAW21 e.1', 'La llamada de Cthulhu', 13, 24, 'A1', 'Relata el ficticio nacimiento de un horror cósmico cuya presencia resuena en las mentes y cuerpos de todas las personas y seres', '2024-11-05 15:36:09', 'En biblioteca'),
(32, '001.44 YGNZA e.1', 'Don Quijote de la Mancha', 14, 225, 'A2', 'Trata de las ocurrencias, aventuras y vivencias de un caballero medieval delirantemente obsesionado con las costumbres caballerescas de la edad media', '2024-11-05 15:36:09', 'En biblioteca'),
(33, '001.12 TKIYUT e.1', 'Berserk Vol. 1', 15, 220, 'A1', 'Cuenta la historia de un misterioso y oscuro espadachín que lucha contra monstruos que se alzan en su contra por alguna razón', '2024-11-05 15:36:09', 'En biblioteca'),
(34, '001.42 Ag932 e.1', 'Como elaborar un proyecto', 16, 128, '1', 'Guía para diseñar proyectos sociales y culturales', '2024-11-06 08:01:26', 'Prestado'),
(35, '001.42 Ag932 e.2', 'Como elaborar un proyecto', 16, 128, '1', 'Guía para diseñar proyectos sociales y culturales', '2024-11-06 08:01:26', 'En biblioteca'),
(36, '001.42 AN 225 e.1', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-06 08:01:26', 'En biblioteca'),
(37, '001.42 AN 225 e.2', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-06 08:01:26', 'En biblioteca'),
(38, '001.42 AN 225 e.3', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-06 08:01:26', 'En biblioteca'),
(39, '001.42 AN 225 e.4', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-06 08:01:26', 'En biblioteca'),
(40, '001.42 AN 225 e.5', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-06 08:01:26', 'En biblioteca'),
(41, '001.42 AN 225 e.6', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-06 08:01:26', 'En biblioteca'),
(42, '001.42 AR41 e.1', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(43, '001.42 AR41 e.2', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(44, '001.42 AR41 e.3', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(45, '001.42 AR41 e.4', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(46, '001.42 AR41 e.5', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(47, '001.42 AR41 e.6', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(48, '001.42 AR41 e.7', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(49, '001.42 AR41 e.8', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(50, '001.42 AR41 e.9', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(51, '001.42 AR41 e.10', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(52, '001.42 AR41 e.11', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(53, '001.42 AR41 e.12', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-06 08:01:26', 'En biblioteca'),
(54, '001.42 AR41M e.1', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-06 08:01:26', 'En biblioteca'),
(55, '001.42 AR41M e.2', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-06 08:01:26', 'En biblioteca'),
(56, '001.42 AR41M e.3', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-06 08:01:26', 'En biblioteca'),
(57, '001.42 AR41M e.4', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-06 08:01:26', 'En biblioteca'),
(58, '001.42 AR41M e.5', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-06 08:01:26', 'En biblioteca');

--
-- Volcado de datos para la tabla `book_author`
--

INSERT INTO `book_author` (`id`, `book`, `author`) VALUES
(1, 30, 15),
(2, 31, 16),
(3, 32, 17),
(4, 33, 18),
(5, 33, 19),
(6, 34, 20),
(7, 34, 21),
(8, 35, 20),
(9, 35, 21),
(10, 36, 20),
(11, 37, 20),
(12, 38, 20),
(13, 39, 20),
(14, 40, 20),
(15, 41, 20),
(16, 42, 22),
(17, 43, 22),
(18, 44, 22),
(19, 45, 22),
(20, 46, 22),
(21, 47, 22),
(22, 48, 22),
(23, 49, 22),
(24, 50, 22),
(25, 51, 22),
(26, 52, 22),
(27, 53, 22),
(28, 54, 22),
(29, 55, 22),
(30, 56, 22),
(31, 57, 22),
(32, 58, 22);

--
-- Volcado de datos para la tabla `book_category`
--

INSERT INTO `book_category` (`id`, `book`, `category`) VALUES
(1, 30, 24),
(2, 31, 25),
(3, 31, 26),
(4, 31, 27),
(5, 32, 28),
(6, 32, 29),
(7, 33, 30),
(8, 33, 28),
(9, 34, 31),
(10, 35, 31),
(11, 36, 31),
(12, 37, 31),
(13, 38, 31),
(14, 39, 31),
(15, 40, 31),
(16, 41, 31),
(17, 42, 31),
(18, 43, 31),
(19, 44, 31),
(20, 45, 31),
(21, 46, 31),
(22, 47, 31),
(23, 48, 31),
(24, 49, 31),
(25, 50, 31),
(26, 51, 31),
(27, 52, 31),
(28, 53, 31),
(29, 54, 31),
(30, 55, 31),
(31, 56, 31),
(32, 57, 31),
(33, 58, 31);

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(30, 'Acción'),
(29, 'Clásico'),
(24, 'Crecimiento personal'),
(28, 'Fantasía'),
(25, 'Ficción'),
(31, 'Metodología de la investigación'),
(27, 'Misterio'),
(26, 'Terror');

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id`, `name`) VALUES
(13, 'Capriles'),
(18, 'Episteme'),
(15, 'Hakusensha'),
(12, 'La Flor'),
(17, 'LUMEN'),
(16, 'LUMEN/HVHUMANITAS'),
(14, 'Santillana');

--
-- Volcado de datos para la tabla `loan`
--

INSERT INTO `loan` (`id`, `book`, `reader`, `observation`, `deliver_date`, `return_date`, `created_at`, `active`) VALUES
(1, 34, 2, '', '2024-11-06 08:07:27', NULL, '2024-11-06 08:07:27', 1);

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

--
-- Volcado de datos para la tabla `reader`
--

INSERT INTO `reader` (`id`, `cedula`, `names`, `surnames`, `gender`, `birthdate`, `phone`, `is_teacher`) VALUES
(2, '28672717', 'Jessica', 'Ruíz', 'F', '2001-08-12', '0416-0509548', 0),
(3, '28019228', 'Gabriel Alberto', 'Silva Montilla', 'M', '2001-03-02', '04163567008', 0),
(4, '7474747', 'Pepito Fracisco', 'Gallegos Arroyo', 'M', '2014-03-02', '04163567008', 0),
(5, '85967412', 'Magda', 'Perozo', 'F', '1989-04-09', '04163567008', 1),
(6, '12345678', 'Jaime Pedro', 'Altozano Rajoy', 'M', '1975-08-26', '04168759225', 0),
(7, '13434114', 'adfaefdasdas', 'sfgfsgsfgfssdfg', 'M', '2014-06-06', 'sfsdfsdfsdfsdf', 0),
(8, '32165498', 'Raul', 'Sequera', 'M', '2014-06-19', '04163567008', 0),
(9, '3563630', 'Ramón Luis', 'Gallegos', 'F', '2014-03-05', '8684562451', 0),
(10, '4718529', 'Pedritongo', 'Falasito', 'M', '2014-07-01', '04163567008', 0),
(11, '741852963', 'vxbxfvfsgfdgfd', 'hhhhhhhhhh', 'F', '2014-06-30', '04163567008', 1),
(12, '65746743563', 'sdfgsdgdghd', 'tytttttttttt', 'M', '2014-06-30', '04163567008', 1);

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`name`) VALUES
('En biblioteca'),
('Extraviado'),
('Prestado');

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nickname`, `level`, `created_at`, `username`, `password`, `token`, `active`) VALUES
(14, 'SuperBiblioteca', 'Super', '2024-07-26 08:07:00', '$argon2id$v=19$m=65536,t=3,p=4$H5QRUNQ1cKaCANACDAjBCg$HhicRyE9Opq0qHaFLJ257HMW0y4zCddGZmHtC/pGfe4', '$argon2id$v=19$m=65536,t=3,p=4$GkRS30Iy5uxTcdhaDvvehA$wtHRL3eqs04xtxOhGcFhoFyd+Y1A8bXCDdDUUrkOYvA', 'dcd78902-70b4-40a2-9c17-b7a0486e9980-5f031834-7798-4cb4-a77b-114s3a7b8d6f', 1);

--
-- Volcado de datos para la tabla `user_level`
--

INSERT INTO `user_level` (`name`) VALUES
('Admin'),
('Editor'),
('Super');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
