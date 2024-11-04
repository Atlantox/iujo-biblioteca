--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`id`, `name`) VALUES
(2, 'Atlantox'),
(10, 'Autorsote'),
(11, 'Chuylaso'),
(12, 'Chuylaso2'),
(4, 'Edgar Allan Poe'),
(8, 'H. P. Lovecraft'),
(1, 'Kentaro Miura'),
(6, 'Mamma Mia'),
(9, 'Miguel de Cervantes'),
(5, 'Miguelito'),
(3, 'Nadie'),
(7, 'Sun Tzu');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `binnacle`
--

INSERT INTO `binnacle` (`id`, `user`, `action`, `date`, `ip_address`) VALUES
(1, 1, 'Atlantox7 Ha creado al usuario El pepito5', '2024-04-30 10:03:08', ''),
(2, 1, 'Atlantox7 Ha creado al usuario El pepito6', '2024-04-30 10:11:46', ''),
(3, 1, 'Atlantox7 Ha creado al usuario El pepito7', '2024-04-30 10:12:11', ''),
(4, 1, 'Atlantox7 Ha creado al usuario El pepito8', '2024-04-30 10:13:45', ''),
(5, 1, 'Creó la categoría Comedia', '2024-05-07 09:15:18', ''),
(6, 1, 'Creó la categoría Romance', '2024-05-07 09:15:21', ''),
(7, 1, 'Creó la categoría Terror', '2024-05-07 09:15:25', ''),
(8, 1, 'Creó la categoría Fantasía', '2024-05-07 09:15:29', ''),
(9, 1, 'Creó la categoría Historia', '2024-05-07 09:15:35', ''),
(10, 1, 'Creó la categoría Acción', '2024-05-07 09:15:45', ''),
(11, 1, 'Creó la categoría Crecimiento personal', '2024-05-07 09:15:50', ''),
(12, 1, 'Creó la categoría Enciclopedia', '2024-05-07 09:15:58', ''),
(13, 1, 'Creó la categoría Normativo', '2024-05-07 09:16:02', ''),
(14, 1, 'Creó el Libro Berserk Vol. 1', '2024-05-07 09:18:06', ''),
(15, 1, 'Creó el Libro Berserk Vol. 1', '2024-05-07 09:25:33', ''),
(16, 1, 'Editó el Libro 1', '2024-05-07 09:28:29', ''),
(17, 1, 'Editó el Libro 1', '2024-05-07 09:44:58', ''),
(18, 1, 'Borró el libro Berserk Vol. 2', '2024-05-07 11:46:43', ''),
(19, 1, 'Creó el Libro Berserk Vol. 3', '2024-05-09 08:07:56', ''),
(20, 1, 'Creó el Libro Berserk Vol. 4', '2024-05-09 08:31:38', ''),
(21, 1, 'Renombró la categoría \"Comedia\" por \"Comediante\" ', '2024-05-09 10:15:03', ''),
(22, 1, 'Renombró la categoría \"{\'name\': \'Comediante\'}\" por \"Comedia\" ', '2024-05-09 10:16:21', ''),
(23, 1, 'Creó la categoría Mamador', '2024-05-09 10:16:34', ''),
(24, 1, 'Eliminó la categoría \"Comedia\"', '2024-05-09 10:29:53', ''),
(25, 1, 'Creó la categoría comedia', '2024-05-09 10:30:11', ''),
(26, 1, 'Creó la categoría Adult', '2024-05-09 14:30:27', ''),
(27, 1, 'Creó al lector Gabriel Alberto de cédula 28019228', '2024-05-09 14:37:40', ''),
(28, 1, 'Creó al lector Jessica de cédula 28672717', '2024-05-09 14:39:28', ''),
(29, 1, 'Editó los campos phone del lector de id 1', '2024-05-09 17:45:26', ''),
(30, 1, 'Borró al lector Gabriel Alberto de cédula 28019228 y id 1', '2024-05-09 18:06:05', ''),
(31, 1, 'Creó un préstamo 1 al lector 2 y el libro 2', '2024-05-10 09:31:43', ''),
(32, 1, 'Creó un préstamo 2 al lector 2 y el libro 3', '2024-05-10 09:50:33', ''),
(33, 1, 'Se devolvió el libro 2 del lector 2 del préstamo 1', '2024-05-10 11:13:10', ''),
(34, 1, 'Creó un préstamo 3 al lector 2 y el libro 2', '2024-05-12 10:41:25', ''),
(35, 1, 'Creó al lector Gabriel Alberto de cédula 28019228', '2024-05-12 11:39:37', ''),
(36, 1, 'Creó al lector Pepito Fracisco de cédula 7474747', '2024-05-12 11:40:54', ''),
(37, 1, 'Creó al lector Magda de cédula 85967412', '2024-05-12 11:57:47', ''),
(38, 1, 'Creó el Libro \"¿Cómo ser tu propio jefe?\"', '2024-05-12 12:15:27', ''),
(39, 1, 'Creó la categoría Curso', '2024-05-12 12:17:29', ''),
(40, 1, 'Creó el Libro \"Curso de PHP 2\"', '2024-05-12 12:17:59', ''),
(41, 1, 'Creó un préstamo 4 al lector 5 y el libro 6', '2024-05-12 12:20:45', ''),
(42, 1, 'Creó un préstamo 5 al lector 5 y el libro 5', '2024-05-12 12:20:53', ''),
(43, 1, 'Creó un préstamo 6 al lector 4 y el libro 4', '2024-05-12 12:34:34', ''),
(44, 1, 'Se devolvió el libro 4 del lector 4 del préstamo 6', '2024-05-12 12:56:46', ''),
(45, 1, 'Creó al lector Jaime Pedro de cédula 12345678', '2024-05-12 13:10:10', ''),
(46, 1, 'Atlantox7 ha creado al usuario Atlantox', '2024-05-21 20:03:39', ''),
(47, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:04:07', ''),
(48, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:04:27', ''),
(49, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:05:05', ''),
(50, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:24:24', ''),
(51, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:27:37', ''),
(52, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:28:30', ''),
(53, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:29:06', ''),
(54, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:29:29', ''),
(55, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:29:59', ''),
(56, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:30:28', ''),
(57, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:31:19', ''),
(58, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:31:34', ''),
(59, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:31:57', ''),
(60, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:33:08', ''),
(61, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:34:19', ''),
(62, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:36:27', ''),
(63, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:37:01', ''),
(64, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:45:55', ''),
(65, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:46:40', ''),
(66, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:55:15', ''),
(67, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 20:56:53', ''),
(68, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 21:01:23', ''),
(69, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 21:08:33', ''),
(70, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 21:09:30', ''),
(71, 10, 'Atlantox ha ingresado al sistema', '2024-05-21 21:38:39', ''),
(72, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 17:51:40', ''),
(73, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 17:52:07', ''),
(74, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 17:59:12', ''),
(75, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:00:42', ''),
(76, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:01:18', ''),
(77, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:02:17', ''),
(78, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:08:23', ''),
(79, 10, 'Atlantox ha ingresado al sistema', '2024-05-22 18:09:31', ''),
(80, 10, 'Atlantox ha ingresado al sistema', '2024-05-29 19:05:40', ''),
(81, 10, 'Atlantox ha ingresado al sistema', '2024-06-02 19:45:41', ''),
(82, 10, 'Atlantox ha ingresado al sistema', '2024-06-02 19:48:12', ''),
(83, 10, 'Atlantox ha ingresado al sistema', '2024-06-03 08:59:17', ''),
(84, 10, 'Atlantox ha ingresado al sistema', '2024-06-03 09:23:14', ''),
(85, 1, 'Creó el autor Edgar Allan Poe', '2024-06-03 11:34:29', ''),
(86, 10, 'Atlantox ha ingresado al sistema', '2024-06-03 11:37:50', ''),
(87, 10, 'Creó el Libro \"Mein Kaphf\"', '2024-06-07 11:27:16', ''),
(88, 10, 'Creó el Libro \"Libro nuevo\"', '2024-06-07 11:52:34', ''),
(89, 10, 'Creó el Libro \"Other book\"', '2024-06-07 14:14:23', ''),
(90, 10, 'Editó los campos: title del Libro de id 5', '2024-06-10 07:43:44', ''),
(91, 10, 'Editó los campos: title del Libro de id 5', '2024-06-10 07:43:58', ''),
(92, 10, 'Editó los campos:  del Libro de id 5', '2024-06-10 08:03:07', ''),
(93, 10, 'Editó los campos:  del Libro de id 5', '2024-06-10 08:25:01', ''),
(94, 10, 'Editó los campos:  del Libro de id 5', '2024-06-10 08:25:07', ''),
(95, 10, 'Editó los campos:  del Libro de id 5', '2024-06-10 08:25:10', ''),
(96, 10, 'Editó los campos:  del Libro de id 5', '2024-06-10 08:25:23', ''),
(97, 10, 'Editó los campos: state del Libro de id 5', '2024-06-10 08:27:32', ''),
(98, 10, 'Editó los campos: editorial, state del Libro de id 5', '2024-06-10 08:27:36', ''),
(99, 10, 'Editó los campos: editorial, shelf, state del Libro de id 5', '2024-06-10 08:27:40', ''),
(100, 10, 'Editó los campos: editorial, shelf, pages, state del Libro de id 5', '2024-06-10 08:27:45', ''),
(101, 10, 'Editó los campos: editorial del Libro de id 5', '2024-06-10 09:01:45', ''),
(102, 10, 'Editó los campos: author, editorial del Libro de id 5', '2024-06-10 09:02:22', ''),
(103, 10, 'Editó los campos:  del Libro de id 6', '2024-06-10 10:50:53', ''),
(104, 10, 'Editó los campos:  del Libro de id 6', '2024-06-10 10:51:01', ''),
(105, 10, 'Creó la editorial 123123', '2024-06-10 14:35:38', ''),
(106, 10, 'Renombró la editorial \"Editorial editada\" por \"Editorial editada22\" ', '2024-06-10 14:40:03', ''),
(107, 10, 'Renombró la editorial \"Shizuka\" por \"Shizukazin\" ', '2024-06-10 14:41:13', ''),
(108, 10, 'Editó los campos:  del Libro de id 4', '2024-06-10 15:00:22', ''),
(109, 10, 'Renombró la editorial \"Editorial editada22\" por \"Editorial editada\" ', '2024-06-10 15:06:40', ''),
(110, 10, 'Creó la editorial UwU Cats', '2024-06-10 15:08:44', ''),
(111, 10, 'Renombró la editorial \"UwU Cats\" por \"UwU Cats2\" ', '2024-06-10 15:09:48', ''),
(112, 1, 'Creó el estado de libro Nuevecito', '2024-06-10 15:28:24', ''),
(113, 1, 'Renombró el estado de libro \"Nuevecito\" por \"Nuevecito22\" ', '2024-06-10 15:29:45', ''),
(114, 1, 'Creó el estado de libro Nuevecito22', '2024-06-10 15:33:04', ''),
(115, 1, 'Creó el estado de libro Nuevecito22', '2024-06-10 15:33:33', ''),
(116, 1, 'Eliminó el estado de libro \"Nuevecito22\"', '2024-06-10 15:33:41', ''),
(117, 10, 'Creó el autor Miguelito', '2024-06-10 15:41:23', ''),
(118, 10, 'Renombró el autor \"Miguelito22\" por \"Miguelito\" ', '2024-06-10 15:50:47', ''),
(119, 10, 'Creó la editorial nuevote', '2024-06-13 19:44:38', ''),
(120, 10, 'Creó al lector adfaefdasdas de cédula 13434114', '2024-06-13 21:23:55', ''),
(121, 10, 'Editó los campos birthdate, is_teacher del lector de id 5', '2024-06-13 21:55:09', ''),
(122, 10, 'Editó los campos birthdate, is_teacher del lector de id 5', '2024-06-13 21:55:13', ''),
(123, 10, 'Editó los campos birthdate, is_teacher del lector de id 5', '2024-06-13 21:55:51', ''),
(124, 10, 'Editó los campos birthdate, is_teacher del lector de id 5', '2024-06-13 21:56:10', ''),
(125, 10, 'Editó los campos birthdate, is_teacher del lector de id 5', '2024-06-13 21:56:24', ''),
(126, 10, 'Editó los campos birthdate, is_teacher del lector de id 5', '2024-06-13 21:56:35', ''),
(127, 10, 'Editó los campos birthdate, is_teacher del lector de id 5', '2024-06-13 21:56:46', ''),
(128, 10, 'Editó los campos birthdate, is_teacher del lector de id 5', '2024-06-13 21:56:56', ''),
(129, 10, 'Editó los campos birthdate del lector de id 5', '2024-06-13 21:57:28', ''),
(130, 10, 'Editó los campos birthdate del lector de id 5', '2024-06-13 21:57:48', ''),
(131, 10, 'Creó al lector Raul de cédula 32165498', '2024-06-25 17:35:32', ''),
(132, 10, 'Creó al lector hdryhft de cédula 3563636', '2024-06-25 18:06:36', ''),
(133, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 18:49:06', ''),
(134, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 18:49:23', ''),
(135, 10, 'Editó los campos gender, birthdate, is_teacher del lector de id 9', '2024-06-25 18:49:31', ''),
(136, 10, 'Editó los campos birthdate, phone, is_teacher del lector de id 9', '2024-06-25 18:49:39', ''),
(137, 10, 'Editó los campos surnames, birthdate, phone, is_teacher del lector de id 9', '2024-06-25 18:49:49', ''),
(138, 10, 'Editó los campos names, surnames, birthdate, phone, is_teacher del lector de id 9', '2024-06-25 18:49:58', ''),
(139, 10, 'Editó los campos birthdate, phone, is_teacher del lector de id 9', '2024-06-25 18:53:31', ''),
(140, 10, 'Editó los campos surnames, birthdate, phone, is_teacher del lector de id 9', '2024-06-25 18:53:38', ''),
(141, 10, 'Editó los campos cedula, birthdate, is_teacher del lector de id 9', '2024-06-25 18:53:49', ''),
(142, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 18:54:56', ''),
(143, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 18:55:04', ''),
(144, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 18:55:35', ''),
(145, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 18:55:51', ''),
(146, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 18:57:08', ''),
(147, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 18:57:26', ''),
(148, 10, 'Editó los campos birthdate del lector de id 9', '2024-06-25 18:58:26', ''),
(149, 10, 'Editó los campos birthdate del lector de id 9', '2024-06-25 18:58:44', ''),
(150, 10, 'Editó los campos birthdate del lector de id 9', '2024-06-25 18:59:07', ''),
(151, 10, 'Editó los campos birthdate del lector de id 9', '2024-06-25 18:59:25', ''),
(152, 10, 'Editó los campos birthdate del lector de id 9', '2024-06-25 19:08:38', ''),
(153, 10, 'Editó los campos birthdate del lector de id 9', '2024-06-25 19:15:23', ''),
(154, 10, 'Editó los campos cedula del lector de id 9', '2024-06-25 19:22:43', ''),
(155, 10, 'Editó los campos cedula, is_teacher del lector de id 9', '2024-06-25 19:22:47', ''),
(156, 10, 'Editó los campos gender del lector de id 9', '2024-06-25 19:23:08', ''),
(157, 10, 'Editó los campos is_teacher del lector de id 9', '2024-06-25 19:23:15', ''),
(158, 10, 'Editó los campos birthdate, is_teacher del lector de id 9', '2024-06-25 19:23:22', ''),
(159, 10, 'Editó los campos phone, is_teacher del lector de id 9', '2024-06-25 19:23:34', ''),
(160, 10, 'Atlantox ha ingresado al sistema', '2024-06-25 19:45:08', ''),
(161, 10, 'Atlantox ha ingresado al sistema', '2024-06-25 19:46:04', ''),
(162, 2, 'Editó los campos nickname del usuario de id 2', '2024-06-26 20:20:24', ''),
(163, 2, 'Editó los campos active del usuario de id 2', '2024-06-26 20:23:17', ''),
(164, 2, 'Editó los campos active del usuario de id 2', '2024-06-26 20:23:24', ''),
(165, 2, 'Editó los campos active del usuario de id 2', '2024-06-26 20:23:38', ''),
(166, 2, 'Editó los campos active del usuario de id 2', '2024-06-26 20:24:05', ''),
(167, 10, 'Atlantox ha creado al usuario DonPancho', '2024-06-26 20:34:27', ''),
(168, 11, 'DonPancho ha ingresado al sistema', '2024-06-26 20:34:59', ''),
(169, 10, 'Atlantox ha ingresado al sistema', '2024-07-02 20:31:50', ''),
(170, 10, 'Atlantox ha creado al usuario Atlantox2', '2024-07-02 20:35:53', ''),
(171, 12, 'Atlantox2 ha ingresado al sistema', '2024-07-02 20:36:05', ''),
(172, 10, 'Renombró la categoría \"Comedia\" por \"Comedia2\" ', '2024-07-02 21:12:32', ''),
(173, 10, 'Renombró la categoría \"Comedia2\" por \"Comedia\" ', '2024-07-02 21:12:38', ''),
(174, 10, 'Creó la categoría nuevcita', '2024-07-02 21:13:25', ''),
(175, 10, 'Creó un préstamo 7 al lector 2 y el libro 5', '2024-07-05 17:59:54', ''),
(176, 10, 'Creó al lector Pedritongo de cédula 4718529', '2024-07-05 18:03:43', ''),
(177, 10, 'Creó al lector vxbxfvfsgfdgfd de cédula 741852963', '2024-07-05 18:07:35', ''),
(178, 10, 'Creó al lector sdfgsdgdghd de cédula 65746743563', '2024-07-05 18:08:08', ''),
(179, 10, 'Creó un préstamo 8 al lector 12 y el libro 7', '2024-07-05 18:08:19', ''),
(180, 10, 'Se devolvió el libro 5 del lector 2 del préstamo 7', '2024-07-07 11:17:45', ''),
(181, 10, 'Se devolvió el libro 5 del lector 2 del préstamo 7', '2024-07-07 11:18:40', ''),
(182, 10, 'Se devolvió el libro 5 del lector 2 del préstamo 7', '2024-07-07 11:19:50', ''),
(183, 10, 'Se devolvió el libro 5 del lector 2 del préstamo 7', '2024-07-07 11:21:45', ''),
(184, 10, 'Se devolvió el libro 5 del lector 2 del préstamo 7', '2024-07-07 11:57:12', ''),
(185, 10, 'Se devolvió el libro 7 del lector 12 del préstamo 8', '2024-07-08 19:14:53', ''),
(186, 10, 'Creó un préstamo 9 al lector 2 y el libro 2', '2024-07-10 17:37:58', ''),
(187, 10, 'Se devolvió el libro 2 del lector 2 del préstamo 9', '2024-07-10 17:40:32', ''),
(188, 10, 'Editó los campos:  del Libro de id 2', '2024-07-11 20:09:01', ''),
(189, 10, 'Editó los campos: description del Libro de id 2', '2024-07-11 20:12:57', ''),
(190, 10, 'Creó un préstamo 10 al lector 2 y el libro 2', '2024-07-11 21:23:49', ''),
(191, 10, 'Creó un préstamo 11 al lector 5 y el libro 5', '2024-07-13 09:17:59', ''),
(192, 10, 'Editó los campos: description del Libro de id 3', '2024-07-13 10:31:14', ''),
(193, 10, 'Creó el autor Mamma Mia', '2024-07-13 10:35:13', ''),
(194, 10, 'Atlantox ha ingresado al sistema', '2024-07-13 14:32:15', ''),
(195, 2, 'Editó los campos username, password, active del usuario de id 2', '2024-07-17 20:23:26', ''),
(196, 2, 'Editó los campos username, password, active del usuario de id 2', '2024-07-17 20:25:56', ''),
(197, 2, 'KingPepito ha ingresado al sistema', '2024-07-17 20:26:01', ''),
(198, 2, 'KingPepito ha ingresado al sistema', '2024-07-17 20:34:30', ''),
(199, 2, 'KingPepito ha ingresado al sistema', '2024-07-17 20:35:41', ''),
(200, 2, 'KingPepito ha ingresado al sistema', '2024-07-17 20:36:11', ''),
(201, 2, 'KingPepito ha ingresado al sistema', '2024-07-17 20:36:30', ''),
(202, 10, 'Atlantox ha ingresado al sistema', '2024-07-17 20:37:52', ''),
(203, 2, 'Editó los campos active del usuario de id 2', '2024-07-17 20:38:06', ''),
(204, 10, 'Atlantox ha ingresado al sistema', '2024-07-17 20:59:52', ''),
(205, 10, 'Creó el autor Autorsote', '2024-07-21 08:55:58', '127.0.0.1'),
(206, 10, 'Creó un préstamo 12 al lector 3 y el libro 10', '2024-07-21 08:57:19', '127.0.0.1');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `call_number`, `author`, `title`, `editorial`, `pages`, `shelf`, `description`, `created_at`, `state`) VALUES
(2, 'BE-01', 1, 'Berserk Vol. 1', 1, 26, 'A2', 'Va de un pibe que deambula con una espada más grande que él y mata monstruos demoniacos en busca de venganza', '2024-05-07 09:25:33', 'Prestado'),
(3, 'BE3-01', 1, 'Berserk Vol. 3', 1, 25, 'A2', 'Muestra el pasado de Guts y como se unió a la banda del halcón', '2024-05-09 08:07:56', 'En biblioteca'),
(4, 'BE4-01', 1, 'Berserk Vol. 4', 1, 22, 'A2', '', '2024-05-09 08:31:38', 'En biblioteca'),
(5, 'IFA-115', 2, '¿Cómo ser tu propio jefe?', 1, 40, 'A62', 'Trata sobre como estafar personas sin que estas se den cuenta así mismo explica como lidiar con los clientes difíciles dándoles una muerte inmediata y secreta', '2024-05-12 12:15:27', 'Prestado'),
(6, 'PHP2-1', 3, 'Curso de PHP 2', 3, 596, 'A2', '', '2024-05-12 12:17:59', 'En biblioteca'),
(7, 'MK-23', 2, 'Mein Kaphf', 2, 123, 'A1-S', '', '2024-06-07 11:27:16', 'En biblioteca'),
(8, 'Cota02', 3, 'Libro nuevo', 2, 666, 'AE-5', 'Trata sobre como escribir libros nuevos', '2024-06-07 11:52:34', 'En biblioteca'),
(10, '123ASng', 4, 'Other book', NULL, 123, 'A654', '', '2024-06-07 14:14:23', 'Prestado'),
(16, '151s', 7, 'El arte de la guerra', 7, 40, '1', 'Explica diversas estrategias para persuadir personas y ganar batallas o discusiones con el poder de la elocuencia y la mente', '2024-07-14 17:59:04', 'En biblioteca'),
(17, 'e82', 8, 'La llamada de Cthulhu', 8, 24, '1', 'Relata el ficticio nacimiento de un horror cósmico cuya presencia resuena en las mentes y cuerpos de todas las personas y seres', '2024-07-14 17:59:04', 'En biblioteca'),
(18, 'RF34', 9, 'Don Quijote de la Mancha', 9, 225, '2', 'Trata de las ocurrencias, aventuras y vivencias de un caballero medieval delirantemente obsesionado con las costumbres caballerescas de la edad media', '2024-07-14 17:59:04', 'En biblioteca'),
(19, '35FS', 1, 'Berserk Vol. 1', 10, 220, '1', 'Cuenta la historia de un misterioso y oscuro espadachín que lucha contra monstruos que se alzan en su contra por alguna razón', '2024-07-14 17:59:04', 'En biblioteca');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `book_category`
--

INSERT INTO `book_category` (`id`, `book`, `category`) VALUES
(6, 3, 3),
(12, 7, 3),
(14, 7, 15),
(15, 8, 5),
(16, 8, 4),
(17, 10, 8),
(18, 10, 17),
(56, 5, 17),
(60, 6, 17),
(61, 4, 3),
(62, 4, 6),
(67, 2, 3),
(68, 2, 2),
(69, 2, 9),
(70, 2, 5),
(80, 16, 19),
(81, 17, 20),
(82, 17, 3),
(83, 17, 21),
(84, 18, 4),
(85, 18, 22),
(86, 19, 6),
(87, 19, 4);

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(6, 'Acción'),
(22, 'Clásico'),
(15, 'Comedia'),
(19, 'Crecimiento personal'),
(17, 'Curso'),
(8, 'Enciclopedia'),
(4, 'Fantasía'),
(20, 'Ficción'),
(5, 'Historia'),
(21, 'Misterio'),
(9, 'Normativo'),
(2, 'Romance'),
(3, 'Terror');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id`, `name`) VALUES
(8, 'Capriles'),
(4, 'Editorial editada'),
(3, 'Editorial vieja'),
(2, 'El EteSechu'),
(10, 'Hakusensha'),
(7, 'La Flor'),
(6, 'nuevote'),
(9, 'Santillana'),
(1, 'Shizukazin'),
(5, 'UwU Cats2'),
(11, 'Waaaa');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `loan`
--

INSERT INTO `loan` (`id`, `book`, `reader`, `observation`, `deliver_date`, `return_date`, `created_at`, `active`) VALUES
(3, 2, 2, 'Ninguna', '2024-05-10 00:00:00', NULL, '2024-05-12 10:41:25', 1),
(6, 4, 4, '', '2024-05-08 00:00:00', '2024-05-12 12:56:46', '2024-05-12 12:34:34', 1),
(8, 7, 12, 'Ninguna', '2024-07-01 18:08:19', '2024-07-08 19:14:53', '2024-07-05 18:08:19', 1),
(10, 2, 2, 'Es una furra2', '2024-07-11 21:23:49', NULL, '2024-07-11 21:23:49', 1),
(11, 5, 5, '', '2024-07-13 09:17:59', NULL, '2024-07-13 09:17:59', 1),
(12, 10, 3, '', '2024-07-21 08:57:19', NULL, '2024-07-21 08:57:19', 1);

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nickname`, `level`, `created_at`, `username`, `password`, `token`, `active`) VALUES
(1, 'Atlantox7', 'Admin', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$3AS4idk0Vww0t4Sb01WeTA$jGz2iJeNl6gDxT2fMeWDqSoxQFQDGMiKysTEl77zrtE', '$argon2id$v=19$m=65536,t=3,p=4$ZdHbxL0d8wcfNPlDgenj+A$fl4pfvgOkUwHLCjxIAP5d794CGpc13YWcDrOWgrvtak', 'd4239cd0-77e5-4d73-bb73-7ba3e9ecbc00-b4828893-f47d-47fe-a5f0-128b13e8a786', 1),
(2, 'KingPepito', 'Editor', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$8UZyhH7/YQKpgg2BSLWMKQ$JZdATk50aVy3c65APOFXkySRzQhodo6cW/zICTsxINQ', '$argon2id$v=19$m=65536,t=3,p=4$l/9fkk5EhOwo+1EpOkKihg$srAta6y+0YKv1ev70s8lfqFaKLzj4b0CHcxW4BrnBeg', '9559e961-3d82-4013-ac43-1071ae4bbea9-48f22212-d27f-439d-a32e-9c7facdc62c2', 0),
(3, 'El pepito2', 'Admin', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$sC68eq03u8/8VvWIlE7V2w$8zFKttxeLrzFfxzoCv38GzAnNGEdln7SamRwOV+1GRY', '$argon2id$v=19$m=65536,t=3,p=4$bHwiNX9DS0r6cPzgUELkUA$XBm8tql9z9n6rvaSX1YAcbyI5ht97u8lLTnFczr4uak', '73361c62-9340-4c9e-9dd3-33a73547d761-029002f7-f5a7-4c99-bdd4-2d179f024977', 1),
(4, 'El pepito3', 'Editor', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$LpxdH78OEo+g1pjBUaK04Q$HqgbgCdtTM4GaXFZ2ZqLmQv6gMs46Ot5c3Y5Am9LMsY', '$argon2id$v=19$m=65536,t=3,p=4$pkySPKBSNnOnewqZdy67Ww$gUgbBU6aqv5xEtiSdWYRDqoYcBVxCVafxysh4vvxnaY', '08bc0ff1-132b-40b4-ad58-c196890dee56-2ded1689-f8da-4534-9abe-67247860d3ab', 0),
(5, 'El pepito4', 'Editor', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$cpWY38BOtU9Obhe3DR3bhA$XLJGqZHPj1WwsM9OL6JMR2yxTWkzjXwPO1Mw6KP1t2I', '$argon2id$v=19$m=65536,t=3,p=4$Wlmnwt6OoPS40ziRz3qwAQ$yFOrGDhX1sE5VjMiOzZgPz+fbwDBGGIwRWl/DkgL8vY', '876bbab3-5890-457b-888b-69c2acfc8a00-c0938fd2-a87d-4451-a865-fe8405df6122', 1),
(6, 'El pepito5', 'Editor', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$jXGc7XJH4hQT3EOUnaG1uA$1x+TERIFqhg2mZshTx2l+mju0tkap4gSoJ1wFnu7j20', '$argon2id$v=19$m=65536,t=3,p=4$3ibE1pMM3ILiSFWS0bvLYg$Xq6xfDW7TdzXaGCd7KGQcMTclfiR6djZ0kZey/iKmsI', 'c6d08108-8771-46b0-adac-f5ce0c03f8ba-3972822d-3b25-4f54-9f43-c9f134eb266a', 1),
(7, 'El pepito6', 'Editor', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$NqtGczl0CGAQlsjt55K79g$NdQWA4SWVJ/h+I14AA6CWZOJ0sBs6asyrNzPJpK8N0U', '$argon2id$v=19$m=65536,t=3,p=4$TMNXWRrkjSqdYirkW/q7DQ$1JXU038KTPR6PX0LBZuf9FtEbJ9P7J6a79NKi5tSoco', '1ccd1e8a-8272-49a9-a93b-af486ec03a8b-e33f60bc-38b5-4811-a889-04fec04acc4a', 1),
(8, 'El pepito7', 'Editor', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$wkHf2sGs7rzpZr8NnxVpCg$qEP5Xdq2Ug2woLQZGgsVYr/ZcO7rm5jaP3SR0P37UGE', '$argon2id$v=19$m=65536,t=3,p=4$0oU/JC3TILOLMY8MHLgQbg$fa5pLqaom4IjiaL6In8wM0BTCYcBEW3yiN5JuKJ1ny0', 'bc7b23dd-63e4-4624-83d4-e2deeb0f3b05-ec23053e-925d-4e4f-ba67-6eff9ea464b3', 1),
(9, 'El pepito8', 'Editor', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$vQfLmfv2+sGfhhFgruSzfA$PgYiH9XFyggzKsZA4P7tZozj32u8NXi0pPhpvd/RLtY', '$argon2id$v=19$m=65536,t=3,p=4$8vf2Q2qT5OoGFfOpMcCC1A$D9CvCFc2PBJI51YAW4uW8ZswGEgJZWVmCzy7VlLGi68', '45ec7c08-aca4-4c1a-9cdf-cbb9c54ff128-27f6b3b2-50c9-48ac-ba63-3103b995561c', 0),
(10, 'Atlantox', 'Admin', '2024-06-25 19:49:47', '$argon2id$v=19$m=65536,t=3,p=4$am1VC7JJtJEwA6YHympJfA$g7uf84pTXJKeq5QsUGqDacFoj54gR35J9uwf9KFsX7M', '$argon2id$v=19$m=65536,t=3,p=4$ISIMPRqNxz8MHYV3iuBYWg$tiPy3KFUbTTRqoormbEbXOcPnVogoDvwppMvGtUYjO8', 'dcd78902-70b4-40a2-9c17-b7a0486e9980-5f031834-7798-4cb4-a77b-114b3a7b8d6f', 1),
(11, 'DonPancho', 'Editor', '2024-06-26 20:34:27', '$argon2id$v=19$m=65536,t=3,p=4$7y5aQNLihofWYQnkBfP7AQ$iLx1BHVf91i4+xygJ8ik7ktrSKDe7FbjqfCO0H9lyP4', '$argon2id$v=19$m=65536,t=3,p=4$Sj06V0NS178Nr1Y77e80Jg$js0aCrjiL6BIyCpwAXWmaUwqRtJVTrsbu2gqQ1GSSBw', '7a04b361-00b1-4f61-98eb-0799e9728f42-a24a222f-099d-4763-b8e4-1433ad347a58', 1),
(12, 'Atlantox2', 'Editor', '2024-07-02 20:35:53', '$argon2id$v=19$m=65536,t=3,p=4$8c1HJ2Rwl9qPc5tf5q4pDQ$F/MJnarJgP24d/x1NfKLMgs75kLZbPVczmMetI+aJvQ', '$argon2id$v=19$m=65536,t=3,p=4$jakjClp3Hl6lVxsGu4/i1w$jRd5Tg6sMRVVqNkY0bX+Hp/U/TvdVm9e2CUooL2GLrg', '439265b4-72b7-4ffe-9223-ae309e09a1aa-a65a350b-8eca-4370-a0c9-8f2d958cc177', 1);

-- --------------------------------------------------------