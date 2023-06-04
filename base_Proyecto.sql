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
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (2,'Bienes Mercantiles','Diciplinar obligatoria',2,17142),(3,'Contratos Civiles y Mercantiles','Diciplinar obligatoria',3,17142),(4,'Derecho administrativo','Diciplinar obligatoria',3,17142),(5,'Derecho administrativo II','Diciplinar obligatoria',3,17142),(6,'Derecho Ambiental','Diciplinar obligatoria',3,17142),(7,'Derecho Civil General y Personas','Diciplinar obligatoria',3,17142),(8,'Derecho Comercial General y Sociedades','Diciplinar obligatoria',3,17142),(9,'Derecho constitucional colombiano','Diciplinar obligatoria',3,17142),(10,'Derecho de las Relaciones Laborales','Diciplinar obligatoria',3,17142),(11,'Derecho Económico','Diciplinar obligatoria',2,17142),(12,'Derecho Internacional de los Derechos Humanos','Diciplinar obligatoria',2,17142),(13,'Derecho Internacional Público','Diciplinar obligatoria',3,17142),(14,'Derecho Penal Especial','Diciplinar obligatoria',3,17142),(15,'Derecho Penal General','Diciplinar obligatoria',3,17142),(16,'Derecho Penal Internacional','Diciplinar obligatoria',3,17142),(17,'Derecho Procesal Administrativo','Diciplinar obligatoria',3,17142),(18,'Derecho Procesal Civil','Diciplinar obligatoria',3,17142),(19,'Derecho Procesal Laboral','Diciplinar obligatoria',3,17142),(20,'Derecho Procesal Penal','Diciplinar obligatoria',3,17142),(21,'Derechos Reales','Diciplinar obligatoria',3,17142),(22,'Examen Preparatorio básico','Diciplinar obligatoria',0,17142),(23,'Investigación II','Diciplinar obligatoria',3,17142),(24,'Obligaciones y Responsabilidad','Diciplinar obligatoria',3,17142),(25,'Políticas Públicas de Familia','Diciplinar obligatoria',3,17142),(26,'Prácticas y Consultorio Jurídico I','Diciplinar obligatoria',3,17142),(27,'Prácticas y Consultorio Jurídico II','Diciplinar obligatoria',3,17142),(28,'Seguridad Social','Diciplinar obligatoria',3,17142),(29,'Seminario de Investigación I','Diciplinar obligatoria',2,17142),(30,'Seminario de Investigación II','Diciplinar obligatoria',3,17142),(31,'Teoría del Delito','Diciplinar obligatoria',3,17142),(32,'Teoría General del Proceso','Diciplinar obligatoria',4,17142),(33,'Teoría y Practica de la Prueba y de la Evidencia','Diciplinar obligatoria',3,17142),(34,'Transmisión de Derechos','Diciplinar obligatoria',2,17142),(35,'Inglés I- Semestral','Nivelacion',3,17142),(36,'Inglés II - Semestral','Nivelacion',3,17142),(37,'Inglés II - Virtual','Nivelacion',3,17142),(38,'Inglés III - Semestral','Nivelacion',3,17142),(39,'Inglés III- Virtual','Nivelacion',3,17142),(40,'Inglés Intensivo I y II','Nivelacion',3,17142),(41,'Inglés Intensivo III y IV','Nivelacion',3,17142),(42,'Inglés IV- Semestral','Nivelacion',3,17142),(43,'Inglés IV- Virtual','Nivelacion',3,17142),(44,'Lecto-Escritura','Nivelacion',4,17142),(45,'Trabajo de Grado','Trabajo de grado',6,17142),(46,'Trabajo de Grado - Asignaturas de Posgrado','Trabajo de grado',6,17142),(47,'Catedra Eduardo Umaña Luna','Fundamentacion obligatoria',3,17142),(48,'Drechos Humanos integrales','Fundamentacion obligatoria',3,17142),(49,'Hermeneutica juridica','Fundamentacion obligatoria',3,17142),(50,'Introduccion al derecho','Fundamentacion obligatoria',3,17142),(51,'Investigacion 1','Fundamentacion obligatoria',2,17142),(52,'Logica y argumentacion juridica','Fundamentacion obligatoria',3,17142),(53,'Sistemas de derecho','Fundamentacion obligatoria',2,17142),(54,'Sociología del Conflicto y Elemento Criminal','Fundamentacion obligatoria',3,17142),(55,'Sociología Jurídica','Fundamentacion obligatoria',2,17142),(56,'Teoría Constitucional','Fundamentacion obligatoria',3,17142),(57,'Teoría y Filosofía del Derecho. Ética Jurídica','Fundamentacion obligatoria',3,17142),(58,'Acciones Constitucionales','Disciplinar optativa',2,17142),(59,'Arbitramento Internacional','Disciplinar optativa',2,17142),(60,'Contratación internacional','Disciplinar optativa',2,17142),(61,'Derecho Constitucional Económico','Disciplinar optativa',2,17142),(62,'Derecho de Autor','Disciplinar optativa',2,17142),(63,'Derecho de la Competencia y del Consumo','Disciplinar optativa',2,17142),(64,'Derecho Disciplinario','Disciplinar optativa',2,17142),(65,'Derecho Internacional Humanitario','Disciplinar optativa',2,17142),(66,'Derecho Internacional Privado','Disciplinar optativa',2,17142),(67,'Derecho Notarial y Registral','Disciplinar optativa',2,17142),(68,'Derecho Penal Especial II','Disciplinar optativa',2,17142),(69,'Derecho Policivo','Disciplinar optativa',2,17142),(70,'Derecho Tributario','Disciplinar optativa',2,17142),(71,'Derecho y políticas públicas','Disciplinar optativa',2,17142),(72,'Instituciones del Derecho Romano','Disciplinar optativa',2,17142),(73,'Internet derecho y sociedad','Disciplinar optativa',2,17142),(74,'Justicia Comunitaria','Disciplinar optativa',2,17142),(75,'La Conciliación','Disciplinar optativa',2,17142),(76,'Medicina Legal','Disciplinar optativa',2,17142),(77,'Multiculturalismo y Derechos Étnicos','Disciplinar optativa',2,17142),(78,'Planeación Estrategica Urbana','Disciplinar optativa',2,17142),(79,'Prácticas y Consultorio Jurídico III','Disciplinar optativa',2,17142),(80,'Praxis Penal Instrucción y Juzgamiento','Disciplinar optativa',2,17142),(81,'Propiedad Industrial y Competencia Desleal','Disciplinar optativa',2,17142),(82,'Responsabilidad Patrimonial del Estado','Disciplinar optativa',2,17142),(83,'Responsabilidad Penal Juvenil','Disciplinar optativa',2,17142),(84,'Sistema Interamericano de Derechos Humanos','Disciplinar optativa',2,17142),(85,'Teorias del estado, genero y derecho','Disciplinar optativa',2,17142),(86,'Análisis Económico del Derecho','Fundamentacion optativa',3,17142),(87,'Filosofía Política','Fundamentacion optativa',3,17142),(88,'Historia politica y socieconómica de colombia del s. xix','Fundamentacion optativa',3,17142),(89,'Historia politica y socieconomica de colombia del s. xx','Fundamentacion optativa',3,17142),(90,'Introduccion a la ciencia politica','Fundamentacion optativa',3,17142),(91,'Problemas Internacionales','Fundamentacion optativa',3,17142),(92,'Procesos politicos de america latina','Fundamentacion optativa',3,17142),(93,'Teoría General del Trabajo y Regulaciones Jurídicas','Fundamentacion optativa',3,17142),(94,'Teorías políticas modernas','Fundamentacion optativa',3,17142),(95,'Transnacionalización del Derecho','Fundamentacion optativa',3,17142),(96,'Modalidades cinéticas: Masoterapia','Diciplinar obligatoria',1,26328),(97,'Modalidades cinéticas: principios fundamentales','Diciplinar obligatoria',2,26328),(98,'Modalidades físicas y neumáticas','Diciplinar obligatoria',3,26328),(99,'Practica académica clinica niños','Diciplinar obligatoria',7,26328),(100,'Practica académica en actividad física y deporte	','Diciplinar obligatoria',7,26328),(101,'Practica académica clinica adultos','Diciplinar obligatoria',7,26328),(102,'Practica académica en salud trabajo y comunidad','Diciplinar obligatoria',7,26328),(103,'Principios de facilitación del movimiento','Diciplinar obligatoria',2,26328),(104,'Procesos evaluativos II','Diciplinar obligatoria',2,26328),(105,'Seminario de trabajo de grado','Diciplinar obligatoria',1,26328),(106,'Comprensión de textos en idioma extranjero','Nivelacion',12,26328),(107,'Inglés I- Semestral','Nivelacion',3,26328),(108,'Inglés II - Semestral','Nivelacion',3,26328),(109,'Inglés II - Virtual','Nivelacion',3,26328),(110,'Inglés III - Semestral','Nivelacion',3,26328),(111,'Inglés III- Virtual','Nivelacion',3,26328),(112,'Inglés Intensivo I y II','Nivelacion',3,26328),(113,'Inglés Intensivo III y IV','Nivelacion',3,26328),(114,'Inglés IV- Semestral','Nivelacion',3,26328),(115,'Inglés IV- Virtual','Nivelacion',3,26328),(116,'Lecto-Escritura','Nivelacion',4,26328),(117,'Matemáticas Básicas','Nivelacion',4,26328),(118,'Trabajo de Grado','Trabajo de grado',6,26328),(119,'Trabajo de Grado - Asignaturas de Posgrado','Trabajo de grado',6,26328),(120,'Anatomía e histología funcional','Fundamentacion obligatoria',3,26328),(121,'Anatomia osteomuscular','Fundamentacion obligatoria',2,26328),(122,'Bioestadística fundamental','Fundamentacion obligatoria',3,26328),(123,'Biomecánica articular y de movimiento complejo','Fundamentacion obligatoria',2,26328),(124,'Farmacologia','Fundamentacion obligatoria',2,26328),(125,'Fisiología general','Fundamentacion obligatoria',4,26328),(126,'Fluidos y electromagnetismo para biociencias','Fundamentacion obligatoria',4,26328),(127,'Fundamentos de administración en salud','Fundamentacion obligatoria',1,26328),(128,'Fundamentos de investigacion cualitativa y cuantitativa','Fundamentacion obligatoria',2,26328),(129,'Mecánica y ondas para biociencias','Fundamentacion obligatoria',4,26328),(130,'Neuroanatomia estructural y funcional','Fundamentacion obligatoria',2,26328),(131,'Psicopatología','Fundamentacion obligatoria',2,26328),(132,'Salud pública','Fundamentacion obligatoria',2,26328),(133,'Taller de cuerpo y movimiento','Fundamentacion obligatoria',2,26328),(134,'Actividad física y deporte I','Disciplinar optativa',2,26328),(135,'Actividad física y deporte III','Disciplinar optativa',2,26328),(136,'Comunicación oral y escrita I','Disciplinar optativa',3,26328),(137,'Comunidad y desarrollo humano I','Disciplinar optativa',2,26328),(138,'Comunidad y desarrollo humano III','Disciplinar optativa',2,26328),(139,'Cuerpo e imagen','Disciplinar optativa',3,26328),(140,'Fundamentación y practica en salud de los trabajadores','Disciplinar optativa',4,26328),(141,'Hominización','Disciplinar optativa',3,26328),(142,'Ingenieria tisular','Disciplinar optativa',2,26328),(143,'Iniciacion a estudios feministas y de género','Disciplinar optativa',3,26328),(144,'Kinesioterapia I','Disciplinar optativa',2,26328),(145,'Kinesioterapia III','Disciplinar optativa',2,26328),(146,'Mecánica y neuromecánica del movimiento III','Disciplinar optativa',2,26328),(147,'Mi cuerpo, sus cuerpos, nuestros cuerpos','Disciplinar optativa',2,26328),(148,'Movimiento corporal humano salud y trabajo I','Disciplinar optativa',2,26328),(149,'Movimiento corporal humano salud y trabajo III','Disciplinar optativa',2,26328),(150,'Música y bienestar ocupacional','Disciplinar optativa',2,26328),(151,'Primeros auxilios','Disciplinar optativa',2,26328),(152,'Biología general','Fundamentacion optativa',3,26328),(153,'Biología molecular y celular','Fundamentacion optativa',3,26328),(154,'Bioquímica básica','Fundamentacion optativa',3,26328),(155,'Fundamentos de psicología','Fundamentacion optativa',4,26328),(156,'Medicina Social y Salud Colectiva: fundamentos conceptuales','Fundamentacion optativa',3,26328),(157,'Principios de bioquímica','Fundamentacion optativa',3,26328),(158,'Psicología comunitaria','Fundamentacion optativa',3,26328),(159,'Psicología del desarrollo','Fundamentacion optativa',3,26328),(160,'Psicología y salud ocupacional','Fundamentacion optativa',3,26328),(161,'Química básica','Fundamentacion optativa',3,26328),(162,'Salud y sociedad','Fundamentacion optativa',2,26328),(163,'Aplicaciones empresariales','Diciplinar obligatoria',4,19584),(164,'Comportamiento organizacional','Diciplinar obligatoria',3,19584),(165,'Derecho comercial general y sociedades','Diciplinar obligatoria',3,19584),(166,'Derecho de las relaciones laborales','Diciplinar obligatoria',3,19584),(167,'Diseño, gestión y evaluación de proyectos','Diciplinar obligatoria',4,19584),(168,'Emprendimiento enfocado en la generación de valor','Diciplinar obligatoria',4,19584),(169,'Estrategia','Diciplinar obligatoria',4,19584),(170,'Estrategia de mercadeo','Diciplinar obligatoria',3,19584),(171,'Finanzas avanzadas','Diciplinar obligatoria',4,19584),(172,'Fundamentos de mercadeo','Diciplinar obligatoria',4,19584),(173,'Gestión de las operaciones I','Diciplinar obligatoria',4,19584),(174,'Gestión de las operaciones II','Diciplinar obligatoria',3,19584),(175,'Gestión de las operaciones y la producción I','Diciplinar obligatoria',4,19584),(176,'Gestión de recursos humanos','Diciplinar obligatoria',4,19584),(177,'Internacionalización de la empresa','Diciplinar obligatoria',4,19584),(178,'Problemas económicos colombianos','Diciplinar obligatoria',4,19584),(179,'Sistemas de Información Gerencial','Diciplinar obligatoria',4,19584),(180,'Teoría Contemporánea de la Organización','Diciplinar obligatoria',4,19584),(181,'Teoría de la decisión','Diciplinar obligatoria',4,19584),(182,'Teoría organizacional II','Diciplinar obligatoria',4,19584),(183,'Inglés I- Semestral','Nivelacion',3,19584),(184,'Inglés II - Semestral','Nivelacion',3,19584),(185,'Inglés III - Semestral','Nivelacion',3,19584),(186,'Inglés Intensivo I y II','Nivelacion',6,19584),(187,'Inglés Intensivo III y IV','Nivelacion',6,19584),(188,'Inglés IV- Semestral','Nivelacion',3,19584),(189,'Lecto-Escritura','Nivelacion',4,19584),(190,'Matemáticas Básicas','Nivelacion',4,19584),(191,'Trabajo de Grado','Trabajo de grado',6,19584),(192,'Trabajo de Grado - Asignaturas de Posgrado','Trabajo de grado',6,19584),(193,'Analítica de negocios I','Fundamentacion obligatoria',4,19584),(194,'Cálculo diferencial','Fundamentacion obligatoria',4,19584),(195,'Español y comunicación','Fundamentacion obligatoria',3,19584),(196,'Fundamentos de administración','Fundamentacion obligatoria',4,19584),(197,'Fundamentos de contabilidad de gestión','Fundamentacion obligatoria',4,19584),(198,'Fundamentos de contabilidad financiera','Fundamentacion obligatoria',4,19584),(199,'Fundamentos de economía','Fundamentacion obligatoria',3,19584),(200,'Fundamentos de finanzas','Fundamentacion obligatoria',4,19584),(201,'Habilidades comunicativas en ciencias de gestión','Fundamentacion obligatoria',3,19584),(202,'Informática aplicada para la gestión de datos e información','Fundamentacion obligatoria',4,19584),(203,'Macroeconomía I','Fundamentacion obligatoria',4,19584),(204,'Microeconomía I','Fundamentacion obligatoria',4,19584),(205,'Modelación dinámica','Fundamentacion obligatoria',4,19584),(206,'Modelación estática','Fundamentacion obligatoria',4,19584),(207,'Probabilidad y estadística fundamental','Fundamentacion obligatoria',3,19584),(208,'Teoría de la organización (ASIGNATURA SIN PROGRAMAR)','Fundamentacion obligatoria',4,19584),(209,'Teoría moderna de la firma','Fundamentacion obligatoria',4,19584),(210,'Teoría organizacional I','Fundamentacion obligatoria',4,19584),(211,'Auditoría financiera I','Disciplinar optativa',4,19584),(212,'Auditoría financiera II','Disciplinar optativa',4,19584),(213,'Cátedra de gestión y organizaciones','Disciplinar optativa',3,19584),(214,'Cátedra del egresado','Disciplinar optativa',3,19584),(215,'Cátedra empresarial I','Disciplinar optativa',2,19584),(216,'Cátedra empresarial II','Disciplinar optativa',2,19584),(217,'Comunicaciones integradas de mercadeo y gestión de marca','Disciplinar optativa',3,19584),(218,'Contabilidad de inversiones y financiación','Disciplinar optativa',3,19584),(219,'Contabilidad de operaciones','Disciplinar optativa',3,19584),(220,'Control interno','Disciplinar optativa',3,19584),(221,'Control y gestión de calidad','Disciplinar optativa',3,19584),(222,'Desarrollo y diseño de producto','Disciplinar optativa',3,19584),(223,'Diseño y Mercados','Disciplinar optativa',3,19584),(224,'Economía política I','Disciplinar optativa',4,19584),(225,'Emprendimiento centrado en el cliente','Disciplinar optativa',3,19584),(226,'Estructuración y puesta en marcha de startups y negocios innovadores','Disciplinar optativa',3,19584),(227,'Gerencia de recursos humanos','Disciplinar optativa',3,19584),(228,'Gerencia y gestión de proyectos','Disciplinar optativa',3,19584),(229,'Gestión tecnológica','Disciplinar optativa',3,19584),(230,'Historia del pensamiento económico','Disciplinar optativa',4,19584),(231,'Historia económica general','Disciplinar optativa',4,19584),(232,'Logística','Disciplinar optativa',3,19584),(233,'Logística y cadena de abastecimiento','Disciplinar optativa',3,19584),(234,'Macroeconomía II','Disciplinar optativa',4,19584),(235,'Microeconomía II','Disciplinar optativa',4,19584),(236,'Modelos económicos computacionales','Disciplinar optativa',3,19584),(237,'Negociación, trabajo en equipo y liderazgo','Disciplinar optativa',3,19584),(238,'Pensamiento sistémico','Disciplinar optativa',3,19584),(239,'Programación de computadores','Disciplinar optativa',3,19584),(240,'Psicología Organizacional','Disciplinar optativa',3,19584),(241,'Psicología y comportamiento del consumidor','Disciplinar optativa',3,19584),(242,'Psicología y salud ocupacional','Disciplinar optativa',3,19584),(243,'Responsabilidad Social Empresarial','Disciplinar optativa',3,19584),(244,'Riesgos emergentes en el ecosistema empresarial','Disciplinar optativa',3,19584),(245,'Seguridad industrial','Disciplinar optativa',3,19584),(246,'Seguridad Social','Disciplinar optativa',3,19584),(247,'Teorías de la administración pública','Disciplinar optativa',3,19584),(248,'Teorías de la globalización','Disciplinar optativa',3,19584),(249,'Tipos modernos de contratación','Disciplinar optativa',3,19584),(250,'Analítica de negocios II','Fundamentacion optativa',4,19584),(251,'Derecho constitucional colombiano','Fundamentacion optativa',3,19584),(252,'Econometría I','Fundamentacion optativa',4,19584),(253,'Instituciones politico-constitucionales colombianas','Fundamentacion optativa',4,19584),(254,'Matemáticas Financieras','Fundamentacion optativa',4,19584),(255,'Metodología de la investigación I','Fundamentacion optativa',2,19584),(256,'Metodología de la investigación II','Fundamentacion optativa',3,19584),(257,'Métodos Cuantitativos','Fundamentacion optativa',4,19584),(258,'Construcción de baja complejidad','Diciplinar obligatoria',3,11945),(259,'Construcciones complejas','Diciplinar obligatoria',3,11945),(260,'Construcciones de mediana complejidad','Diciplinar obligatoria',3,11945),(261,'Estructuras de alta complejidad','Diciplinar obligatoria',3,11945),(262,'Estructuras de baja complejidad','Diciplinar obligatoria',3,11945),(263,'Estructuras de mediana complejidad','Diciplinar obligatoria',3,11945),(264,'Historia de la arquitectura II','Diciplinar obligatoria',3,11945),(265,'Historia de la arquitectura III','Diciplinar obligatoria',3,11945),(266,'Historia de la arquitectura IV','Diciplinar obligatoria',3,11945),(267,'Origenes del urbanismo','Diciplinar obligatoria',2,11945),(268,'Protocolo de trabajo de grado','Diciplinar obligatoria',2,11945),(269,'Proyecto I','Diciplinar obligatoria',5,11945),(270,'Proyecto II','Diciplinar obligatoria',5,11945),(271,'Proyecto III','Diciplinar obligatoria',5,11945),(272,'Proyecto urbano','Diciplinar obligatoria',2,11945),(273,'Representacion II','Diciplinar obligatoria',3,11945),(274,'Representacion III','Diciplinar obligatoria',2,11945),(275,'Representacion IV','Diciplinar obligatoria',2,11945),(276,'Seminario trabajo de grado','Diciplinar obligatoria',2,11945),(277,'Sistemas portantes arquitectonicos','Diciplinar obligatoria',3,11945),(278,'Teoria de la arquitectura II','Diciplinar obligatoria',2,11945),(279,'Teoria de la arquitectura III','Diciplinar obligatoria',2,11945),(280,'Teoria de la arquitectura IV','Diciplinar obligatoria',2,11945),(281,'Urbanismo contemporáneo','Disciplinar Obligatoria',2,11945),(282,'Urbanismo en Latinoamérica','Disciplinar Obligatoria',2,11945),(283,'Comprensión de textos en idioma extranjero','Nivelacion',12,11945),(284,'Inglés I- Semestral','Nivelacion',3,11945),(285,'Inglés II - Semestral','Nivelacion',3,11945),(286,'Inglés II - Virtual','Nivelacion',3,11945),(287,'Inglés III - Semestral','Nivelacion',3,11945),(288,'Inglés III- Virtual','Nivelacion',3,11945),(289,'Inglés Intensivo I y II','Nivelacion',6,11945),(290,'Inglés Intensivo III y IV','Nivelacion',6,11945),(291,'Inglés IV- Semestral','Nivelacion',3,11945),(292,'Inglés IV- Virtual','Nivelacion',3,11945),(293,'Lecto-Escritura','Nivelacion',4,11945),(294,'Trabajo de Grado','Trabajo de grado',6,11945),(295,'Trabajo de Grado - Asignaturas de Posgrado','Trabajo de grado',6,11945),(296,'Administración y gestión','Fundamentacion obligatoria',2,11945),(297,'Fundamentos tecnologicos en arquitectura','Fundamentacion obligatoria',3,11945),(298,'Historia de la arquitectura I','Fundamentacion obligatoria',2,11945),(299,'La ciudad y el espacio urbano','Fundamentacion obligatoria',2,11945),(300,'Representacion I','Fundamentacion obligatoria',3,11945),(301,'Teoria de la arquitectura I','Fundamentacion obligatoria',2,11945),(302,'Acústica','Disciplinar optativa',3,11945),(303,'Acústica','Disciplinar optativa',3,11945),(304,'Análisis de ciudades','Disciplinar optativa',2,11945),(305,'Arquitectura bioclimática','Disciplinar optativa',3,11945),(306,'Arquitectura del paisaje','Disciplinar optativa',3,11945),(307,'Arquitectura gótica','Disciplinar optativa',2,11945),(308,'Arquitectura moderna en Bogotá','Disciplinar optativa',2,11945),(309,'Arquitectura y metal','Disciplinar optativa',3,11945),(310,'Arquitectura y textos','Disciplinar optativa',2,11945),(311,'Asoleación y arquitectura','Disciplinar optativa',3,11945),(312,'Aspectos arquitectónicos en el diseño sismoresistente','Disciplinar optativa',3,11945),(313,'Ciudad y movimiento moderno','Disciplinar optativa',2,11945),(314,'Clima y arquitectura','Disciplinar optativa',3,11945),(315,'Consolidación estructural','Disciplinar optativa',3,11945),(316,'Construcción en madera y bambú','Disciplinar optativa',3,11945),(317,'Costos y programación','Disciplinar optativa',3,11945),(318,'Crítica de la arquitectura','Disciplinar optativa',2,11945),(319,'Documentación gráfica del patrimonio','Disciplinar optativa',3,11945),(320,'Énfasis en investigación y proyecto arquitectónico I','Disciplinar optativa',5,11945),(321,'Énfasis en investigación y proyecto arquitectónico II','Disciplinar Optativa',5,11945),(322,'Énfasis en investigación y proyecto de vivienda I','Disciplinar Optativa',5,11945),(323,'Énfasis en investigación y proyecto de vivienda II','Disciplinar Optativa',5,11945),(324,'Énfasis en investigación y proyecto patrimonial I','Disciplinar Optativa',5,11945),(325,'Énfasis en investigación y proyecto patrimonial II','Disciplinar Optativa',5,11945),(326,'Énfasis en investigación y proyecto tecnológico I','Disciplinar Optativa',5,11945),(327,'Énfasis en investigación y proyecto tecnológico II','Disciplinar Optativa',5,11945),(328,'Énfasis en investigación y proyecto urbano I','Disciplinar Optativa',5,11945),(329,'Énfasis en investigación y proyecto urbano II','Disciplinar Optativa',5,11945),(330,'Especificaciones y cantidades','Disciplinar Optativa',3,11945),(331,'Grandes maestros de la arquitectura','Disciplinar optativa',2,11945),(332,'Interventoría','Disciplinar optativa',3,11945),(333,'Medios artísticos','Disciplinar optativa',3,11945),(334,'Medios digitales en construcción','Disciplinar optativa',3,11945),(335,'Medios informáticos I','Disciplinar optativa',3,11945),(336,'Medios informáticos II','Disciplinar optativa',3,11945),(337,'Modelos','Disciplinar optativa',3,11945),(338,'Morfología estructural','Disciplinar optativa',3,11945),(339,'Patologia de la edificacion','Disciplinar optativa',3,11945),(340,'Planeación ordenamiento territorial','Disciplinar optativa',2,11945),(341,'Procesos urbanos','Disciplinar optativa',2,11945),(342,'Proyecto vertical de actividad','Disciplinar optativa',6,11945),(343,'Proyecto vertical de forma','Disciplinar optativa',6,11945),(344,'Proyecto vertical de lugar','Disciplinar optativa',6,11945),(345,'Proyecto vertical de técnica','Disciplinar optativa',6,11945),(346,'Proyecto vertical lugar urbano','Disciplinar optativa',6,11945),(347,'Residencia de obra','Disciplinar optativa',3,11945),(348,'Seminario de investigación y proyecto arquitectónico I','Disciplinar Optativa',2,11945),(349,'Seminario de investigación y proyecto arquitectónico II','Disciplinar Optativa',2,11945),(350,'Seminario de investigación y proyecto de vivienda I','Disciplinar Optativa',2,11945),(351,'Seminario de investigación y proyecto de vivienda II','Disciplinar Optativa',2,11945),(352,'Seminario de investigación y proyecto patrimonial I','Disciplinar Optativa',2,11945),(353,'Seminario de investigación y proyecto patrimonial II','Disciplinar Optativa',2,11945),(354,'Seminario de investigación y proyecto tecnológico I','Disciplinar Optativa',2,11945),(355,'Seminario de investigación y proyecto tecnológico II','Disciplinar Optativa',2,11945),(356,'Seminario de investigación y proyecto urbano I','Disciplinar Optativa',2,11945),(357,'Seminario de investigación y proyecto urbano II','Disciplinar Optativa',2,11945),(358,'Suelos y cimientos','Disciplinar Optativa',3,11945),(359,'Tecnología del concreto','Disciplinar Optativa',3,11945),(360,'Teoría de la arquitectura latinoamericana','Disciplinar Optativa',2,11945),(361,'Arte y paisaje','Fundamentacion optativa',3,11945),(362,'Gestión cultural y empresarial en las artes','Fundamentacion optativa',3,11945),(363,'Herencias - Una mirada a la historia de las artes','Fundamentacion optativa',3,11945),(364,'Problemas contemporáneos de las artes','Fundamentacion optativa',3,11945),(365,'Responsabilidad socio-ambiental de las artes','Fundamentacion optativa',3,11945),(366,'Antropología Aplicada y del Desarrollo','Diciplinar obligatoria',3,19587),(367,'Antropología en Colombia','Diciplinar obligatoria',3,19587),(368,'Antropología Histórica I','Diciplinar obligatoria',3,19587),(369,'Antropología Histórica II','Diciplinar obligatoria',3,19587),(370,'Arqueología y Sociedad','Diciplinar obligatoria',3,19587),(371,'Arqueologías Americanas','Diciplinar obligatoria',3,19587),(372,'Etnología en Colombia','Diciplinar obligatoria',3,19587),(373,'Etnología Regional','Diciplinar obligatoria',3,19587),(374,'Fundamentos de antropología','Diciplinar obligatoria',3,19587),(375,'Hominización','Diciplinar obligatoria',3,19587),(376,'Introducción a la Antropología Lingüística','Diciplinar obligatoria',3,19587),(377,'Pensamiento antropológico I','Disciplinar Obligatoria',3,19587),(378,'Pensamiento antropológico II','Disciplinar Obligatoria',3,19587),(379,'Pensamiento arqueológico I','Disciplinar Obligatoria',3,19587),(380,'Pensamiento arqueológico II','Disciplinar Obligatoria',3,19587),(381,'Seminario del Departamento','Disciplinar Obligatoria',3,19587),(382,'Técnicas de investigación en antropología I','Disciplinar Obligatoria',3,19587),(383,'Técnicas de investigación en antropología II','Disciplinar Obligatoria',4,19587),(384,'Teoría Social','Disciplinar Obligatoria',3,19587),(385,'Inglés I- Semestral','Nivelacion',3,19587),(386,'Inglés II - Semestral','Nivelacion',3,19587),(387,'Inglés II - Virtual','Nivelacion',3,19587),(388,'Inglés III - Semestral','Nivelacion',3,19587),(389,'Inglés III- Virtual','Nivelacion',3,19587),(390,'Inglés Intensivo I y II','Nivelacion',6,19587),(391,'Inglés Intensivo III y IV','Nivelacion',6,19587),(392,'Inglés IV- Semestral','Nivelacion',3,19587),(393,'Inglés IV- Virtual','Nivelacion',3,19587),(394,'Lecto-Escritura','Nivelacion',4,19587),(395,'Trabajo de Grado','Trabajo de grado',6,19587),(396,'Trabajo de Grado - Asignaturas de Posgrado','Trabajo de grado',6,19587),(397,'Colombia Contemporánea','Fundamentacion obligatoria',3,19587),(398,'Ecología y Evolución','Fundamentacion obligatoria',3,19587),(399,'Fundamentos de las ciencias sociales','Fundamentacion obligatoria',3,19587),(400,'Historia Sociocultural de Colombia','Fundamentacion obligatoria',3,19587),(401,'Comunicación y Cultura','Disciplinar Optativa',3,19587),(402,'Diseño de Proyecto en Antropología Biológica','Disciplinar Optativa',5,19587),(403,'Diseño de Proyecto en Antropología Lingüística','Disciplinar Optativa',5,19587),(404,'Diseño de Proyecto en Antropología Social','Disciplinar Optativa',5,19587),(405,'Etnografía del Habla','Disciplinar Optativa',3,19587),(406,'Etnolingüística','Disciplinar Optativa',3,19587),(407,'Laboratorio en Antropología Social','Disciplinar Optativa',10,19587),(408,'Laboratorio en Arqueología','Disciplinar Optativa',10,19587),(409,'Palabra e imagen','Disciplinar Optativa',3,19587),(410,'Panorama Lingüístico Colombiano','Disciplinar Optativa',3,19587),(411,'Sociolinguística','Disciplinar Optativa',3,19587),(412,'Agroecología','Diciplinar obligatoria',3,10572),(413,'Climatología','Diciplinar obligatoria',3,10572),(414,'Edafología','Diciplinar obligatoria',3,10572),(415,'Entomología','Diciplinar obligatoria',3,10572),(416,'Fisiología Vegetal','Diciplinar obligatoria',4,10572),(417,'Fitomejoramiento','Diciplinar obligatoria',3,10572),(418,'Fitopatología','Diciplinar obligatoria',3,10572),(419,'Introduccion a la Ingeniería Agronómica','Diciplinar obligatoria',3,10572),(420,'Manejo de la Fertilidad del Suelo','Disciplinar Obligatoria',3,10572),(421,'Manejo Integrado de Enfermedades','Disciplinar Obligatoria',3,10572),(422,'Manejo Integrado de Malezas','Disciplinar Obligatoria',3,10572),(423,'Manejo Integrado de Plagas','Disciplinar Obligatoria',3,10572),(424,'Mecanización Agricola','Disciplinar Obligatoria',3,10572),(425,'Practica Profesional Agronomia','Disciplinar Obligatoria',12,10572),(426,'Reproducción y multiplicación de plantas','Disciplinar Obligatoria',3,10572),(427,'Riegos y Drenajes','Disciplinar Obligatoria',3,10572),(428,'Examen de Clasificación Inglés nivel II','Nivelacion',3,10572),(429,'Examen de Clasificación Ingles nivel III','Nivelacion',6,10572),(430,'Examen de Clasificación Ingles nivel IV','Nivelacion',9,10572),(431,'Inglés I','Nivelacion',3,10572),(432,'Inglés II','Nivelacion',3,10572),(433,'Inglés III','Nivelacion',3,10572),(434,'Inglés Intensivo III y IV','Nivelacion',6,10572),(435,'Inglés IV','Nivelacion',3,10572),(436,'Inglés Virtual Nivel II','Nivelacion',3,10572),(437,'Inglés Virtual Nivel III','Nivelacion',3,10572),(438,'Inglés Virtual Nivel IV','Nivelacion',3,10572),(439,'Lecto-Escritura','Nivelacion',4,10572),(440,'Matemáticas Básica','Nivelacion',4,10572),(441,'Trabajo de Grado','Trabajo de grado',6,10572),(442,'Trabajo de Grado - Asignaturas de Posgrado','Trabajo de grado',6,10572),(443,'Biologia General','Fundamentacion obligatoria',4,10572),(444,'Biología Molecular y Celular','Fundamentacion obligatoria',4,10572),(445,'Bioquímica','Fundamentacion obligatoria',3,10572),(446,'Botánica','Fundamentacion obligatoria',3,10572),(447,'Cálculo Diferencial','Fundamentacion obligatoria',4,10572),(448,'Cálculo Integral','Fundamentacion obligatoria',4,10572),(449,'Diseño Experimental','Fundamentacion obligatoria',4,10572),(450,'Economía','Fundamentacion obligatoria',3,10572),(451,'Física: mecánica','Fundamentación Obligatoria',4,10572),(452,'Genética','Fundamentación Obligatoria',3,10572),(453,'Gestión de Empresas','Fundamentación Obligatoria',3,10572),(454,'Microbiología','Fundamentación Obligatoria',4,10572),(455,'Probabilidad y estadística','Fundamentación Obligatoria',4,10572),(456,'Quimica General','Fundamentación Obligatoria',3,10572),(457,'Abonos Verdes y Acolchado Orgánicos','Disciplinar Optativa',3,10572),(458,'Acarología','Disciplinar Optativa',3,10572),(459,'Biología del Suelo','Disciplinar Optativa',3,10572),(460,'Control Biológico','Disciplinar Optativa',3,10572),(461,'Epidemiologia Agrícola','Disciplinar Optativa',3,10572),(462,'Fisiología de Cultivos','Disciplinar Optativa',3,10572),(463,'Hongos y Oomicetos patógenos de plantas','Disciplinar Optativa',3,10572),(464,'Manejo Integrado de Plaguicidas','Disciplinar Optativa',3,10572),(465,'Nutrición Vegetal','Disciplinar Optativa',3,10572),(466,'Relación Planta-Agua-Suelo-Atmósfera','Disciplinar Optativa',3,10572),(467,'Sistemas de información geográfico básico','Disciplinar Optativa',3,10572),(468,'Sistemas de prod.(Café, cacao y musáceas)','Disciplinar Optativa',3,10572),(469,'Sistemas de prod.(Cereales y leguminosas)','Disciplinar Optativa',3,10572),(470,'Sistemas de prod.(Cultivos Industriales)','Disciplinar Optativa',3,10572),(471,'Sistemas de prodrucción (Plantas medicinales y aromáticas)','Disciplinar Optativa',3,10572),(472,'Sistemas de Produccion de Caña de Azúcar','Disciplinar Optativa',3,10572),(473,'Sistemas de producción (Frutales)','Disciplinar Optativa',3,10572),(474,'Sistemas de producción (Hortalizas)','Disciplinar Optativa',3,10572),(475,'Sistemas de producción (Pastos y forrajes)','Disciplinar Optativa',3,10572),(476,'Sistemas diversificados de cultivos','Disciplinar Optativa',3,10572),(477,'Topografía y cartografía','Disciplinar Optativa',3,10572),(478,'Uso, Manejo y Conservación de Suelos','Disciplinar Optativa',3,10572),(479,'Virus de Plantas','Disciplinar Optativa',3,10572),(480,'Botánica taxonómica','Fundamentacion optativa',3,10572),(481,'Ecología','Fundamentacion optativa',3,10572),(482,'Extension Rural','Fundamentacion optativa',3,10572),(483,'Formulación y Evaluación de Proyectos','Fundamentacion optativa',3,10572),(484,'Manejo ambiental agropecuario','Fundamentacion optativa',3,10572),(485,'Mercadeo','Fundamentacion optativa',3,10572),(486,'Métodos de Biología Molecular','Fundamentacion optativa',3,10572),(487,'Bacteriología y micología','Diciplinar obligatoria',3,797),(488,'Cirugía I','Diciplinar obligatoria',4,797),(489,'Cirugía II','Diciplinar obligatoria',2,797),(490,'Clínica de grandes animales','Diciplinar obligatoria',8,797),(491,'Clínica de la reproducción','Diciplinar obligatoria',8,797),(492,'Clínica de pequeños animales','Diciplinar obligatoria',8,797),(493,'Epidemiología','Diciplinar obligatoria',3,797),(494,'Extensión y desarrollo rural','Diciplinar obligatoria',1,797),(495,'Farmacología','Diciplinar obligatoria',4,797),(496,'Imagenología','Diciplinar obligatoria',1,797),(497,'Inmunología','Diciplinar obligatoria',2,797),(498,'Mecanismos de enfermedad','Diciplinar obligatoria',4,797),(499,'Medicina aviar','Diciplinar obligatoria',3,797),(500,'Medicina interna de equinos','Diciplinar obligatoria',2,797),(501,'Medicina interna de pequeños','Diciplinar obligatoria',2,797),(502,'Medicina interna de porcinos','Diciplinar obligatoria',2,797),(503,'Medicina interna de rumiantes','Diciplinar obligatoria',2,797),(504,'Medicina interna de silvestres','Diciplinar obligatoria',2,797),(505,'Nutrición','Diciplinar obligatoria',2,797),(506,'Parasitología','Diciplinar obligatoria',4,797),(507,'Patología clínica','Diciplinar obligatoria',3,797),(508,'Patología sistémica','Diciplinar obligatoria',4,797),(509,'Planeación y evaluación de empresas agropecuarias','Diciplinar obligatoria',2,797),(510,'Política agropecuaria','Diciplinar obligatoria',3,797),(511,'Rotación por laboratorios','Diciplinar obligatoria',8,797),(512,'Salud de hato','Diciplinar obligatoria',3,797),(513,'Salud pública','Diciplinar obligatoria',4,797),(514,'Semiología','Diciplinar obligatoria',3,797),(515,'Sociedades rurales','Diciplinar obligatoria',3,797),(516,'Teriogenología I','Diciplinar obligatoria',2,797),(517,'Teriogenología II','Diciplinar obligatoria',2,797),(518,'Toxicología','Diciplinar obligatoria',3,797),(519,'Virología','Diciplinar obligatoria',3,797),(520,'Inglés I- Semestral','Nivelacion',3,797),(521,'Inglés II - Semestral','Nivelacion',3,797),(522,'Inglés II - Virtual','Nivelacion',3,797),(523,'Inglés III - Semestral','Nivelacion',3,797),(524,'Inglés III- Virtual','Nivelacion',3,797),(525,'Inglés Intensivo I y II','Nivelacion',6,797),(526,'Inglés Intensivo III y IV','Nivelacion',6,797),(527,'Inglés IV- Semestral','Nivelacion',3,797),(528,'Inglés IV- Virtual','Nivelacion',3,797),(529,'Lecto-Escritura','Nivelacion',4,797),(530,'Matemáticas Básicas','Nivelacion',4,797),(531,'Suficiencia en lengua extranjera','Nivelacion',12,797),(532,'Trabajo de Grado','Trabajo de grado',10,797),(533,'Trabajo de Grado - Asignaturas de Posgrado','Trabajo de grado',10,797),(534,'Anatomía comparada','Fundamentacion obligatoria',5,797),(535,'Bioestadística fundamental','Fundamentacion obligatoria',3,797),(536,'Bioética y bienestar en salud animal','Fundamentacion obligatoria',3,797),(537,'Biofísica','Fundamentacion obligatoria',2,797),(538,'Biología molecular avanzada','Fundamentacion obligatoria',2,797),(539,'Bioquímica básica','Fundamentacion obligatoria',3,797),(540,'Fisiología','Fundamentacion obligatoria',5,797),(541,'Genética','Fundamentacion obligatoria',3,797),(542,'Histología y embriología','Fundamentacion obligatoria',4,797),(543,'Introducción a las ciencias veterinarias','Fundamentacion obligatoria',2,797),(544,'Química básica','Fundamentacion obligatoria',3,797),(545,'Medicina de peces','Disciplinar Optativa',2,797),(546,'Mercadeo agropecuario','Disciplinar Optativa',3,797),(547,'Nutrición y alimentación I','Disciplinar Optativa',4,797),(548,'Problemática ambiental','Disciplinar Optativa',2,797),(549,'Sistemas de producción I','Disciplinar Optativa',2,797),(550,'Sistemas de producción II','Disciplinar Optativa',2,797),(551,'Suelos y plantas','Disciplinar Optativa',2,797),(552,'Trabajo de campo Costa Atlántica','Disciplinar Optativa',2,797),(553,'Trabajo de campo Los Llanos','Disciplinar Optativa',2,797),(554,'Trabajo de campo Quindío','Disciplinar Optativa',2,797),(555,'Biología general','Fundamentacion optativa',3,797),(556,'Biología molecular y celular','Fundamentacion optativa',3,797),(557,'Fundamentos de ecología','Fundamentacion optativa',3,797),(558,'Algebra lineal basica','FUND. OBLIGATORIA',4,26329),(559,'Algebra matricial','FUND. OBLIGATORIA',4,26329),(560,'Fundamentos de matematicas','FUND. OBLIGATORIA',4,26329),(561,'Comunicación oral y escrita','FUND. OPTATIVA',3,26329),(562,'Cálculo diferencial en una variable','FUND. OBLIGATORIA',4,26329),(563,'Estadística descriptiva y exploratoria','FUND. OBLIGATORIA',4,26329),(564,'Sistemas numéricos','FUND. OBLIGATORIA',4,26329),(565,'Cálculo integral en una variable ','FUND. OBLIGATORIA',4,26329),(566,'Probabilidad','FUND. OBLIGATORIA',4,26329),(567,'Calculo vectorial','FUND. OBLIGATORIA',4,26329),(568,'Inferencia estadística','FUND. OBLIGATORIA',4,26329),(569,'Análisis de datos categóricos','DISCIPLINAR OPTATIVA',4,26329),(570,'Análisis de datos longitudinales','DISCIPLINAR OPTATIVA ',4,26329),(571,'Análisis de regresión','DISCIPLINAR OBLIGATORIA ',4,26329),(572,'Análisis estocástico','FUND. OPTATIVA ',4,26329),(573,'Análisis multivariado','DISCIPLINAR OPTATIVA',4,26329),(574,'Bases de datos','FUND. OPTATIVA ',3,26329),(575,'Cálculo actuarial','DISCIPLINAR OPTATIVA ',3,26329),(576,'Cálculo de ecuaciones diferenciales ordinarias','FUND. OPTATIVA ',3,26329),(577,'Comprensión de textos en idioma extranjero','NIVELACIÓN ',12,26329),(578,'Computación estadística','DISCIPLINAR OPTATIVA ',3,26329),(579,'Consultoría estadística','DISCIPLINAR OBLIGATORIA ',3,26329),(580,'Control estadístico de calidad','DISCIPLINAR OPTATIVA ',3,26329),(581,'Estadística bayesiana','DISCIPLINAR OPTATIVA ',4,26329),(582,'Muestreo estadístico','DISCIPLINAR OPTATIVA ',4,26329),(583,'Diseño de experimentos','DISCIPLINAR OPTATIVA ',4,26329),(584,'Series de tiempo univariadas','DISCIPLINAR OPTATIVA ',4,26329),(585,'Programación de computadores','FUND. OPTATIVA',3,26329),(586,'Programación en lenguajes estadísticos ','FUND. OPTATIVA',4,26329),(587,'Programación orientada a objetos ','FUND. OPTATIVA',3,26329),(588,'Español funcional','FUND. OPTATIVA',3,26329),(589,'Métodos numéricos','FUND. OPTATIVA',3,26329),(590,'Seminario de estadística','DISCIPLINAR OPTATIVA',2,26329),(591,'Tópicos de econometría II','DISCIPLINAR OPTATIVA',2,26329),(592,'Minería de datos','DISCIPLINAR OPTATIVA',4,26329),(593,'Métodos de clasificación','DISCIPLINAR OPTATIVA',4,26329),(594,'Finanzas','DISCIPLINAR OPTATIVA',3,26329),(595,'Finanzas y modelos de inversión','DISCIPLINAR OPTATIVA',3,26329),(596,'Estadística espacial','DISCIPLINAR OPTATIVA',4,26329),(597,'Estadística y sociedad','DISCIPLINAR OPTATIVA',3,26329),(598,'Tópicos de econometría II','DISCIPLINAR OPTATIVA',3,26329),(599,'Arquitectura de computadores','DISCIPLINAR OBLIGATORIA',3,3576),(600,'Arquitectura de infraestructura y gobierno de tics','DISCIPLINAR OBLIGATORIA',3,3576),(601,'Arquitectura de Software','DISCIPLINAR OBLIGATORIA',3,3576),(602,'Bases de datos','DISCIPLINAR OBLIGATORIA',3,3576),(603,'Computación paralela y distribuida','DISCIPLINAR OBLIGATORIA',3,3576),(604,'Computación visual','DISCIPLINAR OBLIGATORIA',3,3576),(605,'Estructuras de datos','DISCIPLINAR OBLIGATORIA',3,3576),(606,'Ingeniería de software I','DISCIPLINAR OBLIGATORIA',3,3576),(607,'Ingeniería de software II','DISCIPLINAR OBLIGATORIA',3,3576),(608,'Inteligencia artificial','DISCIPLINAR OBLIGATORIA',3,3576),(609,'Introducción a la ingeniería de sistemas y computación','DISCIPLINAR OBLIGATORIA',3,3576),(610,'Introducción a los sistemas inteligentes','DISCIPLINAR OBLIGATORIA',3,3576),(611,'Lenguajes de programación','DISCIPLINAR OBLIGATORIA',3,3576),(612,'Modelos estocásticos y simulación en computación y comunicaciones','DISCIPLINAR OBLIGATORIA',3,3576),(613,'Pensamiento sistémico','DISCIPLINAR OBLIGATORIA',3,3576),(614,'Programación orientada a objetos','DISCIPLINAR OBLIGATORIA',3,3576),(615,'Redes de computadores','DISCIPLINAR OBLIGATORIA',3,3576),(616,'Sistemas operativos','DISCIPLINAR OBLIGATORIA',3,3576),(617,'Taller de proyectos interdisciplinarios','DISCIPLINAR OBLIGATORIA',3,3576),(618,'Tópicos de econometría II','DISCIPLINAR OBLIGATORIA',3,3576),(619,'Matemáticas Básicas','NIVELACION',4,3576),(620,'Inglés I- Semestral','Nivelacion',3,3576),(621,'Inglés II - Semestral','Nivelacion',3,3576),(622,'Inglés II - Virtual','Nivelacion',3,3576),(623,'Inglés III - Semestral','Nivelacion',3,3576),(624,'Inglés III- Virtual','Nivelacion',3,3576),(625,'Inglés Intensivo I y II','Nivelacion',3,3576),(626,'Inglés Intensivo III y IV','Nivelacion',3,3576),(627,'Inglés IV- Semestral','Nivelacion',3,3576),(628,'Inglés IV- Virtual','Nivelacion',3,3576),(629,'Lecto-Escritura','Nivelacion',4,3576),(630,'Trabajo de Grado','Trabajo de Grado',6,3576),(631,'Trabajo de grado - asignaturas de posgrados','Trabajo de Grado',6,3576),(632,'Trabajo de grado - modalidad trabajos investigativos','Trabajo de Grado',6,3576),(633,'Trabajo de grado - modalidad practica de extensión','Trabajo de Grado',6,3576),(634,'Algoritmos','FUND. OBLIGATORIA',3,3576),(635,'Complemento a teoría de la computación','FUND. OBLIGATORIA',1,3576),(636,'Fundamentos de electricidad y magnetismo','FUND. OBLIGATORIA',4,3576),(637,'Fundamentos de mecánica','FUND. OBLIGATORIA',4,3576),(638,'Introducción a la teoría de la computación','FUND. OBLIGATORIA',4,3576),(639,'Teoría de la computación','FUND. OBLIGATORIA',3,3576),(640,'Comunicaciones','DISCIPLINAR OPTATIVA',3,3576),(641,'Elementos de computadores','DISCIPLINAR OPTATIVA',3,3576),(642,'Introducción a la criptografía y a la seguridad de la Información','DISCIPLINAR OPTATIVA',3,3576),(643,'Introducción a las ciencias de la computación y a la programación','DISCIPLINAR OPTATIVA',3,3576),(644,'Modelos y simulación','DISCIPLINAR OPTATIVA',3,3576),(645,'Optimización','DISCIPLINAR OPTATIVA',3,3576),(646,'Programación de computadores','DISCIPLINAR OPTATIVA',3,3576),(647,'Sistemas de información','DISCIPLINAR OPTATIVA',3,3576),(648,'Sistemas de Información Gerencial','DISCIPLINAR OPTATIVA',4,3576),(649,'Teoría de la información y sistemas de comunicacion','DISCIPLINAR OPTATIVA',3,3576),(650,'Álgebra Lineal','FUND. OPTATIVA',4,3576),(651,'Álgebra lineal básica','FUND.OPTATIVA',4,3576),(652,'Cálculo diferencial','FUND. OPTATIVA',4,3576),(653,'Cálculo en varias variables','FUND. OPTATIVA',4,3576),(654,'Cálculo Integral','FUND. OPTATIVA',4,3576),(655,'Cálculo integral en una variable','FUND. OPTATIVA',4,3576),(656,'Calculo vectorial','FUND. OPTATIVA',4,3576),(657,'Diseño, gestión y evaluación de proyectos','FUND. OPTATIVA',4,3576),(658,'Ecuaciones Diferenciales','FUND. OPTATIVA',4,3576),(659,'Gerencia y gestión de proyectos','FUND. OPTATIVA',3,3576),(660,'Ingeniería económica','FUND. OPTATIVA',3,3576),(661,'Ingeniería económica y análisis de riesgo','FUND. OPTATIVA',3,3576),(662,'Matemáticas discretas I','FUND. OPTATIVA',4,3576),(663,'Matemáticas discretas II','FUND. OPTATIVA',4,3576),(664,'Métodos numéricos','FUND. OPTATIVA',3,3576),(665,'Probabilidad','FUND. OPTATIVA',4,3576),(666,'Probabilidad y estadística fundamental','FUND. OPTATIVA',3,3576),(667,'Teoría de grafos','FUND. OPTATIVA',4,3576),(668,'Contabilidad de Gestión Avanzada','DISCIPLINAR OBLIGATORIA',4,2493),(669,'Ingeniería económica y análisis de riesgo','DISCIPLINAR OBLIGATORIA',3,2493),(670,'Introducción a la ingeniería industrial','DISCIPLINAR OBLIGATORIA',3,2493),(671,'Investigación de mercados','DISCIPLINAR OBLIGATORIA',3,2493),(672,'Logística','DISCIPLINAR OBLIGATORIA',3,2493),(673,'Mercados I','DISCIPLINAR OBLIGATORIA',4,2493),(674,'Modelos estocásticos para procesos de manufactura y sistemas de servicios','DISCIPLINAR OBLIGATORIA',3,2493),(675,'Planeación estratégica','DISCIPLINAR OBLIGATORIA',3,2493),(676,'Seguridad industrial','DISCIPLINAR OBLIGATORIA',3,2493),(677,'Sociología especial: Industrial y del trabajo','DISCIPLINAR OBLIGATORIA',3,2493),(678,'Taller de ciencia y tecnología de materiales','DISCIPLINAR OBLIGATORIA',4,2493),(679,'Taller de diseño de plantas','DISCIPLINAR OBLIGATORIA',4,2493),(680,'Taller de ergonomía e ingeniería de métodos','DISCIPLINAR OBLIGATORIA',4,2493),(681,'Taller de herramientas y problemas en ingeniería industrial','DISCIPLINAR OBLIGATORIA',3,2493),(682,'Taller de ingeniería de la producción','DISCIPLINAR OBLIGATORIA',4,2493),(683,'Taller de invención y creatividad','DISCIPLINAR OBLIGATORIA',3,2493),(684,'Taller de metodología de la investigación','DISCIPLINAR OBLIGATORIA',3,2493),(685,'Taller de Procesos Metalmecánicos','DISCIPLINAR OBLIGATORIA',3,2493),(686,'Taller de Procesos Químicos y Biotecnológicos','DISCIPLINAR OBLIGATORIA',3,2493),(687,'Taller de simulación procesos de manufactura y sistemas de servicios','DISCIPLINAR OBLIGATORIA',3,2493),(688,'Taller de simulación procesos de manufactura y sistemas de servicios','DISCIPLINAR OBLIGATORIA',3,2493),(689,'Teoría Contemporánea de la Organización','DISCIPLINAR OBLIGATORIA',4,2493),(690,'Matemáticas Básicas','NIVELACION',4,2493),(691,'Inglés I- Semestral','Nivelacion',3,2493),(692,'Inglés II - Semestral','Nivelacion',3,2493),(693,'Inglés II - Virtual','Nivelacion',3,2493),(694,'Inglés III - Semestral','Nivelacion',3,2493),(695,'Inglés III- Virtual','Nivelacion',3,2493),(696,'Inglés Intensivo I y II','Nivelacion',3,2493),(697,'Inglés Intensivo III y IV','Nivelacion',3,2493),(698,'Inglés IV- Semestral','Nivelacion',3,2493),(699,'Inglés IV- Virtual','Nivelacion',3,2493),(700,'Lecto-Escritura','Nivelacion',4,2493),(701,'Trabajo de grado - asignaturas de posgrados','Trabajo de Grado',6,2493),(702,'Trabajo de grado - modalidad trabajos investigativos','Trabajo de Grado',6,2493),(703,'Trabajo de grado - modalidad practica de extensión','Trabajo de Grado',6,2493),(704,'Biología general','FUND. OBLIGATORIA',3,2493),(705,'Biología molecular y celular','FUND. OBLIGATORIA',3,2493),(706,'Complemento probabilidad fundamental','FUND. OBLIGATORIA',1,2493),(707,'Estadística descriptiva y exploratoria','FUND. OBLIGATORIA',4,2493),(708,'Fundamentos de ecología','FUND. OBLIGATORIA',3,2493),(709,'Fundamentos de electricidad y magnetismo','FUND. OBLIGATORIA',4,2493),(710,'Fundamentos de mecánica','FUND. OBLIGATORIA',4,2493),(711,'Inferencia estadística','FUND. OBLIGATORIA',4,2493),(712,'Inferencia estadística fundamental','FUND. OBLIGATORIA',4,2493),(713,'Principios de química','FUND. OBLIGATORIA',3,2493),(714,'Probabilidad fundamental','FUND. OBLIGATORIA',4,2493),(715,'Programación de computadores','FUND. OBLIGATORIA',3,2493),(716,'Programación orientada a objetos','FUND. OBLIGATORIA',3,2493),(717,'Administración de personal I','DISCIPLINAR OPTATIVA',4,2493),(718,'Control estadístico de calidad','DISCIPLINAR OPTATIVA',3,2493),(719,'Control y gestión de calidad','DISCIPLINAR OPTATIVA',3,2493),(720,'Creación y gestión de empresas','DISCIPLINAR OPTATIVA',3,2493),(721,'Diseño, gestión y evaluación de proyectos','DISCIPLINAR OPTATIVA',4,2493),(722,'Economía general','DISCIPLINAR OPTATIVA',3,2493),(723,'Finanzas','DISCIPLINAR OPTATIVA',3,2493),(724,'Finanzas avanzadas','DISCIPLINAR OPTATIVA',4,2493),(725,'Fundamentos de administración','DISCIPLINAR OPTATIVA',4,2493),(726,'Gerencia de recursos humanos','DISCIPLINAR OPTATIVA',3,2493),(727,'Gerencia y gestión de proyectos','DISCIPLINAR OPTATIVA',3,2493),(728,'Gestión tecnológica','DISCIPLINAR OPTATIVA',3,2493),(729,'Microeconomía I','DISCIPLINAR OPTATIVA',4,2493),(730,'Modelos y simulación','DISCIPLINAR OPTATIVA',3,2493),(731,'Optimización','DISCIPLINAR OPTATIVA',3,2493),(732,'Sistemas de costos','DISCIPLINAR OPTATIVA',4,2493),(733,'Sistemas de información','DISCIPLINAR OPTATIVA',3,2493),(734,'Sistemas de Información Gerencial','DISCIPLINAR OPTATIVA',4,2493),(735,'Álgebra Lineal','FUND. OPTATIVA',4,2493),(736,'Cálculo diferencial','FUND. OPTATIVA',4,2493),(737,'Cálculo diferencial en una variable','FUND. OPTATIVA',4,2493),(738,'Cálculo en varias variables','FUND. OPTATIVA',4,2493),(739,'Cálculo Integral','FUND. OPTATIVA',4,2493),(740,'Ecuaciones Diferenciales','FUND. OPTATIVA',4,2493),(741,'Bioética','DISCIPLINAR OBLIGATORIA',2,3680),(742,'Cariología','DISCIPLINAR OBLIGATORIA',3,3680),(743,'Clínica de odontología hospitalaria','DISCIPLINAR OBLIGATORIA',2,3680),(744,'Clínica odontológica de adulto I','DISCIPLINAR OBLIGATORIA',2,3680),(745,'Clínica odontológica de adulto II','DISCIPLINAR OBLIGATORIA',3,3680),(746,'Clínica odontológica de Cirugía oral I','DISCIPLINAR OBLIGATORIA',2,3680),(747,'Clínica odontológica de Cirugía oral II','DISCIPLINAR OBLIGATORIA',2,3680),(748,'Clínica odontológica de Ortodoncia I','DISCIPLINAR OBLIGATORIA',1,3680),(749,'Clínica odontológica de Ortodoncia II','DISCIPLINAR OBLIGATORIA',2,3680),(750,'Clínica odontológica del adulto III','DISCIPLINAR OBLIGATORIA',3,3680),(751,'Clínica odontológica del adulto IV','DISCIPLINAR OBLIGATORIA',3,3680),(752,'Clínica odontológica del adulto mayor','DISCIPLINAR OBLIGATORIA',2,3680),(753,'Clínica odontológica del Niño I ','DISCIPLINAR OBLIGATORIA',2,3680),(754,'Clínica odontológica del niño II','DISCIPLINAR OBLIGATORIA',3,3680),(755,'Determinantes del Proceso Salud - Enfermedad','DISCIPLINAR OBLIGATORIA',3,3680),(756,'Endodoncia','DISCIPLINAR OBLIGATORIA',3,3680),(757,'Epidemiología','DISCIPLINAR OBLIGATORIA',3,3680),(758,'Imagenología','DISCIPLINAR OBLIGATORIA',3,3680),(759,'Morfología oral','DISCIPLINAR OBLIGATORIA',3,3680),(760,'Morfología oral y oclusión','DISCIPLINAR OBLIGATORIA',3,3680),(761,'Odontopediatría','DISCIPLINAR OBLIGATORIA',3,3680),(762,'Operatoria y materiales dentales','DISCIPLINAR OBLIGATORIA',3,3680),(763,'Ortodoncia, crecimiento y desarrollo','DISCIPLINAR OBLIGATORIA',3,3680),(764,'Periodoncia','DISCIPLINAR OBLIGATORIA',3,3680),(765,'Políticas públicas y administración en salud','DISCIPLINAR OBLIGATORIA',2,3680),(766,'Principios quirúrgicos y anestesiología','DISCIPLINAR OBLIGATORIA',3,3680),(767,'Rehabilitación oral I','DISCIPLINAR OBLIGATORIA',3,3680),(768,'Rehabilitación oral II','DISCIPLINAR OBLIGATORIA',3,3680),(769,'Salud pública','DISCIPLINAR OBLIGATORIA',2,3680),(770,'Semiología','DISCIPLINAR OBLIGATORIA',3,3680),(771,'Matemáticas Básicas','NIVELACION',4,3680),(772,'Inglés I- Semestral','Nivelacion',3,3680),(773,'Inglés II - Semestral','Nivelacion',3,3680),(774,'Inglés II - Virtual','Nivelacion',3,3680),(775,'Inglés III - Semestral','Nivelacion',3,3680),(776,'Inglés III- Virtual','Nivelacion',3,3680),(777,'Inglés Intensivo I y II','Nivelacion',3,3680),(778,'Inglés Intensivo III y IV','Nivelacion',3,3680),(779,'Inglés IV- Semestral','Nivelacion',3,3680),(780,'Inglés IV- Virtual','Nivelacion',3,3680),(781,'Lecto-Escritura','Nivelacion',4,3680),(782,'Trabajo de grado - asignaturas de posgrados','Trabajo de Grado',6,3680),(783,'Anatomía e histología I','FUND. OBLIGATORIA',4,3680),(784,'Anatomía e histología II','FUND. OBLIGATORIA',8,3680),(785,'Biología Celular','FUND. OBLIGATORIA',4,3680),(786,'Bioquímica básica','FUND. OBLIGATORIA',3,3680),(787,'Farmacología','FUND. OBLIGATORIA',4,3680),(788,'Fisiología general','FUND. OBLIGATORIA',6,3680),(789,'Lógica Informal','FUND. OBLIGATORIA',3,3680),(790,'Mecánica y ondas para biociencias','FUND. OBLIGATORIA',4,3680),(791,'Microbiología general y oral','FUND. OBLIGATORIA',3,3680),(792,'Patología general y oral I','FUND. OBLIGATORIA',3,3680),(793,'Patología general y oral II','FUND. OBLIGATORIA',2,3680),(794,'Química básica','FUND. OBLIGATORIA',3,3680),(795,'Clínica integral de mantenimiento','DISCIPLINAR OPTATIVA',2,3680),(796,'Odontología forense','DISCIPLINAR OPTATIVA',2,3680),(797,'Perspectivas Sociohistóricas de la Odontología','DISCIPLINAR OPTATIVA',2,3680),(798,'Promoción de la Salud','DISCIPLINAR OPTATIVA',2,3680),(799,'Seminario de materiales dentales I','DISCIPLINAR OPTATIVA',3,3680),(800,'Seminario de trabajo de grado','DISCIPLINAR OPTATIVA',3,3680),(801,'Taller de Investigación','DISCIPLINAR OPTATIVA',3,3680),(802,'Taller: Herramientas básicas para facilitar la construcción de textos.','DISCIPLINAR OPTATIVA',2,3680),(803,'Bioestadística fundamental','FUND. OPTATIVA',3,3680),(804,'Farmacologia en el paciente adulto mayor','FUND. OPTATIVA',3,3680),(805,'Inmunología','FUND. OPTATIVA',3,3680),(806,'Principios de estadística para odontología','FUND. OPTATIVA',3,3680),(807,'ÁLGEBRA MULTILINEAL Y FORMAS CANÓNICAS','DISCIPLINAR OBLIGATORIA',4,176),(808,'ANÁLISIS NUMÉRICO','DISCIPLINAR OBLIGATORIA',4,176),(809,'ANÁLISIS VECTORIAL','DISCIPLINAR OBLIGATORIA',4,176),(810,'GRUPOS Y ANILLOS','DISCIPLINAR OBLIGATORIA',4,176),(811,'INTEGRACION Y SERIES','DISCIPLINAR OBLIGATORIA',4,176),(812,'INTRODUCCIÓN A LA OPTIMIZACIÓN','DISCIPLINAR OBLIGATORIA',4,176),(813,'INTRODUCCIÓN AL ANÁLISIS REAL','DISCIPLINAR OBLIGATORIA',4,176),(814,'LÓGICA MATEMÁTICA','DISCIPLINAR OBLIGATORIA',4,176),(815,'TEORÍA DE CUERPOS','DISCIPLINAR OBLIGATORIA',4,176),(816,'TOPOLOGIA GENERAL','DISCIPLINAR OBLIGATORIA',4,176),(817,'VARIABLE COMPLEJA','DISCIPLINAR OBLIGATORIA',4,176),(818,'Matemáticas Básicas','NIVELACION',4,176),(819,'Inglés I- Semestral','Nivelacion',3,176),(820,'Inglés II - Semestral','Nivelacion',3,176),(821,'Inglés II - Virtual','Nivelacion',3,176),(822,'Inglés III - Semestral','Nivelacion',3,176),(823,'Inglés III- Virtual','Nivelacion',3,176),(824,'Inglés Intensivo I y II','Nivelacion',3,176),(825,'Inglés Intensivo III y IV','Nivelacion',3,176),(826,'Inglés IV- Semestral','Nivelacion',3,176),(827,'Inglés IV- Virtual','Nivelacion',3,176),(828,'Lecto-Escritura','Nivelacion',4,176),(829,'CURSOS EN POSGRADO','Trabajo de Grado',8,176),(830,'TRABAJO DE GRADO','Trabajo de Grado',8,176),(831,'ALGEBRA LINEAL','FUND. OBLIGATORIA',4,176),(832,'CÁLCULO DIFERENCIAL','FUND. OBLIGATORIA',4,176),(833,'CÁLCULO INTEGRAL','FUND. OBLIGATORIA',4,176),(834,'CÁLCULO VECTORIAL','FUND. OBLIGATORIA',4,176),(835,'CONJUNTOS Y COMBINATORIA','FUND. OBLIGATORIA',4,176),(836,'ECUACIONES DIFERENCIALES','FUND. OBLIGATORIA',4,176),(837,'FÍSICA: ELECTRICIDAD Y MAGNETISMO','FUND. OBLIGATORIA',4,176),(838,'FISICA: MECANICA','FUND. OBLIGATORIA',4,176),(839,'FUNDAMENTOS DE MATEMATICAS','FUND. OBLIGATORIA',4,176),(840,'GEOMETRIA','FUND. OBLIGATORIA',4,176),(841,'METODOS NUMERICOS','FUND. OBLIGATORIA',4,176),(842,'PROBABILIDAD','FUND. OBLIGATORIA',4,176),(843,'SISTEMAS NUMÉRICOS','FUND. OBLIGATORIA',4,176),(844,'ALGEBRA CONMUTATIVA','DISCIPLINAR OPTATIVA',4,176),(845,'Algebra tensorial','DISCIPLINAR OPTATIVA',4,176),(846,'ANALISIS DE METODOS MULTIVARIADOS','DISCIPLINAR OPTATIVA',4,176),(847,'Análisis Funcional','DISCIPLINAR OPTATIVA',4,176),(848,'CALCULO AVANZADO','DISCIPLINAR OPTATIVA',4,176),(849,'DISEÑO DE EXPERIMENTOS','DISCIPLINAR OPTATIVA',4,176),(850,'Ecuaciones diferenciales parciales','DISCIPLINAR OPTATIVA',4,176),(851,'Fundamentos para la enseñanza y el aprendizaje de las matemáticas en el contexto universitario','DISCIPLINAR OPTATIVA',4,176),(852,'GEOMETRIA DIFERENCIAL','DISCIPLINAR OPTATIVA',4,176),(853,'Geometría hiperbolica','DISCIPLINAR OPTATIVA',4,176),(854,'GEOMETRIA NO EUCLIDIANA','DISCIPLINAR OPTATIVA',4,176),(855,'GRUPOS DE LIE','DISCIPLINAR OPTATIVA',4,176),(856,'GRUPOS FINITOS','DISCIPLINAR OPTATIVA',4,176),(857,'GRUPOS TOPOLOGICOS','DISCIPLINAR OPTATIVA',4,176),(858,'Inferencia estadística','DISCIPLINAR OPTATIVA',4,176),(859,'Introducción a la geometría algebraica','DISCIPLINAR OPTATIVA',4,176),(860,'Introducción a la teoría de nudos','DISCIPLINAR OPTATIVA',4,176),(861,'INTRODUCCION A LA TOPOLOGIA ALGEBRAICA','DISCIPLINAR OPTATIVA',4,176),(862,'Introducción a la topología algebraica','DISCIPLINAR OPTATIVA',4,176),(863,'INTRODUCCIÓN A LAS ÁLGEBRAS DE LIE Y REPRESENTACIONES','DISCIPLINAR OPTATIVA',4,176),(864,'Introducción al álgebra homológica','DISCIPLINAR OPTATIVA',4,176),(865,'MODELOS LINEALES','DISCIPLINAR OPTATIVA',4,176),(866,'MODELOS MATEMATICOS','DISCIPLINAR OPTATIVA',4,176),(867,'MUESTREO','DISCIPLINAR OPTATIVA',4,176),(868,'PROCESOS ESTOCASTICOS','DISCIPLINAR OPTATIVA',4,176),(869,'Procesos estocásticos','DISCIPLINAR OPTATIVA',4,176),(870,'Representaciones de grupos','DISCIPLINAR OPTATIVA',4,176),(871,'SISTEMAS DINAMICOS','DISCIPLINAR OPTATIVA',4,176),(872,'TEMAS DE CONJUNTOS PARCIALMENTE ORDENADOS','DISCIPLINAR OPTATIVA',4,176),(873,'Teoría cualitativa de ecuaciones diferenciales ordinarias','DISCIPLINAR OPTATIVA',4,176),(874,'TEORIA DE CATEGORIAS','DISCIPLINAR OPTATIVA',4,176),(875,'Teoría de Categorías','DISCIPLINAR OPTATIVA',4,176),(876,'TEORIA DE GALOIS','DISCIPLINAR OPTATIVA',4,176),(877,'TEORIA DE JUEGOS','DISCIPLINAR OPTATIVA',4,176),(878,'TEORIA DE LA MEDIDA','DISCIPLINAR OPTATIVA',4,176),(879,'TEORIA DE MODULOS','DISCIPLINAR OPTATIVA',4,176),(880,'Teoría de números ','DISCIPLINAR OPTATIVA',4,176),(881,'VARIEDADES DIFERENCIABLES ','DISCIPLINAR OPTATIVA',4,176),(882,'Administración de empresas agrarias','DISCIPLINAR OBLIGATORIA',3,4424),(883,'AGROSTOLOGÍA','DISCIPLINAR OBLIGATORIA',3,4424),(884,'ALIMENTACIÓN ANIMAL','DISCIPLINAR OBLIGATORIA',4,4424),(885,'Bioética y bienestar animal','DISCIPLINAR OBLIGATORIA',3,4424),(886,'BIOSEGURIDAD Y SALUD ANIMAL','DISCIPLINAR OBLIGATORIA',3,4424),(887,'BOTANICA Y FISIOLOGÍA VEGETAL','DISCIPLINAR OBLIGATORIA',3,4424),(888,'ECONOMÍA AGROPECUARIA','DISCIPLINAR OBLIGATORIA',3,4424),(889,'FERTILIDAD DEL SUELO','DISCIPLINAR OBLIGATORIA',3,4424),(890,'GENÉTICA','DISCIPLINAR OBLIGATORIA',4,4424),(891,'GENÉTICA CUANTITATIVA','DISCIPLINAR OBLIGATORIA',4,4424),(892,'INDUCCIÓN A LA ZOOTECNIA','DISCIPLINAR OBLIGATORIA',2,4424),(893,'MANEJO Y UTILIZACIÓN DE PASTURAS','DISCIPLINAR OBLIGATORIA',3,4424),(894,'MEJORAMIENTO GENÉTICO ANIMAL','DISCIPLINAR OBLIGATORIA',4,4424),(895,'METABOLISMO ANIMAL','DISCIPLINAR OBLIGATORIA',3,4424),(896,'NUTRICIÓN ANIMAL','DISCIPLINAR OBLIGATORIA',4,4424),(897,'Reproducción animal','DISCIPLINAR OBLIGATORIA',3,4424),(898,'Sistemas de producción animal','DISCIPLINAR OBLIGATORIA',3,4424),(899,'Sistemas Fisiológicos I','DISCIPLINAR OBLIGATORIA',5,4424),(900,'Sistemas Fisiológicos II','DISCIPLINAR OBLIGATORIA',5,4424),(901,'Matemáticas Básicas','NIVELACION',4,4424),(902,'Inglés I- Semestral','Nivelacion',3,4424),(903,'Inglés II - Semestral','Nivelacion',3,4424),(904,'Inglés II - Virtual','Nivelacion',3,4424),(905,'Inglés III - Semestral','Nivelacion',3,4424),(906,'Inglés III- Virtual','Nivelacion',3,4424),(907,'Inglés Intensivo I y II','Nivelacion',3,4424),(908,'Inglés Intensivo III y IV','Nivelacion',3,4424),(909,'Inglés IV- Semestral','Nivelacion',3,4424),(910,'Inglés IV- Virtual','Nivelacion',3,4424),(911,'Lecto-Escritura','Nivelacion',4,4424),(912,'CURSOS EN POSGRADO','Trabajo de Grado',6,4424),(913,'TRABAJO DE GRADO','Trabajo de Grado',6,4424),(914,'ÁLGEBRA LINEAL','FUND. OBLIGATORIA',4,4424),(915,'BIOESTADÍSTICA I','FUND. OBLIGATORIA',3,4424),(916,'BIOESTADÍSTICA II','FUND. OBLIGATORIA',4,4424),(917,'BIOFÍSICA GENERAL','FUND. OBLIGATORIA',3,4424),(918,'BIOLOGÍA GENERAL','FUND. OBLIGATORIA',3,4424),(919,'BIOLOGIA MOLECULAR','FUND. OBLIGATORIA',4,4424),(920,'CÁLCULO DIFERENCIAL','FUND. OBLIGATORIA',4,4424),(921,'CIENCIA DEL SUELO','FUND. OBLIGATORIA',3,4424),(922,'ECOLOGÍA','FUND. OBLIGATORIA',4,4424),(923,'GEOMORFOLOGÍA','FUND. OBLIGATORIA',3,4424),(924,'INTRODUCCIÓN A LA BIOQUIMICA','FUND. OBLIGATORIA',3,4424),(925,'Laboratorio de Microbiología','FUND. OBLIGATORIA',1,4424),(926,'LABORATORIO DE QUIMICA GENERAL','FUND. OBLIGATORIA',2,4424),(927,'Microbiología General','FUND. OBLIGATORIA',3,4424),(928,'QUIMICA GENERAL','FUND. OBLIGATORIA',3,4424),(929,'ADMINISTRACIÓN DE LA PRODUCCIÓN','DISCIPLINAR OPTATIVA',3,4424),(930,'APICULTURA','DISCIPLINAR OPTATIVA',4,4424),(931,'CALIDAD Y CONSERVACIÓN DE LA CARNE','DISCIPLINAR OPTATIVA',3,4424),(932,'CALIDAD Y CONSERVACION DE LA LECHE','DISCIPLINAR OPTATIVA',3,4424),(933,'DESARROLLO RURAL SOSTENIBLE','DISCIPLINAR OPTATIVA',2,4424),(934,'Economía y Cultura','DISCIPLINAR OPTATIVA',3,4424),(935,'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS AGRARIOS','DISCIPLINAR OPTATIVA',3,4424),(936,'Gestión Ambiental','DISCIPLINAR OPTATIVA',3,4424),(937,'GESTIÓN DEL TALENTO HUMANO','DISCIPLINAR OPTATIVA',3,4424),(938,'PRODUCCIÓN CON AVES','DISCIPLINAR OPTATIVA',4,4424),(939,'PRODUCCIÓN CON CERDOS','DISCIPLINAR OPTATIVA',4,4424),(940,'PRODUCCIÓN CON PEQUEÑOS RUMIANTES','DISCIPLINAR OPTATIVA',4,4424),(941,'PRODUCCIÓN DE CARNE CON BOVINOS','DISCIPLINAR OPTATIVA',4,4424),(942,'PRODUCCIÓN DE LECHE CON BOVINOS','DISCIPLINAR OPTATIVA',4,4424),(943,'PRODUCCIÓN EQUINA','DISCIPLINAR OPTATIVA',4,4424),(944,'Producción equina','DISCIPLINAR OPTATIVA',4,4424),(945,'PRODUCCIÓN PISCICOLA','DISCIPLINAR OPTATIVA',4,4424),(946,'TECNOLOGÍA DE CARNES','DISCIPLINAR OPTATIVA',3,4424),(947,'TECNOLOGIA DE DULCES, HELADOS Y POSTRES','DISCIPLINAR OPTATIVA',3,4424),(948,'TECNOLOGÍA DE QUESOS Y LECHES FERMENTADAS','DISCIPLINAR OPTATIVA',3,4424),(949,'Cartografía temática','DISCIPLINAR OBLIGATORIA',3,108083),(950,'Climatología y meteorología','DISCIPLINAR OBLIGATORIA',3,108083),(951,'Geografía política','DISCIPLINAR OBLIGATORIA',3,108083),(952,'Historia del pensamiento geográfico','DISCIPLINAR OBLIGATORIA',3,108083),(953,'Laboratorio de Investigación','DISCIPLINAR OBLIGATORIA',3,108083),(954,'Seminario Geográfico I','DISCIPLINAR OBLIGATORIA',3,108083),(955,'Seminario Geográfico II','DISCIPLINAR OBLIGATORIA',3,108083),(956,'Teoría de la geografía contemporánea','DISCIPLINAR OBLIGATORIA',3,108083),(957,'Teorías del desarrollo y Planificación Territorial','DISCIPLINAR OBLIGATORIA',3,108083),(958,'Trabajo de Campo','DISCIPLINAR OBLIGATORIA',6,108083),(959,'Lenguaje y comunicación','Nivelacion',3,108083),(960,'Pensamiento Matemático','NIVELACION',4,108083),(961,'Inglés I- Semestral','Nivelacion',3,108083),(962,'Inglés II - Semestral','Nivelacion',3,108083),(963,'Inglés II - Virtual','Nivelacion',3,108083),(964,'Inglés III - Semestral','Nivelacion',3,108083),(965,'Inglés III- Virtual','Nivelacion',3,108083),(966,'Inglés IV- Semestral','Nivelacion',3,108083),(967,'Inglés IV- Virtual','Nivelacion',3,108083),(968,'Cartografía general','FUND. OBLIGATORIA',4,108083),(969,'Derechos Humanos y Equidad','FUND. OBLIGATORIA',2,108083),(970,'Fundamentos de Ética','FUND. OBLIGATORIA',2,108083),(971,'Fundamentos de las Ciencias Experimentales','FUND. OBLIGATORIA',2,108083),(972,'Fundamentos de las Ciencias Sociales','FUND. OBLIGATORIA',3,108083),(973,'Fundamentos de Programación de Computadores','FUND. OBLIGATORIA',3,108083),(974,'Geografía física','FUND. OBLIGATORIA',4,108083),(975,'Geografía humana','FUND. OBLIGATORIA',4,108083),(976,'Introducción al trabajo científico','FUND. OBLIGATORIA',3,108083),(977,'Lenguajes Visuales y Narrativos','FUND. OBLIGATORIA',2,108083),(978,'Matemáticas aplicadas en geografía','FUND. OBLIGATORIA',4,108083),(979,'Métodos cualitativos','FUND. OBLIGATORIA',3,108083),(980,'Probabilidad y estadística fundamental','FUND. OBLIGATORIA',3,108083),(981,'Tecnologías de la Información Geográfica I','FUND. OBLIGATORIA',4,108083),(982,'Universidad y Sociedad','FUND. OBLIGATORIA',2,108083),(983,'Inglés IV- Virtual','DISCIPLINAR OPTATIVA',3,108083),(984,'Análisis de riesgos socioambientales','DISCIPLINAR OPTATIVA',3,108083),(985,'Biogeografía','DISCIPLINAR OPTATIVA',3,108083),(986,'Ecología política','DISCIPLINAR OPTATIVA',3,108083),(987,'Edafogeografía','DISCIPLINAR OPTATIVA',3,108083),(988,'Estudios de impacto ambiental','DISCIPLINAR OPTATIVA',3,108083),(989,'Geografía de género','DISCIPLINAR OPTATIVA',3,108083),(990,'Geografía histórica','DISCIPLINAR OPTATIVA',3,108083),(991,'Geografía urbana','DISCIPLINAR OPTATIVA',3,108083),(992,'Geografía y etnoterritorios','DISCIPLINAR OPTATIVA',3,108083),(993,'Geomorfología 1','DISCIPLINAR OPTATIVA',3,108083),(994,'Sensores remotos y teledetección para análisis territorial','DISCIPLINAR OPTATIVA',3,108083),(995,'S.I.G. participativo y cartografía social','DISCIPLINAR OPTATIVA',3,108083);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Estudiante'),(3,'Profesor'),(2,'Prueba');
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Asignatura',7,'add_asignatura'),(26,'Can change Asignatura',7,'change_asignatura'),(27,'Can delete Asignatura',7,'delete_asignatura'),(28,'Can view Asignatura',7,'view_asignatura'),(29,'Can add Cita_Inscripcion',8,'add_cita_inscripcion'),(30,'Can change Cita_Inscripcion',8,'change_cita_inscripcion'),(31,'Can delete Cita_Inscripcion',8,'delete_cita_inscripcion'),(32,'Can view Cita_Inscripcion',8,'view_cita_inscripcion'),(33,'Can add Departamento',9,'add_departamento'),(34,'Can change Departamento',9,'change_departamento'),(35,'Can delete Departamento',9,'delete_departamento'),(36,'Can view Departamento',9,'view_departamento'),(37,'Can add Docente',10,'add_docente'),(38,'Can change Docente',10,'change_docente'),(39,'Can delete Docente',10,'delete_docente'),(40,'Can view Docente',10,'view_docente'),(41,'Can add Estudiante',11,'add_estudiante'),(42,'Can change Estudiante',11,'change_estudiante'),(43,'Can delete Estudiante',11,'delete_estudiante'),(44,'Can view Estudiante',11,'view_estudiante'),(45,'Can add Facultad',12,'add_facultad'),(46,'Can change Facultad',12,'change_facultad'),(47,'Can delete Facultad',12,'delete_facultad'),(48,'Can view Facultad',12,'view_facultad'),(49,'Can add Grupo',13,'add_grupo'),(50,'Can change Grupo',13,'change_grupo'),(51,'Can delete Grupo',13,'delete_grupo'),(52,'Can view Grupo',13,'view_grupo'),(53,'Can add Historial_Academico',14,'add_historial_academico'),(54,'Can change Historial_Academico',14,'change_historial_academico'),(55,'Can delete Historial_Academico',14,'delete_historial_academico'),(56,'Can view Historial_Academico',14,'view_historial_academico'),(57,'Can add Sede',15,'add_sede'),(58,'Can change Sede',15,'change_sede'),(59,'Can delete Sede',15,'delete_sede'),(60,'Can view Sede',15,'view_sede'),(61,'Can add Resumen_Credito',16,'add_resumen_creditos'),(62,'Can change Resumen_Credito',16,'change_resumen_creditos'),(63,'Can delete Resumen_Credito',16,'delete_resumen_creditos'),(64,'Can view Resumen_Credito',16,'view_resumen_creditos'),(65,'Can add Residencia',17,'add_residencia'),(66,'Can change Residencia',17,'change_residencia'),(67,'Can delete Residencia',17,'delete_residencia'),(68,'Can view Residencia',17,'view_residencia'),(69,'Can add Programa',18,'add_programa'),(70,'Can change Programa',18,'change_programa'),(71,'Can delete Programa',18,'delete_programa'),(72,'Can view Programa',18,'view_programa'),(73,'Can add Persona_vinculada',19,'add_persona_vinculada'),(74,'Can change Persona_vinculada',19,'change_persona_vinculada'),(75,'Can delete Persona_vinculada',19,'delete_persona_vinculada'),(76,'Can view Persona_vinculada',19,'view_persona_vinculada'),(77,'Can add Inscripcion_cancelacion',20,'add_inscripcion_cancelacion'),(78,'Can change Inscripcion_cancelacion',20,'change_inscripcion_cancelacion'),(79,'Can delete Inscripcion_cancelacion',20,'delete_inscripcion_cancelacion'),(80,'Can view Inscripcion_cancelacion',20,'view_inscripcion_cancelacion'),(81,'Can add espacio',21,'add_espacio'),(82,'Can change espacio',21,'change_espacio'),(83,'Can delete espacio',21,'delete_espacio'),(84,'Can view espacio',21,'view_espacio'),(85,'Can add Decano',22,'add_decano'),(86,'Can change Decano',22,'change_decano'),(87,'Can delete Decano',22,'delete_decano'),(88,'Can view Decano',22,'view_decano'),(89,'Can add Cupo_Credito',23,'add_cupo_creditos'),(90,'Can change Cupo_Credito',23,'change_cupo_creditos'),(91,'Can delete Cupo_Credito',23,'delete_cupo_creditos'),(92,'Can view Cupo_Credito',23,'view_cupo_creditos'),(93,'Can add ModelName',24,'add_notas'),(94,'Can change ModelName',24,'change_notas'),(95,'Can delete ModelName',24,'delete_notas'),(96,'Can view ModelName',24,'view_notas'),(97,'Can add Inscripcion_cancelacion_grupo',25,'add_inscripcion_cancelacion_grupo'),(98,'Can change Inscripcion_cancelacion_grupo',25,'change_inscripcion_cancelacion_grupo'),(99,'Can delete Inscripcion_cancelacion_grupo',25,'delete_inscripcion_cancelacion_grupo'),(100,'Can view Inscripcion_cancelacion_grupo',25,'view_inscripcion_cancelacion_grupo'),(101,'Can add Pago_Semestre',26,'add_pago_semestre'),(102,'Can change Pago_Semestre',26,'change_pago_semestre'),(103,'Can delete Pago_Semestre',26,'delete_pago_semestre'),(104,'Can view Pago_Semestre',26,'view_pago_semestre'),(105,'Can add Prerequisito',27,'add_prerequisito'),(106,'Can change Prerequisito',27,'change_prerequisito'),(107,'Can delete Prerequisito',27,'delete_prerequisito'),(108,'Can view Prerequisito',27,'view_prerequisito');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$xdY2fdIHrev9qyHI2ueH1y$Vj5qi345oXXN5DrObTKPQ7YjT9GvmtPCaVqv9tGaL/8=','2023-06-04 19:21:29.175128',1,'root','','','root@gmail.com',1,1,'2023-05-27 00:37:13.000000'),(3,'pbkdf2_sha256$390000$YxlODGEPBUCI4ESJ1LtGzI$zgdPRW0xzqbeg2GNQyf2hjSwbXQdaeuNNy75l/ZtFLI=','2023-05-28 21:54:09.415034',0,'Sergio','','','Sergio@unal.edu.co',0,1,'2023-05-28 18:29:24.038115'),(4,'pbkdf2_sha256$390000$ObVDkLkzKHCDuO4pY3Evj5$599KxlSHuy0wXtgMB/wjOnlByU9MwlsqrgT7JOdZnM0=',NULL,0,'Daniel','','','',0,1,'2023-05-28 22:22:45.225823'),(5,'pbkdf2_sha256$390000$2hYMTSvjhhYmraeqf5mgWG$puIH5vI5LZ0HGxGCbwHEZXh3ce6iAsccQXRzv1DSRSA=',NULL,0,'Daniela','','','',0,1,'2023-05-28 22:23:10.697783'),(6,'pbkdf2_sha256$390000$qbD2EdtWJvW9DIienIoGyK$RjTY1EmH8jkcGzf+7qo+rjfnvEM00Pj4NUYcw/yScvM=',NULL,0,'Camilo','','','',0,1,'2023-05-28 22:23:22.922258'),(7,'pbkdf2_sha256$390000$RUpqDDamz3SgLU1HEmgbwM$iTOrO1SXuLZN/+qwosdpA4TmH/c8TDfXuyGMPpD5AgY=',NULL,0,'Diana','','','',0,1,'2023-05-28 22:23:47.911244'),(8,'pbkdf2_sha256$390000$cWXSclcLfC1Ti5g9ecd3qZ$Gyb5ZGq0K/wgWYyBWAD5immw/e8st7+hh8C3HIc8iSY=',NULL,0,'Elizabeth','','','',0,1,'2023-05-28 22:24:01.521827'),(9,'pbkdf2_sha256$390000$9feL7rnPgiN5HBNmGb07y1$LZ3bSPXKuBC0Qj05+mO1kMhygdj5YY9KhpIFSuyDJTE=',NULL,0,'Anna','','','',0,1,'2023-05-28 22:24:12.480686'),(10,'pbkdf2_sha256$390000$PHn2Iuj6qWhVW3I5xNe9uV$78K9a7sjJRjMrzGbZm7W81Fm6BBsI/gu4zv0IiZ65uM=',NULL,0,'Andrea','','','',0,1,'2023-05-28 22:24:23.096644'),(11,'pbkdf2_sha256$390000$oTG4mQDsrNwpExmGrccApd$SfGF/eALaub6UMrwvduD72DWflO3TcIo2uk5CcsIlz0=','2023-06-04 16:50:03.976082',0,'Alejandro','','','Alejandro@unal.edu.co',0,1,'2023-05-28 22:24:29.000000'),(12,'pbkdf2_sha256$390000$9Uz9aYQGVvnkxOCa4vIryD$bJhyOcZEEZX0czY/cFIlwDz9y3Jt925jLrBN3LwovxU=',NULL,0,'Mauricio','','','',0,1,'2023-05-28 22:24:37.215484'),(13,'pbkdf2_sha256$390000$m1Mkg9rB5i9JI35ZqTl8Qz$yjw1+bxW2shB9ma2ACZKOrIiJi/aIhB9RjZ5YY1AwtQ=',NULL,0,'Antonia','','','',0,1,'2023-05-28 22:26:09.571971'),(14,'pbkdf2_sha256$390000$o78jsQPSpG2KeA2vRWnDLK$Z3N1db6YNd+ROhtPZfjMIXf81TPZKtWBr7cs6kiSgQs=',NULL,0,'Antonio','','','',0,1,'2023-05-28 22:26:24.683449'),(15,'pbkdf2_sha256$390000$xfLwx2bpaw3XCCREshEe4R$QHehnkYF4ONgalrybA0DHMeGV/dH33nhavgazjb/I7Q=',NULL,0,'Gonzalo','','','',0,1,'2023-05-28 22:26:44.472891'),(16,'pbkdf2_sha256$390000$Jh6OYKQaND9BWwaDNc4Yd9$DYJeFkDbJE22tTO5ixbEDlr2MQoemwddU62ob2s96PM=','2023-05-31 03:06:15.004938',0,'Leandro','','','LePerez7@unal.edu.co',0,1,'2023-05-28 22:27:31.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,1,2),(5,11,1),(4,16,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-27 01:08:42.529901','3213131','Nombre: Juan ',1,'[{\"added\": {}}]',19,1),(2,'2023-05-27 01:08:49.379293','1','estudiante object (1)',1,'[{\"added\": {}}]',11,1),(3,'2023-05-27 01:09:05.964099','1','Sede object (1)',1,'[{\"added\": {}}]',15,1),(4,'2023-05-27 01:09:12.326499','1','Departamento object (1)',1,'[{\"added\": {}}]',9,1),(5,'2023-05-27 01:09:15.731276','1','Facultad object (1)',1,'[{\"added\": {}}]',12,1),(6,'2023-05-27 01:09:29.848128','313133','Programa object (313133)',1,'[{\"added\": {}}]',18,1),(7,'2023-05-27 01:09:33.142457','1','Historial_Academico object (1)',1,'[{\"added\": {}}]',14,1),(8,'2023-05-27 01:09:35.129070','1','Cita_Inscripcion object (1)',1,'[{\"added\": {}}]',8,1),(9,'2023-05-27 01:09:43.958513','1','Inscripcion_cancelacion object (1)',1,'[{\"added\": {}}]',20,1),(10,'2023-05-27 01:10:08.627194','2','Pedro15',1,'[{\"added\": {}}]',4,1),(11,'2023-05-27 01:10:24.081315','1323133','Nombre: Lucila ',1,'[{\"added\": {}}]',19,1),(12,'2023-05-27 01:10:29.487614','1','Docente object (1)',1,'[{\"added\": {}}]',10,1),(13,'2023-05-27 01:10:49.601078','1','Asignatura object (1)',1,'[{\"added\": {}}]',7,1),(14,'2023-05-27 01:10:56.343133','1','Grupo object (1)',1,'[{\"added\": {}}]',13,1),(15,'2023-05-27 01:10:58.687262','1','Inscripcion_cancelacion_grupo object (1)',1,'[{\"added\": {}}]',25,1),(16,'2023-05-27 01:14:41.494317','7','Notas object (7)',1,'[{\"added\": {}}]',24,1),(17,'2023-05-27 01:14:45.909729','7','Notas object (7)',3,'',24,1),(18,'2023-05-27 01:15:13.677298','8','Notas object (8)',1,'[{\"added\": {}}]',24,1),(19,'2023-05-27 01:16:22.158146','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(20,'2023-05-27 01:34:11.364857','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\", \"Nota Definitiva\"]}}]',24,1),(21,'2023-05-27 01:34:51.092457','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(22,'2023-05-27 01:40:47.315289','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(23,'2023-05-27 01:44:18.059657','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\"]}}]',24,1),(24,'2023-05-27 04:26:58.381068','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(25,'2023-05-27 04:27:04.264323','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(26,'2023-05-27 05:01:28.302853','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Primer Corte\"]}}]',24,1),(27,'2023-05-27 15:02:04.487584','2','Grupo object (2)',1,'[{\"added\": {}}]',13,1),(28,'2023-05-27 15:13:01.529980','2','Inscripcion_cancelacion_grupo object (2)',1,'[{\"added\": {}}]',25,1),(29,'2023-05-27 15:14:58.875261','2','Inscripcion_cancelacion_grupo object (2)',3,'',25,1),(30,'2023-05-27 15:39:05.550668','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Primer Corte\"]}}]',24,1),(31,'2023-05-27 15:39:15.683167','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(32,'2023-05-27 15:42:16.402404','8','Notas object (8)',2,'[{\"changed\": {\"fields\": [\"Primer Corte\"]}}]',24,1),(33,'2023-05-27 15:43:33.776908','3','Inscripcion_cancelacion_grupo object (3)',3,'',25,1),(34,'2023-05-27 15:43:38.593671','5','Inscripcion_cancelacion_grupo object (5)',1,'[{\"added\": {}}]',25,1),(35,'2023-05-27 15:44:37.217663','5','Inscripcion_cancelacion_grupo object (5)',3,'',25,1),(36,'2023-05-27 15:44:41.726251','6','Inscripcion_cancelacion_grupo object (6)',1,'[{\"added\": {}}]',25,1),(37,'2023-05-27 15:45:53.311487','6','Inscripcion_cancelacion_grupo object (6)',3,'',25,1),(38,'2023-05-27 15:45:57.703539','7','Inscripcion_cancelacion_grupo object (7)',1,'[{\"added\": {}}]',25,1),(39,'2023-05-27 15:46:44.370585','7','Inscripcion_cancelacion_grupo object (7)',3,'',25,1),(40,'2023-05-27 15:46:54.795362','8','Inscripcion_cancelacion_grupo object (8)',1,'[{\"added\": {}}]',25,1),(41,'2023-05-27 15:47:07.093164','9','Inscripcion_cancelacion_grupo object (9)',1,'[{\"added\": {}}]',25,1),(42,'2023-05-27 15:48:17.691919','9','Inscripcion_cancelacion_grupo object (9)',3,'',25,1),(43,'2023-05-27 15:48:21.581545','10','Inscripcion_cancelacion_grupo object (10)',1,'[{\"added\": {}}]',25,1),(44,'2023-05-27 15:49:07.416574','1','Inscripcion_cancelacion_grupo object (1)',3,'',25,1),(45,'2023-05-27 18:32:49.052681','9','Notas object (9)',1,'[{\"added\": {}}]',24,1),(46,'2023-05-27 18:32:58.022577','9','Notas object (9)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\", \"Tercer Corte\"]}}]',24,1),(47,'2023-05-27 18:33:26.500263','9','Notas object (9)',2,'[]',24,1),(48,'2023-05-27 18:35:24.920260','10','Notas object (10)',1,'[{\"added\": {}}]',24,1),(49,'2023-05-27 18:35:33.095508','10','Notas object (10)',2,'[{\"changed\": {\"fields\": [\"Primer Corte\", \"Segundo Corte\", \"Tercer Corte\"]}}]',24,1),(50,'2023-05-27 18:36:27.655678','10','Notas object (10)',2,'[]',24,1),(51,'2023-05-27 18:38:03.376101','1','Cupo_Creditos object (1)',1,'[{\"added\": {}}]',23,1),(52,'2023-05-27 18:38:12.561535','10','Notas object (10)',3,'',24,1),(53,'2023-05-27 18:38:15.578794','9','Notas object (9)',3,'',24,1),(54,'2023-05-27 18:38:45.177504','1','Resumen_Creditos object (1)',2,'[{\"changed\": {\"fields\": [\"Creditos Exigidos\", \"Creditos Aprobados\", \"Pendientes\", \"Inscritos\", \"Cursados\"]}}]',16,1),(55,'2023-05-27 18:38:54.328619','11','Notas object (11)',1,'[{\"added\": {}}]',24,1),(56,'2023-05-27 18:39:00.617908','11','Notas object (11)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\", \"Tercer Corte\"]}}]',24,1),(57,'2023-05-27 18:39:12.855415','11','Notas object (11)',2,'[]',24,1),(58,'2023-05-27 18:39:36.834289','1','Resumen_Creditos object (1)',3,'',16,1),(59,'2023-05-27 18:40:22.175249','4','Resumen_Creditos object (4)',1,'[{\"added\": {}}]',16,1),(60,'2023-05-27 18:40:36.858697','11','Inscripcion_cancelacion_grupo object (11)',1,'[{\"added\": {}}]',25,1),(61,'2023-05-27 18:41:52.854185','11','Notas object (11)',3,'',24,1),(62,'2023-05-27 18:42:02.009310','12','Notas object (12)',1,'[{\"added\": {}}]',24,1),(63,'2023-05-27 18:42:07.284758','12','Notas object (12)',2,'[{\"changed\": {\"fields\": [\"Segundo Corte\", \"Tercer Corte\"]}}]',24,1),(64,'2023-05-27 18:42:47.399340','12','Notas object (12)',2,'[]',24,1),(65,'2023-05-27 18:43:21.885480','1','Cupo_Creditos object (1)',2,'[{\"changed\": {\"fields\": [\"Creditos Disponibles\"]}}]',23,1),(66,'2023-05-27 18:43:32.157728','12','Notas object (12)',3,'',24,1),(67,'2023-05-27 18:43:46.890781','13','Notas object (13)',1,'[{\"added\": {}}]',24,1),(68,'2023-05-27 18:43:56.699187','13','Notas object (13)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(69,'2023-05-27 18:44:28.746446','13','Notas object (13)',2,'[]',24,1),(70,'2023-05-27 18:44:46.103315','13','Notas object (13)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(71,'2023-05-27 18:45:40.311305','1','Cupo_Creditos object (1)',2,'[{\"changed\": {\"fields\": [\"Creditos Disponibles\"]}}]',23,1),(72,'2023-05-27 18:46:05.425165','14','Notas object (14)',1,'[{\"added\": {}}]',24,1),(73,'2023-05-27 18:46:11.370184','14','Notas object (14)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(74,'2023-05-27 19:38:56.582892','1','Historial_Academico object (1)',3,'',14,1),(75,'2023-05-27 19:39:07.469656','2','Historial_Academico object (2)',1,'[{\"added\": {}}]',14,1),(76,'2023-05-27 19:42:23.744693','2','Historial_Academico object (2)',3,'',14,1),(77,'2023-05-27 19:47:12.539452','3','Historial_Academico object (3)',1,'[{\"added\": {}}]',14,1),(78,'2023-05-27 19:50:23.157035','3','Historial_Academico object (3)',3,'',14,1),(79,'2023-05-27 19:50:28.152726','4','Historial_Academico object (4)',1,'[{\"added\": {}}]',14,1),(80,'2023-05-27 19:50:59.555005','4','Historial_Academico object (4)',3,'',14,1),(81,'2023-05-27 19:51:06.180655','5','Historial_Academico object (5)',1,'[{\"added\": {}}]',14,1),(82,'2023-05-27 19:56:48.089302','2','Cita_Inscripcion object (2)',1,'[{\"added\": {}}]',8,1),(83,'2023-05-27 19:57:03.145498','2','Inscripcion_cancelacion object (2)',1,'[{\"added\": {}}]',20,1),(84,'2023-05-27 20:02:36.964285','17','Inscripcion_cancelacion_grupo object (17)',1,'[{\"added\": {}}]',25,1),(85,'2023-05-27 20:05:26.498417','22','Inscripcion_cancelacion_grupo object (22)',1,'[{\"added\": {}}]',25,1),(86,'2023-05-27 20:06:51.772849','15','Notas object (15)',1,'[{\"added\": {}}]',24,1),(87,'2023-05-27 20:07:08.520360','15','Notas object (15)',2,'[{\"changed\": {\"fields\": [\"Tercer Corte\"]}}]',24,1),(88,'2023-05-27 20:10:01.376561','22','Inscripcion_cancelacion_grupo object (22)',3,'',25,1),(89,'2023-05-28 18:29:24.248264','3','Sergio',1,'[{\"added\": {}}]',4,1),(90,'2023-05-28 18:31:17.105988','1215','Nombre: Sergio ',1,'[{\"added\": {}}]',19,1),(91,'2023-05-28 18:31:34.531049','1215','Nombre: Sergio ',3,'',19,1),(92,'2023-05-28 18:32:02.833803','13131','Nombre: Sergio ',1,'[{\"added\": {}}]',19,1),(93,'2023-05-28 18:32:17.251657','13131','Nombre: Sergio ',3,'',19,1),(94,'2023-05-28 18:33:27.340454','21321313','Nombre: Sergio ',1,'[{\"added\": {}}]',19,1),(95,'2023-05-28 19:43:12.827116','21321313','Nombre: Sergio ',3,'',19,1),(96,'2023-05-28 19:43:28.313477','312313','Nombre: Sergio ',1,'[{\"added\": {}}]',19,1),(97,'2023-05-28 21:47:16.890907','3','Sergio',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(98,'2023-05-28 22:18:10.749710','1','estudiante object (1)',2,'[{\"changed\": {\"fields\": [\"Persona Vinculada\"]}}]',11,1),(99,'2023-05-28 22:18:14.738194','5','Historial_Academico object (5)',2,'[]',14,1),(100,'2023-05-28 22:19:14.346937','1','Residencia object (1)',1,'[{\"added\": {}}]',17,1),(101,'2023-05-28 22:22:45.488724','4','Daniel',1,'[{\"added\": {}}]',4,1),(102,'2023-05-28 22:22:57.611420','2','Pedro15',3,'',4,1),(103,'2023-05-28 22:23:11.027132','5','Daniela',1,'[{\"added\": {}}]',4,1),(104,'2023-05-28 22:23:23.221128','6','Camilo',1,'[{\"added\": {}}]',4,1),(105,'2023-05-28 22:23:48.224630','7','Diana',1,'[{\"added\": {}}]',4,1),(106,'2023-05-28 22:24:01.825325','8','Elizabeth',1,'[{\"added\": {}}]',4,1),(107,'2023-05-28 22:24:12.755409','9','Anna',1,'[{\"added\": {}}]',4,1),(108,'2023-05-28 22:24:23.504357','10','Andrea',1,'[{\"added\": {}}]',4,1),(109,'2023-05-28 22:24:29.708942','11','Alejandro',1,'[{\"added\": {}}]',4,1),(110,'2023-05-28 22:24:37.475337','12','Mauricio',1,'[{\"added\": {}}]',4,1),(111,'2023-05-28 22:26:10.040898','13','Antonia',1,'[{\"added\": {}}]',4,1),(112,'2023-05-28 22:26:24.980250','14','Antonio',1,'[{\"added\": {}}]',4,1),(113,'2023-05-28 22:26:44.748006','15','Gonzalo',1,'[{\"added\": {}}]',4,1),(114,'2023-05-28 22:27:32.124911','16','Leandro',1,'[{\"added\": {}}]',4,1),(115,'2023-05-28 23:46:23.109752','88','Facultad object (88)',3,'',12,1),(116,'2023-05-28 23:46:23.115755','87','Facultad object (87)',3,'',12,1),(117,'2023-05-28 23:46:23.120301','86','Facultad object (86)',3,'',12,1),(118,'2023-05-28 23:46:23.124305','85','Facultad object (85)',3,'',12,1),(119,'2023-05-28 23:46:23.127308','84','Facultad object (84)',3,'',12,1),(120,'2023-05-28 23:46:23.129822','83','Facultad object (83)',3,'',12,1),(121,'2023-05-28 23:46:23.133321','82','Facultad object (82)',3,'',12,1),(122,'2023-05-28 23:46:23.136320','81','Facultad object (81)',3,'',12,1),(123,'2023-05-28 23:46:23.139322','80','Facultad object (80)',3,'',12,1),(124,'2023-05-28 23:46:23.143985','79','Facultad object (79)',3,'',12,1),(125,'2023-05-28 23:46:23.146986','78','Facultad object (78)',3,'',12,1),(126,'2023-05-28 23:46:23.149985','77','Facultad object (77)',3,'',12,1),(127,'2023-05-28 23:46:23.153542','76','Facultad object (76)',3,'',12,1),(128,'2023-05-28 23:46:23.156542','75','Facultad object (75)',3,'',12,1),(129,'2023-05-28 23:46:23.160543','74','Facultad object (74)',3,'',12,1),(130,'2023-05-28 23:46:23.164175','73','Facultad object (73)',3,'',12,1),(131,'2023-05-28 23:46:23.167176','72','Facultad object (72)',3,'',12,1),(132,'2023-05-28 23:46:23.170176','71','Facultad object (71)',3,'',12,1),(133,'2023-05-28 23:46:23.174791','70','Facultad object (70)',3,'',12,1),(134,'2023-05-28 23:46:23.177791','69','Facultad object (69)',3,'',12,1),(135,'2023-05-28 23:46:23.181791','68','Facultad object (68)',3,'',12,1),(136,'2023-05-28 23:46:23.184353','67','Facultad object (67)',3,'',12,1),(137,'2023-05-28 23:46:23.188358','66','Facultad object (66)',3,'',12,1),(138,'2023-05-28 23:46:23.190358','65','Facultad object (65)',3,'',12,1),(139,'2023-05-28 23:46:23.193875','64','Facultad object (64)',3,'',12,1),(140,'2023-05-28 23:46:23.196361','63','Facultad object (63)',3,'',12,1),(141,'2023-05-28 23:46:23.199360','62','Facultad object (62)',3,'',12,1),(142,'2023-05-28 23:46:23.202361','61','Facultad object (61)',3,'',12,1),(143,'2023-05-28 23:46:23.206563','60','Facultad object (60)',3,'',12,1),(144,'2023-05-28 23:46:23.209562','59','Facultad object (59)',3,'',12,1),(145,'2023-05-28 23:46:23.212564','58','Facultad object (58)',3,'',12,1),(146,'2023-05-28 23:46:23.216108','57','Facultad object (57)',3,'',12,1),(147,'2023-05-28 23:46:23.220113','56','Facultad object (56)',3,'',12,1),(148,'2023-05-28 23:46:23.224114','55','Facultad object (55)',3,'',12,1),(149,'2023-05-28 23:46:23.227675','54','Facultad object (54)',3,'',12,1),(150,'2023-05-28 23:46:23.231676','53','Facultad object (53)',3,'',12,1),(151,'2023-05-28 23:46:23.236674','52','Facultad object (52)',3,'',12,1),(152,'2023-05-28 23:46:23.239746','51','Facultad object (51)',3,'',12,1),(153,'2023-05-28 23:46:23.242747','50','Facultad object (50)',3,'',12,1),(154,'2023-05-28 23:46:23.244748','49','Facultad object (49)',3,'',12,1),(155,'2023-05-28 23:46:23.245747','48','Facultad object (48)',3,'',12,1),(156,'2023-05-28 23:46:23.249279','47','Facultad object (47)',3,'',12,1),(157,'2023-05-28 23:46:23.251902','46','Facultad object (46)',3,'',12,1),(158,'2023-05-28 23:46:23.254903','45','Facultad object (45)',3,'',12,1),(159,'2023-05-28 23:46:23.256902','44','Facultad object (44)',3,'',12,1),(160,'2023-05-28 23:46:23.260005','43','Facultad object (43)',3,'',12,1),(161,'2023-05-28 23:46:23.265006','42','Facultad object (42)',3,'',12,1),(162,'2023-05-28 23:46:23.267005','41','Facultad object (41)',3,'',12,1),(163,'2023-05-28 23:46:23.271560','40','Facultad object (40)',3,'',12,1),(164,'2023-05-28 23:46:23.273559','39','Facultad object (39)',3,'',12,1),(165,'2023-05-28 23:46:23.276560','38','Facultad object (38)',3,'',12,1),(166,'2023-05-28 23:46:23.279071','37','Facultad object (37)',3,'',12,1),(167,'2023-05-28 23:46:23.281416','36','Facultad object (36)',3,'',12,1),(168,'2023-05-28 23:46:23.283416','35','Facultad object (35)',3,'',12,1),(169,'2023-05-28 23:46:23.286417','34','Facultad object (34)',3,'',12,1),(170,'2023-05-28 23:46:23.289931','33','Facultad object (33)',3,'',12,1),(171,'2023-05-28 23:46:23.293974','32','Facultad object (32)',3,'',12,1),(172,'2023-05-28 23:46:23.296973','31','Facultad object (31)',3,'',12,1),(173,'2023-05-28 23:46:23.298974','30','Facultad object (30)',3,'',12,1),(174,'2023-05-28 23:46:23.302525','29','Facultad object (29)',3,'',12,1),(175,'2023-05-28 23:46:23.304525','28','Facultad object (28)',3,'',12,1),(176,'2023-05-28 23:46:23.306527','27','Facultad object (27)',3,'',12,1),(177,'2023-05-28 23:46:23.308527','26','Facultad object (26)',3,'',12,1),(178,'2023-05-28 23:46:23.311038','25','Facultad object (25)',3,'',12,1),(179,'2023-05-28 23:46:23.314069','24','Facultad object (24)',3,'',12,1),(180,'2023-05-28 23:46:23.316068','22','Facultad object (22)',3,'',12,1),(181,'2023-05-28 23:46:23.319067','21','Facultad object (21)',3,'',12,1),(182,'2023-05-28 23:46:23.320066','20','Facultad object (20)',3,'',12,1),(183,'2023-05-28 23:46:23.323599','19','Facultad object (19)',3,'',12,1),(184,'2023-05-28 23:46:23.326595','18','Facultad object (18)',3,'',12,1),(185,'2023-05-28 23:46:23.328596','17','Facultad object (17)',3,'',12,1),(186,'2023-05-28 23:46:23.330596','16','Facultad object (16)',3,'',12,1),(187,'2023-05-28 23:46:23.333649','15','Facultad object (15)',3,'',12,1),(188,'2023-05-28 23:46:23.336648','14','Facultad object (14)',3,'',12,1),(189,'2023-05-28 23:46:23.339648','13','Facultad object (13)',3,'',12,1),(190,'2023-05-28 23:46:23.341648','12','Facultad object (12)',3,'',12,1),(191,'2023-05-28 23:46:23.343218','11','Facultad object (11)',3,'',12,1),(192,'2023-05-28 23:46:23.346218','10','Facultad object (10)',3,'',12,1),(193,'2023-05-28 23:46:23.348218','9','Facultad object (9)',3,'',12,1),(194,'2023-05-28 23:46:23.351730','8','Facultad object (8)',3,'',12,1),(195,'2023-05-28 23:46:23.354921','7','Facultad object (7)',3,'',12,1),(196,'2023-05-28 23:46:23.360923','6','Facultad object (6)',3,'',12,1),(197,'2023-05-28 23:46:23.362924','5','Facultad object (5)',3,'',12,1),(198,'2023-05-28 23:46:23.365840','4','Facultad object (4)',3,'',12,1),(199,'2023-05-28 23:46:23.367840','3','Facultad object (3)',3,'',12,1),(200,'2023-05-28 23:46:23.370842','2','Facultad object (2)',3,'',12,1),(201,'2023-05-28 23:46:23.375361','1','Facultad object (1)',3,'',12,1),(202,'2023-05-30 23:32:37.783832','1','Estudiante',1,'[{\"added\": {}}]',3,1),(203,'2023-05-30 23:32:48.510966','1','root',2,'[]',4,1),(204,'2023-05-30 23:36:49.620091','1','root',2,'[]',4,1),(205,'2023-05-30 23:37:21.027845','2','Prueba',1,'[{\"added\": {}}]',3,1),(206,'2023-05-30 23:37:30.889056','1','root',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(207,'2023-05-31 02:03:31.963553','123113','Nombre: Alejandro ',1,'[{\"added\": {}}]',19,1),(208,'2023-05-31 02:06:50.064430','11','Alejandro',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(209,'2023-05-31 02:35:16.961034','312313','Nombre: Sergio ',2,'[{\"changed\": {\"fields\": [\"Apellido\"]}}]',19,1),(210,'2023-05-31 02:57:23.370216','123123','Nombre: Leandro ',3,'',19,1),(211,'2023-05-31 03:05:48.677900','3','Profesor',1,'[{\"added\": {}}]',3,1),(212,'2023-05-31 03:05:50.530131','16','Leandro',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(213,'2023-05-31 16:19:32.628520','2','estudiante object (2)',1,'[{\"added\": {}}]',11,1),(214,'2023-05-31 16:19:53.809661','2','Residencia object (2)',1,'[{\"added\": {}}]',17,1),(215,'2023-05-31 16:20:30.422759','132131','Programa object (132131)',1,'[{\"added\": {}}]',18,1),(216,'2023-05-31 16:20:33.209328','6','Historial_Academico object (6)',1,'[{\"added\": {}}]',14,1),(217,'2023-05-31 16:24:51.702196','7','Historial_Academico object (7)',1,'[{\"added\": {}}]',14,1),(218,'2023-05-31 16:45:13.153861','11','Alejandro',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(219,'2023-05-31 16:46:28.022117','11','Alejandro',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(220,'2023-06-03 17:10:44.766636','3','Cita_Inscripcion object (3)',1,'[{\"added\": {}}]',8,1),(221,'2023-06-03 17:33:53.605574','4','Cita_Inscripcion object (4)',1,'[{\"added\": {}}]',8,1),(222,'2023-06-03 17:35:35.140289','4','Cita_Inscripcion object (4)',2,'[]',8,1),(223,'2023-06-03 17:35:40.818081','5','Cita_Inscripcion object (5)',1,'[{\"added\": {}}]',8,1),(224,'2023-06-03 18:14:51.633990','3','Cita_Inscripcion object (3)',3,'',8,1),(225,'2023-06-04 15:20:03.091468','3','Inscripcion_cancelacion object (3)',1,'[{\"added\": {}}]',20,1),(226,'2023-06-04 15:21:11.295093','3','Inscripcion_cancelacion object (3)',3,'',20,1),(227,'2023-06-04 15:21:17.211042','4','Inscripcion_cancelacion object (4)',1,'[{\"added\": {}}]',20,1),(228,'2023-06-04 15:29:41.163718','4','Inscripcion_cancelacion object (4)',3,'',20,1),(229,'2023-06-04 15:30:41.351059','5','Inscripcion_cancelacion object (5)',1,'[{\"added\": {}}]',20,1),(230,'2023-06-04 15:31:15.795024','5','Inscripcion_cancelacion object (5)',3,'',20,1),(231,'2023-06-04 15:31:20.305286','6','Inscripcion_cancelacion object (6)',1,'[{\"added\": {}}]',20,1),(232,'2023-06-04 15:39:06.711795','6','Inscripcion_cancelacion object (6)',3,'',20,1),(233,'2023-06-04 15:39:21.843295','6','Cita de Alejandro Alarcon',1,'[{\"added\": {}}]',8,1),(234,'2023-06-04 15:39:32.264864','7','Inscripcion_cancelacion object (7)',1,'[{\"added\": {}}]',20,1),(235,'2023-06-04 15:46:53.058794','7','Inscripcion_cancelacion object (7)',3,'',20,1),(236,'2023-06-04 15:57:43.867034','9','Inscripcion_cancelacion object (9)',1,'[{\"added\": {}}]',20,1),(237,'2023-06-04 16:00:06.280821','9','Inscripcion_cancelacion object (9)',3,'',20,1),(238,'2023-06-04 16:00:10.215371','10','Inscripcion_cancelacion object (10)',1,'[{\"added\": {}}]',20,1),(239,'2023-06-04 16:01:13.721102','10','Inscripcion_cancelacion object (10)',3,'',20,1),(240,'2023-06-04 16:01:17.392816','11','Inscripcion_cancelacion object (11)',1,'[{\"added\": {}}]',20,1),(241,'2023-06-04 16:01:23.427685','11','Inscripcion_cancelacion object (11)',3,'',20,1),(242,'2023-06-04 16:01:26.955999','12','Inscripcion_cancelacion object (12)',1,'[{\"added\": {}}]',20,1),(243,'2023-06-04 16:01:30.321698','12','Inscripcion_cancelacion object (12)',3,'',20,1),(244,'2023-06-04 16:01:46.073207','4','Cupo_Creditos object (4)',2,'[{\"changed\": {\"fields\": [\"Creditos Disponibles\"]}}]',23,1),(245,'2023-06-04 16:01:52.583651','7','Cita de Sergio Ruiz Medina',1,'[{\"added\": {}}]',8,1),(246,'2023-06-04 16:02:00.350927','13','Inscripcion_cancelacion object (13)',1,'[{\"added\": {}}]',20,1),(247,'2023-06-04 16:02:03.269743','13','Inscripcion_cancelacion object (13)',3,'',20,1),(248,'2023-06-04 16:04:49.831593','14','Inscripcion_cancelacion object (14)',3,'',20,1),(249,'2023-06-04 16:05:12.493222','6','Cita de Alejandro Alarcon',2,'[{\"changed\": {\"fields\": [\"Hora\"]}}]',8,1),(250,'2023-06-04 19:21:53.653034','132131','Programa object (132131)',3,'',18,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'academico','asignatura'),(8,'academico','cita_inscripcion'),(23,'academico','cupo_creditos'),(22,'academico','decano'),(9,'academico','departamento'),(10,'academico','docente'),(21,'academico','espacio'),(11,'academico','estudiante'),(12,'academico','facultad'),(13,'academico','grupo'),(14,'academico','historial_academico'),(20,'academico','inscripcion_cancelacion'),(25,'academico','inscripcion_cancelacion_grupo'),(24,'academico','notas'),(26,'academico','pago_semestre'),(19,'academico','persona_vinculada'),(27,'academico','prerequisito'),(18,'academico','programa'),(17,'academico','residencia'),(16,'academico','resumen_creditos'),(15,'academico','sede'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-27 00:33:15.665498'),(2,'auth','0001_initial','2023-05-27 00:33:16.095240'),(3,'academico','0001_initial','2023-05-27 00:33:17.462070'),(4,'admin','0001_initial','2023-05-27 00:33:17.595842'),(5,'admin','0002_logentry_remove_auto_add','2023-05-27 00:33:17.617019'),(6,'admin','0003_logentry_add_action_flag_choices','2023-05-27 00:33:17.636404'),(7,'contenttypes','0002_remove_content_type_name','2023-05-27 00:33:17.766234'),(8,'auth','0002_alter_permission_name_max_length','2023-05-27 00:33:17.845069'),(9,'auth','0003_alter_user_email_max_length','2023-05-27 00:33:17.894074'),(10,'auth','0004_alter_user_username_opts','2023-05-27 00:33:17.908075'),(11,'auth','0005_alter_user_last_login_null','2023-05-27 00:33:18.015600'),(12,'auth','0006_require_contenttypes_0002','2023-05-27 00:33:18.022128'),(13,'auth','0007_alter_validators_add_error_messages','2023-05-27 00:33:18.042137'),(14,'auth','0008_alter_user_username_max_length','2023-05-27 00:33:18.132480'),(15,'auth','0009_alter_user_last_name_max_length','2023-05-27 00:33:18.221419'),(16,'auth','0010_alter_group_name_max_length','2023-05-27 00:33:18.292592'),(17,'auth','0011_update_proxy_permissions','2023-05-27 00:33:18.345458'),(18,'auth','0012_alter_user_first_name_max_length','2023-05-27 00:33:18.433849'),(19,'sessions','0001_initial','2023-05-27 00:33:18.472911'),(20,'academico','0002_notas_remove_inscripcion_cancelacion_grupo','2023-05-27 00:52:03.527986'),(21,'academico','0003_inscripcion_cancelacion_grupo_notas_inscripcion','2023-05-27 00:53:18.429160'),(22,'academico','0004_notas_historial','2023-05-27 00:56:27.486571'),(23,'academico','0005_alter_notas_options_alter_notas_nota_definitiva_and_more','2023-05-27 01:12:48.273235'),(24,'academico','0006_alter_cupo_creditos_creditos_disponibles_and_more','2023-05-27 03:04:11.705573'),(25,'academico','0007_alter_resumen_creditos_creditos_aprobados_and_more','2023-05-27 04:16:19.242005'),(26,'academico','0008_alter_cupo_creditos_creditos_adicionales_and_more','2023-05-27 18:37:52.020769'),(27,'academico','0009_alter_cupo_creditos_creditos_disponibles','2023-05-27 19:49:30.592608'),(28,'academico','0010_pago_semestre','2023-05-27 22:12:59.084313'),(29,'academico','0011_alter_espacio_dia','2023-05-28 22:33:47.497866'),(30,'academico','0012_alter_departamento_sede_alter_facultad_departamento','2023-05-28 23:13:07.498294'),(31,'academico','0013_rename_sede_departamento_facultad_and_more','2023-05-28 23:15:53.072811'),(32,'academico','0014_alter_facultad_nombre','2023-05-28 23:33:54.533319'),(33,'academico','0015_alter_historial_academico_programa','2023-05-31 16:24:13.676780'),(34,'academico','0016_alter_inscripcion_cancelacion_creditos_disponibles_and_more','2023-06-04 15:19:06.716150'),(35,'academico','0017_alter_inscripcion_cancelacion_creditos_disponibles_and_more','2023-06-04 15:19:51.842230'),(36,'academico','0018_prerequisito','2023-06-04 16:29:53.392277'),(37,'academico','0019_delete_prerequisito','2023-06-04 19:05:40.626515'),(38,'academico','0020_prerequisito','2023-06-04 19:06:01.552761');
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
INSERT INTO `django_session` VALUES ('0nvvvorvu7uul25rdkjuocye95mvzl9p','.eJxVy0sKwjAUheG9ZCwlNw9MHAquI9xXSNAqmHYk7t0KHej0O-d_mYLr0so69Fm6mJMBc_g1Qr7q_Tsgo-jc-THtNqbLjP123h9_WcPRtsalypYRbOUkjFhzjNm6BEdMgSES-UQiwdmqWjOFYD1EJCW3mRfz_gCJtDSO:1q5tI9:4v0vL7g4TF9fkVA3i2_SE4zreIp9T34pfX5JnIBreyY','2023-06-18 19:21:29.180234'),('ezqfhgqgzf57r9mdovioi1dpaphh36sv','.eJxVy0sKwjAUheG9ZCwlNw9MHAquI9xXSNAqmHYk7t0KHej0O-d_mYLr0so69Fm6mJMBc_g1Qr7q_Tsgo-jc-THtNqbLjP123h9_WcPRtsalypYRbOUkjFhzjNm6BEdMgSES-UQiwdmqWjOFYD1EJCW3mRfz_gCJtDSO:1q43Fb:_NfRGSI7QIGgpBsPvicG5DuyqCjP0n8sIHZyAYkSe88','2023-06-13 17:35:15.182759'),('mofrajzzjwen81irf7pk0qw4z0equ1cw','.eJxVi0sKwjAQQO8yayn5TjIuBc8RJj8StAqmXYl3t4UudPs-bwi8Li2so7xCz3AGKeH0CyOnW3nshhPnMvf0nA42puvM_X45ir-t8Wjbo3Ulq6Iik230mnJ1TniZrEdBDtFHNGirYJ8QJZLTVTgl0CiDkmyGzxdXLjI3:1q5qgm:-cZC3adNq4zegn331krTlTNHte6QocrC6GKX_Q6KOhs','2023-06-18 16:34:44.536012'),('oy8z13lhjy9y93kmxw56ixr6rflqmk4k','.eJxVi0sKwjAQQO8yayn5TjIuBc8RJj8StAqmXYl3t4UudPs-bwi8Li2so7xCz3AGKeH0CyOnW3nshhPnMvf0nA42puvM_X45ir-t8Wjbo3Ulq6Iik230mnJ1TniZrEdBDtFHNGirYJ8QJZLTVTgl0CiDkmyGzxdXLjI3:1q5VCd:lE7fFhxLKGlFdFRu7gMLjCH81kLgQQyMiwG_J2xqe5o','2023-06-17 17:38:11.756295'),('u7dy5z5mobprldt4lk9fhqad3qqwfsah','.eJxVjMsOwiAUBf-FtSE8I7h07zeQ-wCpGkhKuzL-u23ShW5n5py3SLAuNa0jz2licRFanH4ZAj1z2wU_oN27pN6WeUK5J_KwQ94659f1aP8OKoy6rU0opAi0KhSYAEr0PioT9BmCI-0RbUBmZ1TJuUR0TlntATOajVkWny__1zhz:1q2hvz:Esp_18aB2459x1vGcHgFgTmD2xodvgyhlZQpRf6ahrw','2023-06-10 00:37:27.623153');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,0,312313),(2,0,123113);
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
  KEY `Historial_Academico_Estudiante_id_34ac7fc9_fk_Estudiant` (`Estudiante_id`),
  KEY `Historial_Academico_Programa_id_fab1e4a9` (`Programa_id`),
  CONSTRAINT `Historial_Academico_Estudiante_id_34ac7fc9_fk_Estudiant` FOREIGN KEY (`Estudiante_id`) REFERENCES `estudiante` (`Id_estudiante`),
  CONSTRAINT `Historial_Academico_Programa_id_fab1e4a9_fk_Programa_` FOREIGN KEY (`Programa_id`) REFERENCES `programa` (`Codigo_SNIES`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_academico`
--

LOCK TABLES `historial_academico` WRITE;
/*!40000 ALTER TABLE `historial_academico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!50001 DROP VIEW IF EXISTS `inscripcion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inscripcion` AS SELECT 
 1 AS `Semestre`,
 1 AS `Nombre`,
 1 AS `idcita`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inscripcion_cancelacion`
--

DROP TABLE IF EXISTS `inscripcion_cancelacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion_cancelacion` (
  `Id_incripcion` int NOT NULL AUTO_INCREMENT,
  `Creditos_Disponibles` int DEFAULT NULL,
  `Semestre` int DEFAULT NULL,
  `Cita_id` int NOT NULL,
  PRIMARY KEY (`Id_incripcion`),
  UNIQUE KEY `Cita_id` (`Cita_id`),
  CONSTRAINT `Inscripcion_cancelac_Cita_id_0d7a53b1_fk_Cita_Insc` FOREIGN KEY (`Cita_id`) REFERENCES `cita_inscripcion` (`Id_cita`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
INSERT INTO `persona_vinculada` VALUES (123113,'Cedula','Alejandro','Alarcon','0','Sergio@gmail.com','32322','Colombia','Alejandro@unal.edu.co','2023-05-31',11),(123123,'Cedula','Leandro','Perez','1','Alfonso@gmail.com','123212','Colombia','LePerez7@unal.edu.co','2023-05-30',16),(312313,'Cedula','Sergio','Ruiz Medina','1','sergio@gmail.com','12312115x57','Colombia','Sergio@unal.edu.co','2023-05-28',3),(3213131,'Cedula','Juan','Medina','1','jmedinagu@unal.edu.co','+13222401133x57','Colombia','Juan@unal.edu.co','2023-05-27',1);
/*!40000 ALTER TABLE `persona_vinculada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisito`
--

DROP TABLE IF EXISTS `prerequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prerequisito` (
  `Id_Prerequisito` int NOT NULL AUTO_INCREMENT,
  `Materia_id` int NOT NULL,
  `Prerequisito_id` int NOT NULL,
  PRIMARY KEY (`Id_Prerequisito`),
  KEY `Prerequisito_Materia_id_a24221f0_fk_Asignatura_Codigo` (`Materia_id`),
  KEY `Prerequisito_Prerequisito_id_f64fcf67_fk_Asignatura_Codigo` (`Prerequisito_id`),
  CONSTRAINT `Prerequisito_Materia_id_a24221f0_fk_Asignatura_Codigo` FOREIGN KEY (`Materia_id`) REFERENCES `asignatura` (`Codigo`),
  CONSTRAINT `Prerequisito_Prerequisito_id_f64fcf67_fk_Asignatura_Codigo` FOREIGN KEY (`Prerequisito_id`) REFERENCES `asignatura` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisito`
--

LOCK TABLES `prerequisito` WRITE;
/*!40000 ALTER TABLE `prerequisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `prerequisito` ENABLE KEYS */;
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
INSERT INTO `programa` VALUES (176,'Matematicas',170,'Pregrado',115),(538,'Cine y television',158,'Pregrado',89),(797,'Medicina veterinaria',209,'Pregrado',133),(2042,'Ingenieria Geologica',170,'Pregrado',106),(2493,'Ingenieria industrial',180,'Pregrado',105),(3576,'Ingenieria de sistemas y computacion',185,'Pregrado',105),(3680,'Odontologia',200,'Pregrado',130),(3983,'Ingenieria Industrial',165,'Pregrado',114),(3985,'Economia',151,'Pregrado',98),(3986,'Ingenieria Ambiental',160,'Pregrado',126),(4257,'Administracion de empresas',160,'Pregrado',123),(4424,'Zootecnia',187,'Pregrado',135),(4605,'Ingenieria de Control',172,'Pregrado',106),(5123,'Musica',171,'Pregrado',89),(5465,'Ingenieria Electrica',200,'Pregrado',107),(5940,'Trabajo social',160,'Pregrado',97),(9273,'Ingenieria Quimica',190,'Pregrado',107),(10572,'Ingenieria Agronomica',192,'Pregrado',135),(11584,'Ingenieria de Minas y Metalurgia',180,'Pregrado',106),(11945,'Arquitectura',179,'Pregrado',89),(12258,'Matematicas',140,'Pregrado',113),(15553,'Ciencia politica',150,'Pregrado',98),(16035,'Biologia',177,'Pregrado',113),(16332,'Arquitectura',190,'Pregrado',90),(17142,'Derecho',180,'Pregrado',138),(19584,'Administracion de empresas',176,'Pregrado',121),(19587,'Antropologia',139,'Pregrado',97),(24499,'Ingenieria mecanica',192,'Pregrado',105),(24501,'Nutricion y dietetica',173,'Pregrado',129),(24509,'Ingenieria Industrial',177,'Pregrado',106),(26328,'Fisioterapia',178,'Pregrado',129),(26329,'Estadistica',141,'Pregrado',113),(108081,'Biologia',179,'Pregrado',120),(108083,'Geografia',141,'Pregrado',120),(108084,'Gestion Cultural y comunicativa',155,'Pregrado',96),(108086,'Ingenieria Mecatronica',182,'Pregrado',120);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residencia`
--

LOCK TABLES `residencia` WRITE;
/*!40000 ALTER TABLE `residencia` DISABLE KEYS */;
INSERT INTO `residencia` VALUES (1,1,'Bogota','Avenida Chile',13,1),(2,2,'Villavicencio','mzdasda #19',13,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 1 AS `Papa`,
 1 AS `Papi`,
 1 AS `Pa`,
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
 1 AS `programa`,
 1 AS `idcita`,
 1 AS `facultad`,
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
-- Final view structure for view `inscripcion`
--

/*!50001 DROP VIEW IF EXISTS `inscripcion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inscripcion` AS select `inscripcion_cancelacion`.`Semestre` AS `Semestre`,`programa`.`Nombre` AS `Nombre`,`inscripcion_cancelacion`.`Cita_id` AS `idcita` from (((`inscripcion_cancelacion` join `cita_inscripcion` on((`cita_inscripcion`.`Id_cita` = `inscripcion_cancelacion`.`Cita_id`))) join `historial_academico` on((`historial_academico`.`Id_Historial` = `cita_inscripcion`.`Id_cita`))) join `programa` on((`programa`.`Codigo_SNIES` = `historial_academico`.`Programa_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `vst_estuidiante_datos` AS select `persona_vinculada`.`Documento` AS `Documento`,`persona_vinculada`.`Tipo_Documento` AS `Tipo_Documento`,`persona_vinculada`.`Nombre` AS `Nombre`,`persona_vinculada`.`Apellido` AS `Apellido`,`persona_vinculada`.`Correo_Personal` AS `Correo_Personal`,`persona_vinculada`.`Correo_institucional` AS `Correo_institucional`,`persona_vinculada`.`Telefono` AS `Telefono`,`residencia`.`Estrato` AS `Estrato`,`residencia`.`Ciudad` AS `Ciudad`,`residencia`.`Calle` AS `Calle`,`historial_academico`.`Papa` AS `Papa`,`historial_academico`.`Papi` AS `Papi`,`historial_academico`.`Pa` AS `Pa`,`programa`.`Nombre` AS `Programa`,`persona_vinculada`.`Usuario_id` AS `userid` from ((((`persona_vinculada` join `estudiante` on((`estudiante`.`Persona_Vinculada_id` = `persona_vinculada`.`Documento`))) join `residencia` on((`estudiante`.`Id_estudiante` = `residencia`.`Estudiante_id`))) join `historial_academico` on((`historial_academico`.`Estudiante_id` = `estudiante`.`Id_estudiante`))) join `programa` on((`programa`.`Codigo_SNIES` = `historial_academico`.`Programa_id`))) */;
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
/*!50001 VIEW `vst_inscripcion` AS select `programa`.`Nombre` AS `programa`,`cita_inscripcion`.`Id_cita` AS `idcita`,`facultad`.`Nombre` AS `facultad`,`cita_inscripcion`.`Fecha` AS `Fecha`,`cita_inscripcion`.`Hora` AS `Hora`,`persona_vinculada`.`Usuario_id` AS `userid` from (((((`persona_vinculada` join `estudiante` on((`estudiante`.`Persona_Vinculada_id` = `persona_vinculada`.`Documento`))) join `historial_academico` on((`estudiante`.`Id_estudiante` = `historial_academico`.`Estudiante_id`))) join `programa` on((`programa`.`Codigo_SNIES` = `historial_academico`.`Programa_id`))) join `cita_inscripcion` on((`historial_academico`.`Id_Historial` = `cita_inscripcion`.`Historial_id`))) join `facultad` on((`facultad`.`Id_Facultad` = `programa`.`Facultad_id`))) */;
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

-- Dump completed on 2023-06-04 14:23:05
