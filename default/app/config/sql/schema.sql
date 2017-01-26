-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) NOT NULL,
  `descripcion` tinytext,
  `slug` varchar(1000) DEFAULT NULL,
  `orden` int(11) DEFAULT '0',
  `visible` tinyint(4) DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activa` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `slug`, `orden`, `visible`, `updated_at`, `activa`) VALUES
(1,	'Blog',	'Artículos, noticias, novedades de utilidad para la comunidad',	'blog',	1,	1,	'2016-10-21 11:25:33',	1);

DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(40) NOT NULL,
  `valor` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `configuracion` (`id`, `tag`, `valor`) VALUES
(1,	'OFFLINE',	'OFF');

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `imagen`;
CREATE TABLE `imagen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo` varchar(300) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `activa` tinyint(4) DEFAULT NULL,
  `creada_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `imagen` (`id`, `archivo`, `item_id`, `activa`, `creada_at`) VALUES
(1,	'a85c443bef64af09d7a006b68a993e29.jpg',	1,	NULL,	'2016-10-21 12:11:49');

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) NOT NULL,
  `cuerpo` text NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `img_portada` varchar(200) DEFAULT NULL,
  `breve_descripcion` tinytext,
  `destacado` tinyint(4) DEFAULT NULL,
  `slug` varchar(1000) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `item` (`id`, `nombre`, `cuerpo`, `categoria_id`, `img_portada`, `breve_descripcion`, `destacado`, `slug`, `activo`, `created_at`) VALUES
(1,	'Salvemos el Achibueno',	'<p><span style=\"color: black; font-family: Calibri,Arial,Helvetica,sans-serif; font-size: medium;\"><span id=\"divtagdefaultwrapper\" style=\"font-size: 12pt;\">Es una pelea de a&ntilde;os porque pretenden construir centrales de paso e inundan los alrededores muriendo flora y fauna y afectando el r&iacute;o y su caudal.</span></span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"color: black; font-family: Calibri,Arial,Helvetica,sans-serif; font-size: medium;\"><span style=\"font-size: 12pt;\"><span style=\"color: black; font-family: Calibri,Arial,Helvetica,sans-serif; font-size: medium;\"><span id=\"divtagdefaultwrapper\" style=\"font-size: 12pt;\">Linares defiende&nbsp;el RIO ACHIBUENO como Santuario Natural. Puedes ver los siguientes enlaces en los que encontrar&aacute;s interesantes videos sobre nuestro r&iacute;o.<br /></span></span></span></span></p>\r\n<p><span style=\"color: black; font-family: Calibri,Arial,Helvetica,sans-serif; font-size: medium;\"><span style=\"font-size: 12pt;\"><span style=\"color: black; font-family: Calibri,Arial,Helvetica,sans-serif; font-size: medium;\"><span style=\"font-size: 12pt;\">Reportaje Achibueno<br /><a href=\"https://www.youtube.com/watch?v=E2eAqmFc9iI%20\" target=\"_blank\">https://www.youtube.com/watch?v=E2eAqmFc9iI &nbsp;</a>&nbsp; &nbsp;<br />Recomiendo Chile<br /><a href=\"https://www.youtube.com/watch?v=6WjA2_Tk9qs%20\" target=\"_blank\">https://www.youtube.com/watch?v=6WjA2_Tk9qs &nbsp;</a>&nbsp; &nbsp;<br />Achibueno HD<br /><a href=\"https://www.youtube.com/watch?v=1wLsUmEc1Ww\" target=\"_blank\">https://www.youtube.com/watch?v=1wLsUmEc1Ww</a> &nbsp;&nbsp; &nbsp;<br />Achibueno HD<br /><a href=\"https://www.youtube.com/watch?v=FABJGKbbA7U%20\" target=\"_blank\">https://www.youtube.com/watch?v=FABJGKbbA7U </a>&nbsp;&nbsp; &nbsp;<br />Chile conectado<br /><a href=\"https://www.youtube.com/watch?v=DFiFOEHipV8%20\" target=\"_blank\">https://www.youtube.com/watch?v=DFiFOEHipV8 </a>&nbsp;&nbsp; &nbsp;<br />Lo mejor del Achibueno<br /><a href=\"https://www.youtube.com/watch?v=chsVHm3hzqY%20\" target=\"_blank\">https://www.youtube.com/watch?v=chsVHm3hzqY &nbsp;&nbsp; &nbsp;</a><br />Reportaje Salvemos Achibueno 1<br /><a href=\"https://www.youtube.com/watch?v=-btIOfw3c9c%20\" target=\"_blank\">https://www.youtube.com/watch?v=-btIOfw3c9c &nbsp;</a>&nbsp; &nbsp;<br />Reportaje Salvemos Achibueno 2<br /><a href=\"https://www.youtube.com/watch?v=w0yw7Jgfbq0%20\" target=\"_blank\">https://www.youtube.com/watch?v=w0yw7Jgfbq0 &nbsp;&nbsp; </a>&nbsp;<br />Reportaje Salvemos Achibueno 3<br /><a href=\"https://www.youtube.com/watch?v=8AUBaV2aCaw%20\" target=\"_blank\">https://www.youtube.com/watch?v=8AUBaV2aCaw &nbsp;&nbsp;</a> &nbsp;<br />Reportaje Salvemos Achibueno 4<br /><a href=\"https://www.youtube.com/watch?v=M2TPGyB7zyo\" target=\"_blank\">https://www.youtube.com/watch?v=M2TPGyB7zyo</a> &nbsp;&nbsp; &nbsp;<br />Sitio Web<br /><a href=\"http://salvemoselachibueno.org/\" target=\"_blank\">http://salvemoselachibueno.org/</a></span></span></span></span></p>',	1,	'a85c443bef64af09d7a006b68a993e29.jpg',	'Es una pelea de años porque pretenden construir centrales de paso e inundan los alrededores muriendo flora y fauna y afectando el río y su caudal.',	1,	'salvemos-el-achibueno',	1,	'2016-10-21 12:06:54');

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  `url` varchar(1000) NOT NULL,
  `orden` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `recurso_id` int(11) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  `disposicion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `menu` (`id`, `nombre`, `icono`, `url`, `orden`, `menu_id`, `recurso_id`, `creado_at`, `actualizado_in`, `disposicion`) VALUES
(1,	'Home',	'fa fa-dashboard',	'index/',	1,	NULL,	21,	'2016-06-23 17:10:16',	'2016-10-21 12:18:22',	NULL),
(2,	'Administración',	'fa fa-cog',	'#',	2,	NULL,	1,	'2016-06-23 17:13:53',	'2016-07-14 14:03:32',	NULL),
(3,	'Menú',	NULL,	'menu/',	0,	2,	3,	'2016-06-23 17:14:25',	'2016-06-23 17:17:28',	NULL),
(5,	'Usuarios',	NULL,	'usuarios/',	0,	2,	5,	'2016-06-23 17:18:09',	'2016-07-13 10:36:32',	NULL),
(6,	'Recursos',	NULL,	'recurso/',	0,	2,	6,	'2016-06-23 17:23:52',	'2016-07-13 10:36:39',	NULL),
(7,	'Texto',	NULL,	'texto/',	0,	2,	7,	'2016-06-23 17:24:13',	'2016-07-13 10:36:47',	NULL),
(17,	'Estados',	NULL,	'estado/',	0,	28,	18,	'2016-06-28 05:34:05',	'2016-07-14 13:55:50',	NULL),
(25,	'Usuario',	NULL,	'#',	300,	NULL,	1,	'2016-07-14 13:13:39',	'2016-07-14 14:04:49',	NULL),
(27,	'Cerrar sesión',	NULL,	'sesion/logout/',	0,	25,	24,	'2016-07-14 13:14:25',	'2016-10-19 06:01:20',	NULL),
(28,	'Recursos por perfil',	NULL,	'perfil_recurso/',	4,	2,	1,	'2016-10-17 14:53:03',	'2016-10-17 14:53:39',	NULL),
(29,	'Perfiles por usuario',	NULL,	'perfil_usuario',	5,	2,	1,	'2016-10-17 15:17:16',	NULL,	NULL),
(30,	'Perfiles',	NULL,	'perfil/',	6,	2,	1,	'2016-10-17 15:18:33',	NULL,	NULL),
(31,	'Parámetros',	NULL,	'parametros/',	7,	2,	19,	'2016-10-17 15:50:21',	NULL,	NULL),
(32,	'Categorias',	NULL,	'categorias/',	9,	2,	26,	'2016-10-21 11:24:27',	NULL,	NULL),
(33,	'Articulos',	NULL,	'articulos/',	10,	2,	25,	'2016-10-21 11:24:50',	NULL,	NULL);

DROP TABLE IF EXISTS `parametro`;
CREATE TABLE `parametro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `valor` varchar(1000) NOT NULL,
  `creado_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actualizado_in` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `parametro` (`id`, `slug`, `descripcion`, `valor`, `creado_at`, `actualizado_in`) VALUES
(1,	'logo-size',	'logo-size',	'200px',	'2016-10-17 15:50:54',	'0000-00-00 00:00:00');

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `perfil` (`id`, `nombre`, `activo`, `creado_at`, `actualizado_in`) VALUES
(1,	'Administrador',	1,	'2016-06-23 17:08:36',	NULL),
(2,	'Editor',	1,	'2016-10-19 04:39:24',	NULL);

DROP TABLE IF EXISTS `perfil_recurso`;
CREATE TABLE `perfil_recurso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `perfil_id` int(11) NOT NULL,
  `recurso_id` int(11) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `perfil_recurso` (`id`, `perfil_id`, `recurso_id`, `creado_at`, `actualizado_in`) VALUES
(1,	2,	21,	'2016-10-19 04:39:50',	NULL),
(2,	2,	24,	'2016-10-19 04:41:05',	NULL),
(3,	1,	1,	'2016-10-19 04:41:19',	NULL);

DROP TABLE IF EXISTS `perfil_usuario`;
CREATE TABLE `perfil_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `perfil_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `perfil_usuario` (`id`, `perfil_id`, `usuario_id`, `creado_at`, `actualizado_in`) VALUES
(1,	1,	1,	'2016-10-17 15:17:47',	NULL),
(2,	2,	2,	'2016-10-19 05:46:16',	NULL);

DROP TABLE IF EXISTS `peticion`;
CREATE TABLE `peticion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `descripcion` text,
  `archivo` varchar(1000) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_in` timestamp NULL DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `recurso`;
CREATE TABLE `recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controlador` varchar(300) NOT NULL,
  `accion` varchar(300) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `recurso` (`id`, `controlador`, `accion`, `creado_at`, `actualizado_in`) VALUES
(1,	'*',	'*',	'2016-06-23 17:06:25',	NULL),
(3,	'menu',	'*',	'2016-06-23 17:07:19',	NULL),
(5,	'usuarios',	'*',	'2016-06-23 17:08:03',	NULL),
(6,	'recurso',	'*',	'2016-06-23 17:23:16',	NULL),
(7,	'texto',	'*',	'2016-06-23 17:23:32',	NULL),
(18,	'estado',	'*',	'2016-06-28 05:33:44',	NULL),
(19,	'parametros',	'*',	'2016-06-29 22:40:23',	NULL),
(20,	'perfil',	'*',	'2016-10-17 15:20:30',	NULL),
(21,	'dashboard',	'*',	'2016-10-17 15:20:50',	NULL),
(22,	'perfil_recurso',	'*',	'2016-10-17 15:21:20',	'2016-10-17 15:21:35'),
(23,	'perfil_usuario',	'*',	'2016-10-17 15:21:30',	NULL),
(24,	'sesion',	'*',	'2016-10-19 04:40:47',	NULL),
(25,	'articulos',	'*',	'2016-10-21 11:23:35',	NULL),
(26,	'categorias',	'*',	'2016-10-21 11:23:44',	NULL);

DROP TABLE IF EXISTS `texto`;
CREATE TABLE `texto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(300) DEFAULT NULL,
  `texto` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `texto` (`id`, `slug`, `texto`, `created_at`, `updated_in`) VALUES
(1,	'slogan',	'La comunidad que hacemos todos',	NULL,	'2016-11-19 03:42:44'),
(2,	'titulo',	'comunidad.cl',	NULL,	'2016-11-19 03:42:53'),
(3,	'icono',	'fa fa-file-o',	NULL,	NULL),
(4,	'logo',	'bg/header_left.jpg',	NULL,	'2016-10-19 17:31:22');

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(40) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(100) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `creado_at` timestamp NULL DEFAULT NULL,
  `actualizado_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `usuario` (`id`, `login`, `email`, `password`, `activo`, `nombre`, `creado_at`, `actualizado_in`) VALUES
(1,	'admin',	'admin@localhost',	'$2y$12$sDVZwOjLfOtXt0/pwcdP0OVx186rAVxrdl6vrPRnMIEhq9oUDdjze',	1,	'Nelson Rojas',	'2016-05-23 11:00:00',	NULL),
(2,	'editor',	'editor@localhost',	'$2y$12$8/cStJyGlXbTjJz2t7F5AeZIRIEQu79fiqdGExHBTMo4ZSyGkN0qW',	1,	'Editor',	'2016-10-19 04:55:00',	NULL);

-- 2016-11-19 03:46:45
