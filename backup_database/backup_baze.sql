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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_05_15_223646_create_vehicle_types_table',1),(5,'2025_05_15_223647_create_time_slots_table',1),(6,'2025_05_15_223648_create_reservations_table',1),(7,'2025_05_15_223649_create_admins_table',1),(8,'2025_05_15_223650_create_system_config_table',1),(9,'2025_05_15_223707_create_time_slots_table',2),(10,'2025_05_15_223721_create_reservations_table',3),(11,'2025_05_15_223734_create_admins_table',4),(12,'2025_05_15_223744_create_system_config_table',5),(13,'2025_05_16_085647_create_books_table',6),(14,'2025_05_18_091601_create_personal_access_tokens_table',7),(15,'2025_05_18_183214_create_sessions_table',8),(16,'2025_05_19_090156_add_duration_to_time_slots_table',9),(17,'2025_05_19_084853_update_time_slots_duration',10),(18,'2025_05_19_091223_adjust_time_intervals_to_20_minutes',11),(19,'2025_05_19_091933_adjust_time_intervals_to_20_minutes',12),(20,'2025_05_19_092217_adjust_strict_20_minute_intervals',13),(21,'2025_05_19_093059_fix_time_slots_intervals',14),(22,'2025_05_20_090421_remove_status_from_reservations_table',15);
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
INSERT INTO `reservations` VALUES (3,1,'2025-05-20','John Doe','Croatia','ZG123AB',1,'john.doe@example.com');
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
INSERT INTO `sessions` VALUES ('2pqQWBo9ljxJzRCo54Nd1qhYUOs2YPehd3XkRMrN',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ3BMc3JLSmxxdHZCRFA2WTlpN3Eyc21aa0JSYXlJaVlDZWJEenlaNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747691629),('3P0qlcYw6dSll7z2KYO1x8uMjjJH2YGXyJgpPbvg',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoibmNxaXF4TTVqQkJ1WE9PZ2k0c0VmNnMwRTJjclBVdzkxMHVLVnVRSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747692899),('422LjBqjXkwVA0eClCTHNof5L8bX7JcjB0Mj1gEd',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiOVFqNDVhMW9veE1WTmRKdzVnc1NwcU94Nk5oRXhlUkV0S2xnekJRbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747691986),('4F0uKXrJ9dnL9Bd5APIUhWKzxUGkdxW04kBR9urh',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOXViS3I2ZWcxWkp1NG9OcXRPcjZKemtBR0pMa3ZYcW1kVUdEeGg0MiI7czozOiJrZXkiO3M6NToidmFsdWUiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdGVzdC1zZXNzaW9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747722090),('4rYz59i035UEZLAudyWNkcUqcLKafZFJCipQPzLq',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaGJUMnViRnQwRXdGcm9jNXN0aklyY0FJcXFxSmtWc2hZOUlHTkkzZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747691093),('7MtDu8TdYtKyUjN8JdjkTmIq0JAiaP47tqwBq0jU',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiOElWNTRVWnFMYU56S3NVbTlUUnNHQ3dyTXRvNDJ6Q3NZT0ZxMnVNNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747691067),('aCHSzUWDuDHCYPGZY9ZvamZyxj4oktok5S5zNwoM',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ0JmNTlMNzRmM28wYjJPMnFXMEdBWDVLRUswOWFlMXZlbFZIWUYzdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747694490),('bUxxD5fMYqyIbGg3xqkz30jbyXRDR21RrKrnPOIr',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiVG81RHBBcDFPb2Q1UzRETldPWFRxTWpMcTlUT0hQb3BOM0dnYWd3YSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747693779),('d8q8MFhsrBdHGCaYbxelJ7J2uwieys5Tqz5K5gfa',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoienNQSnlpRWJSYzF3QVg5a1NTZklQdTV5RHVEUktRMkVYdkdIUFFKNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747691986),('De9erzMJG78j1KKuRXiVohIILR33BlqxB5ZkGJtl',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoibExCZzk1Sk4wdU93dkhhNlNIUXAyU0gxVjZ2Mm5zRHMwcGJnem5YSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747692357),('Dgd0plxOADvdO6j9byDfJOZzClUA4pAvovGMLPqC',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiYXVNcFB3VTV2RlJNbTQxZVhJVnpwRzhpcFIwRU93cjA4TzBHbWRheSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747693779),('gV6Z6VuDZfTgEIB6zozpnfGQlsl6NvPgpjlE0aj7',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUHBIb3NsZFlMZDVEcTBwT21ROTZjRzZpRHhmUjBHTW82VjRrREozYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747692357),('H4pguYKhmxF6QjwUE8UwR2hziA22bz5SuaB955ek',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFJ3dUJUZVpwUmtpRkZVQkZDQ3Z1Mm5lcHBRY1ZtRklVS0xqcWNhUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747693779),('iBruTKwRmKzGEgudIE9lk6JwCMfYktvFHCjxng8x',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkhmVVNwelZUMGd6Mm1OTE1acFFtQ3BPMlpsNHVhSmtqZlJvT2hoVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1747727090),('jawfi7qyH3dWGz7M4erT4y3JM2pabVi90w9mSsV3',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiVjh1RG1TdE9pMEJoTlhnMGFZVElJWWNJSTl0aHBvbHRrTUI4TENwcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747691629),('Ju44PHXz7bh9sh7UJ3mSmSFsFZ1tEQktvMNZskph',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoid3ozOTh2VFhCNURXc2NUSXJHRG93M0VBb21ha1hDWXNBdVhKeEgxNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747689425),('kdeUfDAu1lX1vjJM3IWhdNhNqYxf3Uqrjcb1hDjp',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDA0WjAzbm1lNGdla2Q2azBpTTh3SHBxZ0hUMUVUc2ozcmQ2V3QyOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747694490),('LQ5WXKvaRIgBHQ5PfV0Pf9UyYbvt9CeJjyDpTNuT',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWGFvMnFTck5HenVzSU4wZ1VoQVVza0NGeGtLcXJIUWw3eGo0YVZYUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747689426),('mIZd2c1gWwwnX6e0LVaapE6iw7RFjWrAep18STW0',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ0thZ244STJ2eHBsZHZFUHdNMWNSR2pMbDIxbFRXYnpDNUtvdlllVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747694490),('o3xmFrdtKqOdx5fEVNnCp2Q3NyOQ6aZHILY5Jx06',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWHh6QllkTXU2czdJd2FZTlBEUWFseExLMVNpYWZMMGdOYXFRdVN2RSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747691093),('OxPNGi67s6PdD7ESnb5IzNmHZcqjB3V9o4Apy46z',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlM0WDRvY2VObTZucTBUdlBNR010RDZhMG9MQTRIN01OZG5idXlSVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747691093),('QuknaApGjR4yHw6dJe8nRUP9UcDNF3gC6auIxmHL',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN042cjNCRlo0OFJmYjNTVkpGOHpCTTY1VGJuR3daemZyY2hidzEzcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747689426),('rAsof645y4CJxXWrMMf2uOc5AxHtdA9VE5GoIYgb',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiNVUxVnd5bzZKN21ESmE4VHpsdlV0N3MwUndJNFNxVUFGSTFnaVdMRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747691986),('S5bOWAzkchYrObj8boJg8JnPRT19hXmxJJAKHyP0',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoieUhIVUhFS2xnbTZScTQ0QjNhZHRmVmxzZ0xpWWFqYjl6d1JFc3RoTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747690087),('seruSL9JhWncj9uxvcvNMscIbpq7Y965KLz3owcG',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoicXRRRlViUnZJVlhYWmoyWExObzFiQVZnb05Mc1pxTERjUFZHcjNMRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747691067),('SNE7AldSaIOp11qDwt6h6rQE8SvJi8n4WStv1QpD',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWmNKb2FqcUtHSG5oTmhxTUZER3pteEh6SmdhYlRRbmFBR0lTMnhKTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747690087),('TfdK1nc4p8LKKYX6nOUY9Xc1y4QPeDQLsqm2tqKx',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaXFFSXdUd2RRTUdDTngxbGN1QTlyemw5N2dRR0UzZWJ4SWVMZVVzVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747689849),('USpDwYr8w3bqTFCiaj14ZMQykOHEM4nVV9fOefCl',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoia2ZxVzJHdVlXaldMalRPdDBGc1RGUlJvaTRvZzZOd2MzaGJvSVFrSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747689849),('UVBGA8N8p73nyh3WG7X7g4SxofsQaoHqWzRaOoJL',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoia2x1MXZkb1h5WmtRTVVJMkNaVGFFYlcwcGl0TXJ2OUlVbXg5WGZqeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747692899),('uXPfXBd6RMlucUr2nAwPD6ybD5mq5tru3EsfgLaT',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiRExZMzVUa2oybG5vU0cyR0ZYTXU3NXlabG9zMVRxakFMYVVkU2tkUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747691067),('VsSKO3Tl8YlWIMcoM4qMJiF14GYEzmZZgFc0PtSo',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmFIUGpkb2pMSVZSUThHNFhTWnR3SWcydXpYVDFhZUI4aHJNZ2N2MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747692357),('WFt8TgNcuOyqbMDbX4PfV8uegp49qlvIMkWzpu5z',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUDlqTWR0Vm1TbUN2aFY5djl2WmRUTGFRWElCVDk4UDZ4cW9rV2lrayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747692899),('YfzpLa3XMCCrotA5J5B0H3z2x7zNvJaoo4MKU3Dy',NULL,'127.0.0.1','Symfony','YToyOntzOjY6Il90b2tlbiI7czo0MDoiRjFsN2lzZjJDSGc0eGs4aXdnZk9RT3piUzE2dnBjaVJNdVY1Q1VnQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1747690087),('YJoRhhbY4U0IUwXDXoq4U0CTAPhfVOXmnXt9hOGz',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGw5Vll6ODBVSDE1bUVtSW9DaVdmcWk0b0tDV242anZHZzBaVFp1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1747691629);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_time_slot` (`start_time`,`end_time`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` VALUES (1,'07:00:00','07:20:00','drop_off','available',NULL),(207,'07:20:00','07:40:00','drop_off','available',NULL),(208,'07:40:00','08:00:00','drop_off','available',NULL),(209,'08:00:00','08:20:00','drop_off','available',NULL),(210,'08:20:00','08:40:00','drop_off','available',NULL),(211,'08:40:00','09:00:00','drop_off','available',NULL),(212,'09:00:00','09:20:00','drop_off','available',NULL),(213,'09:20:00','09:40:00','drop_off','available',NULL),(214,'09:40:00','10:00:00','drop_off','available',NULL),(215,'10:00:00','10:20:00','drop_off','available',NULL),(216,'10:20:00','10:40:00','drop_off','available',NULL),(217,'10:40:00','11:00:00','drop_off','available',NULL),(218,'11:00:00','11:20:00','drop_off','available',NULL),(219,'11:20:00','11:40:00','drop_off','available',NULL),(220,'11:40:00','12:00:00','drop_off','available',NULL),(221,'12:00:00','12:20:00','drop_off','available',NULL),(222,'12:20:00','12:40:00','drop_off','available',NULL),(223,'12:40:00','13:00:00','drop_off','available',NULL),(224,'13:00:00','13:20:00','drop_off','available',NULL),(225,'13:20:00','13:40:00','drop_off','available',NULL),(226,'13:40:00','14:00:00','drop_off','available',NULL),(227,'14:00:00','14:20:00','drop_off','available',NULL),(228,'14:20:00','14:40:00','drop_off','available',NULL),(229,'14:40:00','15:00:00','drop_off','available',NULL),(230,'15:00:00','15:20:00','drop_off','available',NULL),(231,'15:20:00','15:40:00','drop_off','available',NULL),(232,'15:40:00','16:00:00','drop_off','available',NULL),(233,'16:00:00','16:20:00','drop_off','available',NULL),(234,'16:20:00','16:40:00','drop_off','available',NULL),(235,'16:40:00','17:00:00','drop_off','available',NULL),(236,'17:00:00','17:20:00','drop_off','available',NULL),(237,'17:20:00','17:40:00','drop_off','available',NULL),(238,'17:40:00','18:00:00','drop_off','available',NULL),(239,'18:00:00','18:20:00','drop_off','available',NULL),(240,'18:20:00','18:40:00','drop_off','available',NULL),(241,'18:40:00','19:00:00','drop_off','available',NULL),(242,'19:00:00','19:20:00','drop_off','available',NULL),(243,'19:20:00','19:40:00','drop_off','available',NULL),(244,'19:40:00','20:00:00','drop_off','available',NULL),(245,'07:00:00','07:20:00','pick_up','available',NULL),(246,'07:20:00','07:40:00','pick_up','available',NULL),(247,'07:40:00','08:00:00','pick_up','available',NULL),(248,'08:00:00','08:20:00','pick_up','available',NULL),(249,'08:20:00','08:40:00','pick_up','available',NULL),(250,'08:40:00','09:00:00','pick_up','available',NULL),(251,'09:00:00','09:20:00','pick_up','available',NULL),(252,'09:20:00','09:40:00','pick_up','available',NULL),(253,'09:40:00','10:00:00','pick_up','available',NULL),(254,'10:00:00','10:20:00','pick_up','available',NULL),(255,'10:20:00','10:40:00','pick_up','available',NULL),(256,'10:40:00','11:00:00','pick_up','available',NULL),(257,'11:00:00','11:20:00','pick_up','available',NULL),(258,'11:20:00','11:40:00','pick_up','available',NULL),(259,'11:40:00','12:00:00','pick_up','available',NULL),(260,'12:00:00','12:20:00','pick_up','available',NULL),(261,'12:20:00','12:40:00','pick_up','available',NULL),(262,'12:40:00','13:00:00','pick_up','available',NULL),(263,'13:00:00','13:20:00','pick_up','available',NULL),(264,'13:20:00','13:40:00','pick_up','available',NULL),(265,'13:40:00','14:00:00','pick_up','available',NULL),(266,'14:00:00','14:20:00','pick_up','available',NULL),(267,'14:20:00','14:40:00','pick_up','available',NULL),(268,'14:40:00','15:00:00','pick_up','available',NULL),(269,'15:00:00','15:20:00','pick_up','available',NULL),(270,'15:20:00','15:40:00','pick_up','available',NULL),(271,'15:40:00','16:00:00','pick_up','available',NULL),(272,'16:00:00','16:20:00','pick_up','available',NULL),(273,'16:20:00','16:40:00','pick_up','available',NULL),(274,'16:40:00','17:00:00','pick_up','available',NULL),(275,'17:00:00','17:20:00','pick_up','available',NULL),(276,'17:20:00','17:40:00','pick_up','available',NULL),(277,'17:40:00','18:00:00','pick_up','available',NULL),(278,'18:00:00','18:20:00','pick_up','available',NULL),(279,'18:20:00','18:40:00','pick_up','available',NULL),(280,'18:40:00','19:00:00','pick_up','available',NULL),(281,'19:00:00','19:20:00','pick_up','available',NULL),(282,'19:20:00','19:40:00','pick_up','available',NULL),(283,'19:40:00','20:00:00','pick_up','available',NULL);
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

-- Dump completed on 2025-05-20 14:21:25
