-- --------------------------------------------------------
-- Host:                         MYSQL5011.Smarterasp.net
-- Versión del servidor:         5.6.26-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4998
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para db_9dac90_cole
CREATE DATABASE IF NOT EXISTS `db_9dac90_cole` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_9dac90_cole`;


-- Volcando estructura para tabla db_9dac90_cole.arc_archivos_proyecto
CREATE TABLE IF NOT EXISTS `arc_archivos_proyecto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RUTA_ARCHIVO` varchar(500) DEFAULT NULL,
  `PRO_ID` int(11) DEFAULT '0',
  `ELIMINADO` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.arc_archivos_proyecto: ~2 rows (aproximadamente)
DELETE FROM `arc_archivos_proyecto`;
/*!40000 ALTER TABLE `arc_archivos_proyecto` DISABLE KEYS */;
INSERT INTO `arc_archivos_proyecto` (`ID`, `RUTA_ARCHIVO`, `PRO_ID`, `ELIMINADO`) VALUES
	(1, '~/ArchivosProyectos/ajj0optt.hqj DTO-732 11-FEB-1998-Estatutos Tipos.pdf', 1, 0),
	(2, '~/ArchivosProyectos/0uglmfgv.l2e guia-propiedad-intelectual.pdf', 7, 0);
/*!40000 ALTER TABLE `arc_archivos_proyecto` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.arti_articulo
CREATE TABLE IF NOT EXISTS `arti_articulo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VISIBLE` int(11) NOT NULL DEFAULT '0',
  `USA_IMAGEN` int(11) NOT NULL DEFAULT '0',
  `URL_IMAGEN` varchar(500) NOT NULL DEFAULT '0',
  `FECHA` varchar(250) NOT NULL DEFAULT '0',
  `USA_FECHA` int(11) NOT NULL DEFAULT '0',
  `USA_TITULO` int(11) NOT NULL DEFAULT '0',
  `TITULO` varchar(1000) NOT NULL DEFAULT '0',
  `CONTENIDO` varchar(5000) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `TIPO_ARTICULO` int(11) DEFAULT '1',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.arti_articulo: ~9 rows (aproximadamente)
DELETE FROM `arti_articulo`;
/*!40000 ALTER TABLE `arti_articulo` DISABLE KEYS */;
INSERT INTO `arti_articulo` (`ID`, `VISIBLE`, `USA_IMAGEN`, `URL_IMAGEN`, `FECHA`, `USA_FECHA`, `USA_TITULO`, `TITULO`, `CONTENIDO`, `INST_ID`, `TIPO_ARTICULO`, `ELIMINADO`) VALUES
	(1, 0, 1, '~/img/imgArticulo_1.png', '14-12-2015', 0, 1, '¿QUIENES SOMOS?', 'Una plataforma de gestión para los centros de padres y apoderados de cualquier tipo de instituciones o establecimiento. \nEl foco fundamental esta centrado en la gestión de las actividades del centro de padres y la trasnparencia de los estados de cuentas y flujos economicos producto de la gestion del centro de padres y apoderados. ', 3, 1, 0),
	(2, 0, 1, '~/img/imgArticulo_2.png', '14-12-2015', 0, 1, 'NUESTRA VISIÓN', 'Ser la mejor mejor herramienta de gestion y transparencia para los centros de padres y apoderados asi también un mecanismo moderno de interacción educativa entre los establecimientos y la comunidad estudiantil. ', 3, 1, 0),
	(3, 0, 1, '~/img/imgArticulo_3.png', '14-12-2015', 0, 1, 'NUESTROS SERVICIOS', 'Nuestro servico consta de perfiles y roles de acuerdo a la orgánica de administración de los centros de padres y apoderados así como también un canal directo de transparencia e información al apoderado y el establecimiento.', 3, 1, 0),
	(4, 0, 1, '~/img/imgArticulo_4.png', '14-12-2015', 0, 1, 'NUESTRO COLEGIO', 'El Colegio Santa Elena fue fundado el año 1913 por las Hermanas Carmelitas de la Caridad. Estos 100 años de existencia nos avalan como una institución que ha estado permanentemente preocupada por la educación de niñas y jóvenes, formando mujeres líderes de nuestra sociedad, lo que hoy significa seguir aspirando a que ellas logren la excelencia humana, mediante el desarrollo de sus habilidades y capacidades personales.', 4, 1, 0),
	(5, 0, 1, '~/img/imgArticulo_5.png', '14-12-2015', 0, 1, 'CENTRO DE PADRES', 'El Centro de Padres y Apoderados del Colegio (CPA) nace el año 2003, producto de la fusión de los Centros de Padres y Apoderados de las distintas sedes.', 4, 1, 0),
	(6, 0, 1, '~/img/imgArticulo_6.png', '14-12-2015', 0, 1, 'MISIÓN', 'Nuestra misión es formar mujeres líderes, comprometidas con los valores del Evangelio, con un profundo sentimiento de gratitud y amor por la vida, que aspiren a la excelencia humana, mediante el desarrollo de las habilidades y capacidades personales. Ésta se promueve en un estilo de vida comunitario, favorecido por un clima afectivo-familiar.', 4, 1, 0),
	(7, 0, 1, '~/img/imgArticulo_4.png', '14-12-2015', 0, 1, 'NUESTRO COLEGIO', 'El Colegio Santa Elena fue fundado el año 1913 por las Hermanas Carmelitas de la Caridad. Estos 100 años de existencia nos avalan como una institución que ha estado permanentemente preocupada por la educación de niñas y jóvenes, formando mujeres líderes de nuestra sociedad, lo que hoy significa seguir aspirando a que ellas logren la excelencia humana, mediante el desarrollo de sus habilidades y capacidades personales.', 5, 1, 0),
	(8, 0, 1, '~/img/imgArticulo_5.png', '14-12-2015', 0, 1, 'CENTRO DE PADRES', 'El Centro de Padres y Apoderados del Colegio (CPA) nace el año 2003, producto de la fusión de los Centros de Padres y Apoderados de las distintas sedes.', 5, 1, 0),
	(9, 0, 1, '~/img/imgArticulo_6.png', '14-12-2015', 0, 1, 'MISIÓN', 'Nuestra misión es formar mujeres líderes, comprometidas con los valores del Evangelio, con un profundo sentimiento de gratitud y amor por la vida, que aspiren a la excelencia humana, mediante el desarrollo de las habilidades y capacidades personales. Ésta se promueve en un estilo de vida comunitario, favorecido por un clima afectivo-familiar.', 5, 1, 0);
/*!40000 ALTER TABLE `arti_articulo` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.atr_archivos_tricel
CREATE TABLE IF NOT EXISTS `atr_archivos_tricel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RUTA_ARCHIVO` varchar(500) DEFAULT NULL,
  `TRI_ID` int(11) DEFAULT '0',
  `ELIMINADO` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.atr_archivos_tricel: ~0 rows (aproximadamente)
DELETE FROM `atr_archivos_tricel`;
/*!40000 ALTER TABLE `atr_archivos_tricel` DISABLE KEYS */;
/*!40000 ALTER TABLE `atr_archivos_tricel` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.au_autentificacion_usuario
CREATE TABLE IF NOT EXISTS `au_autentificacion_usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_USUARIO` varchar(250) NOT NULL DEFAULT '0',
  `PASSWORD` varchar(250) NOT NULL DEFAULT '0',
  `CORREO_ELECTRONICO` varchar(250) NOT NULL DEFAULT '0',
  `ROL_ID` int(11) NOT NULL DEFAULT '0',
  `ES_VIGENTE` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.au_autentificacion_usuario: ~26 rows (aproximadamente)
DELETE FROM `au_autentificacion_usuario`;
/*!40000 ALTER TABLE `au_autentificacion_usuario` DISABLE KEYS */;
INSERT INTO `au_autentificacion_usuario` (`ID`, `NOMBRE_USUARIO`, `PASSWORD`, `CORREO_ELECTRONICO`, `ROL_ID`, `ES_VIGENTE`, `INST_ID`, `ELIMINADO`) VALUES
	(1, 'vcoronado', 'MQAyADMANAA1ADYA', 'vcoronado.alarcon@gmail.com', 1, 1, 3, 0),
	(4, 'Vgarcia', 'MQAyADMANAA1ADYA', 'turck182@gmail.com', 5, 1, 3, 0),
	(5, 'vcoronado3', '123456', 'vcoronado.alarcon@gmail.com', 3, 0, 3, 0),
	(6, 'vgarciaadm', 'MQAyADMANAA1ADYA', 'vgarcia@saydex.cl', 2, 1, 4, 0),
	(7, 'vgarcia1', 'MQAyADMANAA1ADYA', 'vgarcia@saydex.cl', 3, 1, 4, 0),
	(8, 'vgarcia2', 'MQAyADMANAA1ADYA', 'vgarcia@saydex.cl', 4, 1, 4, 0),
	(9, 'vgarcia3', 'MQAyADMANAA1ADYA', 'vgarcia@saydex.cl', 5, 1, 4, 0),
	(10, 'vgarcia4', 'MQAyADMANAA1ADYA', 'vgarcia@saydex.cl', 9, 1, 4, 0),
	(11, 'vgarcia5', 'MQAyADMANAA1ADYA', 'vgarcia@saydex.cl', 9, 1, 4, 0),
	(12, 'vgarcia6', 'MQAyADMANAA1ADYA', 'vgarcia@saydex.com', 9, 1, 4, 0),
	(13, 'ppprueba', 'MQAwADQANQAyADYAOQAxADgA', 'vcoronado@saydex.cl', 9, 1, 3, 0),
	(14, 'iretamalesPrueba', 'MQAyADEAOQAzADAAMQA0ADUA', 'vcoronado.alarcon@gmail.com', 9, 1, 3, 0),
	(15, 'otroPrueba', 'MQAwADQANQAyADYAOQAxADgA', 'vcoronado@saydex.cl', 9, 1, 3, 0),
	(16, 'ppablo', 'MQAwADQANQAyADYAOQAxADgA', 'vcoronado@saydex.cl', 9, 1, 3, 0),
	(17, 'iretamales', 'MQAyADEAOQAzADAAMQA0ADUA', 'vcoronado.alarcon@gmail.com', 9, 1, 3, 0),
	(18, 'vgarciasuper', 'MQAyADMANAA1ADYA', 'vgarcia@saydex.cl', 1, 1, 5, 0),
	(19, 'dsalazar', 'MQAzADUAOQA3ADQAMwA0AGsA', 'danny_salazaro@hotmail.com', 9, 1, 4, 0),
	(20, 'vigarci', 'MQAxADEAMQAxADEAMQAxADEA', 'turck182@gmail.com', 9, 1, 4, 0),
	(21, 'SecretariaCGPA', 'MQAyADMANAA1ADYA', 'danny_salaro@hotmail.com', 5, 1, 4, 0),
	(22, 'mabarca', 'OQAxADYANgAyADEAMwAyAA==', 'abarcamiguel63@gmail.com', 3, 1, 5, 0),
	(23, 'mquiroga', 'MQAyADIAMwA5ADIANAA0ADkA', 'marcia_quiroga_m@hotmail.com', 4, 1, 5, 0),
	(24, 'srojas', 'MQAyADEAMgA2ADUAOQA0AGsA', 'rojassandr@gmail.com', 5, 1, 5, 0),
	(25, 'dlabbe', 'MQA0ADAANQAyADUANwA4ADIA', 'daniela_labbe@hotmail.com', 10, 1, 5, 0),
	(26, 'cABmAHUAZQBuAHQAZQBzAG8AcgB0AGUAZwBhAA==', '123456', 'pfuentesortega98@gmail.com', 9, 1, 3, 0),
	(27, 'cABmAHUAZQBuAHQAZQBzAG8AcgB0AGUAZwBhAA==', '123456', 'pfuentesortega98@gmail.com', 9, 1, 3, 0),
	(28, 'cABmAHUAZQBuAHQAZQBzAG8AcgB0AGUAZwBhAA==', '123456', 'pfuentesortega98@gmail.com', 9, 1, 3, 0);
/*!40000 ALTER TABLE `au_autentificacion_usuario` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.cal_calendario
CREATE TABLE IF NOT EXISTS `cal_calendario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(250) DEFAULT ' ',
  `URL` varchar(250) DEFAULT ' ',
  `FECHA_INICIO` datetime DEFAULT CURRENT_TIMESTAMP,
  `FECHA_TERMINO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DETALLE` varchar(500) DEFAULT ' ',
  `ELIMINADO` int(11) DEFAULT '0',
  `INST_ID` int(11) DEFAULT '0',
  `ASUNTO` varchar(500) DEFAULT ' ',
  `UBICACION` varchar(500) DEFAULT ' ',
  `ETIQUETA` int(11) DEFAULT '0',
  `DESCRIPCION` varchar(500) DEFAULT ' ',
  `STATUS` int(11) DEFAULT '0',
  `TIPO` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.cal_calendario: ~23 rows (aproximadamente)
DELETE FROM `cal_calendario`;
/*!40000 ALTER TABLE `cal_calendario` DISABLE KEYS */;
INSERT INTO `cal_calendario` (`ID`, `TITULO`, `URL`, `FECHA_INICIO`, `FECHA_TERMINO`, `DETALLE`, `ELIMINADO`, `INST_ID`, `ASUNTO`, `UBICACION`, `ETIQUETA`, `DESCRIPCION`, `STATUS`, `TIPO`) VALUES
	(1, '', '', '2015-12-16 01:00:00', '2015-12-16 03:00:00', '', 0, 3, 'Prueba', 'Sala 213', 1, 'Prueba', 0, 0),
	(2, '', '', '2015-12-17 15:00:00', '2015-12-17 19:00:00', '', 0, 3, 'Prueba', 'Local', 3, 'Detalle ', 0, 0),
	(3, '', '', '2015-12-18 15:00:00', '2015-12-18 18:00:00', '', 0, 3, 'nueva cita', 'local 2', 1, 'prueba de detalle', 0, 0),
	(4, 'Prueba de calendario', '', '2015-12-17 00:00:00', '2015-12-18 00:00:00', 'Prueba de calendario', 1, 4, 'pruebs', 'local', 1, 'Prueba de calendario', 0, 0),
	(5, 'breve', '', '2015-12-15 14:00:00', '2015-12-15 15:00:00', 'breve', 0, 3, 'prueba de asunto nuevo', 'en la empresa', 2, 'breve', 0, 0),
	(6, 'Tricel 1', '', '2016-02-14 00:00:00', '2016-02-29 00:00:00', 'Tricel 1', 0, 3, 'Tricel 1', 'NO DEFINIDA', 1, 'Objetivo', 1, 1),
	(7, 'Tricel 1', '', '2016-02-17 00:00:00', '2016-02-29 00:00:00', 'Tricel 1', 0, 4, 'Tricel 1', 'NO DEFINIDA', 1, 'objetivo 1', 1, 1),
	(8, 'prueba', '', '2016-03-06 00:00:00', '2016-03-30 00:00:00', 'prueba', 0, 3, 'prueba', 'NO DEFINIDA', 1, 'Objetivo prueba', 1, 1),
	(9, 'proyecto coro', '', '2016-03-09 00:00:00', '2016-03-30 00:00:00', 'Desc', 0, 3, 'proyecto coro', 'NO DEFINIDA', 1, 'Desc', 1, 1),
	(10, 'Triple coro', '', '2016-03-08 00:00:00', '2016-03-29 00:00:00', 'Triple coro', 0, 3, 'Triple coro', 'NO DEFINIDA', 1, 'Obj', 1, 1),
	(11, 'pppp', '', '2016-03-08 00:00:00', '2016-03-30 00:00:00', 'pppp', 0, 3, 'pppp', 'NO DEFINIDA', 1, 'Obj', 1, 1),
	(12, 'coro', '', '2016-03-11 00:00:00', '2016-03-29 00:00:00', 'coro', 0, 3, 'coro', 'NO DEFINIDA', 1, 'Objetivo', 1, 1),
	(13, ' presentar los lineamientos y énfasis para este año escolar .', '', '2016-03-19 09:00:00', '2016-03-19 12:00:00', ' presentar los lineamientos y énfasis para este año escolar .', 0, 4, 'Asamblea General 2016', 'Colegio de niñas Santa Elena', 0, ' presentar los lineamientos y énfasis para este año escolar .', 0, 0),
	(14, '', '', '2016-04-02 10:00:00', '2016-04-02 16:00:00', '', 0, 4, 'Tallarinata Ramas deportivas Santa Elena ', 'Colegio Santa Elena', 0, 'Feria de las pulgas y 1ra tallarinata en pro de las ramas deportivas del Colegio Santa Elena', 0, 0),
	(15, 'TABLA:\n1. Rendición de cuentas directiva anterior\n2. Tallarinata\n3. Comunicación directa con las ramas\n4. Mejorar la comunicación actualizando los correos de las directivas actuales, para que no haya malos entendidos\n\nNOTA:EL COLEGIO DISPUSO UNA HORA', '', '2016-04-04 19:30:00', '2016-04-04 20:30:00', 'TABLA:\n1. Rendición de cuentas directiva anterior\n2. Tallarinata\n3. Comunicación directa con las ramas\n4. Mejorar la comunicación actualizando los correos de las directivas actuales, para que no haya malos entendidos\n\nNOTA:EL COLEGIO DISPUSO UNA HORA DE REUNIÓN  DESDE LAS 19:30 A LAS 20:30 POR PROBLEMAS DE POCO PERSONAL  POR ESO SE RUEGA \nPUNTUALIDAD\n', 0, 4, ' 2da Reunión  CGPA', 'Colegio Santa Elena', 0, 'TABLA:\n1. Rendición de cuentas directiva anterior\n2. Tallarinata\n3. Comunicación directa con las ramas\n4. Mejorar la comunicación actualizando los correos de las directivas actuales, para que no haya malos entendidos\n\nNOTA:EL COLEGIO DISPUSO UNA HORA DE REUNIÓN  DESDE LAS 19:30 A LAS 20:30 POR PROBLEMAS DE POCO PERSONAL  POR ESO SE RUEGA \nPUNTUALIDAD\n', 0, 0),
	(16, 'prueba', '', '2016-04-07 00:00:00', '2016-04-08 00:00:00', 'prueba', 0, 3, 'prueba', 'local', 1, 'prueba', 0, 0),
	(17, 'evento de prueba', '', '2016-04-07 10:00:00', '2016-04-07 12:00:00', 'evento de prueba', 0, 4, 'otro evento', 'Colegio Santa Elena', 0, 'evento de prueba', 0, 0),
	(18, 'Instalación de graderías en patio principal', '', '2016-04-14 00:00:00', '2016-04-22 00:00:00', 'Juegos de graderías para el patio', 0, 4, 'Instalación de graderías en patio principal', 'NO DEFINIDA', 1, 'Juegos de graderías para el patio', 1, 1),
	(19, 'Prueba de cita', '', '2016-04-16 13:00:00', '2016-04-16 14:00:00', 'Prueba de cita', 0, 4, 'Prueba de cita', 'En el establecimiento', 1, 'Prueba de cita', 0, 0),
	(20, 'prueba', '', '2016-04-16 13:00:00', '2016-04-16 14:00:00', 'prueba', 0, 4, 'Otra Prueba', 'en el local', 1, 'prueba', 0, 0),
	(21, 'Hola', '', '2016-04-15 18:30:00', '2016-04-15 20:00:00', 'Hola', 0, 4, 'Presentación plataforma cpas', 'Santa elena', 2, 'Hola', 1, 0),
	(22, 'asasasas', '', '2016-06-28 00:00:00', '2016-06-29 00:00:00', 'asasasas', 0, 3, 'asasasas', 'asasasas', 0, 'asasasas', 0, 0),
	(23, 'DEMO proyecto', '', '2016-11-04 00:00:00', '2016-11-11 00:00:00', 'Este proyecto tiene como foco poder entregar funciones de valor que puedan hacer match con CitiZen', 0, 4, 'DEMO proyecto', 'NO DEFINIDA', 1, 'Este proyecto tiene como foco poder entregar funciones de valor que puedan hacer match con CitiZen', 1, 1);
/*!40000 ALTER TABLE `cal_calendario` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.com_comuna
CREATE TABLE IF NOT EXISTS `com_comuna` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID unico de la comuna',
  `PROV_ID` int(11) NOT NULL COMMENT 'ID de la provincia asociada',
  `NOMBRE` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Nombre descriptivo de la comuna',
  PRIMARY KEY (`ID`,`PROV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Lista de comunas por provincias';

-- Volcando datos para la tabla db_9dac90_cole.com_comuna: ~346 rows (aproximadamente)
DELETE FROM `com_comuna`;
/*!40000 ALTER TABLE `com_comuna` DISABLE KEYS */;
INSERT INTO `com_comuna` (`ID`, `PROV_ID`, `NOMBRE`) VALUES
	(1, 1, 'ARICA'),
	(2, 1, 'CAMARONES'),
	(3, 2, 'PUTRE'),
	(4, 2, 'GENERAL LAGOS'),
	(5, 3, 'IQUIQUE'),
	(6, 3, 'ALTO HOSPICIO'),
	(7, 4, 'POZO ALMONTE'),
	(8, 4, 'CAMIÑA'),
	(9, 4, 'COLCHANE'),
	(10, 4, 'HUARA'),
	(11, 4, 'PICA'),
	(12, 5, 'ANTOFAGASTA'),
	(13, 5, 'MEJILLONES'),
	(14, 5, 'SIERRA GORDA'),
	(15, 5, 'TALTAL'),
	(16, 6, 'CALAMA'),
	(17, 6, 'OLLAGÜE'),
	(18, 6, 'SAN PEDRO DE ATACAMA'),
	(19, 7, 'TOCOPILLA'),
	(20, 7, 'MARÍA ELENA'),
	(21, 8, 'COPIAPÓ'),
	(22, 8, 'CALDERA'),
	(23, 8, 'TIERRA AMARILLA'),
	(24, 9, 'CHAÑARAL'),
	(25, 9, 'DIEGO DE ALMAGRO'),
	(26, 10, 'VALLENAR'),
	(27, 10, 'ALTO DEL CARMEN'),
	(28, 10, 'FREIRINA'),
	(29, 10, 'HUASCO'),
	(30, 11, 'LA SERENA'),
	(31, 11, 'COQUIMBO'),
	(32, 11, 'ANDACOLLO'),
	(33, 11, 'LA HIGUERA'),
	(34, 11, 'PAIGUANO'),
	(35, 11, 'VICUÑA'),
	(36, 12, 'ILLAPEL'),
	(37, 12, 'CANELA'),
	(38, 12, 'LOS VILOS'),
	(39, 12, 'SALAMANCA'),
	(40, 13, 'OVALLE'),
	(41, 13, 'COMBARBALÁ'),
	(42, 13, 'MONTE PATRIA'),
	(43, 13, 'PUNITAQUI'),
	(44, 13, 'RÍO HURTADO'),
	(45, 14, 'VALPARAÍSO'),
	(46, 14, 'CASABLANCA'),
	(47, 14, 'CONCÓN'),
	(48, 14, 'JUAN FERNÁNDEZ'),
	(49, 14, 'PUCHUNCAVÍ'),
	(50, 14, 'QUINTERO'),
	(51, 14, 'VIÑA DEL MAR'),
	(52, 15, 'ISLA DE PASCUA'),
	(53, 16, 'LOS ANDES'),
	(54, 16, 'CALLE LARGA'),
	(55, 16, 'RINCONADA'),
	(56, 16, 'SAN ESTEBAN'),
	(57, 17, 'LA LIGUA'),
	(58, 17, 'CABILDO'),
	(59, 17, 'PAPUDO'),
	(60, 17, 'PETORCA'),
	(61, 17, 'ZAPALLAR'),
	(62, 18, 'QUILLOTA'),
	(63, 18, 'CALERA'),
	(64, 18, 'HIJUELAS'),
	(65, 18, 'LA CRUZ'),
	(66, 18, 'NOGALES'),
	(67, 19, 'SAN ANTONIO'),
	(68, 19, 'ALGARROBO'),
	(69, 19, 'CARTAGENA'),
	(70, 19, 'EL QUISCO'),
	(71, 19, 'EL TABO'),
	(72, 19, 'SANTO DOMINGO'),
	(73, 20, 'SAN FELIPE'),
	(74, 20, 'CATEMU'),
	(75, 20, 'LLAILLAY'),
	(76, 20, 'PANQUEHUE'),
	(77, 20, 'PUTAENDO'),
	(78, 20, 'SANTA MARÍA'),
	(79, 21, 'LIMACHE'),
	(80, 21, 'QUILPUÉ'),
	(81, 21, 'VILLA ALEMANA'),
	(82, 21, 'OLMUÉ'),
	(83, 22, 'RANCAGUA'),
	(84, 22, 'CODEGUA'),
	(85, 22, 'COINCO'),
	(86, 22, 'COLTAUCO'),
	(87, 22, 'DOÑIHUE'),
	(88, 22, 'GRANEROS'),
	(89, 22, 'LAS CABRAS'),
	(90, 22, 'MACHALÍ'),
	(91, 22, 'MALLOA'),
	(92, 22, 'MOSTAZAL'),
	(93, 22, 'OLIVAR'),
	(94, 22, 'PEUMO'),
	(95, 22, 'PICHIDEGUA'),
	(96, 22, 'QUINTA DE TILCOCO'),
	(97, 22, 'RENGO'),
	(98, 22, 'REQUÍNOA'),
	(99, 22, 'SAN VICENTE'),
	(100, 23, 'PICHILEMU'),
	(101, 23, 'LA ESTRELLA'),
	(102, 23, 'LITUECHE'),
	(103, 23, 'MARCHIHUE'),
	(104, 23, 'NAVIDAD'),
	(105, 23, 'PAREDONES'),
	(106, 24, 'SAN FERNANDO'),
	(107, 24, 'CHÉPICA'),
	(108, 24, 'CHIMBARONGO'),
	(109, 24, 'LOLOL'),
	(110, 24, 'NANCAGUA'),
	(111, 24, 'PALMILLA'),
	(112, 24, 'PERALILLO'),
	(113, 24, 'PLACILLA'),
	(114, 24, 'PUMANQUE'),
	(115, 24, 'SANTA CRUZ'),
	(116, 25, 'TALCA'),
	(117, 25, 'CONSTITUCIÓN'),
	(118, 25, 'CUREPTO'),
	(119, 25, 'EMPEDRADO'),
	(120, 25, 'MAULE'),
	(121, 25, 'PELARCO'),
	(122, 25, 'PENCAHUE'),
	(123, 25, 'RÍO CLARO'),
	(124, 25, 'SAN CLEMENTE'),
	(125, 25, 'SAN RAFAEL'),
	(126, 26, 'CAUQUENES'),
	(127, 26, 'CHANCO'),
	(128, 26, 'PELLUHUE'),
	(129, 27, 'CURICÓ'),
	(130, 27, 'HUALAÑÉ'),
	(131, 27, 'LICANTÉN'),
	(132, 27, 'MOLINA'),
	(133, 27, 'RAUCO'),
	(134, 27, 'ROMERAL'),
	(135, 27, 'SAGRADA FAMILIA'),
	(136, 27, 'TENO'),
	(137, 27, 'VICHUQUÉN'),
	(138, 28, 'LINARES'),
	(139, 28, 'COLBÚN'),
	(140, 28, 'LONGAVÍ'),
	(141, 28, 'PARRAL'),
	(142, 28, 'RETIRO'),
	(143, 28, 'SAN JAVIER'),
	(144, 28, 'VILLA ALEGRE'),
	(145, 28, 'YERBAS BUENAS'),
	(146, 29, 'CONCEPCIÓN'),
	(147, 29, 'CORONEL'),
	(148, 29, 'CHIGUAYANTE'),
	(149, 29, 'FLORIDA'),
	(150, 29, 'HUALQUI'),
	(151, 29, 'LOTA'),
	(152, 29, 'PENCO'),
	(153, 29, 'SAN PEDRO DE LA PAZ'),
	(154, 29, 'SANTA JUANA'),
	(155, 29, 'TALCAHUANO'),
	(156, 29, 'TOMÉ'),
	(157, 29, 'HUALPÉN'),
	(158, 30, 'LEBU'),
	(159, 30, 'ARAUCO'),
	(160, 30, 'CAÑETE'),
	(161, 30, 'CONTULMO'),
	(162, 30, 'CURANILAHUE'),
	(163, 30, 'LOS ALAMOS'),
	(164, 30, 'TIRÚA'),
	(165, 31, 'LOS ANGELES'),
	(166, 31, 'ANTUCO'),
	(167, 31, 'CABRERO'),
	(168, 31, 'LAJA'),
	(169, 31, 'MULCHÉN'),
	(170, 31, 'NACIMIENTO'),
	(171, 31, 'NEGRETE'),
	(172, 31, 'QUILACO'),
	(173, 31, 'QUILLECO'),
	(174, 31, 'SAN ROSENDO'),
	(175, 31, 'SANTA BÁRBARA'),
	(176, 31, 'TUCAPEL'),
	(177, 31, 'YUMBEL'),
	(178, 31, 'ALTO BIOBÍO'),
	(179, 32, 'CHILLÁN'),
	(180, 32, 'BULNES'),
	(181, 32, 'COBQUECURA'),
	(182, 32, 'COELEMU'),
	(183, 32, 'COIHUECO'),
	(184, 32, 'CHILLÁN VIEJO'),
	(185, 32, 'EL CARMEN'),
	(186, 32, 'NINHUE'),
	(187, 32, 'ÑIQUÉN'),
	(188, 32, 'PEMUCO'),
	(189, 32, 'PINTO'),
	(190, 32, 'PORTEZUELO'),
	(191, 32, 'QUILLÓN'),
	(192, 32, 'QUIRIHUE'),
	(193, 32, 'RÁNQUIL'),
	(194, 32, 'SAN CARLOS'),
	(195, 32, 'SAN FABIÁN'),
	(196, 32, 'SAN IGNACIO'),
	(197, 32, 'SAN NICOLÁS'),
	(198, 32, 'TREGUACO'),
	(199, 32, 'YUNGAY'),
	(200, 33, 'TEMUCO'),
	(201, 33, 'CARAHUE'),
	(202, 33, 'CUNCO'),
	(203, 33, 'CURARREHUE'),
	(204, 33, 'FREIRE'),
	(205, 33, 'GALVARINO'),
	(206, 33, 'GORBEA'),
	(207, 33, 'LAUTARO'),
	(208, 33, 'LONCOCHE'),
	(209, 33, 'MELIPEUCO'),
	(210, 33, 'NUEVA IMPERIAL'),
	(211, 33, 'PADRE LAS CASAS'),
	(212, 33, 'PERQUENCO'),
	(213, 33, 'PITRUFQUÉN'),
	(214, 33, 'PUCÓN'),
	(215, 33, 'SAAVEDRA'),
	(216, 33, 'TEODORO SCHMIDT'),
	(217, 33, 'TOLTÉN'),
	(218, 33, 'VILCÚN'),
	(219, 33, 'VILLARRICA'),
	(220, 33, 'CHOLCHOL'),
	(221, 34, 'ANGOL'),
	(222, 34, 'COLLIPULLI'),
	(223, 34, 'CURACAUTÍN'),
	(224, 34, 'ERCILLA'),
	(225, 34, 'LONQUIMAY'),
	(226, 34, 'LOS SAUCES'),
	(227, 34, 'LUMACO'),
	(228, 34, 'PURÉN'),
	(229, 34, 'RENAICO'),
	(230, 34, 'TRAIGUÉN'),
	(231, 34, 'VICTORIA'),
	(232, 35, 'VALDIVIA'),
	(233, 35, 'CORRAL'),
	(234, 35, 'LANCO'),
	(235, 35, 'LOS LAGOS'),
	(236, 35, 'MÁFIL'),
	(237, 35, 'MARIQUINA'),
	(238, 35, 'PAILLACO'),
	(239, 35, 'PANGUIPULLI'),
	(240, 36, 'LA UNIÓN'),
	(241, 36, 'FUTRONO'),
	(242, 36, 'LAGO RANCO'),
	(243, 36, 'RÍO BUENO'),
	(244, 37, 'PUERTO MONTT'),
	(245, 37, 'CALBUCO'),
	(246, 37, 'COCHAMÓ'),
	(247, 37, 'FRESIA'),
	(248, 37, 'FRUTILLAR'),
	(249, 37, 'LOS MUERMOS'),
	(250, 37, 'LLANQUIHUE'),
	(251, 37, 'MAULLÍN'),
	(252, 37, 'PUERTO VARAS'),
	(253, 38, 'CASTRO'),
	(254, 38, 'ANCUD'),
	(255, 38, 'CHONCHI'),
	(256, 38, 'CURACO DE VÉLEZ'),
	(257, 38, 'DALCAHUE'),
	(258, 38, 'PUQUELDÓN'),
	(259, 38, 'QUEILÉN'),
	(260, 38, 'QUELLÓN'),
	(261, 38, 'QUEMCHI'),
	(262, 38, 'QUINCHAO'),
	(263, 39, 'OSORNO'),
	(264, 39, 'PUERTO OCTAY'),
	(265, 39, 'PURRANQUE'),
	(266, 39, 'PUYEHUE'),
	(267, 39, 'RÍO NEGRO'),
	(268, 39, 'SAN JUAN DE LA COSTA'),
	(269, 39, 'SAN PABLO'),
	(270, 40, 'CHAITÉN'),
	(271, 40, 'FUTALEUFÚ'),
	(272, 40, 'HUALAIHUÉ'),
	(273, 40, 'PALENA'),
	(274, 41, 'COIHAIQUE'),
	(275, 41, 'LAGO VERDE'),
	(276, 42, 'AISÉN'),
	(277, 42, 'CISNES'),
	(278, 42, 'GUAITECAS'),
	(279, 43, 'COCHRANE'),
	(280, 43, 'O\'HIGGINS'),
	(281, 43, 'TORTEL'),
	(282, 44, 'CHILE CHICO'),
	(283, 44, 'RÍO IBÁÑEZ'),
	(284, 45, 'PUNTA ARENAS'),
	(285, 45, 'LAGUNA BLANCA'),
	(286, 45, 'RÍO VERDE'),
	(287, 45, 'SAN GREGORIO'),
	(288, 46, 'CABO DE HORNOS'),
	(289, 46, 'ANTÁRTICA'),
	(290, 47, 'PORVENIR'),
	(291, 47, 'PRIMAVERA'),
	(292, 47, 'TIMAUKEL'),
	(293, 48, 'NATALES'),
	(294, 48, 'TORRES DEL PAINE'),
	(295, 49, 'SANTIAGO'),
	(296, 49, 'CERRILLOS'),
	(297, 49, 'CERRO NAVIA'),
	(298, 49, 'CONCHALÍ'),
	(299, 49, 'EL BOSQUE'),
	(300, 49, 'ESTACIÓN CENTRAL'),
	(301, 49, 'HUECHURABA'),
	(302, 49, 'INDEPENDENCIA'),
	(303, 49, 'LA CISTERNA'),
	(304, 49, 'LA FLORIDA'),
	(305, 49, 'LA GRANJA'),
	(306, 49, 'LA PINTANA'),
	(307, 49, 'LA REINA'),
	(308, 49, 'LAS CONDES'),
	(309, 49, 'LO BARNECHEA'),
	(310, 49, 'LO ESPEJO'),
	(311, 49, 'LO PRADO'),
	(312, 49, 'MACUL'),
	(313, 49, 'MAIPÚ'),
	(314, 49, 'ÑUÑOA'),
	(315, 49, 'PEDRO AGUIRRE CERDA'),
	(316, 49, 'PEÑALOLÉN'),
	(317, 49, 'PROVIDENCIA'),
	(318, 49, 'PUDAHUEL'),
	(319, 49, 'QUILICURA'),
	(320, 49, 'QUINTA NORMAL'),
	(321, 49, 'RECOLETA'),
	(322, 49, 'RENCA'),
	(323, 49, 'SAN JOAQUÍN'),
	(324, 49, 'SAN MIGUEL'),
	(325, 49, 'SAN RAMÓN'),
	(326, 49, 'VITACURA'),
	(327, 50, 'PUENTE ALTO'),
	(328, 50, 'PIRQUE'),
	(329, 50, 'SAN JOSÉ DE MAIPO'),
	(330, 51, 'COLINA'),
	(331, 51, 'LAMPA'),
	(332, 51, 'TILTIL'),
	(333, 52, 'SAN BERNARDO'),
	(334, 52, 'BUIN'),
	(335, 52, 'CALERA DE TANGO'),
	(336, 52, 'PAINE'),
	(337, 53, 'MELIPILLA'),
	(338, 53, 'ALHUÉ'),
	(339, 53, 'CURACAVÍ'),
	(340, 53, 'MARÍA PINTO'),
	(341, 53, 'SAN PEDRO'),
	(342, 54, 'TALAGANTE'),
	(343, 54, 'EL MONTE'),
	(344, 54, 'ISLA DE MAIPO'),
	(345, 54, 'PADRE HURTADO'),
	(346, 54, 'PEÑAFLOR');
/*!40000 ALTER TABLE `com_comuna` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.coni_configuracion_institucion
CREATE TABLE IF NOT EXISTS `coni_configuracion_institucion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INST_ID` int(11) DEFAULT '0',
  `ENVIA_DOCUMENTOS` int(11) DEFAULT '0',
  `ENVIA_PROYECTOS` int(11) DEFAULT '0',
  `ENVIA_RENDICIONES` int(11) DEFAULT '0',
  `ENVIA_CORREO_EVENTOS` int(11) DEFAULT '0',
  `ELIMINADO` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.coni_configuracion_institucion: ~3 rows (aproximadamente)
DELETE FROM `coni_configuracion_institucion`;
/*!40000 ALTER TABLE `coni_configuracion_institucion` DISABLE KEYS */;
INSERT INTO `coni_configuracion_institucion` (`ID`, `INST_ID`, `ENVIA_DOCUMENTOS`, `ENVIA_PROYECTOS`, `ENVIA_RENDICIONES`, `ENVIA_CORREO_EVENTOS`, `ELIMINADO`) VALUES
	(1, 3, 0, 0, 0, 0, 0),
	(2, 4, 1, 1, 1, 1, 0),
	(3, 5, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `coni_configuracion_institucion` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.cua_curso_apoderado
CREATE TABLE IF NOT EXISTS `cua_curso_apoderado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INST_ID` int(11) DEFAULT '0',
  `USU_ID` int(11) DEFAULT '0',
  `CUR_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.cua_curso_apoderado: ~9 rows (aproximadamente)
DELETE FROM `cua_curso_apoderado`;
/*!40000 ALTER TABLE `cua_curso_apoderado` DISABLE KEYS */;
INSERT INTO `cua_curso_apoderado` (`ID`, `INST_ID`, `USU_ID`, `CUR_ID`) VALUES
	(1, 3, 4, 14),
	(5, 3, 1, 1),
	(6, 4, 19, 115),
	(7, 4, 20, 115),
	(8, 4, 21, 115),
	(9, 5, 22, 134),
	(10, 5, 23, 137),
	(13, 5, 25, 130),
	(16, 5, 24, 7);
/*!40000 ALTER TABLE `cua_curso_apoderado` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.cur_curso
CREATE TABLE IF NOT EXISTS `cur_curso` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INST_ID` int(11) DEFAULT '0',
  `NOMBRE` varchar(500) DEFAULT '0',
  `ID_USU_RESPONSABLE` int(11) DEFAULT '0',
  `ELIMINADO` int(11) DEFAULT '0',
  `ORDEN` int(11) DEFAULT '0',
  `TIPO` int(11) DEFAULT '0',
  `GRUPO` varchar(500) DEFAULT NULL,
  `SUB_GRUPO` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.cur_curso: ~140 rows (aproximadamente)
DELETE FROM `cur_curso`;
/*!40000 ALTER TABLE `cur_curso` DISABLE KEYS */;
INSERT INTO `cur_curso` (`ID`, `INST_ID`, `NOMBRE`, `ID_USU_RESPONSABLE`, `ELIMINADO`, `ORDEN`, `TIPO`, `GRUPO`, `SUB_GRUPO`) VALUES
	(1, 3, 'Sala Cuna Menor A', 0, 0, 1, 1, 'Parvularia ', 'Sala Cuna Menor'),
	(2, 3, 'Sala Cuna Menor B', 0, 0, 2, 1, 'Parvularia ', 'Sala Cuna Menor'),
	(3, 3, 'Sala Cuna Menor C', 0, 0, 3, 1, 'Parvularia ', 'Sala Cuna Menor'),
	(4, 3, 'Sala Cuna Mayor A', 0, 0, 4, 1, 'Parvularia ', 'Sala Cuna Mayor'),
	(5, 3, 'Sala Cuna Mayor B', 0, 0, 5, 1, 'Parvularia ', 'Sala Cuna Mayor'),
	(6, 3, 'Sala Cuna Mayor C', 0, 0, 6, 1, 'Parvularia ', 'Sala Cuna Mayor'),
	(7, 3, 'Primer Nivel Transición (Pre-Kinder) A', 0, 0, 7, 1, 'Parvularia ', 'Prekinder'),
	(8, 3, 'Primer Nivel Transición (Pre-Kinder) B', 0, 0, 8, 1, 'Parvularia ', 'Prekinder'),
	(9, 3, 'Primer Nivel Transición (Pre-Kinder) C', 0, 0, 9, 1, 'Parvularia ', 'Prekinder'),
	(10, 3, 'Segundo Nivel Transición (Kinder) A', 0, 0, 10, 1, 'Parvularia ', 'Kinder'),
	(11, 3, 'Segundo Nivel Transición (Kinder) B', 0, 0, 11, 1, 'Parvularia ', 'Kinder'),
	(12, 3, 'Segundo Nivel Transición (Kinder) C', 0, 0, 12, 1, 'Parvularia ', 'Kinder'),
	(13, 3, 'Primer Año Básico A', 0, 0, 13, 2, 'Básica', 'Primeros'),
	(14, 3, 'Primer Año Básico B', 0, 0, 14, 2, 'Básica', 'Primeros'),
	(15, 3, 'Primer Año Básico C', 0, 0, 15, 2, 'Básica', 'Primeros'),
	(16, 3, 'Primer Año Básico D', 0, 0, 16, 2, 'Básica', 'Primeros'),
	(17, 3, 'Primer Año Básico E', 0, 0, 17, 2, 'Básica', 'Primeros'),
	(18, 3, 'Primer Año Básico F', 0, 0, 18, 2, 'Básica', 'Primeros'),
	(19, 3, 'Primer Año Básico G', 0, 0, 19, 2, 'Básica', 'Primeros'),
	(20, 3, 'Primer Año Básico H', 0, 0, 20, 2, 'Básica', 'Primeros'),
	(21, 3, 'Segundo Año Básico A', 0, 0, 21, 2, 'Básica', 'Segundos'),
	(22, 3, 'Segundo Año Básico B', 0, 0, 22, 2, 'Básica', 'Segundos'),
	(23, 3, 'Segundo Año Básico C', 0, 0, 23, 2, 'Básica', 'Segundos'),
	(24, 3, 'Segundo Año Básico D', 0, 0, 24, 2, 'Básica', 'Segundos'),
	(25, 3, 'Segundo Año Básico E', 0, 0, 25, 2, 'Básica', 'Segundos'),
	(26, 3, 'Segundo Año Básico F', 0, 0, 26, 2, 'Básica', 'Segundos'),
	(27, 3, 'Segundo Año Básico G', 0, 0, 27, 2, 'Básica', 'Segundos'),
	(28, 3, 'Segundo Año Básico H', 0, 0, 28, 2, 'Básica', 'Segundos'),
	(29, 3, 'Tercer Año Básico A', 0, 0, 29, 2, 'Básica', 'Terceros'),
	(30, 3, 'Tercer Año Básico B', 0, 0, 30, 2, 'Básica', 'Terceros'),
	(31, 3, 'Tercer Año Básico C', 0, 0, 31, 2, 'Básica', 'Terceros'),
	(32, 3, 'Tercer Año Básico D', 0, 0, 32, 2, 'Básica', 'Terceros'),
	(33, 3, 'Tercer Año Básico E', 0, 0, 33, 2, 'Básica', 'Terceros'),
	(34, 3, 'Tercer Año Básico F', 0, 0, 34, 2, 'Básica', 'Terceros'),
	(35, 3, 'Tercer Año Básico G', 0, 0, 35, 2, 'Básica', 'Terceros'),
	(36, 3, 'Tercer Año Básico H', 0, 0, 36, 2, 'Básica', 'Terceros'),
	(37, 3, 'Cuarto Año Básico A', 0, 0, 37, 2, 'Básica', 'Cuartos'),
	(38, 3, 'Cuarto Año Básico B', 0, 0, 38, 2, 'Básica', 'Cuartos'),
	(39, 3, 'Cuarto Año Básico C', 0, 0, 39, 2, 'Básica', 'Cuartos'),
	(40, 3, 'Cuarto Año Básico D', 0, 0, 40, 2, 'Básica', 'Cuartos'),
	(41, 3, 'Cuarto Año Básico E', 0, 0, 41, 2, 'Básica', 'Cuartos'),
	(42, 3, 'Cuarto Año Básico F', 0, 0, 42, 2, 'Básica', 'Cuartos'),
	(43, 3, 'Cuarto Año Básico G', 0, 0, 43, 2, 'Básica', 'Cuartos'),
	(44, 3, 'Cuarto Año Básico H', 0, 0, 44, 2, 'Básica', 'Cuartos'),
	(45, 3, 'Quinto Año Básico A', 0, 0, 45, 2, 'Básica', 'Quintos'),
	(46, 3, 'Quinto Año Básico B', 0, 0, 46, 2, 'Básica', 'Quintos'),
	(47, 3, 'Quinto Año Básico C', 0, 0, 47, 2, 'Básica', 'Quintos'),
	(48, 3, 'Quinto Año Básico D', 0, 0, 48, 2, 'Básica', 'Quintos'),
	(49, 3, 'Quinto Año Básico E', 0, 0, 49, 2, 'Básica', 'Quintos'),
	(50, 3, 'Quinto Año Básico F', 0, 0, 50, 2, 'Básica', 'Quintos'),
	(51, 3, 'Quinto Año Básico G', 0, 0, 51, 2, 'Básica', 'Quintos'),
	(52, 3, 'Quinto Año Básico H', 0, 0, 52, 2, 'Básica', 'Quintos'),
	(53, 3, 'Sexto Año Básico A', 0, 0, 53, 2, 'Básica', 'Sextos'),
	(54, 3, 'Sexto Año Básico B', 0, 0, 54, 2, 'Básica', 'Sextos'),
	(55, 3, 'Sexto Año Básico C', 0, 0, 55, 2, 'Básica', 'Sextos'),
	(56, 3, 'Sexto Año Básico D', 0, 0, 56, 2, 'Básica', 'Sextos'),
	(57, 3, 'Sexto Año Básico E', 0, 0, 57, 2, 'Básica', 'Sextos'),
	(58, 3, 'Sexto Año Básico F', 0, 0, 58, 2, 'Básica', 'Sextos'),
	(59, 3, 'Sexto Año Básico G', 0, 0, 59, 2, 'Básica', 'Sextos'),
	(60, 3, 'Sexto Año Básico H', 0, 0, 60, 2, 'Básica', 'Sextos'),
	(61, 3, 'Séptimo Año Básico A', 0, 0, 61, 2, 'Básica', 'Séptimos'),
	(62, 3, 'Séptimo Año Básico B', 0, 0, 62, 2, 'Básica', 'Séptimos'),
	(63, 3, 'Séptimo Año Básico C', 0, 0, 63, 2, 'Básica', 'Séptimos'),
	(64, 3, 'Séptimo Año Básico D', 0, 0, 64, 2, 'Básica', 'Séptimos'),
	(65, 3, 'Séptimo Año Básico E', 0, 0, 65, 2, 'Básica', 'Séptimos'),
	(66, 3, 'Séptimo Año Básico F', 0, 0, 66, 2, 'Básica', 'Séptimos'),
	(67, 3, 'Séptimo Año Básico G', 0, 0, 67, 2, 'Básica', 'Séptimos'),
	(68, 3, 'Séptimo Año Básico H', 0, 0, 68, 2, 'Básica', 'Séptimos'),
	(69, 3, 'Octavo Año Básico A', 0, 0, 69, 2, 'Básica', 'Octavos'),
	(70, 3, 'Octavo Año Básico B', 0, 0, 70, 2, 'Básica', 'Octavos'),
	(71, 3, 'Octavo Año Básico C', 0, 0, 71, 2, 'Básica', 'Octavos'),
	(72, 3, 'Octavo Año Básico D', 0, 0, 72, 2, 'Básica', 'Octavos'),
	(73, 3, 'Octavo Año Básico E', 0, 0, 73, 2, 'Básica', 'Octavos'),
	(74, 3, 'Octavo Año Básico F', 0, 0, 74, 2, 'Básica', 'Octavos'),
	(75, 3, 'Octavo Año Básico G', 0, 0, 75, 2, 'Básica', 'Octavos'),
	(76, 3, 'Octavo Año Básico H', 0, 0, 76, 2, 'Básica', 'Octavos'),
	(77, 3, 'Primer Año Medio A', 0, 0, 77, 3, 'Media', 'Primeros'),
	(78, 3, 'Primer Año Medio B', 0, 0, 78, 3, 'Media', 'Primeros'),
	(79, 3, 'Primer Año Medio C', 0, 0, 79, 3, 'Media', 'Primeros'),
	(80, 3, 'Primer Año Medio D', 0, 0, 80, 3, 'Media', 'Primeros'),
	(81, 3, 'Primer Año Medio E', 0, 0, 81, 3, 'Media', 'Primeros'),
	(82, 3, 'Primer Año Medio F', 0, 0, 82, 3, 'Media', 'Primeros'),
	(83, 3, 'Primer Año Medio G', 0, 0, 83, 3, 'Media', 'Primeros'),
	(84, 3, 'Primer Año Medio H', 0, 0, 84, 3, 'Media', 'Primeros'),
	(85, 3, 'Segundo Año Medio A', 0, 0, 85, 3, 'Media', 'Segundos'),
	(86, 3, 'Segundo Año Medio B', 0, 0, 86, 3, 'Media', 'Segundos'),
	(87, 3, 'Segundo Año Medio C', 0, 0, 87, 3, 'Media', 'Segundos'),
	(88, 3, 'Segundo Año Medio D', 0, 0, 88, 3, 'Media', 'Segundos'),
	(89, 3, 'Segundo Año Medio E', 0, 0, 89, 3, 'Media', 'Segundos'),
	(90, 3, 'Segundo Año Medio F', 0, 0, 90, 3, 'Media', 'Segundos'),
	(91, 3, 'Segundo Año Medio G', 0, 0, 91, 3, 'Media', 'Segundos'),
	(92, 3, 'Segundo Año Medio H', 0, 0, 92, 3, 'Media', 'Segundos'),
	(93, 3, 'Tercer Año Medio A', 0, 0, 93, 3, 'Media', 'Terceros'),
	(94, 3, 'Tercer Año Medio B', 0, 0, 94, 3, 'Media', 'Terceros'),
	(95, 3, 'Tercer Año Medio C', 0, 0, 95, 3, 'Media', 'Terceros'),
	(96, 3, 'Tercer Año Medio D', 0, 0, 96, 3, 'Media', 'Terceros'),
	(97, 3, 'Tercer Año Medio E', 0, 0, 97, 3, 'Media', 'Terceros'),
	(98, 3, 'Tercer Año Medio F', 0, 0, 98, 3, 'Media', 'Terceros'),
	(99, 3, 'Tercer Año Medio G', 0, 0, 99, 3, 'Media', 'Terceros'),
	(100, 3, 'Tercer Año Medio H', 0, 0, 100, 3, 'Media', 'Terceros'),
	(101, 3, 'Cuarto Año Medio A', 0, 0, 101, 3, 'Media', 'Cuartos'),
	(102, 3, 'Cuarto Año Medio B', 0, 0, 102, 3, 'Media', 'Cuartos'),
	(103, 3, 'Cuarto Año Medio C', 0, 0, 103, 3, 'Media', 'Cuartos'),
	(104, 3, 'Cuarto Año Medio D', 0, 0, 104, 3, 'Media', 'Cuartos'),
	(105, 3, 'Cuarto Año Medio E', 0, 0, 105, 3, 'Media', 'Cuartos'),
	(106, 3, 'Cuarto Año Medio F', 0, 0, 106, 3, 'Media', 'Cuartos'),
	(107, 3, 'Cuarto Año Medio G', 0, 0, 107, 3, 'Media', 'Cuartos'),
	(108, 3, 'Cuarto Año Medio H', 0, 0, 108, 3, 'Media', 'Cuartos'),
	(109, 4, 'Sala Cuna Menor', 0, 0, 1, 1, 'Parvularia', 'Sala Cuna Menor'),
	(110, 4, 'Sala Cuna Mayor', 0, 0, 2, 1, 'Parvularia', 'Sala Cuna Mayor'),
	(111, 4, 'Primer Nivel Transición (Pre-Kinder)', 0, 0, 3, 1, 'Parvularia', 'Prekinder'),
	(112, 4, 'Segundo Nivel Transición (Kinder)', 0, 0, 4, 1, 'Parvularia', 'Kinder'),
	(113, 4, 'Primer Año Básico', 0, 0, 5, 2, 'Básica', 'Primeros'),
	(114, 4, 'Segundo Año Básico', 0, 0, 6, 2, 'Básica', 'Segundos'),
	(115, 4, 'Tercer Año Básico', 0, 0, 7, 2, 'Básica', 'Terceros'),
	(116, 4, 'Cuarto Año Básico', 0, 0, 8, 2, 'Básica', 'Cuartos'),
	(117, 4, 'Quinto Año Básico', 0, 0, 9, 2, 'Básica', 'Quintos'),
	(118, 4, 'Sexto Año Básico', 0, 0, 10, 2, 'Básica', 'Sextos'),
	(119, 4, 'Séptimo Año Básico', 0, 0, 11, 2, 'Básica', 'Séptimos'),
	(120, 4, 'Octavo Año Básico', 0, 0, 12, 2, 'Básica', 'Octavos'),
	(121, 4, 'Primer Año Medio', 0, 0, 13, 3, 'Media', 'Primeros'),
	(122, 4, 'Segundo Año Medio', 0, 0, 14, 3, 'Media', 'Segundos'),
	(123, 4, 'Tercer Año Medio', 0, 0, 15, 3, 'Media', 'Terceros'),
	(124, 4, 'Cuarto Año Medio', 0, 0, 16, 3, 'Media', 'Cuartos'),
	(125, 5, 'Sala Cuna Menor', 0, 0, 1, 1, 'Parvularia', 'Sala Cuna Menor'),
	(126, 5, 'Sala Cuna Mayor', 0, 0, 2, 1, 'Parvularia', 'Sala Cuna Mayor'),
	(127, 5, 'Primer Nivel Transición (Pre-Kinder)', 0, 0, 3, 1, 'Parvularia', 'Prekinder'),
	(128, 5, 'Segundo Nivel Transición (Kinder)', 0, 0, 4, 1, 'Parvularia', 'Kinder'),
	(129, 5, 'Primer Año Básico', 0, 0, 5, 2, 'Básica', 'Primeros'),
	(130, 5, 'Segundo Año Básico', 0, 0, 6, 2, 'Básica', 'Segundos'),
	(131, 5, 'Tercer Año Básico', 0, 0, 7, 2, 'Básica', 'Terceros'),
	(132, 5, 'Cuarto Año Básico', 0, 0, 8, 2, 'Básica', 'Cuartos'),
	(133, 5, 'Quinto Año Básico', 0, 0, 9, 2, 'Básica', 'Quintos'),
	(134, 5, 'Sexto Año Básico', 0, 0, 10, 2, 'Básica', 'Sextos'),
	(135, 5, 'Séptimo Año Básico', 0, 0, 11, 2, 'Básica', 'Séptimos'),
	(136, 5, 'Octavo Año Básico', 0, 0, 12, 2, 'Básica', 'Octavos'),
	(137, 5, 'Primer Año Medio', 0, 0, 13, 3, 'Media', 'Primeros'),
	(138, 5, 'Segundo Año Medio', 0, 0, 14, 3, 'Media', 'Segundos'),
	(139, 5, 'Tercer Año Medio', 0, 0, 15, 3, 'Media', 'Terceros'),
	(140, 5, 'Cuarto Año Medio', 0, 0, 16, 3, 'Media', 'Cuartos');
/*!40000 ALTER TABLE `cur_curso` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.doc_documentos
CREATE TABLE IF NOT EXISTS `doc_documentos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USU_ID` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `NOMBRE_ARCHIVO` varchar(250) NOT NULL DEFAULT '0',
  `URL` varchar(1000) NOT NULL DEFAULT '0',
  `TAMANO` int(11) NOT NULL DEFAULT '0',
  `FECHA_SUBIDA` varchar(50) DEFAULT NULL,
  `EXTENSION` varchar(250) DEFAULT NULL,
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.doc_documentos: ~6 rows (aproximadamente)
DELETE FROM `doc_documentos`;
/*!40000 ALTER TABLE `doc_documentos` DISABLE KEYS */;
INSERT INTO `doc_documentos` (`ID`, `USU_ID`, `INST_ID`, `NOMBRE_ARCHIVO`, `URL`, `TAMANO`, `FECHA_SUBIDA`, `EXTENSION`, `ELIMINADO`) VALUES
	(3, 1, 3, 'g5qz5bgl.l5m LA OFERTA Y DEMANDA.docx', '~/Repositorio/g5qz5bgl.l5m LA OFERTA Y DEMANDA.docx', 13, '10/27/2015 8:57 AM', '~/img/word.png', 0),
	(4, 1, 3, 'dzxjvwf4.gru Ideas y herramientas para mejorar la organizacion.pdf', '~/Repositorio/dzxjvwf4.gru Ideas y herramientas para mejorar la organizacion.pdf', 866, '10/27/2015 11:13 AM', '~/img/pdf.png', 0),
	(5, 1, 3, 'fsdrt32u.mhp Acta Segunda Reunion cgpa 18 6 2015.pdf', '~/Repositorio/fsdrt32u.mhp Acta Segunda Reunion cgpa 18 6 2015.pdf', 802, '10/27/2015 1:22 PM', '~/img/pdf.png', 0),
	(6, 6, 4, 'lriylpeo.ioj acta 2 mayo 2013.pdf', '~/Repositorio/lriylpeo.ioj acta 2 mayo 2013.pdf', 245, '11/11/2015 12:36 PM', '~/img/pdf.png', 0),
	(7, 1, 3, 'vzewr1z4.3gp marcel duchamp.docx', '~/Repositorio/vzewr1z4.3gp marcel duchamp.docx', 24, '12-03-2016 15:59', '~/img/word.png', 0),
	(8, 6, 4, '1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', '~/Repositorio/1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', 578, '02-04-2016 18:20', '~/img/pdf.png', 1);
/*!40000 ALTER TABLE `doc_documentos` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.doc_documentos_usuario
CREATE TABLE IF NOT EXISTS `doc_documentos_usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USU_ID` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `NOMBRE_ARCHIVO` varchar(250) NOT NULL DEFAULT '0',
  `URL` varchar(1000) NOT NULL DEFAULT '0',
  `TAMANO` int(11) NOT NULL DEFAULT '0',
  `FECHA_SUBIDA` varchar(50) DEFAULT NULL,
  `EXTENSION` varchar(250) DEFAULT NULL,
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.doc_documentos_usuario: ~3 rows (aproximadamente)
DELETE FROM `doc_documentos_usuario`;
/*!40000 ALTER TABLE `doc_documentos_usuario` DISABLE KEYS */;
INSERT INTO `doc_documentos_usuario` (`ID`, `USU_ID`, `INST_ID`, `NOMBRE_ARCHIVO`, `URL`, `TAMANO`, `FECHA_SUBIDA`, `EXTENSION`, `ELIMINADO`) VALUES
	(1, 6, 4, 'spppigx0.ery 1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', '~/Repositorio/spppigx0.ery 1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', 578, '14-04-2016 18:50', '~/img/pdf.png', 1),
	(2, 6, 4, '0tifeglf.mkw 1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', '~/Repositorio/0tifeglf.mkw 1zglrxu3.40p BOLETIN-INFORMATIVO-MARZO2016.pdf', 0, '14-04-2016 18:55', '~/img/pdf.png', 0),
	(3, 1, 3, 'x2sblepa.535 ajax-loader.gif', '~/Repositorio/x2sblepa.535 ajax-loader.gif', 7, '23-04-2016 22:41', '~/img/gif.png', 0);
/*!40000 ALTER TABLE `doc_documentos_usuario` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.eg_elementos_grupo
CREATE TABLE IF NOT EXISTS `eg_elementos_grupo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_GRUPO` int(11) NOT NULL DEFAULT '0',
  `HREF_ITEM` varchar(250) DEFAULT '0',
  `CLASS_ITEM` varchar(250) DEFAULT '0',
  `NOMBRE` varchar(250) DEFAULT '0',
  `ROLES_ID` varchar(500) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.eg_elementos_grupo: ~25 rows (aproximadamente)
DELETE FROM `eg_elementos_grupo`;
/*!40000 ALTER TABLE `eg_elementos_grupo` DISABLE KEYS */;
INSERT INTO `eg_elementos_grupo` (`ID`, `ID_GRUPO`, `HREF_ITEM`, `CLASS_ITEM`, `NOMBRE`, `ROLES_ID`) VALUES
	(1, 1, '#', '', 'Gestión Contable', '1'),
	(2, 1, '#', '', 'Ajuste de Precios', '1'),
	(3, 1, '#', '', 'Auditoria de Uso', '1'),
	(4, 1, '#', '', 'Precio y Condiciones Servicio', '1'),
	(5, 1, '#', '', 'Suscripción Gratuita', '1'),
	(6, 1, '#', '', 'Suscripción Pagada', '1'),
	(7, 2, 'Usuario/VistaDocumentos.aspx', '', 'Descarga Asambleas', '1,2,3,4,5,6,7,8'),
	(8, 2, 'Usuario/VistaRendiciones.aspx', '', 'Visualización de Rendiciones', '1,2,3,4,5,6,7,8'),
	(9, 2, '#', '', 'Directiva CPAS', '1,2,3,4,5,6,7,8,9'),
	(10, 2, 'Usuario/VistaCalendario.aspx', '', 'Calendario', '1,2,3,4,5,6,7,8'),
	(11, 6, 'Administracion/Usuarios.aspx', '', 'Usuarios CPAS', '1,2,3,4,5,6,7'),
	(12, 6, 'Administracion/cargaMasiva.aspx', '', 'Carga Masiva Padres/Apoderados', '1,2,3,4,5,6,7'),
	(13, 6, 'Administracion/documentos.aspx', '', 'Actas de Asamblea', '1,2,3,4,5,6,7'),
	(14, 6, 'Administracion/IngresoEgreso.aspx', '', 'Rendiciones', '1,2,3,4,5,6,7'),
	(15, 7, 'Proyectos/Listado.aspx', '', 'Proyectos', '1,2,3,4,5,6,7,10'),
	(16, 7, 'Tricel/ListadoTricel.aspx', '', 'Gestión TRICEL', '1,2,3,4,5,6,7'),
	(17, 8, 'Usuario/VistaCalendario.aspx', '', 'Eventos y Actividades', '1,2,3,4,5,6,7,10'),
	(18, 9, '#', '', 'Generación de Mailing Proximamente!', '1,2,3,4,5,6,7'),
	(19, 10, 'Contacto.aspx', '', 'Formulario de Ingreso', '2,3,4,5,6,7,8,9,10'),
	(20, 11, 'RecuperarClave/Recuperar.aspx', '', 'Cambiar mi clave', '1,2,3,4,5,6,7,8,9,10'),
	(21, 6, 'Administracion/EditorEncabezado.aspx', '', 'Configuración Institución', '1,2,3,4,5,6,7'),
	(22, 7, 'Tricel/Listado.aspx', '', 'Listas TRICEL', '1,2,3,4,5,6,7,8,9'),
	(23, 2, 'Usuario/VistaDocumentosUsuario.aspx', '', 'Descarga Documentos', '1,2,3,4,5,6,7,8'),
	(24, 6, 'Administracion/documentosUsuario.aspx', '', 'Documentos de Usuario', '1,2,3,4,5,6,7,10'),
	(25, 6, 'Administracion/Monitoreo.aspx', '', 'Monitoreo', '1');
/*!40000 ALTER TABLE `eg_elementos_grupo` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.enc_encabezado
CREATE TABLE IF NOT EXISTS `enc_encabezado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USA_IMAGEN_SUPERIOR` int(11) NOT NULL DEFAULT '0',
  `URL_IMAGEN_SUPERIOR` varchar(500) NOT NULL DEFAULT '0',
  `TITULO_ENCABEZADO` varchar(1000) NOT NULL DEFAULT '0',
  `SUBTITULO_ENCABEZADO` varchar(1000) NOT NULL DEFAULT '0',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.enc_encabezado: ~3 rows (aproximadamente)
DELETE FROM `enc_encabezado`;
/*!40000 ALTER TABLE `enc_encabezado` DISABLE KEYS */;
INSERT INTO `enc_encabezado` (`ID`, `USA_IMAGEN_SUPERIOR`, `URL_IMAGEN_SUPERIOR`, `TITULO_ENCABEZADO`, `SUBTITULO_ENCABEZADO`, `ELIMINADO`, `INST_ID`) VALUES
	(1, 1, '~/img/encabezadoCPAS_1.png', 'CPAS', 'Centro de Padres y Apoderados', 0, 3),
	(2, 1, '~/img/encabezadoCPAS_2.png', 'Colegio Santa Elena ', 'CGPA', 0, 4),
	(3, 1, '~/img/encabezadoCPAS_2.png', 'Colegio Santa Elena ', 'CGPA', 0, 5);
/*!40000 ALTER TABLE `enc_encabezado` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.gi_grupo_item
CREATE TABLE IF NOT EXISTS `gi_grupo_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ES_GRUPO` int(11) NOT NULL DEFAULT '0',
  `HREF_GRUPO` varchar(250) DEFAULT '0',
  `CLASS_GRUPO` varchar(250) DEFAULT '0',
  `NOMBRE_GRUPO` varchar(250) DEFAULT '0',
  `ROLES_ID` varchar(500) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.gi_grupo_item: ~12 rows (aproximadamente)
DELETE FROM `gi_grupo_item`;
/*!40000 ALTER TABLE `gi_grupo_item` DISABLE KEYS */;
INSERT INTO `gi_grupo_item` (`ID`, `ES_GRUPO`, `HREF_GRUPO`, `CLASS_GRUPO`, `NOMBRE_GRUPO`, `ROLES_ID`) VALUES
	(1, 1, '#', '', 'Adm. General', '1'),
	(2, 1, '#', '', 'Usuario', '1,2,3,4,5,6,7,8'),
	(6, 1, '#', '', 'Adm. CPAS', '1,2,3,4,5,6,7,10'),
	(7, 1, '#', '', 'Democrática CPAS', '1,2,3,4,5,6,7,9,10'),
	(8, 1, '#', '', 'Calendario', '1,2,3,4,5,6,7,10'),
	(9, 1, '#', '', 'Comunicaciones', '1,2,3,4,5,6,7'),
	(10, 1, '#', '', 'Contacto', '2,3,4,5,6,7,8,9,10'),
	(11, 1, '#', '', 'Ayuda', '1,2,3,4,5,6,7,8,9,10'),
	(12, 0, 'Usuario/VistaDocumentos.aspx', '', 'Documentos', '9,10'),
	(13, 0, 'Usuario/VistaRendiciones.aspx', '', 'Rendiciones', '9,10'),
	(14, 0, 'Usuario/VistaCalendario.aspx', '', 'Calendario', '9,10'),
	(15, 0, 'Reportes/SeleccionReporte.aspx', '', 'Reportes', '1,2,3,4,5,6,7,8,9');
/*!40000 ALTER TABLE `gi_grupo_item` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.ieg_ingreso_egreso
CREATE TABLE IF NOT EXISTS `ieg_ingreso_egreso` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `USU_ID` int(11) NOT NULL DEFAULT '0',
  `FECHA_MOVIMIENTO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TIPO_MOVIMIENTO` int(11) NOT NULL DEFAULT '0',
  `NUMERO_COMPROBANTE` varchar(100) NOT NULL DEFAULT '0',
  `DETALLE` varchar(500) NOT NULL DEFAULT '0',
  `MONTO` int(11) NOT NULL DEFAULT '0',
  `URL_DOCUMENTO` varchar(250) NOT NULL DEFAULT '0',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.ieg_ingreso_egreso: ~11 rows (aproximadamente)
DELETE FROM `ieg_ingreso_egreso`;
/*!40000 ALTER TABLE `ieg_ingreso_egreso` DISABLE KEYS */;
INSERT INTO `ieg_ingreso_egreso` (`ID`, `INST_ID`, `USU_ID`, `FECHA_MOVIMIENTO`, `TIPO_MOVIMIENTO`, `NUMERO_COMPROBANTE`, `DETALLE`, `MONTO`, `URL_DOCUMENTO`, `ELIMINADO`) VALUES
	(1, 3, 1, '2015-12-11 00:00:00', 2, '12534', 'compra de prueba', 55000, '~/Boletas/ke0gl4cs.gtk boleta.png', 1),
	(2, 3, 1, '2015-12-11 00:00:00', 1, 'No hay', 'Prueba 2', 33000, '~/Boletas/5zmgu0mg.ajv Screenshot 2015-10-26-10-29-12.png', 1),
	(3, 3, 1, '2015-12-11 00:00:00', 1, 'No hay', 'Reposición se dinero', 345000, '', 0),
	(4, 3, 1, '2015-12-11 00:00:00', 2, '1234', 'Compra de tortas', 49000, '', 0),
	(5, 4, 6, '2015-12-11 00:00:00', 1, '001', 'Ingreso por pago de CGPA colegio', 5000000, '', 0),
	(6, 4, 6, '2015-12-10 23:00:00', 2, '002', 'Boleta de reparación CASINO', 150000, '~/Boletas/lsxj152c.dfk Boleta Compra sopapo.jpg', 0),
	(7, 4, 6, '2015-12-11 00:00:00', 2, '002', 'Instalación de gradería ', 40000000, '', 0),
	(8, 3, 1, '2016-03-12 20:27:20', 1, '5487999', 'pago de mensualidad coronado', 650000, '', 0),
	(9, 4, 6, '2016-04-16 19:40:34', 2, '00134', 'Honorarios por auditoria contable', 1500000, '', 0),
	(10, 4, 7, '2016-05-16 14:08:11', 2, '37321', 'Comida para la directiva', 12600, '~/Boletas/qyw1ogcy.rzb 1463432839391-1884845293.jpg', 0),
	(11, 3, 1, '2016-08-10 08:55:07', 1, '154879', 'Compra de materiales', 125876, '~/Boletas/wia1du44.tsr entrar.jpg', 0);
/*!40000 ALTER TABLE `ieg_ingreso_egreso` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.inst_institucion
CREATE TABLE IF NOT EXISTS `inst_institucion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(500) NOT NULL DEFAULT '0',
  `REG_ID` int(11) NOT NULL,
  `COM_ID` int(11) NOT NULL,
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.inst_institucion: ~3 rows (aproximadamente)
DELETE FROM `inst_institucion`;
/*!40000 ALTER TABLE `inst_institucion` DISABLE KEYS */;
INSERT INTO `inst_institucion` (`ID`, `NOMBRE`, `REG_ID`, `COM_ID`, `ELIMINADO`) VALUES
	(3, 'CPAS', 15, 295, 0),
	(4, 'Colegio de Prueba', 15, 295, 0),
	(5, 'Colegio Santa Elena', 15, 295, 0);
/*!40000 ALTER TABLE `inst_institucion` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.lgu_login_usuario
CREATE TABLE IF NOT EXISTS `lgu_login_usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USU_ID` int(11) NOT NULL DEFAULT '0',
  `FECHA_MOVIMIENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TIPO_MOVIMIENTO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.lgu_login_usuario: ~307 rows (aproximadamente)
DELETE FROM `lgu_login_usuario`;
/*!40000 ALTER TABLE `lgu_login_usuario` DISABLE KEYS */;
INSERT INTO `lgu_login_usuario` (`ID`, `USU_ID`, `FECHA_MOVIMIENTO`, `TIPO_MOVIMIENTO`) VALUES
	(1, 1, '2016-02-18 10:32:41', 'Ingresar'),
	(2, 1, '2016-02-18 10:33:08', 'Salir'),
	(3, 6, '2016-02-18 10:33:18', 'Ingresar'),
	(4, 6, '2016-02-18 10:33:53', 'Salir'),
	(5, 1, '2016-02-18 11:32:45', 'Ingresar'),
	(6, 1, '2016-02-18 13:22:55', 'Ingresar'),
	(7, 1, '2016-02-18 13:23:52', 'Salir'),
	(8, 1, '2016-02-19 06:14:02', 'Ingresar'),
	(9, 1, '2016-02-19 06:15:16', 'Salir'),
	(10, 1, '2016-02-19 12:48:06', 'Ingresar'),
	(11, 7, '2016-02-19 07:56:56', 'Ingresar'),
	(12, 7, '2016-02-19 07:58:00', 'Salir'),
	(13, 1, '2016-02-25 03:49:23', 'Ingresar'),
	(14, 1, '2016-02-25 03:49:49', 'Salir'),
	(15, 6, '2016-02-25 03:49:59', 'Ingresar'),
	(16, 6, '2016-02-25 03:51:38', 'Salir'),
	(17, 6, '2016-03-03 07:29:50', 'Ingresar'),
	(18, 9, '2016-03-03 07:55:15', 'Ingresar'),
	(19, 9, '2016-03-03 07:56:28', 'Salir'),
	(20, 1, '2016-03-08 07:31:42', 'Ingresar'),
	(21, 1, '2016-03-08 07:38:20', 'Salir'),
	(22, 1, '2016-03-08 07:38:45', 'Ingresar'),
	(23, 1, '2016-03-08 07:39:55', 'Salir'),
	(24, 1, '2016-03-08 07:52:09', 'Ingresar'),
	(25, 1, '2016-03-08 09:03:45', 'Ingresar'),
	(26, 1, '2016-03-08 09:27:39', 'Ingresar'),
	(27, 1, '2016-03-08 09:49:01', 'Ingresar'),
	(28, 1, '2016-03-08 09:54:06', 'Salir'),
	(29, 1, '2016-03-08 10:17:17', 'Ingresar'),
	(30, 1, '2016-03-08 10:59:22', 'Ingresar'),
	(31, 1, '2016-03-08 11:03:19', 'Ingresar'),
	(32, 1, '2016-03-08 11:53:54', 'Ingresar'),
	(33, 1, '2016-03-08 12:27:36', 'Ingresar'),
	(34, 1, '2016-03-08 13:03:16', 'Ingresar'),
	(35, 1, '2016-03-08 13:13:51', 'Ingresar'),
	(36, 1, '2016-03-09 07:12:36', 'Ingresar'),
	(37, 1, '2016-03-09 07:52:36', 'Ingresar'),
	(38, 1, '2016-03-09 07:55:48', 'Salir'),
	(39, 1, '2016-03-09 09:26:42', 'Ingresar'),
	(40, 1, '2016-03-09 10:45:58', 'Ingresar Android'),
	(41, 1, '2016-03-09 11:25:54', 'Ingresar Android'),
	(42, 1, '2016-03-09 16:12:23', 'Ingresar Android'),
	(43, 1, '2016-03-10 09:24:48', 'Ingresar Android'),
	(44, 1, '2016-03-10 09:25:32', 'Ingresar Android'),
	(45, 1, '2016-03-10 09:25:35', 'Ingresar Android'),
	(46, 1, '2016-03-10 09:29:01', 'Ingresar Android'),
	(47, 1, '2016-03-10 09:29:22', 'Ingresar Android'),
	(48, 1, '2016-03-10 11:11:18', 'Ingresar Android'),
	(49, 1, '2016-03-10 12:34:33', 'Ingresar Android'),
	(50, 1, '2016-03-10 17:54:27', 'Ingresar Android'),
	(51, 1, '2016-03-10 18:26:53', 'Ingresar Android'),
	(52, 1, '2016-03-10 18:27:16', 'Ingresar Android'),
	(53, 1, '2016-03-10 18:27:19', 'Ingresar Android'),
	(54, 1, '2016-03-11 08:04:43', 'Ingresar Android'),
	(55, 1, '2016-03-11 08:08:37', 'Ingresar Android'),
	(56, 1, '2016-03-11 08:09:18', 'Ingresar Android'),
	(57, 1, '2016-03-11 08:09:24', 'Ingresar Android'),
	(58, 1, '2016-03-11 08:49:47', 'Ingresar Android'),
	(59, 6, '2016-03-11 09:10:05', 'Ingresar Android'),
	(60, 1, '2016-03-12 13:32:55', 'Ingresar Android'),
	(61, 1, '2016-03-12 15:19:05', 'Ingresar'),
	(62, 1, '2016-03-12 15:59:02', 'Ingresar'),
	(63, 1, '2016-03-12 17:07:53', 'Ingresar Android'),
	(64, 1, '2016-03-12 17:47:53', 'Ingresar Android'),
	(65, 1, '2016-03-12 18:35:31', 'Ingresar Android'),
	(66, 1, '2016-03-12 18:50:24', 'Ingresar Android'),
	(67, 1, '2016-03-12 18:54:44', 'Ingresar Android'),
	(68, 1, '2016-03-12 18:56:38', 'Ingresar Android'),
	(69, 8, '2016-03-14 07:36:19', 'Ingresar'),
	(70, 1, '2016-03-14 08:57:59', 'Ingresar Android'),
	(71, 1, '2016-03-15 11:20:03', 'Ingresar'),
	(72, 1, '2016-03-15 11:26:05', 'Salir'),
	(73, 6, '2016-03-15 18:53:15', 'Ingresar'),
	(74, 6, '2016-03-15 18:56:47', 'Salir'),
	(75, 1, '2016-03-22 04:52:43', 'Ingresar'),
	(76, 1, '2016-03-22 04:55:48', 'Ingresar'),
	(77, 1, '2016-03-22 04:56:46', 'Salir'),
	(78, 1, '2016-03-22 04:59:20', 'Ingresar'),
	(79, 1, '2016-03-22 04:59:38', 'Salir'),
	(80, 1, '2016-03-22 05:00:09', 'Ingresar'),
	(81, 1, '2016-03-22 05:03:29', 'Ingresar'),
	(82, 1, '2016-03-22 05:04:18', 'Salir'),
	(83, 1, '2016-03-22 05:06:33', 'Ingresar'),
	(84, 1, '2016-03-22 05:10:25', 'Salir'),
	(85, 1, '2016-03-23 07:00:20', 'Ingresar Android'),
	(86, 1, '2016-03-23 10:28:36', 'Ingresar'),
	(87, 6, '2016-04-02 13:48:29', 'Ingresar'),
	(88, 6, '2016-04-02 13:50:39', 'Salir'),
	(89, 6, '2016-04-02 13:51:13', 'Ingresar'),
	(90, 6, '2016-04-02 13:51:36', 'Ingresar'),
	(91, 6, '2016-04-02 18:07:04', 'Ingresar'),
	(92, 6, '2016-04-02 18:25:05', 'Salir'),
	(93, 6, '2016-04-02 18:25:12', 'Ingresar'),
	(94, 1, '2016-04-02 18:37:42', 'Ingresar'),
	(95, 6, '2016-04-02 18:51:50', 'Salir'),
	(96, 6, '2016-04-02 18:53:52', 'Ingresar'),
	(97, 6, '2016-04-02 19:07:37', 'Salir'),
	(98, 6, '2016-04-02 19:07:44', 'Ingresar'),
	(99, 6, '2016-04-04 12:40:10', 'Ingresar'),
	(100, 6, '2016-04-04 12:56:25', 'Salir'),
	(101, 1, '2016-04-07 05:52:41', 'Ingresar'),
	(102, 1, '2016-04-07 05:54:02', 'Salir'),
	(103, 6, '2016-04-07 05:54:28', 'Ingresar'),
	(104, 6, '2016-04-07 06:05:19', 'Salir'),
	(105, 6, '2016-04-07 06:23:09', 'Ingresar'),
	(106, 6, '2016-04-07 06:27:02', 'Salir'),
	(107, 9, '2016-04-07 06:27:11', 'Ingresar'),
	(108, 9, '2016-04-07 07:21:40', 'Ingresar'),
	(109, 6, '2016-04-12 05:25:52', 'Ingresar'),
	(110, 6, '2016-04-12 05:30:24', 'Salir'),
	(111, 8, '2016-04-14 17:56:51', 'Ingresar'),
	(112, 1, '2016-04-14 18:33:08', 'Ingresar'),
	(113, 8, '2016-04-14 18:46:54', 'Ingresar'),
	(114, 8, '2016-04-14 18:48:19', 'Salir'),
	(115, 6, '2016-04-14 18:49:29', 'Ingresar'),
	(116, 6, '2016-04-14 19:06:36', 'Salir'),
	(117, 10, '2016-04-14 19:07:11', 'Ingresar'),
	(118, 10, '2016-04-14 19:09:55', 'Salir'),
	(119, 6, '2016-04-14 19:10:07', 'Ingresar'),
	(120, 6, '2016-04-14 19:19:19', 'Salir'),
	(121, 10, '2016-04-14 19:19:31', 'Ingresar'),
	(122, 10, '2016-04-14 19:20:57', 'Salir'),
	(123, 11, '2016-04-14 19:21:10', 'Ingresar'),
	(124, 11, '2016-04-14 19:21:54', 'Salir'),
	(125, 8, '2016-04-14 19:22:06', 'Ingresar'),
	(126, 8, '2016-04-14 19:22:44', 'Salir'),
	(127, 11, '2016-04-14 19:23:00', 'Ingresar'),
	(128, 11, '2016-04-14 19:23:34', 'Salir'),
	(129, 10, '2016-04-14 19:23:43', 'Ingresar'),
	(130, 10, '2016-04-14 19:24:04', 'Salir'),
	(131, 9, '2016-04-14 19:24:22', 'Ingresar'),
	(132, 9, '2016-04-14 19:26:03', 'Salir'),
	(133, 7, '2016-04-14 19:26:18', 'Ingresar'),
	(134, 7, '2016-04-14 19:27:21', 'Salir'),
	(135, 6, '2016-04-14 19:27:31', 'Ingresar'),
	(136, 6, '2016-04-14 19:29:12', 'Salir'),
	(137, 6, '2016-04-14 19:41:02', 'Ingresar'),
	(138, 7, '2016-04-15 08:05:29', 'Ingresar'),
	(139, 6, '2016-04-15 08:13:11', 'Ingresar'),
	(140, 7, '2016-04-15 08:21:32', 'Salir'),
	(141, 8, '2016-04-15 08:21:46', 'Ingresar'),
	(142, 8, '2016-04-15 08:22:10', 'Salir'),
	(143, 9, '2016-04-15 08:22:25', 'Ingresar'),
	(144, 9, '2016-04-15 08:22:44', 'Salir'),
	(145, 10, '2016-04-15 08:22:55', 'Ingresar'),
	(146, 9, '2016-04-15 08:29:22', 'Ingresar'),
	(147, 9, '2016-04-15 08:29:39', 'Salir'),
	(148, 8, '2016-04-15 08:29:54', 'Ingresar'),
	(149, 8, '2016-04-15 08:30:53', 'Salir'),
	(150, 10, '2016-04-15 08:31:04', 'Ingresar'),
	(151, 10, '2016-04-15 09:50:44', 'Ingresar'),
	(152, 6, '2016-04-15 10:27:47', 'Ingresar'),
	(153, 6, '2016-04-15 10:44:16', 'Ingresar'),
	(154, 6, '2016-04-15 10:45:57', 'Salir'),
	(155, 7, '2016-04-15 12:57:23', 'Ingresar'),
	(156, 7, '2016-04-15 13:10:23', 'Salir'),
	(157, 8, '2016-04-15 13:10:33', 'Ingresar'),
	(158, 8, '2016-04-15 13:11:58', 'Salir'),
	(159, 9, '2016-04-15 13:12:12', 'Ingresar'),
	(160, 10, '2016-04-15 13:13:48', 'Ingresar'),
	(161, 10, '2016-04-15 13:16:34', 'Salir'),
	(162, 7, '2016-04-15 13:16:51', 'Ingresar'),
	(163, 6, '2016-04-15 13:23:31', 'Ingresar'),
	(164, 6, '2016-04-15 13:25:42', 'Salir'),
	(165, 7, '2016-04-15 13:33:38', 'Salir'),
	(166, 6, '2016-04-15 13:33:48', 'Ingresar'),
	(167, 7, '2016-04-15 13:34:57', 'Ingresar'),
	(168, 6, '2016-04-15 13:35:52', 'Salir'),
	(169, 7, '2016-04-15 13:36:13', 'Salir'),
	(170, 9, '2016-04-15 13:47:34', 'Ingresar'),
	(171, 7, '2016-04-15 14:50:08', 'Ingresar'),
	(172, 7, '2016-04-15 14:58:02', 'Salir'),
	(173, 7, '2016-04-15 14:58:59', 'Ingresar'),
	(174, 7, '2016-04-15 15:00:00', 'Ingresar'),
	(175, 7, '2016-04-15 15:05:19', 'Ingresar'),
	(176, 6, '2016-04-16 09:57:35', 'Ingresar'),
	(177, 6, '2016-04-16 10:05:54', 'Salir'),
	(178, 4, '2016-04-16 10:06:53', 'Ingresar'),
	(179, 6, '2016-04-16 10:35:58', 'Ingresar'),
	(180, 6, '2016-04-16 18:51:35', 'Ingresar'),
	(181, 6, '2016-04-16 19:16:45', 'Ingresar'),
	(182, 6, '2016-04-16 19:41:34', 'Salir'),
	(183, 7, '2016-04-16 19:41:47', 'Ingresar'),
	(184, 1, '2016-04-18 11:36:44', 'Ingresar'),
	(185, 6, '2016-04-18 08:58:32', 'Ingresar'),
	(186, 1, '2016-04-18 09:54:50', 'Ingresar'),
	(187, 1, '2016-04-18 09:56:37', 'Salir'),
	(188, 1, '2016-04-18 10:10:58', 'Ingresar'),
	(189, 1, '2016-04-18 10:26:27', 'Salir'),
	(190, 18, '2016-04-18 10:59:15', 'Ingresar'),
	(191, 18, '2016-04-18 12:03:27', 'Ingresar'),
	(192, 18, '2016-04-18 12:04:47', 'Salir'),
	(193, 18, '2016-04-18 12:17:18', 'Ingresar'),
	(194, 18, '2016-04-18 12:22:32', 'Ingresar'),
	(195, 18, '2016-04-18 12:38:18', 'Ingresar'),
	(196, 18, '2016-04-18 12:38:58', 'Salir'),
	(197, 18, '2016-04-18 14:45:07', 'Ingresar'),
	(198, 18, '2016-04-18 14:54:44', 'Ingresar'),
	(199, 18, '2016-04-18 15:44:46', 'Ingresar'),
	(200, 18, '2016-04-18 15:49:59', 'Ingresar'),
	(201, 1, '2016-04-22 08:02:19', 'Ingresar Android'),
	(202, 1, '2016-04-22 08:22:25', 'Ingresar Android'),
	(203, 1, '2016-04-22 17:44:37', 'Ingresar Android'),
	(204, 1, '2016-04-23 20:19:12', 'Ingresar Android'),
	(205, 1, '2016-04-23 20:54:16', 'Ingresar'),
	(206, 1, '2016-04-23 21:01:35', 'Ingresar Android'),
	(207, 1, '2016-04-23 21:08:17', 'Salir'),
	(208, 1, '2016-04-23 21:16:34', 'Ingresar Android'),
	(209, 1, '2016-04-23 22:29:59', 'Ingresar Android'),
	(210, 1, '2016-04-23 22:31:27', 'Ingresar'),
	(211, 1, '2016-04-23 22:38:48', 'Ingresar Android'),
	(212, 1, '2016-04-23 22:42:29', 'Ingresar Android'),
	(213, 1, '2016-04-23 22:44:20', 'Ingresar Android'),
	(214, 1, '2016-04-23 22:46:25', 'Salir'),
	(215, 7, '2016-04-23 22:47:06', 'Ingresar Android'),
	(216, 1, '2016-04-23 23:19:03', 'Ingresar Android'),
	(217, 1, '2016-04-23 23:19:12', 'Ingresar Android'),
	(218, 1, '2016-04-25 13:55:06', 'Ingresar Android'),
	(219, 1, '2016-04-25 13:57:45', 'Ingresar Android'),
	(220, 1, '2016-04-25 13:57:59', 'Ingresar Android'),
	(221, 1, '2016-04-25 14:01:34', 'Ingresar'),
	(222, 8, '2016-05-05 19:14:41', 'Ingresar'),
	(223, 7, '2016-05-05 19:20:39', 'Ingresar'),
	(224, 7, '2016-05-05 19:29:15', 'Ingresar'),
	(225, 7, '2016-05-05 19:35:00', 'Salir'),
	(226, 20, '2016-05-05 19:36:38', 'Ingresar'),
	(227, 20, '2016-05-05 19:37:49', 'Salir'),
	(228, 18, '2016-05-05 19:39:14', 'Ingresar'),
	(229, 18, '2016-05-05 19:48:45', 'Salir'),
	(230, 7, '2016-05-05 19:49:36', 'Ingresar'),
	(231, 7, '2016-05-05 19:52:49', 'Ingresar'),
	(232, 7, '2016-05-05 20:02:40', 'Salir'),
	(233, 21, '2016-05-05 20:03:04', 'Ingresar'),
	(234, 21, '2016-05-05 20:03:38', 'Salir'),
	(235, 18, '2016-05-06 07:19:17', 'Ingresar'),
	(236, 18, '2016-05-06 07:39:03', 'Salir'),
	(237, 22, '2016-05-06 07:39:10', 'Ingresar'),
	(238, 1, '2016-05-06 07:41:01', 'Ingresar'),
	(239, 22, '2016-05-06 07:41:04', 'Salir'),
	(240, 18, '2016-05-06 07:41:12', 'Ingresar'),
	(241, 18, '2016-05-06 07:45:32', 'Salir'),
	(242, 23, '2016-05-06 07:45:40', 'Ingresar'),
	(243, 23, '2016-05-06 07:45:50', 'Salir'),
	(244, 18, '2016-05-06 07:46:01', 'Ingresar'),
	(245, 18, '2016-05-06 07:51:37', 'Salir'),
	(246, 24, '2016-05-06 07:51:54', 'Ingresar'),
	(247, 24, '2016-05-06 07:52:21', 'Salir'),
	(248, 1, '2016-05-06 07:55:04', 'Salir'),
	(249, 1, '2016-05-06 07:55:21', 'Ingresar'),
	(250, 1, '2016-05-06 07:59:08', 'Ingresar'),
	(251, 18, '2016-05-06 08:06:20', 'Ingresar'),
	(252, 1, '2016-05-06 08:09:40', 'Salir'),
	(253, 18, '2016-05-06 08:20:47', 'Salir'),
	(254, 8, '2016-05-06 08:29:10', 'Ingresar'),
	(255, 1, '2016-05-06 14:59:50', 'Ingresar'),
	(256, 1, '2016-05-06 15:00:42', 'Salir'),
	(257, 18, '2016-05-07 16:53:27', 'Ingresar'),
	(258, 7, '2016-05-07 16:55:25', 'Ingresar'),
	(259, 18, '2016-05-08 14:32:42', 'Ingresar'),
	(260, 1, '2016-05-10 07:51:35', 'Ingresar'),
	(261, 1, '2016-05-10 07:54:00', 'Salir'),
	(262, 18, '2016-05-12 09:33:01', 'Ingresar'),
	(263, 18, '2016-05-12 10:20:02', 'Ingresar'),
	(264, 18, '2016-05-15 10:47:59', 'Ingresar'),
	(265, 18, '2016-05-15 10:49:55', 'Salir'),
	(266, 1, '2016-05-15 17:37:17', 'Ingresar'),
	(267, 1, '2016-05-15 17:38:00', 'Salir'),
	(268, 22, '2016-05-15 20:24:18', 'Ingresar'),
	(269, 7, '2016-05-16 08:52:55', 'Ingresar'),
	(270, 1, '2016-05-16 13:58:53', 'Ingresar'),
	(271, 1, '2016-05-16 14:01:27', 'Salir'),
	(272, 7, '2016-05-16 14:05:40', 'Ingresar'),
	(273, 1, '2016-05-16 14:13:17', 'Ingresar'),
	(274, 1, '2016-05-16 14:15:17', 'Salir'),
	(275, 18, '2016-05-18 12:18:53', 'Ingresar'),
	(276, 18, '2016-05-18 12:28:19', 'Salir'),
	(277, 9, '2016-05-18 12:28:38', 'Ingresar'),
	(278, 9, '2016-05-18 12:28:54', 'Ingresar'),
	(279, 9, '2016-05-18 12:29:57', 'Salir'),
	(280, 22, '2016-05-21 15:13:59', 'Ingresar'),
	(281, 1, '2016-05-24 21:54:37', 'Ingresar'),
	(282, 18, '2016-06-05 07:39:39', 'Ingresar'),
	(283, 6, '2016-06-08 17:41:52', 'Ingresar'),
	(284, 6, '2016-06-08 17:43:34', 'Salir'),
	(285, 1, '2016-06-08 17:44:06', 'Ingresar'),
	(286, 1, '2016-06-08 17:47:58', 'Salir'),
	(287, 1, '2016-06-29 19:41:26', 'Ingresar'),
	(288, 18, '2016-06-30 05:43:27', 'Ingresar'),
	(289, 18, '2016-07-04 15:08:59', 'Ingresar'),
	(290, 18, '2016-07-05 10:44:15', 'Ingresar'),
	(291, 18, '2016-08-01 14:58:20', 'Ingresar'),
	(292, 18, '2016-08-09 10:57:29', 'Ingresar'),
	(293, 1, '2016-08-10 08:43:15', 'Ingresar'),
	(294, 1, '2016-08-10 08:45:50', 'Salir'),
	(295, 1, '2016-08-10 08:46:00', 'Ingresar'),
	(296, 1, '2016-08-10 08:58:01', 'Salir'),
	(297, 1, '2016-08-10 18:09:41', 'Ingresar'),
	(298, 1, '2016-08-10 18:12:49', 'Salir'),
	(299, 22, '2016-08-17 16:00:44', 'Ingresar'),
	(300, 1, '2016-08-25 17:29:21', 'Ingresar'),
	(301, 1, '2016-08-25 17:33:53', 'Salir'),
	(302, 1, '2016-09-28 12:35:15', 'Ingresar'),
	(303, 18, '2016-10-31 10:26:52', 'Ingresar'),
	(304, 18, '2016-10-31 10:28:37', 'Salir'),
	(305, 7, '2016-11-04 12:09:26', 'Ingresar'),
	(306, 9, '2016-11-04 12:53:23', 'Ingresar'),
	(307, 7, '2016-11-08 08:41:14', 'Ingresar');
/*!40000 ALTER TABLE `lgu_login_usuario` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.ltr_lista_tricel
CREATE TABLE IF NOT EXISTS `ltr_lista_tricel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRI_ID` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `USU_ID` int(11) NOT NULL DEFAULT '0',
  `ROL` varchar(500) NOT NULL,
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  `NOMBRE` varchar(500) DEFAULT NULL,
  `OBJETIVO` varchar(500) DEFAULT NULL,
  `DESCRIPCION` varchar(500) DEFAULT NULL,
  `BENEFICIOS` varchar(500) DEFAULT NULL,
  `FECHA_INICIO` datetime DEFAULT CURRENT_TIMESTAMP,
  `FECHA_TERMINO` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.ltr_lista_tricel: ~6 rows (aproximadamente)
DELETE FROM `ltr_lista_tricel`;
/*!40000 ALTER TABLE `ltr_lista_tricel` DISABLE KEYS */;
INSERT INTO `ltr_lista_tricel` (`ID`, `TRI_ID`, `INST_ID`, `USU_ID`, `ROL`, `ELIMINADO`, `NOMBRE`, `OBJETIVO`, `DESCRIPCION`, `BENEFICIOS`, `FECHA_INICIO`, `FECHA_TERMINO`) VALUES
	(1, 1, 4, 6, 'Administrador', 0, 'Lista 1', 'objetivo Lista 1', 'Descripcion Lista 1', 'Beneficios Lista 1', '2016-02-17 00:00:00', '2016-02-26 00:00:00'),
	(2, 1, 4, 7, 'Administrador', 0, 'Lista 2', 'Objetivo lista 2', 'Descripcion lista 2', 'beneficios lista 2', '2016-02-17 00:00:00', '2016-02-28 00:00:00'),
	(3, 2, 3, 1, 'Administrador', 0, 'lista de prueba ', 'Objetivo de prueba', 'Descripción de pruebs', 'Beneficia', '2016-03-06 00:00:00', '2016-03-29 00:00:00'),
	(4, 3, 3, 1, 'Administrador', 0, 'lista coro', 'Obj', 'Desc', 'Bene', '2016-03-09 00:00:00', '2016-03-28 00:00:00'),
	(5, 4, 3, 1, 'Administrador', 0, 'victor', 'Obj', 'Desc', 'Bene', '2016-03-08 00:00:00', '2016-03-28 00:00:00'),
	(6, 5, 3, 1, 'Administrador', 0, 'lista favorita', 'Obj', 'Descripción', 'Beneficia', '2016-03-11 00:00:00', '2016-03-28 00:00:00');
/*!40000 ALTER TABLE `ltr_lista_tricel` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.per_persona
CREATE TABLE IF NOT EXISTS `per_persona` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RUT` varchar(50) NOT NULL,
  `NOMBRES` varchar(250) DEFAULT NULL,
  `APELLIDO_PATERNO` varchar(250) DEFAULT NULL,
  `APELLIDO_MATERNO` varchar(250) DEFAULT NULL,
  `PAIS_ID` int(11) NOT NULL,
  `REG_ID` int(11) NOT NULL,
  `COM_ID` int(11) NOT NULL,
  `DIRECCION_COMPLETA` varchar(500) DEFAULT NULL,
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `USU_ID` int(11) NOT NULL,
  `TELEFONOS` varchar(250) DEFAULT NULL,
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.per_persona: ~23 rows (aproximadamente)
DELETE FROM `per_persona`;
/*!40000 ALTER TABLE `per_persona` DISABLE KEYS */;
INSERT INTO `per_persona` (`ID`, `RUT`, `NOMBRES`, `APELLIDO_PATERNO`, `APELLIDO_MATERNO`, `PAIS_ID`, `REG_ID`, `COM_ID`, `DIRECCION_COMPLETA`, `INST_ID`, `USU_ID`, `TELEFONOS`, `ELIMINADO`) VALUES
	(3, '12535306-1', 'VICTOR HUGO', 'CORONADO', 'ALARCON', 0, 15, 327, 'Pasaje Cordón Roma 0621 Puente Alto', 3, 1, '85006988', 0),
	(6, '13671095-8', 'González', 'Garcia', '', 0, 15, 295, 'Prueba', 3, 4, '+56994359451', 0),
	(7, '11111111-1', 'Prueba', 'CORONADO', 'ALARCON', 0, 15, 300, 'Prueba', 3, 5, '76890000', 0),
	(8, '11111111-1', 'Victor', 'Garcia', 'G', 0, 15, 295, 'asas', 4, 6, '', 0),
	(9, '11111111-1', 'victor', 'garcia', '', 0, 15, 295, 'pepepep', 4, 7, '', 0),
	(10, '22222222-2', 'victor', 'garcia', 'Dos', 0, 15, 295, 'asasas', 4, 8, '', 0),
	(11, '55555555-5', 'victor', 'garcia', 'Tres', 0, 15, 295, 'asasasas', 4, 9, '', 0),
	(12, '55555555-5', 'victor', 'garcia', 'Cuatro', 0, 15, 295, 'asasas', 4, 10, '', 0),
	(13, '99999999-9', 'victor', 'garcia', 'Seis', 0, 15, 295, 'asas', 4, 12, '', 0),
	(14, '10452691-8', 'Pedro Pablo', 'Contreras', '', 0, 15, 327, '', 3, 13, '569874521', 0),
	(15, '12193014-5', 'Ines', 'Retamales', 'Contreras', 0, 15, 327, '', 3, 14, '5698745121', 0),
	(16, '10452691-8', 'Otro', 'Otro', '', 0, 15, 327, '', 3, 15, '56985006981', 0),
	(17, '10452691-8', 'Pedro Pablo', 'Contreras', '', 0, 15, 327, '', 3, 16, '569874521', 0),
	(18, '12193014-5', 'Ines', 'Retamales', 'Contreras', 0, 15, 327, '', 3, 17, '5698745121', 0),
	(19, '77777777-7', 'Victor ', 'Garcia', 'Cinco', 0, 15, 295, 'asas', 4, 11, '', 0),
	(20, '11111111-1', 'Victor', 'García', '', 0, 15, 295, 'No registrada', 5, 18, '', 0),
	(21, '13597434-k', 'Danitza', 'Salazar', 'Ojeda', 0, 15, 295, '', 4, 19, '96278728', 0),
	(22, '11111111-1', 'Victor', 'García', 'Gonzalez', 0, 15, 295, '', 4, 20, '94359451', 0),
	(23, '12312312-3', 'Danitza ', 'Salazar ', 'Ojeda ', 0, 15, 295, 'Gral.  Bulnes', 4, 21, '227868835', 0),
	(24, '09166213-2', 'Miguel', 'Abarca', 'Soto', 0, 15, 295, 'Avda. Compañía #2398', 5, 22, '975778905', 0),
	(25, '12239244-9', 'Marcia ', 'Quiroga', 'Bastias', 0, 15, 295, 'Avda. Compañía #2398', 5, 23, '975382632', 0),
	(26, '12126594-k', 'Sandra', 'Rojas', 'Castillo', 0, 15, 295, 'Avda. Compañía #2398', 5, 24, '977579808', 0),
	(27, '14052578-2', 'Daniela', 'Labbe', 'Fernandez', 0, 15, 295, 'Avda. Compañía #2398', 5, 25, '985968431', 0);
/*!40000 ALTER TABLE `per_persona` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.prov_provincia
CREATE TABLE IF NOT EXISTS `prov_provincia` (
  `ID` int(11) NOT NULL COMMENT 'ID provincia',
  `REG_ID` int(11) NOT NULL COMMENT 'ID region asociada',
  `NOMBRE` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Nombre descriptivo',
  `NUMERO_COMUNAS` int(11) NOT NULL COMMENT 'Numero de comunas',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Lista de comunas por regiones';

-- Volcando datos para la tabla db_9dac90_cole.prov_provincia: ~54 rows (aproximadamente)
DELETE FROM `prov_provincia`;
/*!40000 ALTER TABLE `prov_provincia` DISABLE KEYS */;
INSERT INTO `prov_provincia` (`ID`, `REG_ID`, `NOMBRE`, `NUMERO_COMUNAS`) VALUES
	(1, 1, 'ARICA', 2),
	(2, 1, 'PARINACOTA', 2),
	(3, 2, 'IQUIQUE', 2),
	(4, 2, 'TAMARUGAL', 5),
	(5, 3, 'ANTOFAGASTA', 4),
	(6, 3, 'EL LOA', 3),
	(7, 3, 'TOCOPILLA', 2),
	(8, 4, 'COPIAPÓ', 3),
	(9, 4, 'CHAÑARAL', 2),
	(10, 4, 'HUASCO', 4),
	(11, 5, 'ELQUI', 6),
	(12, 5, 'CHOAPA', 4),
	(13, 5, 'LIMARÍ', 5),
	(14, 6, 'VALPARAÍSO', 7),
	(15, 6, 'ISLA DE PASCUA', 1),
	(16, 6, 'LOS ANDES', 4),
	(17, 6, 'PETORCA', 5),
	(18, 6, 'QUILLOTA', 5),
	(19, 6, 'SAN ANTONIO', 6),
	(20, 6, 'SAN FELIPE DE ACONCAGUA', 6),
	(21, 6, 'MARGA MARGA', 4),
	(22, 7, 'CACHAPOAL', 17),
	(23, 7, 'CARDENAL CARO', 6),
	(24, 7, 'COLCHAGUA', 10),
	(25, 8, 'TALCA', 10),
	(26, 8, 'CAUQUENES', 3),
	(27, 8, 'CURICÓ', 9),
	(28, 8, 'LINARES', 8),
	(29, 9, 'CONCEPCIÓN', 12),
	(30, 9, 'ARAUCO', 7),
	(31, 9, 'BIOBÍO', 14),
	(32, 9, 'ÑUBLE', 21),
	(33, 10, 'CAUTÍN', 21),
	(34, 10, 'MALLECO', 11),
	(35, 11, 'VALDIVIA', 8),
	(36, 11, 'RANCO', 4),
	(37, 12, 'LLANQUIHUE', 9),
	(38, 12, 'CHILOÉ', 10),
	(39, 12, 'OSORNO', 7),
	(40, 12, 'PALENA', 4),
	(41, 13, 'COIHAIQUE', 2),
	(42, 13, 'AISÉN', 3),
	(43, 13, 'CAPITÁN PRAT', 3),
	(44, 13, 'GENERAL CARRERA', 2),
	(45, 14, 'MAGALLANES', 4),
	(46, 14, 'ANTÁRTICA CHILENA', 2),
	(47, 14, 'TIERRA DEL FUEGO', 3),
	(48, 14, 'ULTIMA ESPERANZA', 2),
	(49, 15, 'SANTIAGO', 32),
	(50, 15, 'CORDILLERA', 3),
	(51, 15, 'CHACABUCO', 3),
	(52, 15, 'MAIPO', 4),
	(53, 15, 'MELIPILLA', 5),
	(54, 15, 'TALAGANTE', 5);
/*!40000 ALTER TABLE `prov_provincia` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.pro_proyectos
CREATE TABLE IF NOT EXISTS `pro_proyectos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_CREACION` datetime DEFAULT NULL,
  `USU_ID_CREADOR` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `NOMBRE` varchar(500) NOT NULL DEFAULT '0',
  `OBJETIVO` varchar(1500) DEFAULT '0',
  `DESCRIPCION` varchar(1500) DEFAULT '0',
  `BENEFICIOS` varchar(1500) DEFAULT '0',
  `COSTO` int(11) DEFAULT '0',
  `FECHA_INICIO` datetime DEFAULT NULL,
  `FECHA_TERMINO` datetime DEFAULT NULL,
  `ENVIA_CORREO` int(11) DEFAULT '0',
  `NOTIFICA_POPUP` int(11) DEFAULT '0',
  `ES_VIGENTE` int(11) DEFAULT '0',
  `ELIMINADO` int(11) DEFAULT '0',
  `FUE_APROBADO` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.pro_proyectos: ~7 rows (aproximadamente)
DELETE FROM `pro_proyectos`;
/*!40000 ALTER TABLE `pro_proyectos` DISABLE KEYS */;
INSERT INTO `pro_proyectos` (`ID`, `FECHA_CREACION`, `USU_ID_CREADOR`, `INST_ID`, `NOMBRE`, `OBJETIVO`, `DESCRIPCION`, `BENEFICIOS`, `COSTO`, `FECHA_INICIO`, `FECHA_TERMINO`, `ENVIA_CORREO`, `NOTIFICA_POPUP`, `ES_VIGENTE`, `ELIMINADO`, `FUE_APROBADO`) VALUES
	(1, '0001-01-01 00:00:00', 1, 3, 'Proyecto de Prueba Numero 1', 'El objetivo es probar la aplicacion', 'La idea es describir principal mente cual es el detalle del proyecto y cual es el alcance del mismo ', 'Aca se destaca el impacto y los beneficios esperados que resultaran de la ejecución del proyecto', 587000, '2015-11-08 00:00:00', '2015-11-29 00:00:00', 1, 1, 1, 0, 0),
	(2, '2015-11-10 18:29:56', 6, 4, 'Mejoramiento baños', 'Mejorar la infraestructura de los baños de niños', 'Breve descripción ', 'Breve descripción ', 8500000, '2015-11-10 00:00:00', '2016-05-31 00:00:00', 1, 1, 1, 1, 0),
	(3, '2015-11-10 18:38:02', 6, 4, 'Mejoramiento Acceso Principal', 'Mejorar el acceso principal del Establecimiento', 'Breve Descripcion', 'Para todos los alumnos', 3250000, '2015-11-10 00:00:00', '2015-11-24 00:00:00', 1, 1, 1, 1, 0),
	(4, '2015-12-13 20:04:57', 1, 3, 'prueba de proyecto 1', 'Objetivo', 'Descripción ', 'Beneficios ', 1548777, '2015-12-16 00:00:00', '2015-12-18 00:00:00', 0, 0, 1, 0, 0),
	(5, '2016-03-11 08:06:38', 1, 3, 'proyecto coro', 'Obj', 'Desc', 'Bene', 7000000, '2016-03-09 00:00:00', '2016-03-30 00:00:00', 0, 0, 1, 0, 0),
	(6, '2016-04-14 19:19:02', 6, 4, 'Instalación de graderías en patio principal', 'Instalación de graderias en patio principal', 'Juegos de graderías para el patio', 'Comodidad en los actos y Eventos deportivos del colegio', 2500000, '2016-04-12 00:00:00', '2016-04-22 00:00:00', 1, 0, 1, 1, 0),
	(7, '2016-11-04 12:15:58', 7, 4, 'DEMO proyecto', 'El objetivo es  demostrar la funcionalidad democrática de proyectos.', 'Este proyecto tiene como foco poder entregar funciones de valor que puedan hacer match con CitiZen', 'Entregar funciones de votaciones online par aproyectos y releccion de directivas', 2500000, '2016-11-04 00:00:00', '2016-11-11 00:00:00', 1, 0, 1, 0, 0);
/*!40000 ALTER TABLE `pro_proyectos` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.reg_region
CREATE TABLE IF NOT EXISTS `reg_region` (
  `ID` int(11) NOT NULL COMMENT 'ID unico',
  `NOMBRE` varchar(60) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Nombre extenso',
  `ROMANO` varchar(5) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Número de región',
  `NUMERO_PROVINCIAS` int(11) NOT NULL COMMENT 'total provincias',
  `NUMERO_COMUNAS` int(11) NOT NULL COMMENT 'Total de comunas',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Lista de regiones de Chile';

-- Volcando datos para la tabla db_9dac90_cole.reg_region: ~15 rows (aproximadamente)
DELETE FROM `reg_region`;
/*!40000 ALTER TABLE `reg_region` DISABLE KEYS */;
INSERT INTO `reg_region` (`ID`, `NOMBRE`, `ROMANO`, `NUMERO_PROVINCIAS`, `NUMERO_COMUNAS`) VALUES
	(1, 'ARICA Y PARINACOTA', 'XV', 2, 4),
	(2, 'TARAPACÁ', 'I', 2, 7),
	(3, 'ANTOFAGASTA', 'II', 3, 9),
	(4, 'ATACAMA ', 'III', 3, 9),
	(5, 'COQUIMBO ', 'IV', 3, 15),
	(6, 'VALPARAÍSO ', 'V', 8, 38),
	(7, 'DEL LIBERTADOR GRAL. BERNARDO O\'HIGGINS ', 'VI', 3, 33),
	(8, 'DEL MAULE', 'VII', 4, 30),
	(9, 'DEL BIOBÍO ', 'VIII', 4, 54),
	(10, 'DE LA ARAUCANÍA', 'IX', 2, 32),
	(11, 'DE LOS RÍOS', 'XIV', 2, 12),
	(12, 'DE LOS LAGOS', 'X', 4, 30),
	(13, 'AISÉN DEL GRAL. CARLOS IBAÑEZ DEL CAMPO ', 'XI', 4, 10),
	(14, 'MAGALLANES Y DE LA ANTÁRTICA CHILENA', 'XII', 4, 11),
	(15, 'METROPOLITANA DE SANTIAGO', 'RM', 6, 52);
/*!40000 ALTER TABLE `reg_region` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.rol_rol
CREATE TABLE IF NOT EXISTS `rol_rol` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(250) NOT NULL DEFAULT '0',
  `DESCRIPCION` varchar(500) DEFAULT '0',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.rol_rol: ~10 rows (aproximadamente)
DELETE FROM `rol_rol`;
/*!40000 ALTER TABLE `rol_rol` DISABLE KEYS */;
INSERT INTO `rol_rol` (`ID`, `NOMBRE`, `DESCRIPCION`, `ELIMINADO`) VALUES
	(1, 'Super Administrador', 'Rol encargado de administrar todo el sistema con permisos especiales', 0),
	(2, 'Administrador Centro Educacional', 'Administra los usuarios del establecimiento', 0),
	(3, 'Presidente CPAS', 'Gestiona actividades del Centro de Padres', 0),
	(4, 'Tesorero CPAS', 'Solo lectura', 0),
	(5, 'Secretario CPAS', 'Secretario', 0),
	(6, 'Vicepresidente CPAS', 'Tesorero', 0),
	(7, 'Director CPAS', 'DIRECTOR', 0),
	(8, 'Director Establecimiento', 'Director del Establecimiento', 0),
	(9, 'Apoderado', 'Apoderado', 0),
	(10, 'Delegado de Cultura y Deportes', 'Delegado Cultural y Deportivo del Establecimiento', 0);
/*!40000 ALTER TABLE `rol_rol` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.rpt_responsable_tricel
CREATE TABLE IF NOT EXISTS `rpt_responsable_tricel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRI_ID` int(11) NOT NULL DEFAULT '0',
  `USU_ID` int(11) NOT NULL DEFAULT '0',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.rpt_responsable_tricel: ~10 rows (aproximadamente)
DELETE FROM `rpt_responsable_tricel`;
/*!40000 ALTER TABLE `rpt_responsable_tricel` DISABLE KEYS */;
INSERT INTO `rpt_responsable_tricel` (`ID`, `TRI_ID`, `USU_ID`, `ELIMINADO`) VALUES
	(1, 1, 6, 0),
	(2, 1, 7, 0),
	(5, 2, 1, 0),
	(6, 2, 7, 0),
	(7, 3, 1, 0),
	(8, 3, 6, 0),
	(9, 4, 1, 0),
	(10, 4, 6, 0),
	(11, 5, 1, 0),
	(12, 5, 6, 0);
/*!40000 ALTER TABLE `rpt_responsable_tricel` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.tri_tricel
CREATE TABLE IF NOT EXISTS `tri_tricel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_CREACION` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USU_ID_CREADOR` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `NOMBRE` varchar(500) NOT NULL,
  `OBJETIVO` varchar(500) NOT NULL,
  `FECHA_INICIO` datetime NOT NULL,
  `FECHA_TERMINO` datetime NOT NULL,
  `ES_VIGENTE` int(11) NOT NULL DEFAULT '0',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.tri_tricel: ~5 rows (aproximadamente)
DELETE FROM `tri_tricel`;
/*!40000 ALTER TABLE `tri_tricel` DISABLE KEYS */;
INSERT INTO `tri_tricel` (`ID`, `FECHA_CREACION`, `USU_ID_CREADOR`, `INST_ID`, `NOMBRE`, `OBJETIVO`, `FECHA_INICIO`, `FECHA_TERMINO`, `ES_VIGENTE`, `ELIMINADO`) VALUES
	(1, '2016-02-17 17:26:59', 6, 4, 'Tricel 1', 'objetivo 1', '2016-02-17 00:00:00', '2016-02-29 00:00:00', 1, 0),
	(2, '2016-03-08 07:33:47', 1, 3, 'prueba', 'Objetivo prueba', '2016-03-06 00:00:00', '2016-03-30 00:00:00', 1, 0),
	(3, '2016-03-11 08:11:54', 1, 3, 'Triple coro', 'Obj', '2016-03-08 00:00:00', '2016-03-29 00:00:00', 1, 0),
	(4, '2016-03-11 08:52:55', 1, 3, 'pppp', 'Obj', '2016-03-08 00:00:00', '2016-03-30 00:00:00', 1, 0),
	(5, '2016-03-12 13:35:04', 1, 3, 'coro', 'Objetivo', '2016-03-11 00:00:00', '2016-03-29 00:00:00', 1, 0);
/*!40000 ALTER TABLE `tri_tricel` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.usl_usuario_lista
CREATE TABLE IF NOT EXISTS `usl_usuario_lista` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USU_ID` int(11) NOT NULL DEFAULT '0',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  `LTR_ID` int(11) NOT NULL DEFAULT '0',
  `ROL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.usl_usuario_lista: ~25 rows (aproximadamente)
DELETE FROM `usl_usuario_lista`;
/*!40000 ALTER TABLE `usl_usuario_lista` DISABLE KEYS */;
INSERT INTO `usl_usuario_lista` (`ID`, `USU_ID`, `ELIMINADO`, `LTR_ID`, `ROL`) VALUES
	(1, 8, 0, 1, 'Presidente'),
	(2, 9, 0, 1, 'Vicepresidente'),
	(3, 10, 0, 1, 'Secretario'),
	(4, 11, 0, 1, 'Tesorero'),
	(5, 8, 0, 2, 'Presidente'),
	(6, 9, 0, 2, 'Vicepresidente'),
	(7, 10, 0, 2, 'Secretario'),
	(8, 12, 0, 2, 'Tesorero'),
	(9, 4, 0, 3, 'Presidente'),
	(10, 6, 0, 3, 'Vicepresidente'),
	(11, 8, 0, 3, 'Secretario'),
	(12, 9, 0, 3, 'Tesorero'),
	(13, 10, 0, 3, 'Otro1'),
	(14, 4, 0, 4, 'Presidente'),
	(15, 7, 0, 4, 'Vicepresidente'),
	(16, 10, 0, 4, 'Secretario'),
	(17, 8, 0, 4, 'Tesorero'),
	(18, 4, 0, 5, 'Presidente'),
	(19, 7, 0, 5, 'Vicepresidente'),
	(20, 8, 0, 5, 'Secretario'),
	(21, 9, 0, 5, 'Tesorero'),
	(22, 4, 0, 6, 'Presidente'),
	(23, 7, 0, 6, 'Vicepresidente'),
	(24, 8, 0, 6, 'Secretario'),
	(25, 9, 0, 6, 'Tesorero');
/*!40000 ALTER TABLE `usl_usuario_lista` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.vi_vinculos_institucion
CREATE TABLE IF NOT EXISTS `vi_vinculos_institucion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `IMAGEN_VINCULO_1` varchar(200) NOT NULL DEFAULT '0',
  `URL_VINCULO_1` varchar(200) NOT NULL DEFAULT '0',
  `TEXTO_VINCULO_1` varchar(200) NOT NULL DEFAULT '0',
  `VISIBLE_VINCULO_1` int(11) NOT NULL DEFAULT '0',
  `VISIBLE_VINCULO_2` int(11) NOT NULL DEFAULT '0',
  `IMAGEN_VINCULO_2` varchar(200) NOT NULL DEFAULT '0',
  `URL_VINCULO_2` varchar(200) NOT NULL DEFAULT '0',
  `TEXTO_VINCULO_2` varchar(200) NOT NULL DEFAULT '0',
  `VISIBLE_VINCULO_3` int(11) NOT NULL DEFAULT '0',
  `IMAGEN_VINCULO_3` varchar(200) NOT NULL DEFAULT '0',
  `URL_VINCULO_3` varchar(200) NOT NULL DEFAULT '0',
  `TEXTO_VINCULO_3` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.vi_vinculos_institucion: ~1 rows (aproximadamente)
DELETE FROM `vi_vinculos_institucion`;
/*!40000 ALTER TABLE `vi_vinculos_institucion` DISABLE KEYS */;
INSERT INTO `vi_vinculos_institucion` (`ID`, `INST_ID`, `IMAGEN_VINCULO_1`, `URL_VINCULO_1`, `TEXTO_VINCULO_1`, `VISIBLE_VINCULO_1`, `VISIBLE_VINCULO_2`, `IMAGEN_VINCULO_2`, `URL_VINCULO_2`, `TEXTO_VINCULO_2`, `VISIBLE_VINCULO_3`, `IMAGEN_VINCULO_3`, `URL_VINCULO_3`, `TEXTO_VINCULO_3`) VALUES
	(1, 3, '~/img/facebook.png', 'https://www.facebook.com/cpas.cl/', 'http://facebook.com/', 1, 1, '~/img/twitter.png', 'https://twitter.com/CPAScl', 'http://twitter.com', 1, '~/img/email.png', 'mailto:contacto@cpas.cl', 'contacto@cpas.cl');
/*!40000 ALTER TABLE `vi_vinculos_institucion` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.vot_votaciones
CREATE TABLE IF NOT EXISTS `vot_votaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_ID` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `USU_ID_VOTADOR` int(11) NOT NULL DEFAULT '0',
  `FECHA_VOTACION` datetime NOT NULL,
  `VALOR` int(11) NOT NULL DEFAULT '0',
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.vot_votaciones: ~7 rows (aproximadamente)
DELETE FROM `vot_votaciones`;
/*!40000 ALTER TABLE `vot_votaciones` DISABLE KEYS */;
INSERT INTO `vot_votaciones` (`ID`, `PRO_ID`, `INST_ID`, `USU_ID_VOTADOR`, `FECHA_VOTACION`, `VALOR`, `ELIMINADO`) VALUES
	(1, 2, 4, 6, '2015-11-10 18:40:09', 1, 0),
	(2, 3, 4, 6, '2015-11-10 18:41:06', 1, 0),
	(3, 2, 4, 7, '2015-11-10 18:58:06', 0, 0),
	(4, 6, 4, 10, '2016-04-14 19:20:24', 1, 0),
	(5, 6, 4, 11, '2016-04-14 19:21:38', 0, 0),
	(6, 6, 4, 8, '2016-04-14 19:22:26', 1, 0),
	(7, 6, 4, 9, '2016-04-14 19:24:39', 1, 0);
/*!40000 ALTER TABLE `vot_votaciones` ENABLE KEYS */;


-- Volcando estructura para tabla db_9dac90_cole.vtr_vot_tricel
CREATE TABLE IF NOT EXISTS `vtr_vot_tricel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LTR_ID` int(11) NOT NULL DEFAULT '0',
  `TRI_ID` int(11) NOT NULL DEFAULT '0',
  `INST_ID` int(11) NOT NULL DEFAULT '0',
  `USU_ID_VOTADOR` int(11) NOT NULL DEFAULT '0',
  `FECHA_VOTACION` datetime NOT NULL,
  `ELIMINADO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_9dac90_cole.vtr_vot_tricel: ~4 rows (aproximadamente)
DELETE FROM `vtr_vot_tricel`;
/*!40000 ALTER TABLE `vtr_vot_tricel` DISABLE KEYS */;
INSERT INTO `vtr_vot_tricel` (`ID`, `LTR_ID`, `TRI_ID`, `INST_ID`, `USU_ID_VOTADOR`, `FECHA_VOTACION`, `ELIMINADO`) VALUES
	(1, 1, 1, 4, 7, '2016-02-17 17:31:51', 0),
	(2, 2, 1, 4, 6, '2016-02-17 17:32:40', 0),
	(3, 3, 2, 3, 1, '2016-03-08 07:39:47', 0),
	(4, 4, 3, 4, 6, '2016-03-11 09:11:06', 0);
/*!40000 ALTER TABLE `vtr_vot_tricel` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
