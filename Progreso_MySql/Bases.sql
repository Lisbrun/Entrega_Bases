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
  `Dia` date NOT NULL,
  `Hora` time(6) NOT NULL,
  `Edificio` varchar(100) NOT NULL,
  `Salon` int NOT NULL,
  `Grupo_id` int NOT NULL,
  PRIMARY KEY (`Id_espacio`),
  KEY `academico_espacio_Grupo_id_1c94d6c3_fk_Grupo_Id_grupo` (`Grupo_id`),
  CONSTRAINT `academico_espacio_Grupo_id_1c94d6c3_fk_Grupo_Id_grupo` FOREIGN KEY (`Grupo_id`) REFERENCES `grupo` (`Id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
INSERT INTO `asignatura` VALUES (1,'Calculo Diferencial','Fundamental',3,313133);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Asignatura',7,'add_asignatura'),(26,'Can change Asignatura',7,'change_asignatura'),(27,'Can delete Asignatura',7,'delete_asignatura'),(28,'Can view Asignatura',7,'view_asignatura'),(29,'Can add Cita_Inscripcion',8,'add_cita_inscripcion'),(30,'Can change Cita_Inscripcion',8,'change_cita_inscripcion'),(31,'Can delete Cita_Inscripcion',8,'delete_cita_inscripcion'),(32,'Can view Cita_Inscripcion',8,'view_cita_inscripcion'),(33,'Can add Departamento',9,'add_departamento'),(34,'Can change Departamento',9,'change_departamento'),(35,'Can delete Departamento',9,'delete_departamento'),(36,'Can view Departamento',9,'view_departamento'),(37,'Can add Docente',10,'add_docente'),(38,'Can change Docente',10,'change_docente'),(39,'Can delete Docente',10,'delete_docente'),(40,'Can view Docente',10,'view_docente'),(41,'Can add Estudiante',11,'add_estudiante'),(42,'Can change Estudiante',11,'change_estudiante'),(43,'Can delete Estudiante',11,'delete_estudiante'),(44,'Can view Estudiante',11,'view_estudiante'),(45,'Can add Facultad',12,'add_facultad'),(46,'Can change Facultad',12,'change_facultad'),(47,'Can delete Facultad',12,'delete_facultad'),(48,'Can view Facultad',12,'view_facultad'),(49,'Can add Grupo',13,'add_grupo'),(50,'Can change Grupo',13,'change_grupo'),(51,'Can delete Grupo',13,'delete_grupo'),(52,'Can view Grupo',13,'view_grupo'),(53,'Can add Historial_Academico',14,'add_historial_academico'),(54,'Can change Historial_Academico',14,'change_historial_academico'),(55,'Can delete Historial_Academico',14,'delete_historial_academico'),(56,'Can view Historial_Academico',14,'view_historial_academico'),(57,'Can add Sede',15,'add_sede'),(58,'Can change Sede',15,'change_sede'),(59,'Can delete Sede',15,'delete_sede'),(60,'Can view Sede',15,'view_sede'),(61,'Can add Resumen_Credito',16,'add_resumen_creditos'),(62,'Can change Resumen_Credito',16,'change_resumen_creditos'),(63,'Can delete Resumen_Credito',16,'delete_resumen_creditos'),(64,'Can view Resumen_Credito',16,'view_resumen_creditos'),(65,'Can add Residencia',17,'add_residencia'),(66,'Can change Residencia',17,'change_residencia'),(67,'Can delete Residencia',17,'delete_residencia'),(68,'Can view Residencia',17,'view_residencia'),(69,'Can add Programa',18,'add_programa'),(70,'Can change Programa',18,'change_programa'),(71,'Can delete Programa',18,'delete_programa'),(72,'Can view Programa',18,'view_programa'),(73,'Can add Persona_vinculada',19,'add_persona_vinculada'),(74,'Can change Persona_vinculada',19,'change_persona_vinculada'),(75,'Can delete Persona_vinculada',19,'delete_persona_vinculada'),(76,'Can view Persona_vinculada',19,'view_persona_vinculada'),(77,'Can add Inscripcion_cancelacion',20,'add_inscripcion_cancelacion'),(78,'Can change Inscripcion_cancelacion',20,'change_inscripcion_cancelacion'),(79,'Can delete Inscripcion_cancelacion',20,'delete_inscripcion_cancelacion'),(80,'Can view Inscripcion_cancelacion',20,'view_inscripcion_cancelacion'),(81,'Can add espacio',21,'add_espacio'),(82,'Can change espacio',21,'change_espacio'),(83,'Can delete espacio',21,'delete_espacio'),(84,'Can view espacio',21,'view_espacio'),(85,'Can add Decano',22,'add_decano'),(86,'Can change Decano',22,'change_decano'),(87,'Can delete Decano',22,'delete_decano'),(88,'Can view Decano',22,'view_decano'),(89,'Can add Cupo_Credito',23,'add_cupo_creditos'),(90,'Can change Cupo_Credito',23,'change_cupo_creditos'),(91,'Can delete Cupo_Credito',23,'delete_cupo_creditos'),(92,'Can view Cupo_Credito',23,'view_cupo_creditos'),(93,'Can add ModelName',24,'add_notas'),(94,'Can change ModelName',24,'change_notas'),(95,'Can delete ModelName',24,'delete_notas'),(96,'Can view ModelName',24,'view_notas'),(97,'Can add Inscripcion_cancelacion_grupo',25,'add_inscripcion_cancelacion_grupo'),(98,'Can change Inscripcion_cancelacion_grupo',25,'change_inscripcion_cancelacion_grupo'),(99,'Can delete Inscripcion_cancelacion_grupo',25,'delete_inscripcion_cancelacion_grupo'),(100,'Can view Inscripcion_cancelacion_grupo',25,'view_inscripcion_cancelacion_grupo');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$xdY2fdIHrev9qyHI2ueH1y$Vj5qi345oXXN5DrObTKPQ7YjT9GvmtPCaVqv9tGaL/8=','2023-05-27 04:31:37.582228',1,'root','','','',1,1,'2023-05-27 00:37:13.155975'),(2,'pbkdf2_sha256$390000$HXUBYT0GhoVQYYcwF88PqV$mxV+GC1t2/ZgbYJnnkx8zPF2uAgDhZp3K4FxxSSteOo=',NULL,0,'Pedro15','','','',0,1,'2023-05-27 01:10:08.396708');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_inscripcion`
--

LOCK TABLES `cita_inscripcion` WRITE;
/*!40000 ALTER TABLE `cita_inscripcion` DISABLE KEYS */;
INSERT INTO `cita_inscripcion` VALUES (1,'2023-05-27','01:08:08.000000',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `Sede_id` int NOT NULL,
  PRIMARY KEY (`Id_departamento`),
  KEY `Departamento_Sede_id_82743289_fk_Sede_ID_sede` (`Sede_id`),
  CONSTRAINT `Departamento_Sede_id_82743289_fk_Sede_ID_sede` FOREIGN KEY (`Sede_id`) REFERENCES `sede` (`ID_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'SIstemas e industrial',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-27 01:08:42.529901','3213131','Nombre: Juan ',1,'[{\"added\": {}}]',19,1),(2,'2023-05-27 01:08:49.379293','1','estudiante object (1)',1,'[{\"added\": {}}]',11,1),(3,'2023-05-27 01:09:05.964099','1','Sede object (1)',1,'[{\"added\": {}}]',15,1),(4,'2023-05-27 01:09:12.326499','1','Departamento object (1)',1,'[{\"added\": {}}]',9,1),(5,'2023-05-27 01:09:15.731276','1','Facultad object (1)',1,'[{\"added\": {}}]',12,1),(6,'2023-05-27 01:09:29.848128','313133','Programa object (313133)',1,'[{\"added\": {}}]',18,1),(7,'2023-05-27 01:09:33.142457','1','Historial_Academico object (1)',1,'[{\"added\": {}}]',14,1),(8,'2023-05-27 01:09:35.129070','1','Cita_Inscripcion object (1)',1,'[{\"added\": {}}]',8,1),(9,'2023-05-27 01:09:43.958513','1','Inscripcion_cancelacion object (1)',1,'[{\"added\": {}}]',20,1),(10,'2023-05-27 01:10:08.627194','2','Pedro15',1,'[{\"added\": {}}]',4,1),(11,'2023-05-27 01:10:24.081315','1323133','Nombre: Lucila ',1,'[{\"added\": {}}]',19,1),(12,'2023-05-27 01:10:29.487614','1','Docente object (1)',1,'[{\"added\": {}}]',10,1),(13,'2023-05-27 01:10:49.601078','1','Asignatura object (1)',1,'[{\"added\": {}}]',7,1),(14,'2023-05-27 01:10:56.343133','1','Grupo object (1)',1,'[{\"added\": {}}]',13,1),(15,'2023-05-27 01:10:58.687262','1','Inscripcion_cancelacion_grupo object (1)',1,'[{\"added\": {}}]',25,1),(16,'2023-05-27 01:14:41.494317','7','Notas object (7)',1,'[{\"added\": {}}]',24,1),(17,'2023-05-27 01:14:45.909729','7','Notas object (7)',3,'',24,1),(18,'2023-05-27 01:15:13.677298','8','Notas object (8)',1,'[{\"added\": {}}]',24,1),(19,'2023-05-27 01:16:22.158146','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(20,'2023-05-27 01:34:11.364857','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\", \"Nota Definitiva\"]}}]',24,1),(21,'2023-05-27 01:34:51.092457','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(22,'2023-05-27 01:40:47.315289','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(23,'2023-05-27 01:44:18.059657','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(24,'2023-05-27 04:26:58.381068','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(25,'2023-05-27 04:27:04.264323','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'academico','asignatura'),(8,'academico','cita_inscripcion'),(23,'academico','cupo_creditos'),(22,'academico','decano'),(9,'academico','departamento'),(10,'academico','docente'),(21,'academico','espacio'),(11,'academico','estudiante'),(12,'academico','facultad'),(13,'academico','grupo'),(14,'academico','historial_academico'),(20,'academico','inscripcion_cancelacion'),(25,'academico','inscripcion_cancelacion_grupo'),(24,'academico','notas'),(19,'academico','persona_vinculada'),(18,'academico','programa'),(17,'academico','residencia'),(16,'academico','resumen_creditos'),(15,'academico','sede'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-27 00:33:15.665498'),(2,'auth','0001_initial','2023-05-27 00:33:16.095240'),(3,'academico','0001_initial','2023-05-27 00:33:17.462070'),(4,'admin','0001_initial','2023-05-27 00:33:17.595842'),(5,'admin','0002_logentry_remove_auto_add','2023-05-27 00:33:17.617019'),(6,'admin','0003_logentry_add_action_flag_choices','2023-05-27 00:33:17.636404'),(7,'contenttypes','0002_remove_content_type_name','2023-05-27 00:33:17.766234'),(8,'auth','0002_alter_permission_name_max_length','2023-05-27 00:33:17.845069'),(9,'auth','0003_alter_user_email_max_length','2023-05-27 00:33:17.894074'),(10,'auth','0004_alter_user_username_opts','2023-05-27 00:33:17.908075'),(11,'auth','0005_alter_user_last_login_null','2023-05-27 00:33:18.015600'),(12,'auth','0006_require_contenttypes_0002','2023-05-27 00:33:18.022128'),(13,'auth','0007_alter_validators_add_error_messages','2023-05-27 00:33:18.042137'),(14,'auth','0008_alter_user_username_max_length','2023-05-27 00:33:18.132480'),(15,'auth','0009_alter_user_last_name_max_length','2023-05-27 00:33:18.221419'),(16,'auth','0010_alter_group_name_max_length','2023-05-27 00:33:18.292592'),(17,'auth','0011_update_proxy_permissions','2023-05-27 00:33:18.345458'),(18,'auth','0012_alter_user_first_name_max_length','2023-05-27 00:33:18.433849'),(19,'sessions','0001_initial','2023-05-27 00:33:18.472911'),(20,'academico','0002_notas_remove_inscripcion_cancelacion_grupo','2023-05-27 00:52:03.527986'),(21,'academico','0003_inscripcion_cancelacion_grupo_notas_inscripcion','2023-05-27 00:53:18.429160'),(22,'academico','0004_notas_historial','2023-05-27 00:56:27.486571'),(23,'academico','0005_alter_notas_options_alter_notas_nota_definitiva_and_more','2023-05-27 01:12:48.273235'),(24,'academico','0006_alter_cupo_creditos_creditos_disponibles_and_more','2023-05-27 03:04:11.705573'),(25,'academico','0007_alter_resumen_creditos_creditos_aprobados_and_more','2023-05-27 04:16:19.242005');
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
INSERT INTO `django_session` VALUES ('9143lx8hwxlic1euj6i0hpwfimxldici','.eJxVjMsOwiAUBf-FtSE8I7h07zeQ-wCpGkhKuzL-u23ShW5n5py3SLAuNa0jz2licRFanH4ZAj1z2wU_oN27pN6WeUK5J_KwQ94659f1aP8OKoy6rU0opAi0KhSYAEr0PioT9BmCI-0RbUBmZ1TJuUR0TlntATOajVkWny__1zhz:1q2lab:CPAtlVhC4wfHS_Kw_pQ4ImbQoM-0wJGtnNIi71jjoHI','2023-06-10 04:31:37.592306'),('u7dy5z5mobprldt4lk9fhqad3qqwfsah','.eJxVjMsOwiAUBf-FtSE8I7h07zeQ-wCpGkhKuzL-u23ShW5n5py3SLAuNa0jz2licRFanH4ZAj1z2wU_oN27pN6WeUK5J_KwQ94659f1aP8OKoy6rU0opAi0KhSYAEr0PioT9BmCI-0RbUBmZ1TJuUR0TlntATOajVkWny__1zhz:1q2hvz:Esp_18aB2459x1vGcHgFgTmD2xodvgyhlZQpRf6ahrw','2023-06-10 00:37:27.623153');
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
INSERT INTO `docente` VALUES (1,0,1323133,1);
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
INSERT INTO `estudiante` VALUES (1,0,3213131);
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
  `Nombre` varchar(60) NOT NULL,
  `Departamento_id` int NOT NULL,
  PRIMARY KEY (`Id_Facultad`),
  KEY `Facultad_Departamento_id_576e4037_fk_Departame` (`Departamento_id`),
  CONSTRAINT `Facultad_Departamento_id_576e4037_fk_Departame` FOREIGN KEY (`Departamento_id`) REFERENCES `departamento` (`Id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Ingenieria',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,1321,39,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_academico`
--

LOCK TABLES `historial_academico` WRITE;
/*!40000 ALTER TABLE `historial_academico` DISABLE KEYS */;
INSERT INTO `historial_academico` VALUES (1,0,0,0,1,1,313133);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion_cancelacion`
--

LOCK TABLES `inscripcion_cancelacion` WRITE;
/*!40000 ALTER TABLE `inscripcion_cancelacion` DISABLE KEYS */;
INSERT INTO `inscripcion_cancelacion` VALUES (1,12,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion_cancelacion_grupo`
--

LOCK TABLES `inscripcion_cancelacion_grupo` WRITE;
/*!40000 ALTER TABLE `inscripcion_cancelacion_grupo` DISABLE KEYS */;
INSERT INTO `inscripcion_cancelacion_grupo` VALUES (1,1,1);
/*!40000 ALTER TABLE `inscripcion_cancelacion_grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizacion_grupo` AFTER INSERT ON `inscripcion_cancelacion_grupo` FOR EACH ROW BEGIN
    UPDATE grupo
    SET Cupos = Cupos - 1
    WHERE grupo.Id_grupo = NEW.grupo_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizacion_grupo_suma` AFTER DELETE ON `inscripcion_cancelacion_grupo` FOR EACH ROW BEGIN
    UPDATE grupo
    SET Cupos = Cupos + 1
    WHERE grupo.Id_grupo = OLD.grupo_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (8,2,3,3.6,2.87,0,1);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizar` BEFORE UPDATE ON `notas` FOR EACH ROW BEGIN
    SET NEW.Nota_Definitiva = round((NEW.Primer_Corte + NEW.Segundo_Corte + NEW.Tercer_Corte) / 3,2);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Aprobacion` BEFORE UPDATE ON `notas` FOR EACH ROW BEGIN
	declare creditos int;
    if new.Nota_Definitiva>=3  then
    
		select asignatura.Creditos INTO creditos from notas inner join inscripcion_cancelacion_grupo as inscripcion on notas.Inscripcion_id=inscripcion.Id 
		inner join grupo on inscripcion.Grupo_id=grupo.Id_grupo inner join asignatura on Asignatura_id=grupo.Asignatura_id where notas.Id_Nota= new.Id_Nota;
        insert into resumen_credito(Cursados) values (creditos);
    
    else
    set new.aprobada =0;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_historial`
--

LOCK TABLES `notas_historial` WRITE;
/*!40000 ALTER TABLE `notas_historial` DISABLE KEYS */;
INSERT INTO `notas_historial` VALUES (8,8,1);
/*!40000 ALTER TABLE `notas_historial` ENABLE KEYS */;
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
INSERT INTO `persona_vinculada` VALUES (1323133,'Cedula','Lucila','Guerrero','0','jmedinagu@unal.edu.co','+13222401133','Colombia','Lucila@unal.edu.co','2023-05-27',2),(3213131,'Cedula','Juan','Medina','1','jmedinagu@unal.edu.co','+13222401133x57','Colombia','Juan@unal.edu.co','2023-05-27',1);
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
INSERT INTO `programa` VALUES (313133,'Ingenieria de sistemas',166,'pregrado',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residencia`
--

LOCK TABLES `residencia` WRITE;
/*!40000 ALTER TABLE `residencia` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Bogota');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26 23:42:56
