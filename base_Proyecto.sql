-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mysqlproyecto
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `academico_espacio`
--

DROP TABLE IF EXISTS `academico_espacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academico_espacio` (
  `Id_espacio` int NOT NULL AUTO_INCREMENT,
  `Dia` varchar(100) NOT NULL,
  `Hora` time(6) NOT NULL,
  `Edificio` varchar(100) NOT NULL,
  `Salon` int NOT NULL,
  `Grupo_id` int NOT NULL,
  PRIMARY KEY (`Id_espacio`),
  KEY `academico_espacio_Grupo_id_1c94d6c3_fk_Grupo_Id_grupo` (`Grupo_id`),
  CONSTRAINT `academico_espacio_Grupo_id_1c94d6c3_fk_Grupo_Id_grupo` FOREIGN KEY (`Grupo_id`) REFERENCES `grupo` (`Id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academico_espacio`
--

LOCK TABLES `academico_espacio` WRITE;
/*!40000 ALTER TABLE `academico_espacio` DISABLE KEYS */;
/*!40000 ALTER TABLE `academico_espacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignatura` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Tipologia` varchar(100) NOT NULL,
  `Creditos` int NOT NULL,
  `Programa_id` int NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `Asignatura_Programa_id_c48bd72d_fk_Programa_Codigo_SNIES` (`Programa_id`),
  CONSTRAINT `Asignatura_Programa_id_c48bd72d_fk_Programa_Codigo_SNIES` FOREIGN KEY (`Programa_id`) REFERENCES `programa` (`Codigo_SNIES`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Estudiante'),(2,'Prueba');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Asignatura',7,'add_asignatura'),(26,'Can change Asignatura',7,'change_asignatura'),(27,'Can delete Asignatura',7,'delete_asignatura'),(28,'Can view Asignatura',7,'view_asignatura'),(29,'Can add Cita_Inscripcion',8,'add_cita_inscripcion'),(30,'Can change Cita_Inscripcion',8,'change_cita_inscripcion'),(31,'Can delete Cita_Inscripcion',8,'delete_cita_inscripcion'),(32,'Can view Cita_Inscripcion',8,'view_cita_inscripcion'),(33,'Can add Departamento',9,'add_departamento'),(34,'Can change Departamento',9,'change_departamento'),(35,'Can delete Departamento',9,'delete_departamento'),(36,'Can view Departamento',9,'view_departamento'),(37,'Can add Docente',10,'add_docente'),(38,'Can change Docente',10,'change_docente'),(39,'Can delete Docente',10,'delete_docente'),(40,'Can view Docente',10,'view_docente'),(41,'Can add Estudiante',11,'add_estudiante'),(42,'Can change Estudiante',11,'change_estudiante'),(43,'Can delete Estudiante',11,'delete_estudiante'),(44,'Can view Estudiante',11,'view_estudiante'),(45,'Can add Facultad',12,'add_facultad'),(46,'Can change Facultad',12,'change_facultad'),(47,'Can delete Facultad',12,'delete_facultad'),(48,'Can view Facultad',12,'view_facultad'),(49,'Can add Grupo',13,'add_grupo'),(50,'Can change Grupo',13,'change_grupo'),(51,'Can delete Grupo',13,'delete_grupo'),(52,'Can view Grupo',13,'view_grupo'),(53,'Can add Historial_Academico',14,'add_historial_academico'),(54,'Can change Historial_Academico',14,'change_historial_academico'),(55,'Can delete Historial_Academico',14,'delete_historial_academico'),(56,'Can view Historial_Academico',14,'view_historial_academico'),(57,'Can add Sede',15,'add_sede'),(58,'Can change Sede',15,'change_sede'),(59,'Can delete Sede',15,'delete_sede'),(60,'Can view Sede',15,'view_sede'),(61,'Can add Resumen_Credito',16,'add_resumen_creditos'),(62,'Can change Resumen_Credito',16,'change_resumen_creditos'),(63,'Can delete Resumen_Credito',16,'delete_resumen_creditos'),(64,'Can view Resumen_Credito',16,'view_resumen_creditos'),(65,'Can add Residencia',17,'add_residencia'),(66,'Can change Residencia',17,'change_residencia'),(67,'Can delete Residencia',17,'delete_residencia'),(68,'Can view Residencia',17,'view_residencia'),(69,'Can add Programa',18,'add_programa'),(70,'Can change Programa',18,'change_programa'),(71,'Can delete Programa',18,'delete_programa'),(72,'Can view Programa',18,'view_programa'),(73,'Can add Persona_vinculada',19,'add_persona_vinculada'),(74,'Can change Persona_vinculada',19,'change_persona_vinculada'),(75,'Can delete Persona_vinculada',19,'delete_persona_vinculada'),(76,'Can view Persona_vinculada',19,'view_persona_vinculada'),(77,'Can add Inscripcion_cancelacion',20,'add_inscripcion_cancelacion'),(78,'Can change Inscripcion_cancelacion',20,'change_inscripcion_cancelacion'),(79,'Can delete Inscripcion_cancelacion',20,'delete_inscripcion_cancelacion'),(80,'Can view Inscripcion_cancelacion',20,'view_inscripcion_cancelacion'),(81,'Can add espacio',21,'add_espacio'),(82,'Can change espacio',21,'change_espacio'),(83,'Can delete espacio',21,'delete_espacio'),(84,'Can view espacio',21,'view_espacio'),(85,'Can add Decano',22,'add_decano'),(86,'Can change Decano',22,'change_decano'),(87,'Can delete Decano',22,'delete_decano'),(88,'Can view Decano',22,'view_decano'),(89,'Can add Cupo_Credito',23,'add_cupo_creditos'),(90,'Can change Cupo_Credito',23,'change_cupo_creditos'),(91,'Can delete Cupo_Credito',23,'delete_cupo_creditos'),(92,'Can view Cupo_Credito',23,'view_cupo_creditos'),(93,'Can add ModelName',24,'add_notas'),(94,'Can change ModelName',24,'change_notas'),(95,'Can delete ModelName',24,'delete_notas'),(96,'Can view ModelName',24,'view_notas'),(97,'Can add Inscripcion_cancelacion_grupo',25,'add_inscripcion_cancelacion_grupo'),(98,'Can change Inscripcion_cancelacion_grupo',25,'change_inscripcion_cancelacion_grupo'),(99,'Can delete Inscripcion_cancelacion_grupo',25,'delete_inscripcion_cancelacion_grupo'),(100,'Can view Inscripcion_cancelacion_grupo',25,'view_inscripcion_cancelacion_grupo'),(101,'Can add Pago_Semestre',26,'add_pago_semestre'),(102,'Can change Pago_Semestre',26,'change_pago_semestre'),(103,'Can delete Pago_Semestre',26,'delete_pago_semestre'),(104,'Can view Pago_Semestre',26,'view_pago_semestre');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$xdY2fdIHrev9qyHI2ueH1y$Vj5qi345oXXN5DrObTKPQ7YjT9GvmtPCaVqv9tGaL/8=','2023-05-30 23:36:58.000000',1,'root','','','root@gmail.com',1,1,'2023-05-27 00:37:13.000000'),(3,'pbkdf2_sha256$390000$YxlODGEPBUCI4ESJ1LtGzI$zgdPRW0xzqbeg2GNQyf2hjSwbXQdaeuNNy75l/ZtFLI=','2023-05-28 21:54:09.415034',0,'Sergio','','','Sergio@unal.edu.co',0,1,'2023-05-28 18:29:24.038115'),(4,'pbkdf2_sha256$390000$ObVDkLkzKHCDuO4pY3Evj5$599KxlSHuy0wXtgMB/wjOnlByU9MwlsqrgT7JOdZnM0=',NULL,0,'Daniel','','','',0,1,'2023-05-28 22:22:45.225823'),(5,'pbkdf2_sha256$390000$2hYMTSvjhhYmraeqf5mgWG$puIH5vI5LZ0HGxGCbwHEZXh3ce6iAsccQXRzv1DSRSA=',NULL,0,'Daniela','','','',0,1,'2023-05-28 22:23:10.697783'),(6,'pbkdf2_sha256$390000$qbD2EdtWJvW9DIienIoGyK$RjTY1EmH8jkcGzf+7qo+rjfnvEM00Pj4NUYcw/yScvM=',NULL,0,'Camilo','','','',0,1,'2023-05-28 22:23:22.922258'),(7,'pbkdf2_sha256$390000$RUpqDDamz3SgLU1HEmgbwM$iTOrO1SXuLZN/+qwosdpA4TmH/c8TDfXuyGMPpD5AgY=',NULL,0,'Diana','','','',0,1,'2023-05-28 22:23:47.911244'),(8,'pbkdf2_sha256$390000$cWXSclcLfC1Ti5g9ecd3qZ$Gyb5ZGq0K/wgWYyBWAD5immw/e8st7+hh8C3HIc8iSY=',NULL,0,'Elizabeth','','','',0,1,'2023-05-28 22:24:01.521827'),(9,'pbkdf2_sha256$390000$9feL7rnPgiN5HBNmGb07y1$LZ3bSPXKuBC0Qj05+mO1kMhygdj5YY9KhpIFSuyDJTE=',NULL,0,'Anna','','','',0,1,'2023-05-28 22:24:12.480686'),(10,'pbkdf2_sha256$390000$PHn2Iuj6qWhVW3I5xNe9uV$78K9a7sjJRjMrzGbZm7W81Fm6BBsI/gu4zv0IiZ65uM=',NULL,0,'Andrea','','','',0,1,'2023-05-28 22:24:23.096644'),(11,'pbkdf2_sha256$390000$oTG4mQDsrNwpExmGrccApd$SfGF/eALaub6UMrwvduD72DWflO3TcIo2uk5CcsIlz0=',NULL,0,'Alejandro','','','',0,1,'2023-05-28 22:24:29.358896'),(12,'pbkdf2_sha256$390000$9Uz9aYQGVvnkxOCa4vIryD$bJhyOcZEEZX0czY/cFIlwDz9y3Jt925jLrBN3LwovxU=',NULL,0,'Mauricio','','','',0,1,'2023-05-28 22:24:37.215484'),(13,'pbkdf2_sha256$390000$m1Mkg9rB5i9JI35ZqTl8Qz$yjw1+bxW2shB9ma2ACZKOrIiJi/aIhB9RjZ5YY1AwtQ=',NULL,0,'Antonia','','','',0,1,'2023-05-28 22:26:09.571971'),(14,'pbkdf2_sha256$390000$o78jsQPSpG2KeA2vRWnDLK$Z3N1db6YNd+ROhtPZfjMIXf81TPZKtWBr7cs6kiSgQs=',NULL,0,'Antonio','','','',0,1,'2023-05-28 22:26:24.683449'),(15,'pbkdf2_sha256$390000$xfLwx2bpaw3XCCREshEe4R$QHehnkYF4ONgalrybA0DHMeGV/dH33nhavgazjb/I7Q=',NULL,0,'Gonzalo','','','',0,1,'2023-05-28 22:26:44.472891'),(16,'pbkdf2_sha256$390000$Jh6OYKQaND9BWwaDNc4Yd9$DYJeFkDbJE22tTO5ixbEDlr2MQoemwddU62ob2s96PM=',NULL,0,'Leandro','','','',0,1,'2023-05-28 22:27:31.872265');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita_inscripcion`
--

DROP TABLE IF EXISTS `cita_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita_inscripcion` (
  `Id_cita` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time(6) NOT NULL,
  `Historial_id` int NOT NULL,
  PRIMARY KEY (`Id_cita`),
  KEY `Cita_Inscripcion_Historial_id_5b629aad_fk_Historial` (`Historial_id`),
  CONSTRAINT `Cita_Inscripcion_Historial_id_5b629aad_fk_Historial` FOREIGN KEY (`Historial_id`) REFERENCES `historial_academico` (`Id_Historial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_inscripcion`
--

LOCK TABLES `cita_inscripcion` WRITE;
/*!40000 ALTER TABLE `cita_inscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupo_credito`
--

DROP TABLE IF EXISTS `cupo_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupo_credito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Creditos_Adicionales` int NOT NULL,
  `Cupo_Creditos` int NOT NULL,
  `Creditos_Disponibles` int NOT NULL,
  `Creditos_Doble_titulacion` int NOT NULL,
  `Historial_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Historial_id` (`Historial_id`),
  CONSTRAINT `Cupo_Credito_Historial_id_25ac58c7_fk_Historial` FOREIGN KEY (`Historial_id`) REFERENCES `historial_academico` (`Id_Historial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupo_credito`
--

LOCK TABLES `cupo_credito` WRITE;
/*!40000 ALTER TABLE `cupo_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupo_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decano`
--

DROP TABLE IF EXISTS `decano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decano` (
  `Id_decano` int NOT NULL AUTO_INCREMENT,
  `Ejerciendo` tinyint(1) NOT NULL,
  `Docente_id` int NOT NULL,
  PRIMARY KEY (`Id_decano`),
  UNIQUE KEY `Docente_id` (`Docente_id`),
  CONSTRAINT `Decano_Docente_id_5d4e2f6f_fk_Docente_Id_docente` FOREIGN KEY (`Docente_id`) REFERENCES `docente` (`Id_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decano`
--

LOCK TABLES `decano` WRITE;
/*!40000 ALTER TABLE `decano` DISABLE KEYS */;
/*!40000 ALTER TABLE `decano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Id_departamento` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Facultad_id` int NOT NULL,
  PRIMARY KEY (`Id_departamento`),
  KEY `Departamento_Facultad_id_f0a961df_fk_Facultad_Id_Facultad` (`Facultad_id`),
  CONSTRAINT `Departamento_Facultad_id_f0a961df_fk_Facultad_Id_Facultad` FOREIGN KEY (`Facultad_id`) REFERENCES `facultad` (`Id_Facultad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-27 01:08:42.529901','3213131','Nombre: Juan ',1,'[{\"added\": {}}]',19,1),(2,'2023-05-27 01:08:49.379293','1','estudiante object (1)',1,'[{\"added\": {}}]',11,1),(3,'2023-05-27 01:09:05.964099','1','Sede object (1)',1,'[{\"added\": {}}]',15,1),(4,'2023-05-27 01:09:12.326499','1','Departamento object (1)',1,'[{\"added\": {}}]',9,1),(5,'2023-05-27 01:09:15.731276','1','Facultad object (1)',1,'[{\"added\": {}}]',12,1),(6,'2023-05-27 01:09:29.848128','313133','Programa object (313133)',1,'[{\"added\": {}}]',18,1),(7,'2023-05-27 01:09:33.142457','1','Historial_Academico object (1)',1,'[{\"added\": {}}]',14,1),(8,'2023-05-27 01:09:35.129070','1','Cita_Inscripcion object (1)',1,'[{\"added\": {}}]',8,1),(9,'2023-05-27 01:09:43.958513','1','Inscripcion_cancelacion object (1)',1,'[{\"added\": {}}]',20,1),(10,'2023-05-27 01:10:08.627194','2','Pedro15',1,'[{\"added\": {}}]',4,1),(11,'2023-05-27 01:10:24.081315','1323133','Nombre: Lucila ',1,'[{\"added\": {}}]',19,1),(12,'2023-05-27 01:10:29.487614','1','Docente object (1)',1,'[{\"added\": {}}]',10,1),(13,'2023-05-27 01:10:49.601078','1','Asignatura object (1)',1,'[{\"added\": {}}]',7,1),(14,'2023-05-27 01:10:56.343133','1','Grupo object (1)',1,'[{\"added\": {}}]',13,1),(15,'2023-05-27 01:10:58.687262','1','Inscripcion_cancelacion_grupo object (1)',1,'[{\"added\": {}}]',25,1),(16,'2023-05-27 01:14:41.494317','7','Notas object (7)',1,'[{\"added\": {}}]',24,1),(17,'2023-05-27 01:14:45.909729','7','Notas object (7)',3,'',24,1),(18,'2023-05-27 01:15:13.677298','8','Notas object (8)',1,'[{\"added\": {}}]',24,1),(19,'2023-05-27 01:16:22.158146','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(20,'2023-05-27 01:34:11.364857','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\", \"Nota Definitiva\"]}}]',24,1),(21,'2023-05-27 01:34:51.092457','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(22,'2023-05-27 01:40:47.315289','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(23,'2023-05-27 01:44:18.059657','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(24,'2023-05-27 04:26:58.381068','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(25,'2023-05-27 04:27:04.264323','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(26,'2023-05-27 05:01:28.302853','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Primer Corte\"]}}]',24,1),(27,'2023-05-27 15:02:04.487584','2','Grupo object (2)',1,'[{\"added\": {}}]',13,1),(28,'2023-05-27 15:13:01.529980','2','Inscripcion_cancelacion_grupo object (2)',1,'[{\"added\": {}}]',25,1),(29,'2023-05-27 15:14:58.875261','2','Inscripcion_cancelacion_grupo object (2)',3,'',25,1),(30,'2023-05-27 15:39:05.550668','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Primer Corte\"]}}]',24,1),(31,'2023-05-27 15:39:15.683167','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(32,'2023-05-27 15:42:16.402404','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Primer Corte\"]}}]',24,1),(33,'2023-05-27 15:43:33.776908','3','Inscripcion_cancelacion_grupo object (3)',3,'',25,1),(34,'2023-05-27 15:43:38.593671','5','Inscripcion_cancelacion_grupo object (5)',1,'[{\"added\": {}}]',25,1),(35,'2023-05-27 15:44:37.217663','5','Inscripcion_cancelacion_grupo object (5)',3,'',25,1),(36,'2023-05-27 15:44:41.726251','6','Inscripcion_cancelacion_grupo object (6)',1,'[{\"added\": {}}]',25,1),(37,'2023-05-27 15:45:53.311487','6','Inscripcion_cancelacion_grupo object (6)',3,'',25,1),(38,'2023-05-27 15:45:57.703539','7','Inscripcion_cancelacion_grupo object (7)',1,'[{\"added\": {}}]',25,1),(39,'2023-05-27 15:46:44.370585','7','Inscripcion_cancelacion_grupo object (7)',3,'',25,1),(40,'2023-05-27 15:46:54.795362','8','Inscripcion_cancelacion_grupo object (8)',1,'[{\"added\": {}}]',25,1),(41,'2023-05-27 15:47:07.093164','9','Inscripcion_cancelacion_grupo object (9)',1,'[{\"added\": {}}]',25,1),(42,'2023-05-27 15:48:17.691919','9','Inscripcion_cancelacion_grupo object (9)',3,'',25,1),(43,'2023-05-27 15:48:21.581545','10','Inscripcion_cancelacion_grupo object (10)',1,'[{\"added\": {}}]',25,1),(44,'2023-05-27 15:49:07.416574','1','Inscripcion_cancelacion_grupo object (1)',3,'',25,1),(45,'2023-05-27 18:32:49.052681','9','Notas object (9)',1,'[{\"added\": {}}]',24,1),(46,'2023-05-27 18:32:58.022577','9','Notas object (9)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\", \"Tercer Corte\"]}}]',24,1),(47,'2023-05-27 18:33:26.500263','9','Notas object (9)',2,'[]',24,1),(48,'2023-05-27 18:35:24.920260','10','Notas object (10)',1,'[{\"added\": {}}]',24,1),(49,'2023-05-27 18:35:33.095508','10','Notas object (10)',2,'[{\"changed\": {\"fields\": [\"Primer Corte\", \"Segundo Corte\", \"Tercer Corte\"]}}]',24,1),(50,'2023-05-27 18:36:27.655678','10','Notas object (10)',2,'[]',24,1),(51,'2023-05-27 18:38:03.376101','1','Cupo_Creditos object (1)',1,'[{\"added\": {}}]',23,1),(52,'2023-05-27 18:38:12.561535','10','Notas object (10)',3,'',24,1),(53,'2023-05-27 18:38:15.578794','9','Notas object (9)',3,'',24,1),(54,'2023-05-27 18:38:45.177504','1','Resumen_Creditos object (1)',2,'[{\"changed\": {\"fields\": [\"Creditos Exigidos\", \"Creditos Aprobados\", \"Pendientes\", \"Inscritos\", \"Cursados\"]}}]',16,1),(55,'2023-05-27 18:38:54.328619','11','Notas object (11)',1,'[{\"added\": {}}]',24,1),(56,'2023-05-27 18:39:00.617908','11','Notas object (11)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\", \"Tercer Corte\"]}}]',24,1),(57,'2023-05-27 18:39:12.855415','11','Notas object (11)',2,'[]',24,1),(58,'2023-05-27 18:39:36.834289','1','Resumen_Creditos object (1)',3,'',16,1),(59,'2023-05-27 18:40:22.175249','4','Resumen_Creditos object (4)',1,'[{\"added\": {}}]',16,1),(60,'2023-05-27 18:40:36.858697','11','Inscripcion_cancelacion_grupo object (11)',1,'[{\"added\": {}}]',25,1),(61,'2023-05-27 18:41:52.854185','11','Notas object (11)',3,'',24,1),(62,'2023-05-27 18:42:02.009310','12','Notas object (12)',1,'[{\"added\": {}}]',24,1),(63,'2023-05-27 18:42:07.284758','12','Notas object (12)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\", \"Tercer Corte\"]}}]',24,1),(64,'2023-05-27 18:42:47.399340','12','Notas object (12)',2,'[]',24,1),(65,'2023-05-27 18:43:21.885480','1','Cupo_Creditos object (1)',2,'[{\"changed\": {\"fields\": [\"Creditos Disponibles\"]}}]',23,1),(66,'2023-05-27 18:43:32.157728','12','Notas object (12)',3,'',24,1),(67,'2023-05-27 18:43:46.890781','13','Notas object (13)',1,'[{\"added\": {}}]',24,1),(68,'2023-05-27 18:43:56.699187','13','Notas object (13)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(69,'2023-05-27 18:44:28.746446','13','Notas object (13)',2,'[]',24,1),(70,'2023-05-27 18:44:46.103315','13','Notas object (13)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(71,'2023-05-27 18:45:40.311305','1','Cupo_Creditos object (1)',2,'[{\"changed\": {\"fields\": [\"Creditos Disponibles\"]}}]',23,1),(72,'2023-05-27 18:46:05.425165','14','Notas object (14)',1,'[{\"added\": {}}]',24,1),(73,'2023-05-27 18:46:11.370184','14','Notas object (14)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(74,'2023-05-27 19:38:56.582892','1','Historial_Academico object (1)',3,'',14,1),(75,'2023-05-27 19:39:07.469656','2','Historial_Academico object (2)',1,'[{\"added\": {}}]',14,1),(76,'2023-05-27 19:42:23.744693','2','Historial_Academico object (2)',3,'',14,1),(77,'2023-05-27 19:47:12.539452','3','Historial_Academico object (3)',1,'[{\"added\": {}}]',14,1),(78,'2023-05-27 19:50:23.157035','3','Historial_Academico object (3)',3,'',14,1),(79,'2023-05-27 19:50:28.152726','4','Historial_Academico object (4)',1,'[{\"added\": {}}]',14,1),(80,'2023-05-27 19:50:59.555005','4','Historial_Academico object (4)',3,'',14,1),(81,'2023-05-27 19:51:06.180655','5','Historial_Academico object (5)',1,'[{\"added\": {}}]',14,1),(82,'2023-05-27 19:56:48.089302','2','Cita_Inscripcion object (2)',1,'[{\"added\": {}}]',8,1),(83,'2023-05-27 19:57:03.145498','2','Inscripcion_cancelacion object (2)',1,'[{\"added\": {}}]',20,1),(84,'2023-05-27 20:02:36.964285','17','Inscripcion_cancelacion_grupo object (17)',1,'[{\"added\": {}}]',25,1),(85,'2023-05-27 20:05:26.498417','22','Inscripcion_cancelacion_grupo object (22)',1,'[{\"added\": {}}]',25,1),(86,'2023-05-27 20:06:51.772849','15','Notas object (15)',1,'[{\"added\": {}}]',24,1),(87,'2023-05-27 20:07:08.520360','15','Notas object (15)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(88,'2023-05-27 20:10:01.376561','22','Inscripcion_cancelacion_grupo object (22)',3,'',25,1),(89,'2023-05-28 18:29:24.248264','3','Sergio',1,'[{\"added\": {}}]',4,1),(90,'2023-05-28 18:31:17.105988','1215','Nombre: Sergio ',1,'[{\"added\": {}}]',19,1),(91,'2023-05-28 18:31:34.531049','1215','Nombre: Sergio ',3,'',19,1),(92,'2023-05-28 18:32:02.833803','13131','Nombre: Sergio ',1,'[{\"added\": {}}]',19,1),(93,'2023-05-28 18:32:17.251657','13131','Nombre: Sergio ',3,'',19,1),(94,'2023-05-28 18:33:27.340454','21321313','Nombre: Sergio ',1,'[{\"added\": {}}]',19,1),(95,'2023-05-28 19:43:12.827116','21321313','Nombre: Sergio ',3,'',19,1),(96,'2023-05-28 19:43:28.313477','312313','Nombre: Sergio ',1,'[{\"added\": {}}]',19,1),(97,'2023-05-28 21:47:16.890907','3','Sergio',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(98,'2023-05-28 22:18:10.749710','1','estudiante object (1)',2,'[{\"changed\": {\"fields\": [\"Persona Vinculada\"]}}]',11,1),(99,'2023-05-28 22:18:14.738194','5','Historial_Academico object (5)',2,'[]',14,1),(100,'2023-05-28 22:19:14.346937','1','Residencia object (1)',1,'[{\"added\": {}}]',17,1),(101,'2023-05-28 22:22:45.488724','4','Daniel',1,'[{\"added\": {}}]',4,1),(102,'2023-05-28 22:22:57.611420','2','Pedro15',3,'',4,1),(103,'2023-05-28 22:23:11.027132','5','Daniela',1,'[{\"added\": {}}]',4,1),(104,'2023-05-28 22:23:23.221128','6','Camilo',1,'[{\"added\": {}}]',4,1),(105,'2023-05-28 22:23:48.224630','7','Diana',1,'[{\"added\": {}}]',4,1),(106,'2023-05-28 22:24:01.825325','8','Elizabeth',1,'[{\"added\": {}}]',4,1),(107,'2023-05-28 22:24:12.755409','9','Anna',1,'[{\"added\": {}}]',4,1),(108,'2023-05-28 22:24:23.504357','10','Andrea',1,'[{\"added\": {}}]',4,1),(109,'2023-05-28 22:24:29.708942','11','Alejandro',1,'[{\"added\": {}}]',4,1),(110,'2023-05-28 22:24:37.475337','12','Mauricio',1,'[{\"added\": {}}]',4,1),(111,'2023-05-28 22:26:10.040898','13','Antonia',1,'[{\"added\": {}}]',4,1),(112,'2023-05-28 22:26:24.980250','14','Antonio',1,'[{\"added\": {}}]',4,1),(113,'2023-05-28 22:26:44.748006','15','Gonzalo',1,'[{\"added\": {}}]',4,1),(114,'2023-05-28 22:27:32.124911','16','Leandro',1,'[{\"added\": {}}]',4,1),(115,'2023-05-28 23:46:23.109752','88','Facultad object (88)',3,'',12,1),(116,'2023-05-28 23:46:23.115755','87','Facultad object (87)',3,'',12,1),(117,'2023-05-28 23:46:23.120301','86','Facultad object (86)',3,'',12,1),(118,'2023-05-28 23:46:23.124305','85','Facultad object (85)',3,'',12,1),(119,'2023-05-28 23:46:23.127308','84','Facultad object (84)',3,'',12,1),(120,'2023-05-28 23:46:23.129822','83','Facultad object (83)',3,'',12,1),(121,'2023-05-28 23:46:23.133321','82','Facultad object (82)',3,'',12,1),(122,'2023-05-28 23:46:23.136320','81','Facultad object (81)',3,'',12,1),(123,'2023-05-28 23:46:23.139322','80','Facultad object (80)',3,'',12,1),(124,'2023-05-28 23:46:23.143985','79','Facultad object (79)',3,'',12,1),(125,'2023-05-28 23:46:23.146986','78','Facultad object (78)',3,'',12,1),(126,'2023-05-28 23:46:23.149985','77','Facultad object (77)',3,'',12,1),(127,'2023-05-28 23:46:23.153542','76','Facultad object (76)',3,'',12,1),(128,'2023-05-28 23:46:23.156542','75','Facultad object (75)',3,'',12,1),(129,'2023-05-28 23:46:23.160543','74','Facultad object (74)',3,'',12,1),(130,'2023-05-28 23:46:23.164175','73','Facultad object (73)',3,'',12,1),(131,'2023-05-28 23:46:23.167176','72','Facultad object (72)',3,'',12,1),(132,'2023-05-28 23:46:23.170176','71','Facultad object (71)',3,'',12,1),(133,'2023-05-28 23:46:23.174791','70','Facultad object (70)',3,'',12,1),(134,'2023-05-28 23:46:23.177791','69','Facultad object (69)',3,'',12,1),(135,'2023-05-28 23:46:23.181791','68','Facultad object (68)',3,'',12,1),(136,'2023-05-28 23:46:23.184353','67','Facultad object (67)',3,'',12,1),(137,'2023-05-28 23:46:23.188358','66','Facultad object (66)',3,'',12,1),(138,'2023-05-28 23:46:23.190358','65','Facultad object (65)',3,'',12,1),(139,'2023-05-28 23:46:23.193875','64','Facultad object (64)',3,'',12,1),(140,'2023-05-28 23:46:23.196361','63','Facultad object (63)',3,'',12,1),(141,'2023-05-28 23:46:23.199360','62','Facultad object (62)',3,'',12,1),(142,'2023-05-28 23:46:23.202361','61','Facultad object (61)',3,'',12,1),(143,'2023-05-28 23:46:23.206563','60','Facultad object (60)',3,'',12,1),(144,'2023-05-28 23:46:23.209562','59','Facultad object (59)',3,'',12,1),(145,'2023-05-28 23:46:23.212564','58','Facultad object (58)',3,'',12,1),(146,'2023-05-28 23:46:23.216108','57','Facultad object (57)',3,'',12,1),(147,'2023-05-28 23:46:23.220113','56','Facultad object (56)',3,'',12,1),(148,'2023-05-28 23:46:23.224114','55','Facultad object (55)',3,'',12,1),(149,'2023-05-28 23:46:23.227675','54','Facultad object (54)',3,'',12,1),(150,'2023-05-28 23:46:23.231676','53','Facultad object (53)',3,'',12,1),(151,'2023-05-28 23:46:23.236674','52','Facultad object (52)',3,'',12,1),(152,'2023-05-28 23:46:23.239746','51','Facultad object (51)',3,'',12,1),(153,'2023-05-28 23:46:23.242747','50','Facultad object (50)',3,'',12,1),(154,'2023-05-28 23:46:23.244748','49','Facultad object (49)',3,'',12,1),(155,'2023-05-28 23:46:23.245747','48','Facultad object (48)',3,'',12,1),(156,'2023-05-28 23:46:23.249279','47','Facultad object (47)',3,'',12,1),(157,'2023-05-28 23:46:23.251902','46','Facultad object (46)',3,'',12,1),(158,'2023-05-28 23:46:23.254903','45','Facultad object (45)',3,'',12,1),(159,'2023-05-28 23:46:23.256902','44','Facultad object (44)',3,'',12,1),(160,'2023-05-28 23:46:23.260005','43','Facultad object (43)',3,'',12,1),(161,'2023-05-28 23:46:23.265006','42','Facultad object (42)',3,'',12,1),(162,'2023-05-28 23:46:23.267005','41','Facultad object (41)',3,'',12,1),(163,'2023-05-28 23:46:23.271560','40','Facultad object (40)',3,'',12,1),(164,'2023-05-28 23:46:23.273559','39','Facultad object (39)',3,'',12,1),(165,'2023-05-28 23:46:23.276560','38','Facultad object (38)',3,'',12,1),(166,'2023-05-28 23:46:23.279071','37','Facultad object (37)',3,'',12,1),(167,'2023-05-28 23:46:23.281416','36','Facultad object (36)',3,'',12,1),(168,'2023-05-28 23:46:23.283416','35','Facultad object (35)',3,'',12,1),(169,'2023-05-28 23:46:23.286417','34','Facultad object (34)',3,'',12,1),(170,'2023-05-28 23:46:23.289931','33','Facultad object (33)',3,'',12,1),(171,'2023-05-28 23:46:23.293974','32','Facultad object (32)',3,'',12,1),(172,'2023-05-28 23:46:23.296973','31','Facultad object (31)',3,'',12,1),(173,'2023-05-28 23:46:23.298974','30','Facultad object (30)',3,'',12,1),(174,'2023-05-28 23:46:23.302525','29','Facultad object (29)',3,'',12,1),(175,'2023-05-28 23:46:23.304525','28','Facultad object (28)',3,'',12,1),(176,'2023-05-28 23:46:23.306527','27','Facultad object (27)',3,'',12,1),(177,'2023-05-28 23:46:23.308527','26','Facultad object (26)',3,'',12,1),(178,'2023-05-28 23:46:23.311038','25','Facultad object (25)',3,'',12,1),(179,'2023-05-28 23:46:23.314069','24','Facultad object (24)',3,'',12,1),(180,'2023-05-28 23:46:23.316068','22','Facultad object (22)',3,'',12,1),(181,'2023-05-28 23:46:23.319067','21','Facultad object (21)',3,'',12,1),(182,'2023-05-28 23:46:23.320066','20','Facultad object (20)',3,'',12,1),(183,'2023-05-28 23:46:23.323599','19','Facultad object (19)',3,'',12,1),(184,'2023-05-28 23:46:23.326595','18','Facultad object (18)',3,'',12,1),(185,'2023-05-28 23:46:23.328596','17','Facultad object (17)',3,'',12,1),(186,'2023-05-28 23:46:23.330596','16','Facultad object (16)',3,'',12,1),(187,'2023-05-28 23:46:23.333649','15','Facultad object (15)',3,'',12,1),(188,'2023-05-28 23:46:23.336648','14','Facultad object (14)',3,'',12,1),(189,'2023-05-28 23:46:23.339648','13','Facultad object (13)',3,'',12,1),(190,'2023-05-28 23:46:23.341648','12','Facultad object (12)',3,'',12,1),(191,'2023-05-28 23:46:23.343218','11','Facultad object (11)',3,'',12,1),(192,'2023-05-28 23:46:23.346218','10','Facultad object (10)',3,'',12,1),(193,'2023-05-28 23:46:23.348218','9','Facultad object (9)',3,'',12,1),(194,'2023-05-28 23:46:23.351730','8','Facultad object (8)',3,'',12,1),(195,'2023-05-28 23:46:23.354921','7','Facultad object (7)',3,'',12,1),(196,'2023-05-28 23:46:23.360923','6','Facultad object (6)',3,'',12,1),(197,'2023-05-28 23:46:23.362924','5','Facultad object (5)',3,'',12,1),(198,'2023-05-28 23:46:23.365840','4','Facultad object (4)',3,'',12,1),(199,'2023-05-28 23:46:23.367840','3','Facultad object (3)',3,'',12,1),(200,'2023-05-28 23:46:23.370842','2','Facultad object (2)',3,'',12,1),(201,'2023-05-28 23:46:23.375361','1','Facultad object (1)',3,'',12,1),(202,'2023-05-30 23:32:37.783832','1','Estudiante',1,'[{\"added\": {}}]',3,1),(203,'2023-05-30 23:32:48.510966','1','root',2,'[]',4,1),(204,'2023-05-30 23:36:49.620091','1','root',2,'[]',4,1),(205,'2023-05-30 23:37:21.027845','2','Prueba',1,'[{\"added\": {}}]',3,1),(206,'2023-05-30 23:37:30.889056','1','root',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'academico','asignatura'),(8,'academico','cita_inscripcion'),(23,'academico','cupo_creditos'),(22,'academico','decano'),(9,'academico','departamento'),(10,'academico','docente'),(21,'academico','espacio'),(11,'academico','estudiante'),(12,'academico','facultad'),(13,'academico','grupo'),(14,'academico','historial_academico'),(20,'academico','inscripcion_cancelacion'),(25,'academico','inscripcion_cancelacion_grupo'),(24,'academico','notas'),(26,'academico','pago_semestre'),(19,'academico','persona_vinculada'),(18,'academico','programa'),(17,'academico','residencia'),(16,'academico','resumen_creditos'),(15,'academico','sede'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-27 00:33:15.665498'),(2,'auth','0001_initial','2023-05-27 00:33:16.095240'),(3,'academico','0001_initial','2023-05-27 00:33:17.462070'),(4,'admin','0001_initial','2023-05-27 00:33:17.595842'),(5,'admin','0002_logentry_remove_auto_add','2023-05-27 00:33:17.617019'),(6,'admin','0003_logentry_add_action_flag_choices','2023-05-27 00:33:17.636404'),(7,'contenttypes','0002_remove_content_type_name','2023-05-27 00:33:17.766234'),(8,'auth','0002_alter_permission_name_max_length','2023-05-27 00:33:17.845069'),(9,'auth','0003_alter_user_email_max_length','2023-05-27 00:33:17.894074'),(10,'auth','0004_alter_user_username_opts','2023-05-27 00:33:17.908075'),(11,'auth','0005_alter_user_last_login_null','2023-05-27 00:33:18.015600'),(12,'auth','0006_require_contenttypes_0002','2023-05-27 00:33:18.022128'),(13,'auth','0007_alter_validators_add_error_messages','2023-05-27 00:33:18.042137'),(14,'auth','0008_alter_user_username_max_length','2023-05-27 00:33:18.132480'),(15,'auth','0009_alter_user_last_name_max_length','2023-05-27 00:33:18.221419'),(16,'auth','0010_alter_group_name_max_length','2023-05-27 00:33:18.292592'),(17,'auth','0011_update_proxy_permissions','2023-05-27 00:33:18.345458'),(18,'auth','0012_alter_user_first_name_max_length','2023-05-27 00:33:18.433849'),(19,'sessions','0001_initial','2023-05-27 00:33:18.472911'),(20,'academico','0002_notas_remove_inscripcion_cancelacion_grupo','2023-05-27 00:52:03.527986'),(21,'academico','0003_inscripcion_cancelacion_grupo_notas_inscripcion','2023-05-27 00:53:18.429160'),(22,'academico','0004_notas_historial','2023-05-27 00:56:27.486571'),(23,'academico','0005_alter_notas_options_alter_notas_nota_definitiva_and_more','2023-05-27 01:12:48.273235'),(24,'academico','0006_alter_cupo_creditos_creditos_disponibles_and_more','2023-05-27 03:04:11.705573'),(25,'academico','0007_alter_resumen_creditos_creditos_aprobados_and_more','2023-05-27 04:16:19.242005'),(26,'academico','0008_alter_cupo_creditos_creditos_adicionales_and_more','2023-05-27 18:37:52.020769'),(27,'academico','0009_alter_cupo_creditos_creditos_disponibles','2023-05-27 19:49:30.592608'),(28,'academico','0010_pago_semestre','2023-05-27 22:12:59.084313'),(29,'academico','0011_alter_espacio_dia','2023-05-28 22:33:47.497866'),(30,'academico','0012_alter_departamento_sede_alter_facultad_departamento','2023-05-28 23:13:07.498294'),(31,'academico','0013_rename_sede_departamento_facultad_and_more','2023-05-28 23:15:53.072811'),(32,'academico','0014_alter_facultad_nombre','2023-05-28 23:33:54.533319');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1op7yepo888mqs66h13oozdeglzy04su','.eJxVy0sKwjAUheG9ZCwlNw9MHAquI9xXSNAqmHYk7t0KHej0O-d_mYLr0so69Fm6mJMBc_g1Qr7q_Tsgo-jc-THtNqbLjP123h9_WcPRtsalypYRbOUkjFhzjNm6BEdMgSES-UQiwdmqWjOFYD1EJCW3mRfz_gCJtDSO:1q48te:XMY_kpJWb8NkW2RR--V_SgX1aoWus_9LxAcRz9qKmFY','2023-06-13 23:36:58.977101'),('ezqfhgqgzf57r9mdovioi1dpaphh36sv','.eJxVy0sKwjAUheG9ZCwlNw9MHAquI9xXSNAqmHYk7t0KHej0O-d_mYLr0so69Fm6mJMBc_g1Qr7q_Tsgo-jc-THtNqbLjP123h9_WcPRtsalypYRbOUkjFhzjNm6BEdMgSES-UQiwdmqWjOFYD1EJCW3mRfz_gCJtDSO:1q43Fb:_NfRGSI7QIGgpBsPvicG5DuyqCjP0n8sIHZyAYkSe88','2023-06-13 17:35:15.182759'),('u7dy5z5mobprldt4lk9fhqad3qqwfsah','.eJxVjMsOwiAUBf-FtSE8I7h07zeQ-wCpGkhKuzL-u23ShW5n5py3SLAuNa0jz2licRFanH4ZAj1z2wU_oN27pN6WeUK5J_KwQ94659f1aP8OKoy6rU0opAi0KhSYAEr0PioT9BmCI-0RbUBmZ1TJuUR0TlntATOajVkWny__1zhz:1q2hvz:Esp_18aB2459x1vGcHgFgTmD2xodvgyhlZQpRf6ahrw','2023-06-10 00:37:27.623153');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `Id_docente` int NOT NULL AUTO_INCREMENT,
  `Ocasional` tinyint(1) NOT NULL,
  `Persona_Vinculada_id` int NOT NULL,
  `Sede_id` int NOT NULL,
  PRIMARY KEY (`Id_docente`),
  UNIQUE KEY `Persona_Vinculada_id` (`Persona_Vinculada_id`),
  UNIQUE KEY `Sede_id` (`Sede_id`),
  CONSTRAINT `Docente_Persona_Vinculada_id_a0f1f2ad_fk_Persona_v` FOREIGN KEY (`Persona_Vinculada_id`) REFERENCES `persona_vinculada` (`Documento`),
  CONSTRAINT `Docente_Sede_id_2a59f21e_fk_Sede_ID_sede` FOREIGN KEY (`Sede_id`) REFERENCES `sede` (`ID_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `Id_estudiante` int NOT NULL AUTO_INCREMENT,
  `Peama` tinyint(1) NOT NULL,
  `Persona_Vinculada_id` int NOT NULL,
  PRIMARY KEY (`Id_estudiante`),
  UNIQUE KEY `Persona_Vinculada_id` (`Persona_Vinculada_id`),
  CONSTRAINT `Estudiante_Persona_Vinculada_id_0771ced9_fk_Persona_v` FOREIGN KEY (`Persona_Vinculada_id`) REFERENCES `persona_vinculada` (`Documento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,0,312313);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `Id_Facultad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  `Sede_id` int NOT NULL,
  PRIMARY KEY (`Id_Facultad`),
  KEY `Facultad_Sede_id_6a437dd7_fk_Sede_ID_sede` (`Sede_id`),
  KEY `busqueda_facultad` (`Id_Facultad`,`Nombre`),
  CONSTRAINT `Facultad_Sede_id_6a437dd7_fk_Sede_ID_sede` FOREIGN KEY (`Sede_id`) REFERENCES `sede` (`ID_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (89,'Artes',1),(90,'Artes',2),(91,'Artes',3),(92,'Artes',4),(93,'Artes',5),(94,'Artes',6),(95,'Artes',7),(96,'Artes',8),(97,'Ciencias Humanas',1),(98,'Ciencias Humanas',2),(99,'Ciencias Humanas',3),(100,'Ciencias Humanas',4),(101,'Ciencias Humanas',5),(102,'Ciencias Humanas',6),(103,'Ciencias Humanas',7),(104,'Ciencias Humanas',8),(105,'Ingeneria',1),(106,'Ingeneria',2),(107,'Ingeneria',3),(108,'Ingeneria',4),(109,'Ingeneria',5),(110,'Ingeneria',6),(111,'Ingeneria',7),(112,'Ingeneria',8),(113,'Ciencias',1),(114,'Ciencias',2),(115,'Ciencias',3),(116,'Ciencias',4),(117,'Ciencias',5),(118,'Ciencias',6),(119,'Ciencias',7),(120,'Ciencias',8),(121,'Ciencias Económicas',1),(122,'Ciencias Económicas',2),(123,'Ciencias Económicas',3),(124,'Ciencias Económicas',4),(125,'Ciencias Económicas',5),(126,'Ciencias Económicas',6),(127,'Ciencias Económicas',7),(128,'Ciencias Económicas',8),(129,'Medicina',1),(130,'Odontologia',1),(131,'Medicina Veterinaria y Zootecnia',1),(132,'Medicina Veterinaria y Zootecnia',2),(133,'Medicina Veterinaria y Zootecnia',3),(134,'Ciencias Agrarias',1),(135,'Ciencias Agrarias',2),(136,'Ciencias Agrarias',3),(137,'Enfermeria',1),(138,'Derecho, Ciencias politicas y sociales',1),(139,'Derecho, Ciencias politicas y sociales',2);
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `Id_grupo` int NOT NULL AUTO_INCREMENT,
  `Numero_grupo` int NOT NULL,
  `Cupos` int NOT NULL,
  `Asignatura_id` int NOT NULL,
  `Profesor_id` int NOT NULL,
  PRIMARY KEY (`Id_grupo`),
  KEY `Grupo_Asignatura_id_1580fb29_fk_Asignatura_Codigo` (`Asignatura_id`),
  KEY `Grupo_Profesor_id_bbaa5c5d_fk_Docente_Id_docente` (`Profesor_id`),
  CONSTRAINT `Grupo_Asignatura_id_1580fb29_fk_Asignatura_Codigo` FOREIGN KEY (`Asignatura_id`) REFERENCES `asignatura` (`Codigo`),
  CONSTRAINT `Grupo_Profesor_id_bbaa5c5d_fk_Docente_Id_docente` FOREIGN KEY (`Profesor_id`) REFERENCES `docente` (`Id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_academico`
--

DROP TABLE IF EXISTS `historial_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_academico` (
  `Id_Historial` int NOT NULL AUTO_INCREMENT,
  `Papa` double NOT NULL,
  `Papi` double NOT NULL,
  `Pa` double NOT NULL,
  `Matriculas` int NOT NULL,
  `Estudiante_id` int NOT NULL,
  `Programa_id` int NOT NULL,
  PRIMARY KEY (`Id_Historial`),
  UNIQUE KEY `Programa_id` (`Programa_id`),
  KEY `Historial_Academico_Estudiante_id_34ac7fc9_fk_Estudiant` (`Estudiante_id`),
  CONSTRAINT `Historial_Academico_Estudiante_id_34ac7fc9_fk_Estudiant` FOREIGN KEY (`Estudiante_id`) REFERENCES `estudiante` (`Id_estudiante`),
  CONSTRAINT `Historial_Academico_Programa_id_fab1e4a9_fk_Programa_` FOREIGN KEY (`Programa_id`) REFERENCES `programa` (`Codigo_SNIES`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_academico`
--

LOCK TABLES `historial_academico` WRITE;
/*!40000 ALTER TABLE `historial_academico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion_cancelacion`
--

DROP TABLE IF EXISTS `inscripcion_cancelacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion_cancelacion` (
  `Id_incripcion` int NOT NULL AUTO_INCREMENT,
  `Creditos_Disponibles` int NOT NULL,
  `Semestre` int NOT NULL,
  `Cita_id` int NOT NULL,
  PRIMARY KEY (`Id_incripcion`),
  UNIQUE KEY `Cita_id` (`Cita_id`),
  CONSTRAINT `Inscripcion_cancelac_Cita_id_0d7a53b1_fk_Cita_Insc` FOREIGN KEY (`Cita_id`) REFERENCES `cita_inscripcion` (`Id_cita`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion_cancelacion`
--

LOCK TABLES `inscripcion_cancelacion` WRITE;
/*!40000 ALTER TABLE `inscripcion_cancelacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripcion_cancelacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion_cancelacion_grupo`
--

DROP TABLE IF EXISTS `inscripcion_cancelacion_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion_cancelacion_grupo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Grupo_id` int NOT NULL,
  `Inscripcion_id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Inscripcion_cancelac_Grupo_id_fc94b8fd_fk_Grupo_Id_` (`Grupo_id`),
  KEY `Inscripcion_cancelac_Inscripcion_id_284d162b_fk_Inscripci` (`Inscripcion_id`),
  CONSTRAINT `Inscripcion_cancelac_Grupo_id_fc94b8fd_fk_Grupo_Id_` FOREIGN KEY (`Grupo_id`) REFERENCES `grupo` (`Id_grupo`),
  CONSTRAINT `Inscripcion_cancelac_Inscripcion_id_284d162b_fk_Inscripci` FOREIGN KEY (`Inscripcion_id`) REFERENCES `inscripcion_cancelacion` (`Id_incripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion_cancelacion_grupo`
--

LOCK TABLES `inscripcion_cancelacion_grupo` WRITE;
/*!40000 ALTER TABLE `inscripcion_cancelacion_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripcion_cancelacion_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `Id_Nota` int NOT NULL AUTO_INCREMENT,
  `Primer_Corte` double DEFAULT NULL,
  `Segundo_Corte` double DEFAULT NULL,
  `Tercer_Corte` double DEFAULT NULL,
  `Nota_Definitiva` double DEFAULT NULL,
  `Aprobada` tinyint(1) NOT NULL,
  `Inscripcion_id` int NOT NULL,
  PRIMARY KEY (`Id_Nota`),
  KEY `Notas_Inscripcion_id_a2464d71_fk_Inscripci` (`Inscripcion_id`),
  CONSTRAINT `Notas_Inscripcion_id_a2464d71_fk_Inscripci` FOREIGN KEY (`Inscripcion_id`) REFERENCES `inscripcion_cancelacion_grupo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_historial`
--

DROP TABLE IF EXISTS `notas_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_historial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notas_id` int NOT NULL,
  `historial_academico_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Notas_Historial_notas_id_historial_academico_id_11cc9090_uniq` (`notas_id`,`historial_academico_id`),
  KEY `Notas_Historial_historial_academico__fe8a0e0f_fk_Historial` (`historial_academico_id`),
  CONSTRAINT `Notas_Historial_historial_academico__fe8a0e0f_fk_Historial` FOREIGN KEY (`historial_academico_id`) REFERENCES `historial_academico` (`Id_Historial`),
  CONSTRAINT `Notas_Historial_notas_id_96dc0ade_fk_Notas_Id_Nota` FOREIGN KEY (`notas_id`) REFERENCES `notas` (`Id_Nota`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_historial`
--

LOCK TABLES `notas_historial` WRITE;
/*!40000 ALTER TABLE `notas_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_semestre`
--

DROP TABLE IF EXISTS `pago_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_semestre` (
  `Id_Pago` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Verificacion` tinyint(1) NOT NULL,
  `Historial_id` int NOT NULL,
  PRIMARY KEY (`Id_Pago`),
  KEY `Pago_Semestre_Historial_id_197251f6_fk_Historial` (`Historial_id`),
  CONSTRAINT `Pago_Semestre_Historial_id_197251f6_fk_Historial` FOREIGN KEY (`Historial_id`) REFERENCES `historial_academico` (`Id_Historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_semestre`
--

LOCK TABLES `pago_semestre` WRITE;
/*!40000 ALTER TABLE `pago_semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_vinculada`
--

DROP TABLE IF EXISTS `persona_vinculada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_vinculada` (
  `Documento` int NOT NULL,
  `Tipo_Documento` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Sexo` varchar(1) NOT NULL,
  `Correo_Personal` varchar(254) NOT NULL,
  `Telefono` varchar(31) NOT NULL,
  `Nacionalidad` varchar(50) NOT NULL,
  `Correo_institucional` varchar(254) DEFAULT NULL,
  `Fecha_Vinculacion` date NOT NULL,
  `Usuario_id` int NOT NULL,
  PRIMARY KEY (`Documento`),
  UNIQUE KEY `Usuario_id` (`Usuario_id`),
  CONSTRAINT `Persona_vinculada_Usuario_id_502252f9_fk_auth_user_id` FOREIGN KEY (`Usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_vinculada`
--

LOCK TABLES `persona_vinculada` WRITE;
/*!40000 ALTER TABLE `persona_vinculada` DISABLE KEYS */;
INSERT INTO `persona_vinculada` VALUES (312313,'Cedula','Sergio','Ruiz','1','sergio@gmail.com','12312115x57','Colombia','Sergio@unal.edu.co','2023-05-28',3),(3213131,'Cedula','Juan','Medina','1','jmedinagu@unal.edu.co','+13222401133x57','Colombia','Juan@unal.edu.co','2023-05-27',1);
/*!40000 ALTER TABLE `persona_vinculada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa` (
  `Codigo_SNIES` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Creditos_exigidos` int NOT NULL,
  `Grado_licenciatura` varchar(60) NOT NULL,
  `Facultad_id` int NOT NULL,
  PRIMARY KEY (`Codigo_SNIES`),
  KEY `Programa_Facultad_id_0adfc62e_fk_Facultad_Id_Facultad` (`Facultad_id`),
  CONSTRAINT `Programa_Facultad_id_0adfc62e_fk_Facultad_Id_Facultad` FOREIGN KEY (`Facultad_id`) REFERENCES `facultad` (`Id_Facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residencia`
--

DROP TABLE IF EXISTS `residencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residencia` (
  `Id_residencia` int NOT NULL AUTO_INCREMENT,
  `Estrato` int NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Calle` varchar(255) NOT NULL,
  `Numero` int NOT NULL,
  `Estudiante_id` int NOT NULL,
  PRIMARY KEY (`Id_residencia`),
  KEY `Residencia_Estudiante_id_280c7776_fk_Estudiante_Id_estudiante` (`Estudiante_id`),
  CONSTRAINT `Residencia_Estudiante_id_280c7776_fk_Estudiante_Id_estudiante` FOREIGN KEY (`Estudiante_id`) REFERENCES `estudiante` (`Id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residencia`
--

LOCK TABLES `residencia` WRITE;
/*!40000 ALTER TABLE `residencia` DISABLE KEYS */;
INSERT INTO `residencia` VALUES (1,1,'Bogota','Avenida Chile',13,1);
/*!40000 ALTER TABLE `residencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumen_credito`
--

DROP TABLE IF EXISTS `resumen_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumen_credito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Creditos_Exigidos` int DEFAULT NULL,
  `Creditos_Aprobados` int DEFAULT NULL,
  `Pendientes` int DEFAULT NULL,
  `Inscritos` int DEFAULT NULL,
  `Cursados` int DEFAULT NULL,
  `Historial_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Historial_id` (`Historial_id`),
  CONSTRAINT `Resumen_Credito_Historial_id_1f8fe5eb_fk_Historial` FOREIGN KEY (`Historial_id`) REFERENCES `historial_academico` (`Id_Historial`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumen_credito`
--

LOCK TABLES `resumen_credito` WRITE;
/*!40000 ALTER TABLE `resumen_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumen_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `ID_sede` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Bogota'),(2,'Medellin'),(3,'Manizales'),(4,'Amazonas'),(5,'Orinoquia'),(6,'Palmira'),(7,'Tumaco'),(8,'La Paz');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vst_docente_datos`
--

DROP TABLE IF EXISTS `vst_docente_datos`;
/*!50001 DROP VIEW IF EXISTS `vst_docente_datos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vst_docente_datos` AS SELECT 
 1 AS `Documento`,
 1 AS `Tipo_Documento`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Correo_Personal`,
 1 AS `Correo_institucional`,
 1 AS `Telefono`,
 1 AS `usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vst_docente_nota`
--

DROP TABLE IF EXISTS `vst_docente_nota`;
/*!50001 DROP VIEW IF EXISTS `vst_docente_nota`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vst_docente_nota` AS SELECT 
 1 AS `Numero_grupo`,
 1 AS `nombre_asignatura`,
 1 AS `Codigo`,
 1 AS `Dia`,
 1 AS `hora`,
 1 AS `Edificio`,
 1 AS `Salon`,
 1 AS `nombre_estudiante`,
 1 AS `Apellido`,
 1 AS `Documento`,
 1 AS `Primer_Corte`,
 1 AS `Segundo_Corte`,
 1 AS `Tercer_Corte`,
 1 AS `Nota_Definitiva`,
 1 AS `usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vst_estuidiante_datos`
--

DROP TABLE IF EXISTS `vst_estuidiante_datos`;
/*!50001 DROP VIEW IF EXISTS `vst_estuidiante_datos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vst_estuidiante_datos` AS SELECT 
 1 AS `Documento`,
 1 AS `Tipo_Documento`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Correo_Personal`,
 1 AS `Correo_institucional`,
 1 AS `Telefono`,
 1 AS `Estrato`,
 1 AS `Ciudad`,
 1 AS `Calle`,
 1 AS `Programa`,
 1 AS `userid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vst_inscripcion`
--

DROP TABLE IF EXISTS `vst_inscripcion`;
/*!50001 DROP VIEW IF EXISTS `vst_inscripcion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vst_inscripcion` AS SELECT 
 1 AS `Plan_de_estudio`,
 1 AS `Fecha`,
 1 AS `Hora`,
 1 AS `userid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vts_resumen_historial`
--

DROP TABLE IF EXISTS `vts_resumen_historial`;
/*!50001 DROP VIEW IF EXISTS `vts_resumen_historial`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vts_resumen_historial` AS SELECT 
 1 AS `Nombre`,
 1 AS `Creditos`,
 1 AS `Tipologia`,
 1 AS `Semestre`,
 1 AS `Nota_Definitiva`,
 1 AS `Aprobada`,
 1 AS `Creditos_Adicionales`,
 1 AS `Cupo_Creditos`,
 1 AS `Disponibles`,
 1 AS `Creditos_Doble_titulacion`,
 1 AS `Creditos_Exigidos`,
 1 AS `Creditos_Aprobados`,
 1 AS `Pendientes`,
 1 AS `Inscritos`,
 1 AS `Cursados`,
 1 AS `usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vst_docente_datos`
--

/*!50001 DROP VIEW IF EXISTS `vst_docente_datos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vst_docente_datos` AS select `persona_vinculada`.`Documento` AS `Documento`,`persona_vinculada`.`Tipo_Documento` AS `Tipo_Documento`,`persona_vinculada`.`Nombre` AS `Nombre`,`persona_vinculada`.`Apellido` AS `Apellido`,`persona_vinculada`.`Correo_Personal` AS `Correo_Personal`,`persona_vinculada`.`Correo_institucional` AS `Correo_institucional`,`persona_vinculada`.`Telefono` AS `Telefono`,`persona_vinculada`.`Usuario_id` AS `usuario` from (`persona_vinculada` join `docente` on((`docente`.`Persona_Vinculada_id` = `persona_vinculada`.`Documento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vst_docente_nota`
--

/*!50001 DROP VIEW IF EXISTS `vst_docente_nota`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vst_docente_nota` AS select `grupo`.`Numero_grupo` AS `Numero_grupo`,`asignatura`.`Nombre` AS `nombre_asignatura`,`asignatura`.`Codigo` AS `Codigo`,`academico_espacio`.`Dia` AS `Dia`,`academico_espacio`.`Hora` AS `hora`,`academico_espacio`.`Edificio` AS `Edificio`,`academico_espacio`.`Salon` AS `Salon`,`persona_estudiante`.`Nombre` AS `nombre_estudiante`,`persona_estudiante`.`Apellido` AS `Apellido`,`persona_estudiante`.`Documento` AS `Documento`,`notas`.`Primer_Corte` AS `Primer_Corte`,`notas`.`Segundo_Corte` AS `Segundo_Corte`,`notas`.`Tercer_Corte` AS `Tercer_Corte`,`notas`.`Nota_Definitiva` AS `Nota_Definitiva`,`persona_vinculada`.`Usuario_id` AS `usuario` from ((((((((((`persona_vinculada` join `docente` on((`docente`.`Persona_Vinculada_id` = `persona_vinculada`.`Documento`))) join `grupo` on((`docente`.`Id_docente` = `grupo`.`Profesor_id`))) join `academico_espacio` on((`grupo`.`Id_grupo` = `academico_espacio`.`Grupo_id`))) join `asignatura` on((`grupo`.`Asignatura_id` = `asignatura`.`Codigo`))) join `inscripcion_cancelacion_grupo` on((`grupo`.`Id_grupo` = `inscripcion_cancelacion_grupo`.`Grupo_id`))) join `notas` on((`inscripcion_cancelacion_grupo`.`Id` = `notas`.`Inscripcion_id`))) join `notas_historial` on((`notas_historial`.`historial_academico_id` = `notas`.`Id_Nota`))) join `historial_academico` on((`historial_academico`.`Id_Historial` = `notas_historial`.`historial_academico_id`))) join `estudiante` on((`estudiante`.`Id_estudiante` = `historial_academico`.`Estudiante_id`))) join `persona_vinculada` `persona_estudiante` on((`persona_estudiante`.`Documento` = `estudiante`.`Persona_Vinculada_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vst_estuidiante_datos`
--

/*!50001 DROP VIEW IF EXISTS `vst_estuidiante_datos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vst_estuidiante_datos` AS select `persona_vinculada`.`Documento` AS `Documento`,`persona_vinculada`.`Tipo_Documento` AS `Tipo_Documento`,`persona_vinculada`.`Nombre` AS `Nombre`,`persona_vinculada`.`Apellido` AS `Apellido`,`persona_vinculada`.`Correo_Personal` AS `Correo_Personal`,`persona_vinculada`.`Correo_institucional` AS `Correo_institucional`,`persona_vinculada`.`Telefono` AS `Telefono`,`residencia`.`Estrato` AS `Estrato`,`residencia`.`Ciudad` AS `Ciudad`,`residencia`.`Calle` AS `Calle`,`programa`.`Nombre` AS `Programa`,`persona_vinculada`.`Usuario_id` AS `userid` from ((((`persona_vinculada` join `estudiante` on((`persona_vinculada`.`Documento` = `estudiante`.`Persona_Vinculada_id`))) join `residencia` on((`estudiante`.`Id_estudiante` = `residencia`.`Estudiante_id`))) join `historial_academico` on((`historial_academico`.`Estudiante_id` = `estudiante`.`Id_estudiante`))) join `programa` on((`programa`.`Codigo_SNIES` = `historial_academico`.`Programa_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vst_inscripcion`
--

/*!50001 DROP VIEW IF EXISTS `vst_inscripcion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vst_inscripcion` AS select `programa`.`Nombre` AS `Plan_de_estudio`,`cita_inscripcion`.`Fecha` AS `Fecha`,`cita_inscripcion`.`Hora` AS `Hora`,`persona_vinculada`.`Usuario_id` AS `userid` from ((((`persona_vinculada` join `estudiante` on((`estudiante`.`Persona_Vinculada_id` = `persona_vinculada`.`Documento`))) join `historial_academico` on((`estudiante`.`Id_estudiante` = `historial_academico`.`Estudiante_id`))) join `programa` on((`programa`.`Codigo_SNIES` = `historial_academico`.`Programa_id`))) join `cita_inscripcion` on((`historial_academico`.`Id_Historial` = `cita_inscripcion`.`Historial_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vts_resumen_historial`
--

/*!50001 DROP VIEW IF EXISTS `vts_resumen_historial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vts_resumen_historial` AS select `asignatura`.`Nombre` AS `Nombre`,`asignatura`.`Creditos` AS `Creditos`,`asignatura`.`Tipologia` AS `Tipologia`,`inscripcion_cancelacion`.`Semestre` AS `Semestre`,`notas`.`Nota_Definitiva` AS `Nota_Definitiva`,`notas`.`Aprobada` AS `Aprobada`,`cupo_credito`.`Creditos_Adicionales` AS `Creditos_Adicionales`,`cupo_credito`.`Cupo_Creditos` AS `Cupo_Creditos`,`cupo_credito`.`Creditos_Disponibles` AS `Disponibles`,`cupo_credito`.`Creditos_Doble_titulacion` AS `Creditos_Doble_titulacion`,`resumen_credito`.`Creditos_Exigidos` AS `Creditos_Exigidos`,`resumen_credito`.`Creditos_Aprobados` AS `Creditos_Aprobados`,`resumen_credito`.`Pendientes` AS `Pendientes`,`resumen_credito`.`Inscritos` AS `Inscritos`,`resumen_credito`.`Cursados` AS `Cursados`,`persona_vinculada`.`Usuario_id` AS `usuario` from (((((((((((`persona_vinculada` join `estudiante` on((`estudiante`.`Persona_Vinculada_id` = `persona_vinculada`.`Documento`))) join `historial_academico` on((`historial_academico`.`Estudiante_id` = `estudiante`.`Id_estudiante`))) join `resumen_credito` on((`resumen_credito`.`Historial_id` = `historial_academico`.`Id_Historial`))) join `cupo_credito` on((`cupo_credito`.`Historial_id` = `historial_academico`.`Id_Historial`))) join `programa` on((`programa`.`Codigo_SNIES` = `historial_academico`.`Programa_id`))) join `notas_historial` on((`notas_historial`.`historial_academico_id` = `historial_academico`.`Id_Historial`))) join `notas` on((`notas`.`Id_Nota` = `notas_historial`.`notas_id`))) join `inscripcion_cancelacion_grupo` on((`inscripcion_cancelacion_grupo`.`Id` = `notas`.`Inscripcion_id`))) join `inscripcion_cancelacion` on((`inscripcion_cancelacion`.`Id_incripcion` = `inscripcion_cancelacion_grupo`.`Inscripcion_id`))) join `grupo` on((`grupo`.`Id_grupo` = `inscripcion_cancelacion_grupo`.`Grupo_id`))) join `asignatura` on((`asignatura`.`Codigo` = `grupo`.`Asignatura_id`))) where (`persona_vinculada`.`Correo_Personal` = current_user()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30 19:16:28
