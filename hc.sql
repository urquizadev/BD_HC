create database hc;
use hc;

-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: hc
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admision`
--

DROP TABLE IF EXISTS `admision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admision` (
  `id_admision` int NOT NULL,
  `fecha_admision` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_historia` int NOT NULL,
  `id_medico` int NOT NULL,
  `id_usuario` int NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  `id_paciente` int DEFAULT NULL,
  PRIMARY KEY (`id_admision`),
  KEY `fk_admision_historia` (`id_historia`),
  KEY `fk_admision_medico` (`id_medico`),
  KEY `fk_admision_usuario` (`id_usuario`),
  KEY `fk_admision_paciente` (`id_paciente`),
  CONSTRAINT `fk_admision_historia` FOREIGN KEY (`id_historia`) REFERENCES `historiaclinica` (`id_historia`),
  CONSTRAINT `fk_admision_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `fk_admision_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admision`
--

LOCK TABLES `admision` WRITE;
/*!40000 ALTER TABLE `admision` DISABLE KEYS */;
INSERT INTO `admision` VALUES (9001,'2026-02-08 05:03:59',5001,1001,1001,'Traumatología',1003);
/*!40000 ALTER TABLE `admision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_historia_clinica`
--

DROP TABLE IF EXISTS `detalle_historia_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_historia_clinica` (
  `id_paciente` int NOT NULL,
  `id_medico` int NOT NULL,
  `motivo_consulta` varchar(250) NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `fk_detalle_admision` (`id_paciente`),
  KEY `fk_detalle_medico` (`id_medico`),
  CONSTRAINT `fk_detalle_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_historia_clinica`
--

LOCK TABLES `detalle_historia_clinica` WRITE;
/*!40000 ALTER TABLE `detalle_historia_clinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_historia_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historiaclinica`
--

DROP TABLE IF EXISTS `historiaclinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historiaclinica` (
  `id_historia` int NOT NULL,
  `nro_historia_clinica` varchar(15) NOT NULL,
  `fecha_apertura` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` char(8) NOT NULL,
  `id_paciente` int NOT NULL,
  `motivo_consulta` varchar(100) NOT NULL,
  PRIMARY KEY (`id_historia`),
  UNIQUE KEY `UQ__Historia__F8F9842D45628255` (`nro_historia_clinica`),
  KEY `fk_historia_paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historiaclinica`
--

LOCK TABLES `historiaclinica` WRITE;
/*!40000 ALTER TABLE `historiaclinica` DISABLE KEYS */;
INSERT INTO `historiaclinica` VALUES (5001,'HC-1003','2026-02-08 05:03:38','ACTIVO',1003,'Dolor lumbar');
/*!40000 ALTER TABLE `historiaclinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` int NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` char(8) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CMP` int DEFAULT NULL,
  `RNE` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `fk_medico_usuario` (`id_usuario`),
  CONSTRAINT `fk_medico_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1001,'Andrea','Torres','Traumatología',NULL,NULL,'ACTIVO','2026-02-08 05:03:38',NULL,NULL,1001);
INSERT INTO `medico` VALUES
(1002,'OMAR YVAN','ACHAMISO ALARCON','Traumatología','912345678','omar@gmail.com','ACTIVO','2026-02-08 05:03:38','047765','028633',NULL),
(1003,'ARTURO','AGUILAR MALDONADO','Traumatología','934567891','arturo@gmail.com','ACTIVO','2026-02-08 05:03:38','053507','024710',NULL),
(1004,'PAUL','AGUIRRE GUERRERO','Traumatología','956789123','paul@gmail.com','ACTIVO','2026-02-08 05:03:38','064765','045619',NULL),
(1005,'MAGNO ALEJANDRO','AGUIRRE MARTINEZ','Traumatología','947241235','magno@gmail.com','ACTIVO','2026-02-08 05:03:38','029123','029295',NULL),
(1006,'JOSE BELTRAN','ALAMO NOLE','Traumatología','978896547','jose@gmail.com','ACTIVO','2026-02-08 05:03:38','033268','028871',NULL),
(1007,'GERMAN ARTURO','ALAYO VIDAL','Traumatología','941675942','german@gmail.com','ACTIVO','2026-02-08 05:03:38','061672','033156',NULL),
(1008,'RENATO FRANCO','ALBAN TALANCHA','Traumatología','982486751','renato@gmail.com','ACTIVO','2026-02-08 05:03:38','055940','029280',NULL),
(1009,'ERIK LENNER','ALCALDE LOAYZA','Traumatología','948316742','erik@gmail.com','ACTIVO','2026-02-08 05:03:38','057591','031451',NULL),
(1010,'WILBER CLETO','ALDORADIN JAUREGUI','Traumatología','976844521','wilber@gmail.com','ACTIVO','2026-02-08 05:03:38','031419','028535',NULL);


/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table 'horario_medico'
--
DROP TABLE IF EXISTS horario_medico;
CREATE TABLE horario_medico (
  id_horario int NOT NULL AUTO_INCREMENT,
  id_medico int NOT NULL,
  dia_semana tinyint NOT NULL COMMENT '1=Lunes, 2=Martes, 3=Miércoles, 4=Jueves, 5=Viernes, 6=Sábado, 7=Domingo',
  hora_inicio time NOT NULL,
  hora_fin time NOT NULL,
  duracion_cita int DEFAULT 30 COMMENT 'Duración de cada cita en minutos',
  activo tinyint DEFAULT 1 COMMENT '1=activo, 0=inactivo',
  fecha_registro timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_horario),
  KEY fk_horario_medico (id_medico),
  CONSTRAINT fk_horario_medico FOREIGN KEY (id_medico) REFERENCES medico (id_medico)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table horario_medico
--
INSERT INTO horario_medico (id_medico, dia_semana, hora_inicio, hora_fin, duracion_cita) VALUES
-- Para Andrea Torres (id_medico = 1001)
(1001, 1, '08:00:00', '13:00:00', 30),  -- Lunes mañana
(1001, 2, '08:00:00', '13:00:00', 30),  -- Martes mañana
(1001, 3, '08:00:00', '13:00:00', 30),  -- Miércoles mañana
(1001, 4, '14:00:00', '19:00:00', 30),  -- Jueves tarde
(1001, 5, '08:00:00', '13:00:00', 30),  -- Viernes mañana

-- Para OMAR YVAN ACHAMISO ALARCON (id_medico = 1002)
(1002, 1, '09:00:00', '14:00:00', 30),
(1002, 2, '09:00:00', '14:00:00', 30),
(1002, 3, '15:00:00', '20:00:00', 30),
(1002, 4, '09:00:00', '14:00:00', 30),
(1002, 5, '09:00:00', '13:00:00', 30),

-- Para ARTURO AGUILAR MALDONADO (id_medico = 1003)
(1003, 1, '08:30:00', '12:30:00', 30),
(1003, 2, '08:30:00', '12:30:00', 30),
(1003, 3, '08:30:00', '12:30:00', 30),
(1003, 4, '14:30:00', '18:30:00', 30),
(1003, 5, '14:30:00', '18:30:00', 30),

-- Para PAUL AGUIRRE GUERRERO (id_medico = 1004)
(1004, 1, '07:00:00', '12:00:00', 30),
(1004, 2, '07:00:00', '12:00:00', 30),
(1004, 3, '13:00:00', '18:00:00', 30),
(1004, 4, '07:00:00', '12:00:00', 30),
(1004, 5, '13:00:00', '18:00:00', 30),

-- Para MAGNO ALEJANDRO AGUIRRE MARTINEZ (id_medico = 1005)
(1005, 1, '08:00:00', '13:00:00', 30),
(1005, 2, '08:00:00', '13:00:00', 30),
(1005, 3, '08:00:00', '13:00:00', 30),
(1005, 4, '14:00:00', '19:00:00', 30),
(1005, 5, '08:00:00', '13:00:00', 30),
(1005, 6, '08:00:00', '12:00:00', 30), -- Sábado media jornada

-- Para JOSE BELTRAN ALAMO NOLE (id_medico = 1006)
(1006, 1, '10:00:00', '15:00:00', 30),
(1006, 2, '10:00:00', '15:00:00', 30),
(1006, 3, '10:00:00', '15:00:00', 30),
(1006, 4, '15:00:00', '20:00:00', 30),
(1006, 5, '10:00:00', '15:00:00', 30),

-- Para GERMAN ARTURO ALAYO VIDAL (id_medico = 1007)
(1007, 1, '08:00:00', '14:00:00', 30),
(1007, 2, '08:00:00', '14:00:00', 30),
(1007, 3, '08:00:00', '14:00:00', 30),
(1007, 4, '08:00:00', '14:00:00', 30),
(1007, 5, '08:00:00', '12:00:00', 30),

-- Para RENATO FRANCO ALBAN TALANCHA (id_medico = 1008)
(1008, 1, '13:00:00', '19:00:00', 30),
(1008, 2, '13:00:00', '19:00:00', 30),
(1008, 3, '13:00:00', '19:00:00', 30),
(1008, 4, '08:00:00', '14:00:00', 30),
(1008, 5, '13:00:00', '19:00:00', 30),

-- Para ERIK LENNER ALCALDE LOAYZA (id_medico = 1009)
(1009, 1, '09:00:00', '17:00:00', 45), -- Citas de 45 minutos
(1009, 2, '09:00:00', '17:00:00', 45),
(1009, 3, '09:00:00', '17:00:00', 45),
(1009, 4, '09:00:00', '17:00:00', 45),
(1009, 5, '09:00:00', '13:00:00', 45),

-- Para WILBER CLETO ALDORADIN JAUREGUI (id_medico = 1010)
(1010, 1, '08:00:00', '12:00:00', 30),
(1010, 2, '08:00:00', '12:00:00', 30),
(1010, 3, '08:00:00', '12:00:00', 30),
(1010, 4, '14:00:00', '18:00:00', 30),
(1010, 5, '14:00:00', '18:00:00', 30),
(1010, 6, '08:00:00', '12:00:00', 30); -- Sábado media jornada

-- Verificar los horarios insertados
SELECT 
    m.id_medico,
    m.nombres,
    m.apellidos,
    h.dia_semana,
    h.hora_inicio,
    h.hora_fin,
    h.duracion_cita
FROM medico m
INNER JOIN horario_medico h ON m.id_medico = h.id_medico
ORDER BY m.id_medico, h.dia_semana, h.hora_inicio;
--
ALTER TABLE medico MODIFY CMP VARCHAR(10);
ALTER TABLE medico MODIFY RNE VARCHAR(10);

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(20) NOT NULL,
  `nro_documento` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `estado` char(8) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `UQ__Paciente__761A4C463CA342E3` (`nro_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1001,'DNI','74581236','Carlos','M','1998-06-15','987654321','Av. Siempre Viva 742','ACTIVO','2026-01-30 06:43:04','Pérez,Gómez',NULL),(1003,'DNI','73118847','FARID ISRAEL','M','2005-03-27','922941107','av.hola','ACTIVO','2026-02-05 11:57:43','URQUIZA','SAAVEDRA'),(1004,'DNI','74074569','GONZALO RAMON','M','2026-02-05','77777','rr','ACTIVO','2026-02-05 12:00:26','SARMIENT','OLIVO');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE `pago` (
  `id_pago` INT NOT NULL AUTO_INCREMENT,
  `id_admision` INT NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `metodo_pago` VARCHAR(30) NOT NULL,
  `fecha_pago` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `fk_pago_admision` (`id_admision`),
  CONSTRAINT `fk_pago_admision`
      FOREIGN KEY (`id_admision`)
      REFERENCES `admision` (`id_admision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int NOT NULL,
  `diagram_id` int NOT NULL,
  `version` int DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `password_hash` VARCHAR(255) NOT NULL,
  `rol` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellido_paterno` VARCHAR(100) NOT NULL,
  `apellido_materno` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) DEFAULT NULL,
  `estado` CHAR(8) NOT NULL,
  `fecha_creacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `UQ_usuario_email` (`email`)

) ENGINE=InnoDB
AUTO_INCREMENT=1001
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1001,'$2a$10$IbcqC2pPvWMNVN/P/Cv.VuMAECRD7gYRch4OZoQ9u1dlEuR3GZyui','ADMIN','Atenas','Bonifaz','Obando','atenas@gmail.com','ACTIVO','2026-02-08 05:03:38'),(1002,'$2a$10$4d5edMEGLPWRSBgkXgddK.vjecSLTffk2j3Di83pW3Ev5DTxCApUW','MEDICO','Andrea','Torres','Cerdan','Andrea@gmail.com','ACTIVO','2026-02-08 05:03:38');
INSERT INTO usuario VALUES('$2a$10$IvOlz2Gfa3Q8hqmpDqAMpe407PdQ58SMIFaqEiDvz8vohuAhXyzFS','ADMISION','Farid','Urquiza','Saavedra','farid@gmail.com','ACTIVO');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `auditoria`
--
DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `usuario_email` varchar(100) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `entidad` varchar(50) DEFAULT NULL,
  `id_entidad` int DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_inicio_sesion` timestamp NULL DEFAULT NULL,
  `fecha_fin_sesion` timestamp NULL DEFAULT NULL,
  `duracion_segundos` int DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2026-02-08 17:47:05usuariousuario
use hc;
SELECT * FROM usuario;
SELECT * FROM paciente;
SELECT * FROM pago;
SELECT * FROM medico;
SELECT * FROM pago;
SELECT * FROM admision;

