-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-11-2024 a las 13:26:34
-- Versión del servidor: 10.6.19-MariaDB
-- Versión de PHP: 8.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iujobqto_iujo_library`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`id`, `name`) VALUES
(103, 'Allen B. Tucker'),
(33, 'Ana Isabel Vergara'),
(36, 'Anna Maria Fernandez Poncela'),
(131, 'Anthony de Mello'),
(80, 'Antonia Rigo'),
(125, 'Antonio M. Ferrer Abelló'),
(29, 'Armando Lares.'),
(84, 'Arquimedes Roman'),
(68, 'Arturo Elizando'),
(76, 'Autores varios'),
(126, 'Behrouz Forouzan'),
(89, 'Carlos A. Sabino'),
(71, 'Carlos E. Mendez'),
(56, 'Carlos Fernandez'),
(138, 'Carlos Valles'),
(151, 'Carmen Domench Nieves Martin'),
(96, 'Carol H.Weiss'),
(52, 'Cesar Augusto Bernal'),
(144, 'Conrad Carlberg'),
(106, 'David K. Garnick'),
(139, 'Dentro Giorgett'),
(127, 'Douglas Holmes'),
(73, 'Elena Hochman'),
(74, 'Enrique Palladino'),
(132, 'Eugenio Fizzotti'),
(20, 'Ezequiel Ander-Egg.'),
(112, 'Felix Chamorro'),
(88, 'Feliz Z Seijas'),
(111, 'Fernando Garcia'),
(54, 'Fernando Luis Gonzalez Rey'),
(22, 'Fidias. G. Arias'),
(66, 'Fred N. Kerlinger'),
(39, 'Fuensanta Hernandez'),
(143, 'G. Posner'),
(81, 'Gabriel Genesca'),
(77, 'Gerardo Siso'),
(156, 'Greg Perry'),
(41, 'Gregory Colomb'),
(107, 'Grigore Burdea'),
(115, 'Guillermo Livene'),
(24, 'H. P. Lovecraft'),
(101, 'Hamdy Taha'),
(94, 'Harry Wolcott'),
(53, 'Hilda Gambara'),
(98, 'Hillier Lieberman'),
(67, 'Howard B. Lee'),
(46, 'Hugh Coolican'),
(142, 'Ignacio Zahonero Martínez'),
(133, 'Ignazio Runz'),
(63, 'Ilis M. Alfonzo'),
(64, 'Ivonka Espinoza'),
(50, 'J. Elliott'),
(58, 'J. Hurtado de Barrera'),
(134, 'J. Llorens Fábreagas'),
(119, 'Jaime Peña'),
(149, 'James A Senn'),
(145, 'James A. Senn'),
(100, 'James Shamblin G.T Stenvens Jr'),
(124, 'Javier Guadalajara'),
(146, 'Jeffrey L. Whitten'),
(135, 'Jesus Antonio Bauza'),
(123, 'Joe Casad Bob Willsey'),
(137, 'Jolie E. Kendall'),
(86, 'Jose luis Losada'),
(113, 'Jose Molina'),
(117, 'Jose Parra'),
(42, 'Joseph Williams'),
(49, 'Juan Gutierrez'),
(48, 'Juan Manuel Delgado'),
(83, 'Julian Rodriguez'),
(136, 'Kenneth E. Kendall'),
(26, 'Kentaro Miura'),
(59, 'Kurt Lewin'),
(109, 'L. Casey Larijani'),
(99, 'Larry weatherrford Jerfray Moore'),
(37, 'Leonor Buendia'),
(43, 'Liduvina Carrera'),
(147, 'Lonned D. Bentley'),
(35, 'Luis Batanas Palomares'),
(141, 'Luis Joyanes Aguilar'),
(110, 'Luz de Leon'),
(75, 'M. Paz Sandin'),
(34, 'Marcos Fidel Barrera Morales'),
(45, 'Maria E. Díaz'),
(30, 'Maria Eugenia Bautista'),
(120, 'Maria G. Vidal'),
(21, 'Maria Jose Aguilar Idañez'),
(92, 'Mario Tamayo'),
(72, 'Maritza Montero'),
(95, 'Melissa Walker'),
(85, 'Miguel Angel Rosado'),
(25, 'Miguel de Cervantes'),
(97, 'Miguel Martinez'),
(70, 'Miguel Martinez Miguelez'),
(44, 'Mireya Vasquez'),
(31, 'Mirian Balestrini Acuna'),
(28, 'Mirian Balestrinil'),
(90, 'Neil J. Salkind'),
(32, 'Nekane Balluerka'),
(128, 'Nestor Gonzalez'),
(62, 'O.Fais'),
(27, 'Oichiro Oda'),
(79, 'Paloma Lopez'),
(118, 'Peter Norton'),
(108, 'Philippe Coiffet'),
(47, 'Piergiorgio Corbetta'),
(57, 'Pilar Baptista'),
(38, 'Pilar Colás'),
(51, 'R. Sierra Bravo'),
(61, 'R. Stanvenhagen'),
(87, 'Rafael Lopez real'),
(140, 'Reinaldo Reina Cordero'),
(129, 'Richardd Stenaek'),
(104, 'Robert D. Cupper'),
(55, 'Roberto Hernandez'),
(152, 'Rogero Ma Cruz Delgado'),
(93, 'Rosa Maria Torres'),
(60, 'S.Tax'),
(82, 'Samuel Rolanson'),
(155, 'Sherry KinKoph'),
(130, 'Silcano Fausto'),
(114, 'Soe Habraken'),
(154, 'Solid Quality Learning'),
(121, 'Stephen J. Bigelow'),
(122, 'Steven Brown'),
(116, 'Steven MacConnell'),
(23, 'Sun Tzu'),
(78, 'Tulio Ramirez'),
(69, 'UPEL'),
(148, 'Victor M. Barlow'),
(105, 'W. James Brandley'),
(153, 'Walter Ruso'),
(40, 'Wayne Booth'),
(102, 'Wayne Wiston'),
(150, 'Wilkei Au Noreeen Canon'),
(65, 'Yolanda Jurado Rojas'),
(91, 'Zuleima del rosario Satalla');

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

--
-- Volcado de datos para la tabla `binnacle`
--

INSERT INTO `binnacle` (`id`, `user`, `action`, `date`, `ip_address`) VALUES
(2, 10, 'SuperBiblioteca ha ingresado al sistema', '2024-11-05 14:47:16', '190.89.30.214'),
(3, 10, 'SuperBiblioteca ha creado al usuario Johana', '2024-11-05 14:48:03', '190.89.30.214'),
(4, 13, 'Johana ha ingresado al sistema', '2024-11-05 14:48:22', '190.89.30.214'),
(5, 13, 'Insertó 25 libros mediante un excel', '2024-11-05 14:53:52', '190.89.30.214'),
(6, 13, 'Johana ha ingresado al sistema', '2024-11-07 10:39:54', '190.89.30.214'),
(7, 13, 'Johana ha ingresado al sistema', '2024-11-08 08:17:30', '181.208.23.118'),
(8, 13, 'Creó al lector Johana de cédula 14759036', '2024-11-08 08:18:57', '181.208.23.118'),
(9, 13, 'Creó un préstamo 1 al lector 13 y el libro 32', '2024-11-08 08:20:01', '181.208.23.118'),
(10, 13, 'Se devolvió el libro 32 del lector 13 del préstamo 1', '2024-11-08 13:53:51', '181.208.23.118'),
(11, 13, 'Insertó 4 libros mediante un excel', '2024-11-18 10:33:38', '181.208.23.118'),
(12, 13, 'Insertó 179 libros mediante un excel', '2024-11-20 08:32:03', '181.208.23.118'),
(13, 13, 'Insertó 35 libros mediante un excel', '2024-11-20 08:40:23', '181.208.23.118'),
(14, 13, 'Insertó 3 libros mediante un excel', '2024-11-20 10:36:30', '181.208.23.118'),
(15, 13, 'Creó al lector Víctor Xavier de cédula 28474452', '2024-11-20 11:14:34', '181.208.23.118');

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

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `call_number`, `title`, `editorial`, `pages`, `shelf`, `description`, `created_at`, `state`) VALUES
(24, '001.42 Ag932 e.1', 'Como elaborar un proyecto', 16, 128, '1', 'Guía para diseñar proyectos sociales y culturales', '2024-11-05 14:53:52', 'En biblioteca'),
(25, '001.42 Ag932 e.2', 'Como elaborar un proyecto', 16, 128, '1', 'Guía para diseñar proyectos sociales y culturales', '2024-11-05 14:53:52', 'En biblioteca'),
(26, '001.42 AN 225 e.1', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-05 14:53:52', 'En biblioteca'),
(27, '001.42 AN 225 e.2', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-05 14:53:52', 'En biblioteca'),
(28, '001.42 AN 225 e.3', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-05 14:53:52', 'En biblioteca'),
(29, '001.42 AN 225 e.4', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-05 14:53:52', 'En biblioteca'),
(30, '001.42 AN 225 e.5', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-05 14:53:52', 'En biblioteca'),
(31, '001.42 AN 225 e.6', 'Técnicas de investigación social', 17, 434, '1', 'Guía para ayudar a la realización de programas sociales, culturales y educativos', '2024-11-05 14:53:52', 'En biblioteca'),
(32, '001.42 AR41 e.1', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(33, '001.42 AR41 e.2', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(34, '001.42 AR41 e.3', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(35, '001.42 AR41 e.4', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(36, '001.42 AR41 e.5', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(37, '001.42 AR41 e.6', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(38, '001.42 AR41 e.7', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(39, '001.42 AR41 e.8', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(40, '001.42 AR41 e.9', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(41, '001.42 AR41 e.10', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(42, '001.42 AR41 e.11', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(43, '001.42 AR41 e.12', 'El proyecto de la investigación', 18, 144, '1', 'Conceptos básicos sobre la metodología científica', '2024-11-05 14:53:52', 'En biblioteca'),
(44, '001.42 AR41M e.1', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-05 14:53:52', 'En biblioteca'),
(45, '001.42 AR41M e.2', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-05 14:53:52', 'En biblioteca'),
(46, '001.42 AR41M e.3', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-05 14:53:52', 'En biblioteca'),
(47, '001.42 AR41M e.4', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-05 14:53:52', 'En biblioteca'),
(48, '001.42 AR41M e.5', 'Mitos y errores en la elaboración de tesis y proyectos de investigación', 18, 96, '1', 'Identificar los errores mas comunes que se cometen en la elaboración de tesis y proyectos', '2024-11-05 14:53:52', 'En biblioteca'),
(49, '001.20 HREW e.1', 'El arte de la guerra', 19, 40, 'A1', 'Explica diversas estrategias para persuadir personas y ganar batallas o discusiones con el poder de la elocuencia y la mente', '2024-11-18 10:33:38', 'En biblioteca'),
(50, '001.22 RAW21 e.1', 'La llamada de Cthulhu', 20, 24, 'A1', 'Relata el ficticio nacimiento de un horror cósmico cuya presencia resuena en las mentes y cuerpos de todas las personas y seres', '2024-11-18 10:33:38', 'En biblioteca'),
(51, '001.44 YGNZA e.1', 'Don Quijote de la Mancha', 21, 225, 'A2', 'Trata de las ocurrencias, aventuras y vivencias de un caballero medieval delirantemente obsesionado con las costumbres caballerescas de la edad media', '2024-11-18 10:33:38', 'En biblioteca'),
(52, '001.12 TKIYUT e.1', 'Berserk Vol. 1', 22, 220, 'A1', 'Cuenta la historia de un misterioso y oscuro espadachín que lucha contra monstruos que se alzan en su contra por alguna razón', '2024-11-18 10:33:38', 'En biblioteca'),
(53, '001.42 B195 e.1', 'Metodología para la elaboración de informes', 23, 188, '1', 'Apoyo para la elaboración y redacción de informes', '2024-11-20 08:31:59', 'En biblioteca'),
(54, '001.42 B195 e.2', 'Metodología para la elaboración de informes', 23, 188, '1', 'Apoyo para la elaboración y redacción de informes', '2024-11-20 08:31:59', 'En biblioteca'),
(55, '001.4 B328 e.1', 'Manual de la metodología de la investigación', 24, 87, '1', 'Aborda el proceso de investigación para la búsqueda del conocimiento científico', '2024-11-20 08:31:59', 'En biblioteca'),
(56, '001.4 B328 e.2', 'Manual de la metodología de la investigación', 24, 87, '1', 'Aborda el proceso de investigación para la búsqueda del conocimiento científico', '2024-11-20 08:31:59', 'En biblioteca'),
(57, '001.42 B195C e.1', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(58, '001.42 B195C e.2', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(59, '001.42 B195C e.3', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(60, '001.42 B195C e.4', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(61, '001.42 B195C e.5', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(62, '001.42 B195C e.6', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(63, '001.42 B195C e.7', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(64, '001.42 B195C e.8', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(65, '001.42 B13450 e.1', 'Como se elabora el proyecto de investigación', 23, 252, '1', 'Obra didáctica que ayuda a orientar el desarrollo de la investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(66, '001.42 B214 e.1', 'Diseños de investigación experimental en psicología', 25, 406, '1', 'Proporciona al lector pautas necesarias para realizar investigaciones originales', '2024-11-20 08:31:59', 'En biblioteca'),
(67, '001.42 B214 e.2', 'Diseños de investigación experimental en psicología', 25, 406, '1', 'Proporciona al lector pautas necesarias para realizar investigaciones originales', '2024-11-20 08:31:59', 'En biblioteca'),
(68, '001.42 B274 e.1', 'Líneas de investigación', 26, 106, '1', 'Aspectos sencillos para expertos y profanos en la materia de investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(69, '001.42 B311 e.1', 'Investigación y diagnóstico en educación. Una perspectiva psicopedagógica', 27, 230, '1', 'Actuación preventiva, desarrollo y potenciación de cada alumno', '2024-11-20 08:31:59', 'En biblioteca'),
(70, '001.43 F.391 e.1', 'Investigación social', 28, 320, '1', 'Manual de métodos y técnicas de investigación social, basada en la experiencia adquirida por la autora', '2024-11-20 08:31:59', 'En biblioteca'),
(71, '001.42 B862 e.1', 'Métodos de investigación en psicopedagogía', 29, 350, '1', 'Variedad de perspectivas metodológicas que ofrecen al lector la oportunidad de responder cualquier problema', '2024-11-20 08:31:59', 'En biblioteca'),
(72, '001.42 B862 e.2', 'Métodos de investigación en psicopedagogía', 29, 350, '1', 'Variedad de perspectivas metodológicas que ofrecen al lector la oportunidad de responder cualquier problema', '2024-11-20 08:31:59', 'En biblioteca'),
(73, '001.42 C737 e.1', 'Como convertirse en un hábil investigador', 30, 320, '1', 'Guía para planificar, realizar investigaciones de cualquier disciplina y nivel', '2024-11-20 08:31:59', 'En biblioteca'),
(74, '001.42 C233 e.1', 'Técnicas de redacción e investigación documental', 31, 208, '1', 'Material que abarca diversas herramientas para la elaboración de proyectos de investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(75, '001.42 C233 e.2', 'Técnicas de redacción e investigación documental', 31, 208, '1', 'Material que abarca diversas herramientas para la elaboración de proyectos de investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(76, '001.42 C233 e.3', 'Técnicas de redacción e investigación documental', 31, 208, '1', 'Material que abarca diversas herramientas para la elaboración de proyectos de investigación', '2024-11-20 08:31:59', 'En biblioteca'),
(77, '001.42 C776 e.1', 'Métodos de investigación y estadística en psicología', 32, 600, '1', 'Contiene los aspectos mas importantes del estudio de los métodos estadísticos', '2024-11-20 08:31:59', 'En biblioteca'),
(78, '001.42 C810 e.1', 'Métodos y técnicas de investigación social', 29, 448, '1', 'Manual de herramientas para la elaboración de una investigación de campo social', '2024-11-20 08:31:59', 'En biblioteca'),
(79, '001.42 C810 e.2', 'Métodos y técnicas de investigación social', 29, 448, '1', 'Manual de herramientas para la elaboración de una investigación de campo social', '2024-11-20 08:31:59', 'En biblioteca'),
(80, '001.42 C810 e.3', 'Métodos y técnicas de investigación social', 29, 448, '1', 'Manual de herramientas para la elaboración de una investigación de campo social', '2024-11-20 08:31:59', 'En biblioteca'),
(81, '001.42 D378 e.1', 'Métodos y técnicas cualitativas  de investigación en ciencias sociales', 33, 672, '1', 'Contiene contexto y proceso para la producción de un libro', '2024-11-20 08:31:59', 'En biblioteca'),
(82, '001.42 E1581 e.1', 'El cambio educativo desde la investigación-acción', 34, 192, '1', 'Estrategia que contribuye al desarrollo profesional de los docentes', '2024-11-20 08:31:59', 'En biblioteca'),
(83, '001.42 E1581 e.2', 'El cambio educativo desde la investigación-acción', 34, 192, '1', 'Estrategia que contribuye al desarrollo profesional de los docentes', '2024-11-20 08:31:59', 'En biblioteca'),
(84, '001.42 F391 e.1', 'Técnicas de investigación social. Teoría y ejercicios', 35, 720, '1', 'Colección de casos prácticos, seguidos de sus respuestas', '2024-11-20 08:31:59', 'En biblioteca'),
(85, '001.42 B456 e.1', 'Metodología  de la investigación', 36, 286, '1', 'Principios básicos del método científico', '2024-11-20 08:31:59', 'En biblioteca'),
(86, '001.42 B456 e.2', 'Metodología  de la investigación', 36, 286, '1', 'Principios básicos del método científico', '2024-11-20 08:31:59', 'En biblioteca'),
(87, '001.42 B456 e.3', 'Metodología  de la investigación', 36, 286, '1', 'Principios básicos del método científico', '2024-11-20 08:31:59', 'En biblioteca'),
(88, '001.42 G141 e.1', 'Métodos de investigación en psicología y educación', 29, 262, '1', 'Facilita la comprensión de los conceptos fundamentales en el diseño de investigaciones en psicología y educación', '2024-11-20 08:31:59', 'En biblioteca'),
(89, '001.42 G141 e.2', 'Métodos de investigación en psicología y educación', 29, 262, '1', 'Facilita la comprensión de los conceptos fundamentales en el diseño de investigaciones en psicología y educación', '2024-11-20 08:31:59', 'En biblioteca'),
(90, '001.42 G141 e.3', 'Métodos de investigación en psicología y educación', 29, 262, '1', 'Facilita la comprensión de los conceptos fundamentales en el diseño de investigaciones en psicología y educación', '2024-11-20 08:31:59', 'En biblioteca'),
(91, '001.42 G589 e.1', 'Investigación cualitativa y subjetividad', 29, 156, '1', 'Estimula al lector a comprender mejor el trabajo de la mente', '2024-11-20 08:31:59', 'En biblioteca'),
(92, '001.42 G589 e.2', 'Investigación cualitativa y subjetividad', 29, 156, '1', 'Estimula al lector a comprender mejor el trabajo de la mente', '2024-11-20 08:31:59', 'En biblioteca'),
(93, '001.42 H430 e.1', 'Metodología de la investigación', 29, 706, '1', 'Presentación y análisis del enfoque clásico cuantitativo', '2024-11-20 08:31:59', 'En biblioteca'),
(94, '001.42 H430 e.2', 'Metodología de la investigación', 29, 706, '1', 'Presentación y análisis del enfoque clásico cuantitativo', '2024-11-20 08:31:59', 'En biblioteca'),
(95, '001.42 H430 e.3', 'Metodología de la investigación', 29, 706, '1', 'Presentación y análisis del enfoque clásico cuantitativo', '2024-11-20 08:31:59', 'En biblioteca'),
(96, '001.42 H430 e.4', 'Metodología de la investigación', 29, 706, '1', 'Presentación y análisis del enfoque clásico cuantitativo', '2024-11-20 08:31:59', 'En biblioteca'),
(97, '001.42 H430 e.5', 'Metodología de la investigación', 29, 706, '1', 'Presentación y análisis del enfoque clásico cuantitativo', '2024-11-20 08:31:59', 'En biblioteca'),
(98, '001.42 H430 e.6', 'Metodología de la investigación', 29, 852, '1', 'Análisis de enfoque cualitativo y cuantitativo', '2024-11-20 08:32:00', 'En biblioteca'),
(99, '001.42 H430 e.7', 'Metodología de la investigación', 29, 852, '1', 'Análisis de enfoque cualitativo y cuantitativo', '2024-11-20 08:32:00', 'En biblioteca'),
(100, '001.42 H430 e.8', 'Metodología de la investigación', 29, 852, '1', 'Análisis de enfoque cualitativo y cuantitativo', '2024-11-20 08:32:00', 'En biblioteca'),
(101, '001.42 H430F e.1', 'Fundamentos de la investigación', 29, 336, '1', 'Fundamentos de la Investigacion Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(102, '001.42 H430F e.2', 'Fundamentos de la investigación', 29, 336, '1', 'Fundamentos de la Investigacion Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(103, '001.42 H947 e.1', 'Metodología de la investigación Holística', 37, 638, '1', 'Fundamentos de la Investigacion Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(104, '001.42 H947 e.2', 'Metodología de la investigación Holística', 37, 638, '1', 'Fundamentos de la Investigacion Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(105, '001.42 IN8971 e.1', 'La investigación - acción participativa inicios y desarrollos', 38, 194, '1', 'Fundamentos de la Investigacion Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(106, '001.42 IL5 e.1', 'Técnicas de investigación Bibliográfica', 39, 211, '1', 'Fundamentos de la Investigacion Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(107, '001.42 IV7 e.1', 'Aproximación teórica al educador', 40, 104, '1', 'Fundamentos de la Investigacion Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(108, '001.42 J974 e.1', 'Técnicas de investigación documental', 41, 246, '1', 'Manual para elaboración de tesis, monografías, ensayos, entre otros.', '2024-11-20 08:32:00', 'En biblioteca'),
(109, '001.42 J974 e.2', 'Técnicas de investigación documental', 41, 246, '1', 'Manual para elaboración de tesis, monografías, ensayos, entre otros.', '2024-11-20 08:32:00', 'En biblioteca'),
(110, '001.42 K457 e.1', 'Investigación del comportamiento métodos del investigación en ciencias sociales', 42, 868, '1', 'Los elementos para comprender del enfoque científico en la resolución de problemas', '2024-11-20 08:32:00', 'En biblioteca'),
(111, '001.42 K457 e.2', 'Investigación del comportamiento métodos del investigación en ciencias sociales', 42, 868, '1', 'Los elementos para comprender del enfoque científico en la resolución de problemas', '2024-11-20 08:32:00', 'En biblioteca'),
(112, '001.42 K457 e.3', 'Investigación del comportamiento métodos del investigación en ciencias sociales', 42, 868, '1', 'Los elementos para comprender del enfoque científico en la resolución de problemas', '2024-11-20 08:32:00', 'En biblioteca'),
(113, '001.42 K457 e.4', 'Metodología de la investigación contable', 42, 455, '1', 'Metodología en el campo de la contaduría.', '2024-11-20 08:32:00', 'En biblioteca'),
(114, '001.42 LN897 e.1', 'Investigación Post grado', 43, 200, '1', 'Revista de investigación de post grado de diferentes investigaciones', '2024-11-20 08:32:00', 'En biblioteca'),
(115, '001.42 LN897 e.2', 'Investigación Post grado', 43, 200, '1', 'Revista de investigación de post grado de diferentes investigaciones', '2024-11-20 08:32:00', 'En biblioteca'),
(116, '001.42 LN897 e.3', 'Investigación Post grado', 43, 200, '1', 'Revista de investigación de post grado de diferentes investigaciones', '2024-11-20 08:32:00', 'En biblioteca'),
(117, '001.42 M319 e.1', 'Manual de trabajos de grados de especialización y maestría y tesis doctorales', 44, 215, '1', 'Un Instrumento de Trabajo para mejorar la investigación Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(118, '001.42 M319 e.2', 'Manual de trabajos de grados de especialización y maestría y tesis doctorales', 44, 238, '1', 'Un Instrumento de Trabajo para mejorar la investigación Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(119, '001.42 M319 e.3', 'Manual de trabajos de grados de especialización y maestría y tesis doctorales', 44, 238, '1', 'Un Instrumento de Trabajo para mejorar la investigación Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(120, '001.42 M319 e.4', 'Manual de trabajos de grados de especialización y maestría y tesis doctorales', 44, 238, '1', 'Un Instrumento de Trabajo para mejorar la investigación Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(121, '001.42 M319 e.5', 'Manual de trabajos de grados de especialización y maestría y tesis doctorales', 44, 238, '1', 'Un Instrumento de Trabajo para mejorar la investigación Cientifica', '2024-11-20 08:32:00', 'En biblioteca'),
(122, '001.42 M366 e.1', 'El paradigma emergente', 28, 263, '1', 'Procesos Emergentes en la investigación Educativa', '2024-11-20 08:32:00', 'En biblioteca'),
(123, '001.42 M366 e.2', 'El paradigma emergente', 28, 263, '1', 'Procesos Emergentes en la investigación Educativa', '2024-11-20 08:32:00', 'En biblioteca'),
(124, '001.42 M366 e.3', 'El paradigma emergente', 28, 263, '1', 'Procesos Emergentes en la investigación Educativa', '2024-11-20 08:32:00', 'En biblioteca'),
(125, '001.42 M366L e.1', 'La investigación cualitativa etnográfica en educación', 28, 175, '1', 'El paradigma científico pos positivista diseño general.', '2024-11-20 08:32:00', 'En biblioteca'),
(126, '001.42 M366L e.2', 'La investigación cualitativa etnográfica en educación', 28, 175, '1', 'El paradigma científico pos positivista diseño general.', '2024-11-20 08:32:00', 'En biblioteca'),
(127, '001.42 M366L e.3', 'La investigación cualitativa etnográfica en educación', 28, 175, '1', 'El paradigma científico pos positivista diseño general.', '2024-11-20 08:32:00', 'En biblioteca'),
(128, '001.42 M366L e.4', 'La investigación cualitativa etnográfica en educación', 28, 175, '1', 'El paradigma científico pos positivista diseño general.', '2024-11-20 08:32:00', 'En biblioteca'),
(129, '001.42 M366L e.5', 'La investigación cualitativa etnográfica en educación', 28, 175, '1', 'El paradigma científico pos positivista diseño general.', '2024-11-20 08:32:00', 'En biblioteca'),
(130, '001.42 M522 e.1', 'Metodología', 42, 169, '1', 'Guía para elaborar diseños de investigación ciencias económicas', '2024-11-20 08:32:00', 'En biblioteca'),
(131, '001.42 M764 e.1', 'Investigación documental técnicas y procedimientos', 31, 143, '1', 'Guía para diversas técnicas de búsqueda de datos', '2024-11-20 08:32:00', 'En biblioteca'),
(132, '001.42 M764 e.2', 'Investigación documental técnicas y procedimientos', 31, 143, '1', 'Guía para diversas técnicas de búsqueda de datos', '2024-11-20 08:32:00', 'En biblioteca'),
(133, '001.42 H656 e.1', 'Técnicas de investigación documental', 28, 88, '1', 'Guía para las técnicas de investigación documental  y manual', '2024-11-20 08:32:00', 'En biblioteca'),
(134, '001.42 H656 e.2', 'Como diseñar y elaborar proyectos', 45, 156, '1', 'Instrumento para diseñar u elaborar proyectos', '2024-11-20 08:32:00', 'En biblioteca'),
(135, '001.42 H656 e.3', 'Como diseñar y elaborar proyectos', 45, 156, '1', 'Instrumento para diseñar u elaborar proyectos', '2024-11-20 08:32:00', 'En biblioteca'),
(136, '001.42 P298 e.1', 'La investigación cualitativa en educación Fundamentos y tradiciones', 42, 258, '1', 'Modelo investigativo fundamentos y bases en educación', '2024-11-20 08:32:00', 'En biblioteca'),
(137, '001.42 P298 e.2', 'La investigación cualitativa en educación Fundamentos y tradiciones', 42, 258, '1', 'Modelo investigativo fundamentos y bases en educación', '2024-11-20 08:32:00', 'En biblioteca'),
(138, '001.42 P31 e.1', 'Reflexiones acerca de la investigación en educación y pedagogía', 46, 218, '1', 'Compilación de teórias en base a la investigación en Educación', '2024-11-20 08:32:00', 'En biblioteca'),
(139, '001.42 Q457 e.1', 'IMF Falta la tesis!', 47, 120, '1', 'Estructura de la tesis', '2024-11-20 08:32:00', 'En biblioteca'),
(140, '001.42 Q457 e.2', 'IMF Falta la tesis!', 47, 120, '1', 'Estructura de la tesis', '2024-11-20 08:32:00', 'En biblioteca'),
(141, '001.42 R145 e.1', 'Como hacer un proyecto de investigación', 31, 128, '1', 'Pasos a Seguir para elaborar un proyecto', '2024-11-20 08:32:00', 'En biblioteca'),
(142, '001.42 L881 e.1', 'Un método para la investigación - acciones participativa', 38, 162, '1', 'Estructura y bases de la investigación acción', '2024-11-20 08:32:00', 'En biblioteca'),
(143, '001.42 R449 e.1', 'Como presentar una tesis y trabajos de investigación', 48, 128, '1', 'Estrategias para presentar una tesis de manera formal y espcializada', '2024-11-20 08:32:00', 'En biblioteca'),
(144, '001.42 R560 e.1', 'De proyecto a programa', 49, 420, '1', 'Cambio de enfoque investigativo', '2024-11-20 08:32:01', 'En biblioteca'),
(145, '001.42 R618 e.1', 'Manual de metodología para el estudiante y profesor', 47, 134, '1', 'La metodologia y su importancia en la realidad educativa', '2024-11-20 08:32:01', 'En biblioteca'),
(146, '001.42 R618 e.2', 'Manual de metodología para el estudiante y profesor', 47, 134, '1', 'La metodologia y su importancia en la realidad educativa', '2024-11-20 08:32:01', 'En biblioteca'),
(147, '001.42 R631 e.1', 'Como informar por escrito', 50, 289, '1', 'Estructuración de un mensaje', '2024-11-20 08:32:01', 'En biblioteca'),
(148, '001.42 R631 e.2', 'Como informar por escrito', 50, 289, '1', 'Estructuración de un mensaje', '2024-11-20 08:32:01', 'En biblioteca'),
(149, '001.42 R631 e.3', 'Como informar por escrito', 50, 289, '1', 'Estructuración de un mensaje', '2024-11-20 08:32:01', 'En biblioteca'),
(150, '001.42 R631 e.4', 'Como informar por escrito', 50, 289, '1', 'Estructuración de un mensaje', '2024-11-20 08:32:01', 'En biblioteca'),
(151, '001.42 R710 e.1', 'Metodología de investigación y evaluación', 28, 253, '1', 'Proceso Investigativo y Evaluativo', '2024-11-20 08:32:01', 'En biblioteca'),
(152, '001.42 R710 e.2', 'Metodología de investigación y evaluación', 28, 253, '1', 'Proceso Investigativo y Evaluativo', '2024-11-20 08:32:01', 'En biblioteca'),
(153, '001.42 R710 e.3', 'Metodología de investigación y evaluación', 28, 253, '1', 'Proceso Investigativo y Evaluativo', '2024-11-20 08:32:01', 'En biblioteca'),
(154, '001.42 L959 e.1', 'Métodos de investigación en ciencias humanas y sociales', 35, 246, '1', 'Diferentes Métodos de investigación', '2024-11-20 08:32:01', 'En biblioteca'),
(155, '001.42 L959 e.2', 'Métodos de investigación en ciencias humanas y sociales', 35, 246, '1', 'Diferentes Métodos de investigación', '2024-11-20 08:32:01', 'En biblioteca'),
(156, '001.43 SE429 e.1', 'Investigación de Muestreo', 51, 413, '1', 'El muestreo como herramienta de investigación', '2024-11-20 08:32:01', 'En biblioteca'),
(157, '001.42 SA13C e.1', 'Como hacer una tesis y elaborar todo tipo de escrito', 31, 141, '1', 'Guia para elaborar una tesis o un escrito', '2024-11-20 08:32:01', 'En biblioteca'),
(158, '001.42 SA13C e.2', 'Como hacer una tesis y elaborar todo tipo de escrito', 31, 141, '1', 'Guia para elaborar una tesis o un escrito', '2024-11-20 08:32:01', 'En biblioteca'),
(159, '001.42 SA13C e.3', 'Como hacer una tesis y elaborar todo tipo de escrito', 31, 141, '1', 'Guia para elaborar una tesis o un escrito', '2024-11-20 08:32:01', 'En biblioteca'),
(160, '001.42 SA13C e.4', 'Como hacer una tesis y elaborar todo tipo de escrito', 31, 141, '1', 'Guia para elaborar una tesis o un escrito', '2024-11-20 08:32:01', 'En biblioteca'),
(161, '001.42 SA13C e.5', 'Como hacer una tesis y elaborar todo tipo de escrito', 31, 141, '1', 'Guia para elaborar una tesis o un escrito', '2024-11-20 08:32:01', 'En biblioteca'),
(162, '001.42 SA13C e.6', 'Como hacer una tesis y elaborar todo tipo de escrito', 31, 141, '1', 'Guia para elaborar una tesis o un escrito', '2024-11-20 08:32:01', 'En biblioteca'),
(163, '001.42 SA13 e.1', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(164, '001.42 SA13 e.2', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(165, '001.42 SA13 e.3', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(166, '001.42 SA13 e.4', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(167, '001.42 SA13 e.5', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(168, '001.42 SA13 e.6', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(169, '001.42 SA13 e.7', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(170, '001.42 SA13 e.8', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(171, '001.42 SA13 e.9', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(172, '001.42 SA13 e.10', 'El proceso de la investigación', 31, 151, '1', 'La investigación un proceso dinámico', '2024-11-20 08:32:01', 'En biblioteca'),
(173, '001.42 SA345 e.1', 'Métodos de investigación |', 25, 380, '1', 'Procesos investigativos', '2024-11-20 08:32:01', 'En biblioteca'),
(174, '001.42 SA345 e.2', 'Métodos de investigación |', 25, 380, '1', 'Procesos investigativos', '2024-11-20 08:32:01', 'En biblioteca'),
(175, '001.42 SA52 e.1', 'Guía para elaboración formal de reportes de investigación', 52, 126, '1', 'Guía de elaboracion de escritos formales', '2024-11-20 08:32:01', 'En biblioteca'),
(176, '001.42 SA52 e.2', 'Guía para elaboración formal de reportes de investigación', 52, 126, '1', 'Guía de elaboracion de escritos formales', '2024-11-20 08:32:01', 'En biblioteca'),
(177, '001.42 SA52 e.3', 'Guía para elaboración formal de reportes de investigación', 52, 126, '1', 'Guía de elaboracion de escritos formales', '2024-11-20 08:32:01', 'En biblioteca'),
(178, '001.42 T15 e.1', 'El proceso de la investigación científica', 53, 440, '1', 'Ayuda a responder al alumno diferentes procesos o etapas de  investigación científica', '2024-11-20 08:32:01', 'En biblioteca'),
(179, '001.42 T15 e.2', 'El proceso de la investigación científica', 53, 440, '1', 'Ayuda a responder al alumno diferentes procesos o etapas de  investigación científica', '2024-11-20 08:32:01', 'En biblioteca'),
(180, '001.42 T6 e.1', 'Tesis para justicia educativa el cambio y justicia económica educativo', 54, 196, '1', 'La justicia educativa bajo un modelo cambiante', '2024-11-20 08:32:01', 'En biblioteca'),
(181, '001.42 UPZ e.1', 'Investigación Educación', 44, 166, '1', 'Estructura de la Investigación', '2024-11-20 08:32:01', 'En biblioteca'),
(182, '001.42 W83 e.1', 'Mejorar la escritura de la investigación cualitativa', 55, 226, '1', 'Ayuda sobre como, mejorar la escritura de investigación cualitativa.', '2024-11-20 08:32:01', 'En biblioteca'),
(183, '001.42 W83 e.2', 'Mejorar la escritura de la investigación cualitativa', 55, 226, '1', 'Como mejorar la escritura de investigación cualitativa', '2024-11-20 08:32:01', 'En biblioteca'),
(184, '001.42 WIS1 e.1', 'Cómo escribir trabajos de investigación', 30, 472, '1', 'Guía de correo, redactar trabajos.', '2024-11-20 08:32:01', 'En biblioteca'),
(185, '001.42 W436 e.1', 'Investigación evaluativas métodos para determinar la eficiencia de los programas', 28, 231, '1', 'Objetivos de la evaluación Diseño de evaluación.', '2024-11-20 08:32:01', 'En biblioteca'),
(186, '001.42 W436 e.2', 'Investigación evaluativas métodos para determinar la eficiencia de los programas', 28, 231, '1', 'Objetivos de la evaluación Diseño de evaluación.', '2024-11-20 08:32:01', 'En biblioteca'),
(187, '001.42 M366I e.1', 'La investigación cualitativa etnográfica en educación', 28, 175, '1', 'Investigación etnográfica bajo el enfoque educativo', '2024-11-20 08:32:01', 'En biblioteca'),
(188, '001.24 MB66C e.1', 'Ciencia y arte en la Metodología cualitativa', 28, 350, '1', 'Una gran universidad de procedimientos metodológicos y de explicaciones', '2024-11-20 08:32:01', 'En biblioteca'),
(189, '001.24 MB66C e.2', 'Ciencia y arte en la Metodología cualitativa', 28, 350, '1', 'Una gran universidad de procedimientos metodológicos y de explicaciones', '2024-11-20 08:32:01', 'En biblioteca'),
(190, '001.24 MB66C e.3', 'Ciencia y arte en la Metodología cualitativa', 28, 350, '1', 'Una gran universidad de procedimientos metodológicos y de explicaciones', '2024-11-20 08:32:01', 'En biblioteca'),
(191, '003 H558 e.1', 'Investigación de operaciones', 42, 1221, '1', 'Operacones y sus bases', '2024-11-20 08:32:01', 'En biblioteca'),
(192, '003 IN899 e.1', 'Investigación de operaciones en la ciencia administrativa', 56, 702, '1', 'Las operaciones y su complejidad', '2024-11-20 08:32:01', 'En biblioteca'),
(193, '003 J2325 e.1', 'Investigación de operaciones un enfoque fundamental', 57, 423, '1', 'Operaciones como Enfoque Fundamental', '2024-11-20 08:32:01', 'En biblioteca'),
(194, '003 T13 e.1', 'Investigación de operaciones taha', 58, 989, '1', 'Operaqciones Taha', '2024-11-20 08:32:01', 'En biblioteca'),
(195, '003 W733 e.1', 'Investigación de Operaciones Aplicaciones y Algoritmos', 35, 1418, '1', 'Los algoritmos y su aplicacion', '2024-11-20 08:32:02', 'En biblioteca'),
(196, '003 W733 e.3', 'Investigación de Operaciones Aplicaciones y Algoritmos', 35, 1418, '1', 'Los algoritmos y su aplicacion', '2024-11-20 08:32:02', 'En biblioteca'),
(197, '004.1 AI531 e.1', 'Computación I lógica, resolución de problemas, algoritmos y programas', 42, 422, '2', 'La Computacion y la resolucion de conflictos', '2024-11-20 08:32:02', 'En biblioteca'),
(198, '004.1 B895 e.1', 'Tecnologías de realidad virtual', 59, 430, '2', 'Realidad virtual un enfoque basado en la realidad', '2024-11-20 08:32:02', 'En biblioteca'),
(199, '004.1 C268 e.1', 'Realidad Virtual', 42, 268, '2', 'Bases y fundamentos de la realidad virtual', '2024-11-20 08:32:02', 'En biblioteca'),
(200, '004.1 D377 e.1', 'Photo Shop 4 Practico', 42, 768, '2', 'La estructuras de Photo Shop', '2024-11-20 08:32:02', 'En biblioteca'),
(201, '004.1 G164 e.1', 'Informática de gestión y sistemas de información', 42, 239, '2', 'Sistema de Informacion y su gestion', '2024-11-20 08:32:02', 'En biblioteca'),
(202, '009.1 H114 e.1', 'Routers Cisco Practico Serie', 25, 420, '2', 'Sistema de Cisco Practico', '2024-11-20 08:32:02', 'En biblioteca'),
(203, '004.1 L578 e.1', 'Computación y Programación moderna', 60, 640, '2', 'Leguaje de computacion moderna', '2024-11-20 08:32:02', 'En biblioteca'),
(204, '004.1 MI345 e.1', 'Proyectos informáticos', 42, 691, '2', 'Los proyectos informaticos y su estructura', '2024-11-20 08:32:02', 'En biblioteca'),
(205, '004.1 5772 e.1', 'Introducción a la computación', 61, 544, '2', 'Entendiendo la computacion y su estructura', '2024-11-20 08:32:02', 'En biblioteca'),
(206, '004.1 N821 e.1', 'Introducción a la computación', 42, 544, '2', 'Entendiendo la computacion y su estructura', '2024-11-20 08:32:02', 'En biblioteca'),
(207, '004.1 N821 e.2', 'Introducción a la computación', 42, 544, '2', 'Entendiendo la computacion y su estructura', '2024-11-20 08:32:02', 'En biblioteca'),
(208, '004.1 N821 e.3', 'Introducción a la computación', 42, 544, '2', 'Entendiendo la computacion y su estructura', '2024-11-20 08:32:02', 'En biblioteca'),
(209, '004.1 N821 e.4', 'Introducción a la computación', 42, 544, '2', 'Entendiendo la computacion y su estructura', '2024-11-20 08:32:02', 'En biblioteca'),
(210, '004.1 N821 e.5', 'Introducción a la computación', 42, 544, '2', 'Entendiendo la computacion y su estructura', '2024-11-20 08:32:02', 'En biblioteca'),
(211, '004.1 N821 e.6', 'Introducción a la computación', 42, 544, '2', 'Entendiendo la computacion y su estructura', '2024-11-20 08:32:02', 'En biblioteca'),
(212, '004.1 N821T e.1', 'Toda la PC', 25, 609, '2', 'Estructura del Computador', '2024-11-20 08:32:02', 'En biblioteca'),
(213, '004.1 P31 e.1', 'Introducción a la computación', 42, 257, '2', 'Computacion una forma de ver la realidad desde lo basico', '2024-11-20 08:32:02', 'En biblioteca'),
(214, '004.1 P31 e.2', 'Introducción a la computación', 42, 257, '2', 'Computacion una forma de ver la realidad desde lo basico', '2024-11-20 08:32:02', 'En biblioteca'),
(215, '004.1 P31 e.3', 'Introducción a la computación', 42, 257, '2', 'Computacion una forma de ver la realidad desde lo basico', '2024-11-20 08:32:02', 'En biblioteca'),
(216, '004.6 B281 e.1', 'Localización de averías, reparación mantenimiento y optimización de redes', 42, 996, '2', 'Aprendiendo a optimizar y gestionar tus redes', '2024-11-20 08:32:02', 'En biblioteca'),
(217, '004.6 B281 e.2', 'Localización de averías, reparación mantenimiento y optimización de redes', 42, 996, '2', 'Aprendiendo a optimizar y gestionar tus redes', '2024-11-20 08:32:02', 'En biblioteca'),
(218, '004.6 B281 e.3', 'Localización de averías, reparación mantenimiento y optimización de redes', 42, 996, '2', 'Aprendiendo a optimizar y gestionar tus redes', '2024-11-20 08:32:02', 'En biblioteca'),
(219, '004.6 B8121 e.1', 'Implementación de redes privadas virtuales', 42, 595, '2', 'Manejando y Gestionando redes privadas', '2024-11-20 08:32:02', 'En biblioteca'),
(220, '004.62 C261 e.1', 'Aprendiendo TCP/IP en 24 horas', 42, 348, '2', 'Funcionamiento de las comunicaciones entre computadoras', '2024-11-20 08:32:02', 'En biblioteca'),
(221, '004.6 EX741 e.1', 'Explorando Internet las autopistas de la información', 62, 156, '2', 'Explorando la internet y la informacion', '2024-11-20 08:32:02', 'En biblioteca'),
(222, '004.6 F769T e.1', 'Transmisión de datos y redes de comunicaciones', 42, 870, '2', 'Como aprender la trasmision de datos en el manejo del computador', '2024-11-20 08:32:02', 'En biblioteca'),
(223, '004.6 F769T e.2', 'Transmisión de datos y redes de comunicaciones', 42, 870, '2', 'Como aprender la trasmision de datos en el manejo del computador', '2024-11-20 08:32:02', 'En biblioteca'),
(224, '004.6 F769 e.1', 'Transmisión de datos y redes de comunicaciones', 42, 887, '2', 'Como aprender la trasmision de datos en el manejo del computador', '2024-11-20 08:32:02', 'En biblioteca'),
(225, '004.6 F769 e.2', 'Transmisión de datos y redes de comunicaciones', 42, 887, '2', 'Como aprender la trasmision de datos en el manejo del computador', '2024-11-20 08:32:02', 'En biblioteca'),
(226, '004.6 F769 e.3', 'Transmisión de datos y redes de comunicaciones', 42, 887, '2', 'Función y bases de las redes de datos', '2024-11-20 08:32:02', 'En biblioteca'),
(227, '004.6 F769 e.4', 'Transmisión de datos y redes de comunicaciones', 42, 887, '2', 'Función y bases de las redes de datos', '2024-11-20 08:32:03', 'En biblioteca'),
(228, '004.1 UN12 e.1', 'Introducción a la computación', 63, 54, '2', 'Nivel basico de Computacion', '2024-11-20 08:32:03', 'En biblioteca'),
(229, '004.6 H734 e.1', 'Estrategias para el uso eficiente del internet en el gobierno', 42, 393, '2', 'Uso eficiente del Internet en el Gobierno', '2024-11-20 08:32:03', 'En biblioteca'),
(230, '004.6 G589 e.1', 'Comunicaciones y redes de procesamientos de datos', 42, 396, '2', 'Estructura del Procesamiento de Datos', '2024-11-20 08:32:03', 'En biblioteca'),
(231, '004.6 G589 e.2', 'Comunicaciones y redes de procesamientos de datos', 42, 396, '2', 'Estructura del Procesamiento de Datos', '2024-11-20 08:32:03', 'En biblioteca'),
(232, '248.8 ST421 e.1', '¡Deja de controlarme!', 64, 200, '5A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(233, '248 F275 e.1', '¿Ocasión o tentación?', 65, 210, '6A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(234, '248.4 M48 e.1', '¿Quién puede hacer que amanezca?', 66, 247, '6A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(235, '248.4 M48 e.2', '¿Quién puede hacer que amanezca?', 66, 247, '6A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(236, '248.4 M48 e.3', '¿Quién puede hacer que amanezca?', 66, 247, '6A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(237, '48 F589 e.1', '¿Somos verdaderamente libres?', 67, 31, '6A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(238, '48 F589 e.2', '¿Somos verdaderamente libres?', 67, 31, '6A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(239, '48 F589 e.3', '¿Somos verdaderamente libres?', 67, 31, '6A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(240, '48 F589 e.4', '¿Somos verdaderamente libres?', 67, 31, '6A', '', '2024-11-20 08:40:22', 'En biblioteca'),
(241, '004.21 J106 e.1', 'Administración de Proyectos', 68, 477, '2', '', '2024-11-20 08:40:22', 'En biblioteca'),
(242, '004.21 L36 e.1', 'Administración de sistemas de información', 56, 885, '2', '', '2024-11-20 08:40:22', 'En biblioteca'),
(243, '004.21 L36 e.2', 'Administración de sistemas de información', 56, 885, '2', '', '2024-11-20 08:40:22', 'En biblioteca'),
(244, '004.21 L36 e.3', 'Administración de sistemas de información', 56, 885, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(245, '248.4 V24 e.1', 'Al andar se hace camino', 66, 242, '6A', '', '2024-11-20 08:40:23', 'En biblioteca'),
(246, '242.78 L.438 e.1', 'Al encuentro con Maria', 67, 80, '6A', '', '2024-11-20 08:40:23', 'En biblioteca'),
(247, '330 c311 e.1', 'Al final de la inflación', 69, 194, '5B', '', '2024-11-20 08:40:23', 'En biblioteca'),
(248, '005.133 j849m e.6', 'Algoritmos y estructuras de datos. Una perspectiva en c', 42, 655, '3', '', '2024-11-20 08:40:23', 'En biblioteca'),
(249, '005.133 j849m e.7', 'Algoritmos y estructuras de datos. Una perspectiva en c', 42, 655, '3', '', '2024-11-20 08:40:23', 'En biblioteca'),
(250, '375.008 P843 e.1', 'Análisis de currículo', 42, 345, '5A', '', '2024-11-20 08:40:23', 'En biblioteca'),
(251, '005.43 C763 e.1', 'Análisis de los negocios con Excel', 70, 569, '3', '', '2024-11-20 08:40:23', 'En biblioteca'),
(252, '004.21 K331 e.1', 'Análisis y diseño de sistemas', 56, 726, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(253, '004.21 K331 e.2', 'Análisis y diseño de sistemas', 56, 726, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(254, '004.21 K331 e.3', 'Análisis y diseño de sistemas', 56, 881, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(255, '004.6 SE589 e.1', 'Análisis y diseño de sistemas de información', 42, 643, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(256, '004.21 AN132 e.1', 'Análisis y diseño de sistemas de información', 42, 907, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(257, '004.21 AN132 e.2', 'Análisis y diseño de sistemas de información', 42, 907, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(258, '004.21 SE589 e.1', 'Análisis y diseño de sistemas de información', 42, 942, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(259, '004.21 SE589 e.2', 'Análisis y diseño de sistemas de información', 42, 942, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(260, '004.21 SE589 e.3', 'Análisis y diseño de sistemas de información', 42, 942, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(261, '248 AU1 e.1', 'Anhelos del corazon', 71, 254, '6A', '', '2024-11-20 08:40:23', 'En biblioteca'),
(262, '302.41 D712 e.1', 'Animación a la lectura ¿Cuántos cuentos cuentas tú?', 38, 190, '5A', '', '2024-11-20 08:40:23', 'En biblioteca'),
(263, '248 R095 e.1', 'Apreder a quererse asi mismo', 72, 154, '6A', '', '2024-11-20 08:40:23', 'En biblioteca'),
(264, '248 R095 e.2', 'Apreder a quererse asi mismo', 72, 154, '6A', '', '2024-11-20 08:40:23', 'En biblioteca'),
(265, '005.74 q252 e.1', 'Aprenda ya SQL server 2005 técnicas aplicadas', 42, 348, '3', '', '2024-11-20 08:40:23', 'En biblioteca'),
(266, '004.369 k621 e.1', 'Aprende Office 2000', 73, 404, '2', '', '2024-11-20 08:40:23', 'En biblioteca'),
(267, '005.362 p429 e.1', 'Aprendiendo visual Basic 6 en 21 días', 25, 851, '4', '', '2024-11-20 10:36:30', 'En biblioteca'),
(268, '005.362 p429 e.2', 'Aprendiendo visual Basic 6 en 21 días', 25, 851, '4', '', '2024-11-20 10:36:30', 'En biblioteca'),
(269, '005.362 p429 e.3', 'Aprendiendo visual Basic 6 en 21 días', 25, 851, '4', '', '2024-11-20 10:36:30', 'En biblioteca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_author`
--

CREATE TABLE `book_author` (
  `id` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `book_author`
--

INSERT INTO `book_author` (`id`, `book`, `author`) VALUES
(36, 24, 20),
(37, 24, 21),
(38, 25, 20),
(39, 25, 21),
(40, 26, 20),
(41, 27, 20),
(42, 28, 20),
(43, 29, 20),
(44, 30, 20),
(45, 31, 20),
(46, 32, 22),
(47, 33, 22),
(48, 34, 22),
(49, 35, 22),
(50, 36, 22),
(51, 37, 22),
(52, 38, 22),
(53, 39, 22),
(54, 40, 22),
(55, 41, 22),
(56, 42, 22),
(57, 43, 22),
(58, 44, 22),
(59, 45, 22),
(60, 46, 22),
(61, 47, 22),
(62, 48, 22),
(63, 49, 23),
(64, 50, 24),
(65, 51, 25),
(66, 52, 26),
(67, 52, 27),
(68, 53, 28),
(69, 53, 29),
(70, 54, 28),
(71, 54, 29),
(72, 55, 30),
(73, 56, 30),
(74, 57, 31),
(75, 58, 31),
(76, 59, 31),
(77, 60, 31),
(78, 61, 31),
(79, 62, 31),
(80, 63, 31),
(81, 64, 31),
(82, 65, 31),
(83, 66, 32),
(84, 66, 33),
(85, 67, 32),
(86, 67, 33),
(87, 68, 34),
(88, 69, 35),
(89, 70, 36),
(90, 71, 37),
(91, 71, 38),
(92, 71, 39),
(93, 72, 37),
(94, 72, 38),
(95, 72, 39),
(96, 73, 40),
(97, 73, 41),
(98, 73, 42),
(99, 74, 43),
(100, 74, 44),
(101, 74, 45),
(102, 75, 43),
(103, 75, 44),
(104, 75, 45),
(105, 76, 43),
(106, 76, 44),
(107, 76, 45),
(108, 77, 46),
(109, 78, 47),
(110, 79, 47),
(111, 80, 47),
(112, 81, 48),
(113, 81, 49),
(114, 82, 50),
(115, 83, 50),
(116, 84, 51),
(117, 85, 52),
(118, 86, 52),
(119, 87, 52),
(120, 88, 53),
(121, 89, 53),
(122, 90, 53),
(123, 91, 54),
(124, 92, 54),
(125, 93, 55),
(126, 93, 56),
(127, 93, 57),
(128, 94, 55),
(129, 94, 56),
(130, 94, 57),
(131, 95, 55),
(132, 95, 56),
(133, 95, 57),
(134, 96, 55),
(135, 96, 56),
(136, 96, 57),
(137, 97, 55),
(138, 97, 56),
(139, 97, 57),
(140, 98, 55),
(141, 98, 56),
(142, 98, 57),
(143, 99, 55),
(144, 99, 56),
(145, 99, 57),
(146, 100, 55),
(147, 100, 56),
(148, 100, 57),
(149, 101, 55),
(150, 101, 56),
(151, 101, 57),
(152, 102, 55),
(153, 102, 56),
(154, 102, 57),
(155, 103, 58),
(156, 104, 58),
(157, 105, 59),
(158, 105, 60),
(159, 105, 61),
(160, 105, 62),
(161, 106, 63),
(162, 107, 64),
(163, 108, 65),
(164, 109, 65),
(165, 110, 66),
(166, 110, 67),
(167, 111, 66),
(168, 111, 67),
(169, 112, 66),
(170, 112, 67),
(171, 113, 68),
(172, 114, 69),
(173, 115, 69),
(174, 116, 69),
(175, 117, 69),
(176, 118, 69),
(177, 119, 69),
(178, 120, 69),
(179, 121, 69),
(180, 122, 70),
(181, 123, 70),
(182, 124, 70),
(183, 125, 70),
(184, 126, 70),
(185, 127, 70),
(186, 128, 70),
(187, 129, 70),
(188, 130, 71),
(189, 131, 72),
(190, 131, 73),
(191, 132, 72),
(192, 132, 73),
(193, 133, 72),
(194, 133, 73),
(195, 134, 74),
(196, 135, 74),
(197, 136, 75),
(198, 137, 75),
(199, 138, 76),
(200, 139, 77),
(201, 140, 77),
(202, 141, 78),
(203, 142, 79),
(204, 143, 80),
(205, 143, 81),
(206, 144, 82),
(207, 145, 83),
(208, 146, 83),
(209, 147, 84),
(210, 148, 84),
(211, 149, 84),
(212, 150, 84),
(213, 151, 85),
(214, 152, 85),
(215, 153, 85),
(216, 154, 86),
(217, 154, 87),
(218, 155, 86),
(219, 155, 87),
(220, 156, 88),
(221, 157, 89),
(222, 158, 89),
(223, 159, 89),
(224, 160, 89),
(225, 161, 89),
(226, 162, 89),
(227, 163, 89),
(228, 164, 89),
(229, 165, 89),
(230, 166, 89),
(231, 167, 89),
(232, 168, 89),
(233, 169, 89),
(234, 170, 89),
(235, 171, 89),
(236, 172, 89),
(237, 173, 90),
(238, 174, 90),
(239, 175, 91),
(240, 176, 91),
(241, 177, 91),
(242, 178, 92),
(243, 179, 92),
(244, 180, 93),
(245, 181, 69),
(246, 182, 94),
(247, 183, 94),
(248, 184, 95),
(249, 185, 96),
(250, 186, 96),
(251, 187, 97),
(252, 188, 97),
(253, 189, 97),
(254, 190, 97),
(255, 191, 98),
(256, 192, 99),
(257, 193, 100),
(258, 194, 101),
(259, 195, 102),
(260, 196, 102),
(261, 197, 103),
(262, 197, 104),
(263, 197, 105),
(264, 197, 106),
(265, 198, 107),
(266, 198, 108),
(267, 199, 109),
(268, 200, 110),
(269, 201, 111),
(270, 201, 112),
(271, 201, 113),
(272, 202, 114),
(273, 203, 115),
(274, 204, 116),
(275, 205, 117),
(276, 206, 118),
(277, 207, 118),
(278, 208, 118),
(279, 209, 118),
(280, 210, 118),
(281, 211, 118),
(282, 212, 118),
(283, 213, 119),
(284, 213, 120),
(285, 214, 119),
(286, 214, 120),
(287, 215, 119),
(288, 215, 120),
(289, 216, 121),
(290, 217, 121),
(291, 218, 121),
(292, 219, 122),
(293, 220, 123),
(294, 221, 124),
(295, 221, 125),
(296, 222, 126),
(297, 223, 126),
(298, 224, 126),
(299, 225, 126),
(300, 226, 126),
(301, 227, 126),
(302, 228, 118),
(303, 229, 127),
(304, 230, 128),
(305, 231, 128),
(306, 232, 129),
(307, 233, 130),
(308, 234, 131),
(309, 235, 131),
(310, 236, 131),
(311, 237, 132),
(312, 237, 133),
(313, 238, 132),
(314, 238, 133),
(315, 239, 132),
(316, 239, 133),
(317, 240, 132),
(318, 240, 133),
(319, 241, 134),
(320, 241, 135),
(321, 242, 136),
(322, 242, 137),
(323, 243, 136),
(324, 243, 137),
(325, 244, 136),
(326, 244, 137),
(327, 245, 138),
(328, 246, 139),
(329, 247, 140),
(330, 248, 141),
(331, 248, 142),
(332, 249, 141),
(333, 249, 142),
(334, 250, 143),
(335, 251, 144),
(336, 252, 136),
(337, 252, 137),
(338, 253, 136),
(339, 253, 137),
(340, 254, 136),
(341, 254, 137),
(342, 255, 145),
(343, 256, 146),
(344, 256, 147),
(345, 256, 148),
(346, 257, 146),
(347, 257, 147),
(348, 257, 148),
(349, 258, 149),
(350, 259, 149),
(351, 260, 149),
(352, 261, 150),
(353, 262, 151),
(354, 262, 152),
(355, 263, 153),
(356, 264, 153),
(357, 265, 154),
(358, 266, 155),
(359, 267, 156),
(360, 268, 156),
(361, 269, 156);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_category`
--

CREATE TABLE `book_category` (
  `id` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `book_category`
--

INSERT INTO `book_category` (`id`, `book`, `category`) VALUES
(9, 24, 32),
(10, 25, 32),
(11, 26, 32),
(12, 27, 32),
(13, 28, 32),
(14, 29, 32),
(15, 30, 32),
(16, 31, 32),
(17, 32, 32),
(18, 33, 32),
(19, 34, 32),
(20, 35, 32),
(21, 36, 32),
(22, 37, 32),
(23, 38, 32),
(24, 39, 32),
(25, 40, 32),
(26, 41, 32),
(27, 42, 32),
(28, 43, 32),
(29, 44, 32),
(30, 45, 32),
(31, 46, 32),
(32, 47, 32),
(33, 48, 32),
(34, 49, 33),
(35, 50, 34),
(36, 50, 35),
(37, 50, 36),
(38, 51, 37),
(39, 51, 38),
(40, 52, 39),
(41, 52, 37),
(42, 53, 32),
(43, 54, 32),
(44, 55, 32),
(45, 56, 32),
(46, 57, 32),
(47, 58, 32),
(48, 59, 32),
(49, 60, 32),
(50, 61, 32),
(51, 62, 32),
(52, 63, 32),
(53, 64, 32),
(54, 65, 32),
(55, 66, 32),
(56, 67, 32),
(57, 68, 32),
(58, 69, 32),
(59, 70, 32),
(60, 71, 32),
(61, 72, 32),
(62, 73, 32),
(63, 74, 32),
(64, 75, 32),
(65, 76, 32),
(66, 77, 32),
(67, 78, 32),
(68, 79, 32),
(69, 80, 32),
(70, 81, 32),
(71, 82, 32),
(72, 83, 32),
(73, 84, 32),
(74, 85, 32),
(75, 86, 32),
(76, 87, 32),
(77, 88, 32),
(78, 89, 32),
(79, 90, 32),
(80, 91, 32),
(81, 92, 32),
(82, 93, 32),
(83, 94, 32),
(84, 95, 32),
(85, 96, 32),
(86, 97, 32),
(87, 98, 32),
(88, 99, 32),
(89, 100, 32),
(90, 101, 32),
(91, 102, 32),
(92, 103, 32),
(93, 104, 32),
(94, 105, 32),
(95, 106, 32),
(96, 107, 32),
(97, 108, 32),
(98, 109, 32),
(99, 110, 32),
(100, 111, 32),
(101, 112, 32),
(102, 113, 32),
(103, 114, 32),
(104, 115, 32),
(105, 116, 32),
(106, 117, 32),
(107, 118, 32),
(108, 119, 32),
(109, 120, 32),
(110, 121, 32),
(111, 122, 32),
(112, 123, 32),
(113, 124, 32),
(114, 125, 32),
(115, 126, 32),
(116, 127, 32),
(117, 128, 32),
(118, 129, 32),
(119, 130, 32),
(120, 131, 32),
(121, 132, 32),
(122, 133, 32),
(123, 134, 32),
(124, 135, 32),
(125, 136, 32),
(126, 137, 32),
(127, 138, 32),
(128, 139, 32),
(129, 140, 32),
(130, 141, 32),
(131, 142, 32),
(132, 143, 32),
(133, 144, 32),
(134, 145, 32),
(135, 146, 32),
(136, 147, 32),
(137, 148, 32),
(138, 149, 32),
(139, 150, 32),
(140, 151, 32),
(141, 152, 32),
(142, 153, 32),
(143, 154, 32),
(144, 155, 32),
(145, 156, 32),
(146, 157, 32),
(147, 158, 32),
(148, 159, 32),
(149, 160, 32),
(150, 161, 32),
(151, 162, 32),
(152, 163, 32),
(153, 164, 32),
(154, 165, 32),
(155, 166, 32),
(156, 167, 32),
(157, 168, 32),
(158, 169, 32),
(159, 170, 32),
(160, 171, 32),
(161, 172, 32),
(162, 173, 32),
(163, 174, 32),
(164, 175, 32),
(165, 176, 32),
(166, 177, 32),
(167, 178, 32),
(168, 179, 32),
(169, 180, 32),
(170, 181, 32),
(171, 182, 32),
(172, 183, 32),
(173, 184, 32),
(174, 185, 32),
(175, 186, 32),
(176, 187, 32),
(177, 188, 32),
(178, 189, 32),
(179, 190, 32),
(180, 191, 32),
(181, 192, 32),
(182, 193, 32),
(183, 194, 32),
(184, 195, 32),
(185, 196, 32),
(186, 197, 40),
(187, 198, 40),
(188, 199, 40),
(189, 200, 40),
(190, 201, 40),
(191, 202, 40),
(192, 203, 41),
(193, 204, 41),
(194, 205, 42),
(195, 206, 42),
(196, 207, 42),
(197, 208, 42),
(198, 209, 42),
(199, 210, 42),
(200, 211, 42),
(201, 212, 42),
(202, 213, 42),
(203, 214, 42),
(204, 215, 42),
(205, 216, 43),
(206, 217, 43),
(207, 218, 43),
(208, 219, 43),
(209, 220, 43),
(210, 221, 43),
(211, 222, 43),
(212, 223, 43),
(213, 224, 43),
(214, 225, 43),
(215, 226, 43),
(216, 227, 43),
(217, 228, 43),
(218, 229, 43),
(219, 230, 43),
(220, 231, 43),
(221, 232, 33),
(222, 233, 44),
(223, 234, 33),
(224, 235, 33),
(225, 236, 33),
(226, 237, 44),
(227, 238, 44),
(228, 239, 44),
(229, 240, 44),
(230, 241, 40),
(231, 242, 40),
(232, 243, 40),
(233, 244, 40),
(234, 245, 33),
(235, 246, 44),
(236, 247, 45),
(237, 248, 40),
(238, 249, 40),
(239, 250, 46),
(240, 251, 40),
(241, 252, 40),
(242, 253, 40),
(243, 254, 40),
(244, 255, 40),
(245, 256, 40),
(246, 257, 40),
(247, 258, 40),
(248, 259, 40),
(249, 260, 40),
(250, 261, 47),
(251, 262, 46),
(252, 263, 33),
(253, 264, 33),
(254, 265, 40),
(255, 266, 40),
(256, 267, 40),
(257, 268, 40),
(258, 269, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(39, 'Acción'),
(38, 'Clásico'),
(42, 'Computación'),
(41, 'Computación y programación'),
(33, 'Crecimiento personal'),
(47, 'Desarrollo humano'),
(46, 'Educación'),
(44, 'Espiritualidad'),
(37, 'Fantasía'),
(34, 'Ficción'),
(45, 'Historia'),
(40, 'Informática'),
(32, 'Metodología de la investigación'),
(36, 'Misterio'),
(43, 'Redes de Computadoras'),
(35, 'Terror');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id`, `name`) VALUES
(60, 'Addison weslay'),
(58, 'Alfaomega'),
(27, 'ALJIBE'),
(70, 'Bussiness Computer Library'),
(20, 'Capriles'),
(73, 'Ccolor'),
(41, 'CENGAGE Learning'),
(61, 'Centro de Contadores'),
(23, 'Consultores Asociados'),
(39, 'Contexto-Editores'),
(51, 'Ediciones Faces UCV'),
(18, 'Episteme'),
(45, 'Espacio'),
(48, 'EUMO Octaedro'),
(54, 'Fe y Alegria'),
(30, 'Gedisa'),
(22, 'Hakusensha'),
(19, 'La Flor'),
(40, 'Los Herandos Negros C.A.'),
(17, 'LUMEN'),
(16, 'LUMEN/HVHUMANITAS'),
(53, 'Lumusa Noriega Editores'),
(32, 'Manual Moderno'),
(42, 'MC Graw Hill'),
(57, 'Mc Graw Hilla'),
(29, 'McGrawHill'),
(68, 'MIRO C.A'),
(34, 'Morata'),
(72, 'Norma'),
(59, 'PAIDOS'),
(31, 'Panapo'),
(67, 'Paulinas'),
(36, 'Pearson'),
(56, 'Pearson Prentice Hall'),
(38, 'Popular'),
(65, 'PPC'),
(25, 'Prentice Hall'),
(26, 'Quirón . Sipal'),
(43, 'REINPOST'),
(66, 'Sal Terroe'),
(47, 'San Pablo'),
(21, 'Santillana'),
(71, 'Serendept'),
(64, 'Serendipit'),
(33, 'Síntesis'),
(37, 'SYPAL'),
(24, 'TALITIP,s.r.l'),
(35, 'Thomson'),
(62, 'Tower Comumunicationd SRL'),
(28, 'Trillas'),
(46, 'U. Pedagogica Nacional'),
(52, 'UCAB'),
(69, 'UCLA'),
(49, 'UCV'),
(55, 'Universidad de Antioquia'),
(63, 'Universidad Nacional Abierta'),
(44, 'UPEL'),
(50, 'Vadell Hermanos');

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

--
-- Volcado de datos para la tabla `loan`
--

INSERT INTO `loan` (`id`, `book`, `reader`, `observation`, `deliver_date`, `return_date`, `created_at`, `active`) VALUES
(1, 32, 13, '3 libros', '2024-11-08 08:20:01', '2024-11-08 13:53:51', '2024-11-08 08:20:01', 1);

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
(13, 'Editor', 'Super'),
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

--
-- Volcado de datos para la tabla `reader`
--

INSERT INTO `reader` (`id`, `cedula`, `names`, `surnames`, `gender`, `birthdate`, `phone`, `is_teacher`) VALUES
(13, '14759036', 'Johana', 'Velasquez', 'F', '2010-06-10', '04245952182', 1),
(14, '28474452', 'Víctor Xavier', 'Villarreta', 'M', '2004-04-29', '04245331443', 0);

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
(10, 'SuperBiblioteca', 'Super', '2024-07-26 08:07:00', '$argon2id$v=19$m=65536,t=3,p=4$H5QRUNQ1cKaCANACDAjBCg$HhicRyE9Opq0qHaFLJ257HMW0y4zCddGZmHtC/pGfe4', '$argon2id$v=19$m=65536,t=3,p=4$GkRS30Iy5uxTcdhaDvvehA$wtHRL3eqs04xtxOhGcFhoFyd+Y1A8bXCDdDUUrkOYvA', 'dcd78902-70b4-40a2-9c17-b7a0486e9980-5f031834-7798-4cb4-a77b-114b3a7b8d6f', 1),
(13, 'Johana', 'Admin', '2024-11-05 14:48:03', '$argon2id$v=19$m=65536,t=3,p=4$wMFKS5djwvcdT5BWtOkrqQ$Zy/WZjE/DQU+eh8D6elrXwqYc9Mp3TaMIfMpWeMQtx8', '$argon2id$v=19$m=65536,t=3,p=4$NICE05K0btjflGxXdBq5RQ$InlaP4ZzsHfPGXsIAs7ji6k0x3mFhDOF9KbjeqLlMpU', 'ace7ef67-8c8d-4e46-8d22-fa35edb0f454-bf1aa086-9cbd-46a0-bacd-d98605f0b71d', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de la tabla `binnacle`
--
ALTER TABLE `binnacle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT de la tabla `book_author`
--
ALTER TABLE `book_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=362;

--
-- AUTO_INCREMENT de la tabla `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisson`
--
ALTER TABLE `permisson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
