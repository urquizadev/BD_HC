CREATE DATABASE  IF NOT EXISTS `hc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hc`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hc
-- ------------------------------------------------------
-- Server version	8.0.43

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
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `paciente` VALUES (1001,'DNI','74581236','Carlos','M','1998-06-15','987654321','Av. Siempre Viva 742','INACTIVO','2026-01-30 06:43:04','Pérez,Gómez',NULL),(1003,'DNI','73118847','FARID ISRAEL','M','2005-03-27','922941107','av.hola','ACTIVO','2026-02-05 11:57:43','URQUIZA','SAAVEDRA'),(1004,'DNI','74074569','GONZALO RAMON','M','2026-02-05','77777','rr','ACTIVO','2026-02-05 12:00:26','SARMIENT','OLIVO');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL,
  `id_admision` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(30) NOT NULL,
  `fecha_pago` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` char(8) NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `fk_pago_admision` (`id_admision`),
  CONSTRAINT `fk_pago_admision` FOREIGN KEY (`id_admision`) REFERENCES `admision` (`id_admision`)
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` char(8) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `UQ__Usuario__F3DBC572416C0164` (`username`),
  UNIQUE KEY `UQ__Usuario__AB6E6164421A6488` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
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

-- Dump completed on 2026-02-05  2:31:07
USE hc;
SELECT * 
FROM paciente
ORDER BY id_paciente DESC;

USE hc;

INSERT INTO usuario (username, password_hash, rol, nombres, apellidos, email, estado)
VALUES (
  'admin',
  '$2a$10$IbcqC2pPvWMNVN/P/Cv.VuMAECRD7gYRch4OZoQ9u1dlEuR3GZyui',
  'ADMIN',
  'Atenas',
  'Bonifaz',
  'atenas@gmail.com',
  'ACTIVO'
);
USE hc;

INSERT INTO usuario
(username, password_hash, rol, nombres, apellidos, email, estado)
VALUES
(
'usuario2',
'$2a$10$4d5edMEGLPWRSBgkXgddK.vjecSLTffk2j3Di83pW3Ev5DTxCApUW',
'MEDICO',
'Andrea',
'Torres',
'Andrea@gmail.com',
'ACTIVO'
);
INSERT INTO usuario
(username, password_hash, rol, nombres, apellidos, email, estado)
VALUES
(
'usuario3',
'$2a$10$G9paK.Htr7CcTHQr8zsKke0fUs5lnShqsNaUX8A/xWh.L4ODvQMCK',
'MEDICO',
'Eduardo',
'Perez',
'Eduardo@gmail.com',
'ACTIVO'
);
SELECT id_usuario, username, email, rol, estado, password_hash
FROM usuario
ORDER BY id_usuario DESC;