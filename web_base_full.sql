-- MySQL dump 10.13  Distrib 9.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: web_base
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `20250530`
--

DROP TABLE IF EXISTS `20250530`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250530` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250530_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250530`
--

LOCK TABLES `20250530` WRITE;
/*!40000 ALTER TABLE `20250530` DISABLE KEYS */;
INSERT INTO `20250530` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250530` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `20250531`
--

DROP TABLE IF EXISTS `20250531`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250531` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250531_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250531`
--

LOCK TABLES `20250531` WRITE;
/*!40000 ALTER TABLE `20250531` DISABLE KEYS */;
INSERT INTO `20250531` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250531` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `20250601`
--

DROP TABLE IF EXISTS `20250601`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250601` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250601_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250601`
--

LOCK TABLES `20250601` WRITE;
/*!40000 ALTER TABLE `20250601` DISABLE KEYS */;
INSERT INTO `20250601` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250601` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `20250602`
--

DROP TABLE IF EXISTS `20250602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250602` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250602_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250602`
--

LOCK TABLES `20250602` WRITE;
/*!40000 ALTER TABLE `20250602` DISABLE KEYS */;
INSERT INTO `20250602` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `20250603`
--

DROP TABLE IF EXISTS `20250603`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250603` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250603_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250603`
--

LOCK TABLES `20250603` WRITE;
/*!40000 ALTER TABLE `20250603` DISABLE KEYS */;
INSERT INTO `20250603` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250603` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `20250604`
--

DROP TABLE IF EXISTS `20250604`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250604` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250604_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250604`
--

LOCK TABLES `20250604` WRITE;
/*!40000 ALTER TABLE `20250604` DISABLE KEYS */;
INSERT INTO `20250604` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250604` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `20250605`
--

DROP TABLE IF EXISTS `20250605`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250605` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250605_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250605`
--

LOCK TABLES `20250605` WRITE;
/*!40000 ALTER TABLE `20250605` DISABLE KEYS */;
INSERT INTO `20250605` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250605` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `20250606`
--

DROP TABLE IF EXISTS `20250606`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250606` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250606_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250606`
--

LOCK TABLES `20250606` WRITE;
/*!40000 ALTER TABLE `20250606` DISABLE KEYS */;
INSERT INTO `20250606` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250606` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `20250607`
--

DROP TABLE IF EXISTS `20250607`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `20250607` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot_id` int unsigned NOT NULL,
  `remaining` int NOT NULL,
  `available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `20250607_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `list_of_time_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `20250607`
--

LOCK TABLES `20250607` WRITE;
/*!40000 ALTER TABLE `20250607` DISABLE KEYS */;
INSERT INTO `20250607` VALUES (1,1,999,1),(2,2,7,1),(3,3,7,1),(4,4,7,1),(5,5,7,1),(6,6,7,1),(7,7,7,1),(8,8,7,1),(9,9,7,1),(10,10,7,1),(11,11,7,1),(12,12,7,1),(13,13,7,1),(14,14,7,1),(15,15,7,1),(16,16,7,1),(17,17,7,1),(18,18,7,1),(19,19,7,1),(20,20,7,1),(21,21,7,1),(22,22,7,1),(23,23,7,1),(24,24,7,1),(25,25,7,1),(26,26,7,1),(27,27,7,1),(28,28,7,1),(29,29,7,1),(30,30,7,1),(31,31,7,1),(32,32,7,1),(33,33,7,1),(34,34,7,1),(35,35,7,1),(36,36,7,1),(37,37,7,1),(38,38,7,1),(39,39,7,1),(40,40,7,1),(41,41,999,1);
/*!40000 ALTER TABLE `20250607` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2y$12$tkNs/SAIqPFPn28gzDFRoebLvQsPu2AXxJwxJR1XCmYsv19e3aLIa','kotorbus@kotor.me','2025-05-30 07:15:33');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_of_time_slots`
--

DROP TABLE IF EXISTS `list_of_time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_of_time_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time_slot` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_of_time_slots`
--

LOCK TABLES `list_of_time_slots` WRITE;
/*!40000 ALTER TABLE `list_of_time_slots` DISABLE KEYS */;
INSERT INTO `list_of_time_slots` VALUES (1,'00:00 - 07:00'),(2,'07:00 - 07:20'),(3,'07:20 - 07:40'),(4,'07:40 - 08:00'),(5,'08:00 - 08:20'),(6,'08:20 - 08:40'),(7,'08:40 - 09:00'),(8,'09:00 - 09:20'),(9,'09:20 - 09:40'),(10,'09:40 - 10:00'),(11,'10:00 - 10:20'),(12,'10:20 - 10:40'),(13,'10:40 - 11:00'),(14,'11:00 - 11:20'),(15,'11:20 - 11:40'),(16,'11:40 - 12:00'),(17,'12:00 - 12:20'),(18,'12:20 - 12:40'),(19,'12:40 - 13:00'),(20,'13:00 - 13:20'),(21,'13:20 - 13:40'),(22,'13:40 - 14:00'),(23,'14:00 - 14:20'),(24,'14:20 - 14:40'),(25,'14:40 - 15:00'),(26,'15:00 - 15:20'),(27,'15:20 - 15:40'),(28,'15:40 - 16:00'),(29,'16:00 - 16:20'),(30,'16:20 - 16:40'),(31,'16:40 - 17:00'),(32,'17:00 - 17:20'),(33,'17:20 - 17:40'),(34,'17:40 - 18:00'),(35,'18:00 - 18:20'),(36,'18:20 - 18:40'),(37,'18:40 - 19:00'),(38,'19:00 - 19:20'),(39,'19:20 - 19:40'),(40,'19:40 - 20:00'),(41,'20:00 - 24:00');
/*!40000 ALTER TABLE `list_of_time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2025_05_16_070731_drop_users_table',1),(2,'2025_05_18_183214_create_sessions_table',1),(3,'2025_05_29_000001_create_vehicle_types_table',1),(4,'2025_05_29_000002_create_list_of_time_slots_table',1),(5,'2025_05_29_000003_create_reservations_table',1),(6,'2025_05_29_000004_create_system_config_table',1),(7,'2025_05_29_000005_create_admins_table',1),(8,'2025_05_29_222658_create_cache_table',1),(9,'2025_05_29_230310_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `drop_off_time_slot_id` int unsigned NOT NULL,
  `pick_up_time_slot_id` int unsigned NOT NULL,
  `reservation_date` date NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_plate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_type_id` int unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('paid','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `reservations_drop_off_time_slot_id_foreign` (`drop_off_time_slot_id`),
  KEY `reservations_pick_up_time_slot_id_foreign` (`pick_up_time_slot_id`),
  KEY `reservations_vehicle_type_id_foreign` (`vehicle_type_id`),
  CONSTRAINT `reservations_drop_off_time_slot_id_foreign` FOREIGN KEY (`drop_off_time_slot_id`) REFERENCES `list_of_time_slots` (`id`),
  CONSTRAINT `reservations_pick_up_time_slot_id_foreign` FOREIGN KEY (`pick_up_time_slot_id`) REFERENCES `list_of_time_slots` (`id`),
  CONSTRAINT `reservations_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_config_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (1,'available_parking_slots',7,'2025-05-30 09:15:33');
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_types`
--

DROP TABLE IF EXISTS `vehicle_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description_vehicle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_types`
--

LOCK TABLES `vehicle_types` WRITE;
/*!40000 ALTER TABLE `vehicle_types` DISABLE KEYS */;
INSERT INTO `vehicle_types` VALUES (1,'8+1 mjesta (manji kombi)',20.00),(2,'9-23 mjesta (mini bus)',40.00),(3,'23+ mjesta (veliki autobus)',50.00);
/*!40000 ALTER TABLE `vehicle_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'web_base'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`korisnik`@`%` PROCEDURE `AddReservation`(
    IN dropOffTimeSlotId INT unsigned,
    IN pickUpTimeSlotId INT unsigned,
    IN reservation_date DATE,
    IN userName VARCHAR(255),
    IN countryName VARCHAR(100),
    IN licensePlate VARCHAR(50),
    IN vehicleTypeId INT unsigned,
    IN e_mail VARCHAR(255)
)
BEGIN
    DECLARE preostalo_dorp_off INT;
    DECLARE preostalo_pick_up INT;
    DECLARE reservation_table VARCHAR(20);
    DECLARE is_drop_off_available BOOLEAN DEFAULT FALSE;
    DECLARE is_pick_up_available BOOLEAN DEFAULT FALSE;
    SET reservation_table = DATE_FORMAT(reservation_date, '%Y%m%d');
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_schema = 'web_base' 
        AND table_name = reservation_table)
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabela nije kreirana.';
    END IF;

    -- Provera validnosti tipa vozila
    IF NOT (vehicleTypeId = 1 OR vehicleTypeId = 2 OR vehicleTypeId = 3) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tip vozila nije validan.';
    END IF;
    -- Provera dostupnosti drop-off slota
    SET @sql = CONCAT('SELECT available INTO @available_drop_off FROM `', reservation_table, '` WHERE time_slot_id = ?');
    PREPARE stmt FROM @sql;
    SET @slot_id = dropOffTimeSlotId;
    EXECUTE stmt USING @slot_id;
    DEALLOCATE PREPARE stmt;
    SET is_drop_off_available = @available_drop_off;
    -- Provera dostupnosti pick-up slota
    SET @sql = CONCAT('SELECT available INTO @available_pick_up FROM `', reservation_table, '` WHERE time_slot_id = ?');
    PREPARE stmt FROM @sql;
    SET @slot_id = pickUpTimeSlotId;
    EXECUTE stmt USING @slot_id;
    DEALLOCATE PREPARE stmt;
    SET is_pick_up_available = @available_pick_up;
    IF is_drop_off_available AND is_pick_up_available THEN
        -- Unos rezervacije
        INSERT INTO reservations (drop_off_time_slot_id,  pick_up_time_slot_id, reservation_date, user_name, country, license_plate, vehicle_type_id, email, status)
        VALUES (dropOffTimeSlotId, pickUpTimeSlotId, reservation_date, userName, countryName, licensePlate, vehicleTypeId, e_mail, 'pending');
        -- remaining za drop-off
        SET @sql = CONCAT('SELECT remaining INTO @preostalo_dorp_off FROM `', reservation_table, '` WHERE time_slot_id = ?');
        PREPARE stmt FROM @sql;
        SET @slot_id = dropOffTimeSlotId;
        EXECUTE stmt USING @slot_id;
        DEALLOCATE PREPARE stmt;
        SET preostalo_dorp_off = @preostalo_dorp_off - 1;
        -- remaining za pick-up
        SET @sql = CONCAT('SELECT remaining INTO @preostalo_pick_up FROM `', reservation_table, '` WHERE time_slot_id = ?');
        PREPARE stmt FROM @sql;
        SET @slot_id = pickUpTimeSlotId;
        EXECUTE stmt USING @slot_id;
        DEALLOCATE PREPARE stmt;
        SET preostalo_pick_up = @preostalo_pick_up - 1;
        -- UPDATE drop-off
        SET @sql = CONCAT('UPDATE `', reservation_table, '` SET remaining = ?, available = ? WHERE time_slot_id = ?');
        PREPARE stmt FROM @sql;
        SET @new_remaining1 = preostalo_dorp_off;
        SET @new_available1 = IF(preostalo_dorp_off > 0, TRUE, FALSE);
        SET @slot_id1 = dropOffTimeSlotId;
        EXECUTE stmt USING @new_remaining1, @new_available1, @slot_id1;
        DEALLOCATE PREPARE stmt;
        -- UPDATE pick-up
        SET @sql = CONCAT('UPDATE `', reservation_table, '` SET remaining = ?, available = ? WHERE time_slot_id = ?');
        PREPARE stmt FROM @sql;
        SET @new_remaining2 = preostalo_pick_up;
        SET @new_available2 = IF(preostalo_pick_up > 0, TRUE, FALSE);
        SET @slot_id2 = pickUpTimeSlotId;
        EXECUTE stmt USING @new_remaining2, @new_available2, @slot_id2;
        DEALLOCATE PREPARE stmt;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vremenski slot nije dostupan za rezervaciju.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BlockSlotsForDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`korisnik`@`%` PROCEDURE `BlockSlotsForDate`(
    IN p_date DATE,
    IN firstTimeSlot INT unsigned,
    IN lastTimeSlot INT unsigned
)
BEGIN
    DECLARE reservation_table VARCHAR(20);
    DECLARE insert_query TEXT;
    DECLARE i INT unsigned;
-- Formatiraj datum u 'YYYYMMDD'
    SET reservation_table = DATE_FORMAT(p_date, '%Y%m%d');
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_schema = 'web_base' 
        AND table_name = CAST(reservation_table AS CHAR))
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabela nije kreirana.';
    END IF;
    IF (firstTimeSlot <= lastTimeSlot AND 
        firstTimeSlot >= 1 AND
        firstTimeSlot <= 41 AND
        lastTimeSlot >= 1 AND
        lastTimeSlot <= 41) THEN
        SET i = firstTimeSlot;
        WHILE i <= lastTimeSlot DO
            SET @insert_query = CONCAT('UPDATE `', reservation_table, '` SET remaining = 0, available = FALSE WHERE time_slot_id = ',i);
            PREPARE stmt FROM @insert_query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
            SET i = i + 1;
        END WHILE;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Prvi ili poslednji time slot nisu korektno uneti.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BlockTableForDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`korisnik`@`%` PROCEDURE `BlockTableForDate`(IN p_date DATE)
BEGIN
    DECLARE reservation_table VARCHAR(20);
    DECLARE insert_query TEXT;
    DECLARE i INT unsigned;
    SET reservation_table = DATE_FORMAT(p_date, '%Y%m%d');
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_schema = 'web_base' 
        AND table_name = CAST(reservation_table AS CHAR))
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabela nije kreirana.';
    END IF;
    SET i = 1;
    WHILE i <= 41 DO
        SET @insert_query = CONCAT('UPDATE `', reservation_table, '` SET remaining = 0, available = FALSE WHERE time_slot_id = ',i);
        PREPARE stmt FROM @insert_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckTimeSlotAvailability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`korisnik`@`%` PROCEDURE `CheckTimeSlotAvailability`(
    IN timeSlotId INT unsigned,
    IN reservation_date DATE,
    OUT isAvailable BOOLEAN
)
BEGIN
    DECLARE reservation_table VARCHAR(20);
    SET reservation_table = DATE_FORMAT(reservation_date, '%Y%m%d');
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_schema = 'web_base' 
        AND table_name = reservation_table)
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabela nije kreirana.';
    END IF;
    SET @sql = CONCAT('SELECT available INTO @is_available FROM `', reservation_table, '` WHERE time_slot_id = ?');
    PREPARE stmt FROM @sql;
    SET @slot_id = timeSlotId;
    EXECUTE stmt USING @slot_id;
    DEALLOCATE PREPARE stmt;
    SET isAvailable = @is_available;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateTableForDateWithData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`korisnik`@`%` PROCEDURE `CreateTableForDateWithData`(IN p_date DATE)
BEGIN
    DECLARE table_name VARCHAR(20);
    DECLARE sql_query TEXT;
    DECLARE insert_query TEXT;
    DECLARE i INT unsigned;
    DECLARE default_remaining INT DEFAULT 7;
-- Dohvati broj mesta iz system_config
    SELECT CAST(value AS UNSIGNED) INTO default_remaining FROM system_config WHERE name = 'available_parking_slots';
    SET table_name = DATE_FORMAT(p_date, '%Y%m%d');
    SET @sql_query = CONCAT('CREATE TABLE IF NOT EXISTS `', table_name, '` (id INT unsigned AUTO_INCREMENT PRIMARY KEY, time_slot_id INT unsigned NOT NULL, remaining INT NOT NULL, available BOOLEAN DEFAULT TRUE, FOREIGN KEY (time_slot_id) REFERENCES list_of_time_slots(id))');
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
-- Prva vrsta
    SET @insert_query = CONCAT('INSERT INTO `', table_name, '` (time_slot_id, remaining, available) VALUES (1, 999, TRUE)');
    PREPARE stmt FROM @insert_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
-- Srednje vrste
    SET i = 2;
    WHILE i <= 40 DO
        SET @insert_query = CONCAT('INSERT INTO `', table_name, '` (time_slot_id, remaining, available) VALUES (', i, ', ', default_remaining, ', TRUE)');
        PREPARE stmt FROM @insert_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SET i = i + 1;
    END WHILE;
-- Poslednja vrsta
    SET @insert_query = CONCAT('INSERT INTO `', table_name, '` (time_slot_id, remaining, available) VALUES (41, 999, TRUE)');
    PREPARE stmt FROM @insert_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropTableForDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`korisnik`@`%` PROCEDURE `DropTableForDate`(IN p_date DATE)
BEGIN
    DECLARE reservation_table VARCHAR(20);
    DECLARE sql_query TEXT;
-- Formatiraj datum u 'YYYYMMDD'
    SET reservation_table = DATE_FORMAT(p_date, '%Y%m%d');
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_schema = 'web_base' 
        AND table_name = CAST(reservation_table AS CHAR))
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabela nije kreirana.';
    END IF;
-- Sastavi SQL upit za brisanje tabele
    SET @sql_query = CONCAT('DROP TABLE IF EXISTS `', reservation_table, '`');
-- Pripremi i izvrši dinamički SQL
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-30 13:44:04
