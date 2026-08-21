-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: autism
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(50) NOT NULL,
  `result_message` text NOT NULL,
  `score` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES (1,'N121','Your child needs further Diagnostic Tests for Autism.',0,'2026-04-21 06:49:49'),(2,'N121','Your child needs further Diagnostic Tests for Autism.',0,'2026-04-21 06:58:02'),(3,'N121','Your child needs further Diagnostic Tests for Autism.',0,'2026-04-21 07:02:54'),(4,'N121','Your Child has no signs of Autism at present',0,'2026-04-21 07:03:17'),(5,'N121','Your child needs further Diagnostic Tests for Autism.',0,'2026-04-21 07:15:28'),(6,'B123','Your child needs further Diagnostic Tests for Autism.',0,'2026-04-21 07:25:16'),(182,'A01','Your child needs further Diagnostic Tests for Autism.',0,'2026-08-06 05:38:26'),(185,'MDJ01','Your child needs further Diagnostic Tests for Autism.',0,'2026-08-19 05:23:22');
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultations`
--

DROP TABLE IF EXISTS `consultations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `status` enum('Pending','Replied') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `consultations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `consultations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultations`
--

LOCK TABLES `consultations` WRITE;
/*!40000 ALTER TABLE `consultations` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_advice`
--

DROP TABLE IF EXISTS `doctor_advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(50) DEFAULT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `advice_text` text DEFAULT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `doctor_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_advice`
--

LOCK TABLES `doctor_advice` WRITE;
/*!40000 ALTER TABLE `doctor_advice` DISABLE KEYS */;
INSERT INTO `doctor_advice` VALUES (26,'','','',NULL,'2026-05-30 05:15:52',NULL),(27,'','','',NULL,'2026-05-30 05:15:54',NULL),(28,'','','',NULL,'2026-05-30 05:16:04',NULL),(31,'','','',NULL,'2026-05-30 05:18:32',NULL),(33,'','','',NULL,'2026-05-30 05:25:04',NULL),(56,'A01','Jeelani','Good , need to take extra care.',182,'2026-08-06 05:47:15',NULL);
/*!40000 ALTER TABLE `doctor_advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_image` varchar(255) DEFAULT NULL,
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `doctor_id` (`doctor_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (17,'D01','Dhanush','dhanush.sse@saveetha.com','@Dhanush','Pediatrics','8523697412','2026-08-19 05:17:57','http://localhost/autism/uploads/doc_D01_1787116776.jpeg','2026-08-19 05:19:36');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(50) NOT NULL,
  `receiver_id` varchar(50) NOT NULL,
  `sender_role` enum('doctor','patient') NOT NULL,
  `message_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `dob` date NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_image` varchar(255) DEFAULT NULL,
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `patient_id` (`patient_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (27,'A01','Akhil',19,'2007-08-06','Male','8523697419','akhil.sse@saveetha.com','@@@A01','2026-08-06 05:36:05','http://127.0.0.1/autism/uploads/profile_A01_1785994654.png','2026-08-06 05:49:12'),(29,'MDJ01','Jeelani',3,'2023-08-19','Male','7412365896','jeelani.sse@saveetha.com','@Jeelani','2026-08-19 05:22:16','http://127.0.0.1/autism/uploads/profile_MDJ01_1787117095.png','2026-08-19 05:24:55');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `symptom_id` int(11) NOT NULL,
  `answer` enum('Yes','No') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `symptom_id` (`symptom_id`),
  CONSTRAINT `responses_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `responses_ibfk_2` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `total_yes` int(11) DEFAULT NULL,
  `risk_level` enum('Low','Medium','High') DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom_responses`
--

DROP TABLE IF EXISTS `symptom_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptom_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `symptom_name` varchar(255) NOT NULL,
  `response` enum('Yes','No') NOT NULL,
  `conclusion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `media_url` varchar(500) DEFAULT NULL,
  `media_type` enum('video','audio','image') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `symptom_responses_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom_responses`
--

LOCK TABLES `symptom_responses` WRITE;
/*!40000 ALTER TABLE `symptom_responses` DISABLE KEYS */;
INSERT INTO `symptom_responses` VALUES (1280,27,182,'Child does not involve in imaginative play','No','','2026-08-06 05:38:26',NULL,NULL),(1281,27,182,'Sometimes it feels like child can\'t hear well','Yes','','2026-08-06 05:38:26',NULL,NULL),(1282,27,182,'Child grabs elders hands to his/her point of interest','No','','2026-08-06 05:38:26',NULL,NULL),(1283,27,182,'Child has poor eye contact','Yes','','2026-08-06 05:38:26',NULL,NULL),(1284,27,182,'Child has abnormal gestures and behaviour','No','','2026-08-06 05:38:26',NULL,NULL),(1285,27,182,'Child prefers to be alone','Yes','','2026-08-06 05:38:26',NULL,NULL),(1286,27,182,'Child does not like to be hugged or touched','No','','2026-08-06 05:38:26',NULL,NULL),(1287,27,182,'Child is not indulging in imaginative play','Yes','','2026-08-06 05:38:26',NULL,NULL),(1288,27,182,'Child exhibits strange or savant abilities','No','','2026-08-06 05:38:26',NULL,NULL),(1305,29,185,'Child is not looking at the direction point','Yes','','2026-08-19 05:23:22',NULL,NULL),(1306,29,185,'Child is not sharing things when asked','Yes','','2026-08-19 05:23:22',NULL,NULL),(1307,29,185,'My child is not imitating my actions','No','','2026-08-19 05:23:22',NULL,NULL),(1308,29,185,'Child is finding difficult to express smile','No','','2026-08-19 05:23:22',NULL,NULL),(1309,29,185,'Has poor eye contact','Yes','','2026-08-19 05:23:22',NULL,NULL),(1310,29,185,'Child is finding it difficult to understand gestures','No','','2026-08-19 05:23:22',NULL,NULL),(1311,29,185,'My child prefers to be alone','Yes','','2026-08-19 05:23:22',NULL,NULL);
/*!40000 ALTER TABLE `symptom_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptoms`
--

DROP TABLE IF EXISTS `symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptom_name` varchar(255) NOT NULL,
  `explanation` text DEFAULT NULL,
  `age_group` enum('<3','>3') NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms`
--

LOCK TABLES `symptoms` WRITE;
/*!40000 ALTER TABLE `symptoms` DISABLE KEYS */;
INSERT INTO `symptoms` VALUES (1,'Child is not looking at the direction point','Early Signs','<3','uploads/child1.png'),(2,'Child is not sharing things when asked','Early Signs','<3','uploads/child2.png'),(3,'My child is not imitating my actions','Early Signs','<3','uploads/child3.png'),(4,'Child is finding difficult to express smile','Early Signs','<3','uploads/child4.png'),(5,'Has poor eye contact','Early Signs','<3','uploads/child5.png'),(6,'Child is finding it difficult to understand gestures','Early Signs','<3','uploads/child6.png'),(7,'My child prefers to be alone','Early Signs','<3','uploads/child7.png'),(11,'Child does not involve in imaginative play','Older Children','>3','uploads/child11.png'),(12,'Sometimes it feels like child can\'t hear well','Older Children','>3','uploads/child12.png'),(13,'Child grabs elders hands to his/her point of interest','Older Children','>3','uploads/child13.png'),(14,'Child has poor eye contact','Older Children','>3','uploads/child14.png'),(15,'Child has abnormal gestures and behaviour','Older Children','>3','uploads/child15.png'),(16,'Child prefers to be alone','Older Children','>3','uploads/child16.png'),(17,'Child does not like to be hugged or touched','Older Children','>3','uploads/child17.png'),(18,'Child is not indulging in imaginative play','Older Children','>3','uploads/child18.png'),(19,'Child exhibits strange or savant abilities','Older Children','>3','uploads/child19.png');
/*!40000 ALTER TABLE `symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('doctor','parent') NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:10:55
