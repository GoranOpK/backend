-- MySQL dump 10.13  Distrib 9.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: my_mysql
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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2y$10$examplehashvaluehere','admin@example.com','2025-05-10 17:18:25');
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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_05_15_223646_create_vehicle_types_table',1),(5,'2025_05_15_223647_create_time_slots_table',1),(6,'2025_05_15_223648_create_reservations_table',1),(7,'2025_05_15_223649_create_admins_table',1),(8,'2025_05_15_223650_create_system_config_table',1),(9,'2025_05_15_223707_create_time_slots_table',2),(10,'2025_05_15_223721_create_reservations_table',3),(11,'2025_05_15_223734_create_admins_table',4),(12,'2025_05_15_223744_create_system_config_table',5),(13,'2025_05_16_085647_create_books_table',6),(14,'2025_05_18_091601_create_personal_access_tokens_table',7),(15,'2025_05_18_183214_create_sessions_table',8),(16,'2025_05_19_090156_add_duration_to_time_slots_table',9),(17,'2025_05_19_084853_update_time_slots_duration',10),(18,'2025_05_19_091223_adjust_time_intervals_to_20_minutes',11),(19,'2025_05_19_091933_adjust_time_intervals_to_20_minutes',12),(20,'2025_05_19_092217_adjust_strict_20_minute_intervals',13),(21,'2025_05_19_093059_fix_time_slots_intervals',14);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `time_slot_id` int NOT NULL,
  `reservation_date` date NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `country` varchar(100) NOT NULL,
  `license_plate` varchar(50) NOT NULL,
  `vehicle_type_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('paid','pending') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  KEY `fk_time_slot` (`time_slot_id`),
  CONSTRAINT `fk_time_slot` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (3,1,'2025-05-20','John Doe','Croatia','ZG123AB',1,'john.doe@example.com','pending');
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
INSERT INTO `sessions` VALUES ('Acky2hiSyffq1Sxy9pwPzmKcrx3atTvMaBAq9EOA',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoibXhrdENRemZyTzJnUmhvVG5GendMdzNpeXowV3BwQ290bUlBemdIbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747593150),('FOC0ctcKpY1tdS4dbxh2JwH0gFqwwXfWgNzg2T9q',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZXM1TjFVR3ZrRFlXZ28zSUFqc0NiclRaZjVrTDRHRFRZRkM5Tmx4USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747593539),('g9hzrcIoJYoZCqkm3EdAI9wSUocglyk9DV3OY4H1',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnphS1REajFmT1p3azdKQnpHSzRCRUxleEgzNUJXejB1QjJoTExwNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747593540),('orFKeAOwVyedymcuXNPmhO27vpIU7GfEnIWCXI60',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUjh0WFRxUGVCRzF2bFhUeDA2TGdRUllwcFR1Y0xCbFZxQzdScUg4YiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747593540),('tKalZOqXN4MWmPuTKfc02oIxIWSBNkbmhDZQNLTQ',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMTBDaU5laGZ1RzBTM2tUMDlPMG85NHhMRGE3cnk0akM4dTU1Yjl3UCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747593150),('US83zIvQ0CdyD3oSQYmA4x1JGPyT6yneHOsy3Zt3',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXBkRW9ZTXI1ZmFpSjFTZVBzZjl2V1lIczg3UE9wZFF4ZHpzY040NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747593150);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` int NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (1,'available_parking_slots',7,'2025-05-10 17:18:25');
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `type` enum('drop_off','pick_up') NOT NULL,
  `status` enum('available','full','unavailable') DEFAULT 'available',
  `slot_type` enum('ukrcaj','iskrcaj') DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '15',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` VALUES (1,'07:00:00','07:20:00','drop_off','available',NULL,20),(206,'07:00:00','07:20:00','drop_off','available',NULL,20),(207,'07:20:00','07:40:00','drop_off','available',NULL,20),(208,'07:40:00','08:00:00','drop_off','available',NULL,20),(209,'08:00:00','08:20:00','drop_off','available',NULL,20),(210,'08:20:00','08:40:00','drop_off','available',NULL,20),(211,'08:40:00','09:00:00','drop_off','available',NULL,20),(212,'09:00:00','09:20:00','drop_off','available',NULL,20),(213,'09:20:00','09:40:00','drop_off','available',NULL,20),(214,'09:40:00','10:00:00','drop_off','available',NULL,20),(215,'10:00:00','10:20:00','drop_off','available',NULL,20),(216,'10:20:00','10:40:00','drop_off','available',NULL,20),(217,'10:40:00','11:00:00','drop_off','available',NULL,20),(218,'11:00:00','11:20:00','drop_off','available',NULL,20),(219,'11:20:00','11:40:00','drop_off','available',NULL,20),(220,'11:40:00','12:00:00','drop_off','available',NULL,20),(221,'12:00:00','12:20:00','drop_off','available',NULL,20),(222,'12:20:00','12:40:00','drop_off','available',NULL,20),(223,'12:40:00','13:00:00','drop_off','available',NULL,20),(224,'13:00:00','13:20:00','drop_off','available',NULL,20),(225,'13:20:00','13:40:00','drop_off','available',NULL,20),(226,'13:40:00','14:00:00','drop_off','available',NULL,20),(227,'14:00:00','14:20:00','drop_off','available',NULL,20),(228,'14:20:00','14:40:00','drop_off','available',NULL,20),(229,'14:40:00','15:00:00','drop_off','available',NULL,20),(230,'15:00:00','15:20:00','drop_off','available',NULL,20),(231,'15:20:00','15:40:00','drop_off','available',NULL,20),(232,'15:40:00','16:00:00','drop_off','available',NULL,20),(233,'16:00:00','16:20:00','drop_off','available',NULL,20),(234,'16:20:00','16:40:00','drop_off','available',NULL,20),(235,'16:40:00','17:00:00','drop_off','available',NULL,20),(236,'17:00:00','17:20:00','drop_off','available',NULL,20),(237,'17:20:00','17:40:00','drop_off','available',NULL,20),(238,'17:40:00','18:00:00','drop_off','available',NULL,20),(239,'18:00:00','18:20:00','drop_off','available',NULL,20),(240,'18:20:00','18:40:00','drop_off','available',NULL,20),(241,'18:40:00','19:00:00','drop_off','available',NULL,20),(242,'19:00:00','19:20:00','drop_off','available',NULL,20),(243,'19:20:00','19:40:00','drop_off','available',NULL,20),(244,'19:40:00','20:00:00','drop_off','available',NULL,20),(245,'07:00:00','07:20:00','pick_up','available',NULL,20),(246,'07:20:00','07:40:00','pick_up','available',NULL,20),(247,'07:40:00','08:00:00','pick_up','available',NULL,20),(248,'08:00:00','08:20:00','pick_up','available',NULL,20),(249,'08:20:00','08:40:00','pick_up','available',NULL,20),(250,'08:40:00','09:00:00','pick_up','available',NULL,20),(251,'09:00:00','09:20:00','pick_up','available',NULL,20),(252,'09:20:00','09:40:00','pick_up','available',NULL,20),(253,'09:40:00','10:00:00','pick_up','available',NULL,20),(254,'10:00:00','10:20:00','pick_up','available',NULL,20),(255,'10:20:00','10:40:00','pick_up','available',NULL,20),(256,'10:40:00','11:00:00','pick_up','available',NULL,20),(257,'11:00:00','11:20:00','pick_up','available',NULL,20),(258,'11:20:00','11:40:00','pick_up','available',NULL,20),(259,'11:40:00','12:00:00','pick_up','available',NULL,20),(260,'12:00:00','12:20:00','pick_up','available',NULL,20),(261,'12:20:00','12:40:00','pick_up','available',NULL,20),(262,'12:40:00','13:00:00','pick_up','available',NULL,20),(263,'13:00:00','13:20:00','pick_up','available',NULL,20),(264,'13:20:00','13:40:00','pick_up','available',NULL,20),(265,'13:40:00','14:00:00','pick_up','available',NULL,20),(266,'14:00:00','14:20:00','pick_up','available',NULL,20),(267,'14:20:00','14:40:00','pick_up','available',NULL,20),(268,'14:40:00','15:00:00','pick_up','available',NULL,20),(269,'15:00:00','15:20:00','pick_up','available',NULL,20),(270,'15:20:00','15:40:00','pick_up','available',NULL,20),(271,'15:40:00','16:00:00','pick_up','available',NULL,20),(272,'16:00:00','16:20:00','pick_up','available',NULL,20),(273,'16:20:00','16:40:00','pick_up','available',NULL,20),(274,'16:40:00','17:00:00','pick_up','available',NULL,20),(275,'17:00:00','17:20:00','pick_up','available',NULL,20),(276,'17:20:00','17:40:00','pick_up','available',NULL,20),(277,'17:40:00','18:00:00','pick_up','available',NULL,20),(278,'18:00:00','18:20:00','pick_up','available',NULL,20),(279,'18:20:00','18:40:00','pick_up','available',NULL,20),(280,'18:40:00','19:00:00','pick_up','available',NULL,20),(281,'19:00:00','19:20:00','pick_up','available',NULL,20),(282,'19:20:00','19:40:00','pick_up','available',NULL,20),(283,'19:40:00','20:00:00','pick_up','available',NULL,20),(284,'07:00:00','07:20:00','drop_off','available',NULL,20);
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_types`
--

DROP TABLE IF EXISTS `vehicle_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_types`
--

LOCK TABLES `vehicle_types` WRITE;
/*!40000 ALTER TABLE `vehicle_types` DISABLE KEYS */;
INSERT INTO `vehicle_types` VALUES (1,'Tip A (8+1 mjesta)','8+1 mjesta (manji kombi)',20.00),(2,'Tip B (9-23 mjesta)','9-23 mjesta (mini bus)',40.00),(3,'Tip C (23+ mjesta)','23+ mjesta (veliki autobus)',50.00);
/*!40000 ALTER TABLE `vehicle_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19 12:28:08
