-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: property_management_system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `property_id` int NOT NULL AUTO_INCREMENT,
  `landlord_id` int DEFAULT NULL,
  `tenant_id` int NOT NULL,
  `location` text NOT NULL,
  `price` int NOT NULL,
  `status` enum('vacant','occupied') NOT NULL DEFAULT 'vacant',
  PRIMARY KEY (`property_id`),
  KEY `landlord_id` (`landlord_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`landlord_id`) REFERENCES `property_landlords` (`landlord_id`),
  CONSTRAINT `properties_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `property_tenants` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,1,2,'Nakawa',5000,'vacant');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_complaints`
--

DROP TABLE IF EXISTS `property_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_complaints` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `complaint_text` text,
  `date_submitted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`complaint_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `property_complaints_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `property_tenants` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_complaints`
--

LOCK TABLES `property_complaints` WRITE;
/*!40000 ALTER TABLE `property_complaints` DISABLE KEYS */;
INSERT INTO `property_complaints` VALUES (1,1,'The no access to a proper drainage channel causing stagnation of water around the compound when it rains','2025-04-23 16:34:38',0);
/*!40000 ALTER TABLE `property_complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_landlords`
--

DROP TABLE IF EXISTS `property_landlords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_landlords` (
  `landlord_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`landlord_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_landlords`
--

LOCK TABLES `property_landlords` WRITE;
/*!40000 ALTER TABLE `property_landlords` DISABLE KEYS */;
INSERT INTO `property_landlords` VALUES (1,'Ayomi','ayomi2@gmail.com',786543214),(2,'Ali','ali2@gmail.com',776545224);
/*!40000 ALTER TABLE `property_landlords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_tenants`
--

DROP TABLE IF EXISTS `property_tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_tenants` (
  `tenant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_tenants`
--

LOCK TABLES `property_tenants` WRITE;
/*!40000 ALTER TABLE `property_tenants` DISABLE KEYS */;
INSERT INTO `property_tenants` VALUES (1,'Amina','amina2@gmail.com',785953201),(2,'Sarafina','sarafina34@gmail.com',754678930);
/*!40000 ALTER TABLE `property_tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent_statuses`
--

DROP TABLE IF EXISTS `rent_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_statuses` (
  `rent_status_id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `rent_due_date` date DEFAULT NULL,
  `rent_paid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`rent_status_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `rent_statuses_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `property_tenants` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_statuses`
--

LOCK TABLES `rent_statuses` WRITE;
/*!40000 ALTER TABLE `rent_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `rent_statuses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 17:27:38
