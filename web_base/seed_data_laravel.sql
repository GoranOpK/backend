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
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2y$12$tkNs/SAIqPFPn28gzDFRoebLvQsPu2AXxJwxJR1XCmYsv19e3aLIa','kotorbus@kotor.me','2025-05-30 07:15:33');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `list_of_time_slots`
--

LOCK TABLES `list_of_time_slots` WRITE;
/*!40000 ALTER TABLE `list_of_time_slots` DISABLE KEYS */;
INSERT INTO `list_of_time_slots` VALUES (1,'00:00 - 07:00'),(2,'07:00 - 07:20'),(3,'07:20 - 07:40'),(4,'07:40 - 08:00'),(5,'08:00 - 08:20'),(6,'08:20 - 08:40'),(7,'08:40 - 09:00'),(8,'09:00 - 09:20'),(9,'09:20 - 09:40'),(10,'09:40 - 10:00'),(11,'10:00 - 10:20'),(12,'10:20 - 10:40'),(13,'10:40 - 11:00'),(14,'11:00 - 11:20'),(15,'11:20 - 11:40'),(16,'11:40 - 12:00'),(17,'12:00 - 12:20'),(18,'12:20 - 12:40'),(19,'12:40 - 13:00'),(20,'13:00 - 13:20'),(21,'13:20 - 13:40'),(22,'13:40 - 14:00'),(23,'14:00 - 14:20'),(24,'14:20 - 14:40'),(25,'14:40 - 15:00'),(26,'15:00 - 15:20'),(27,'15:20 - 15:40'),(28,'15:40 - 16:00'),(29,'16:00 - 16:20'),(30,'16:20 - 16:40'),(31,'16:40 - 17:00'),(32,'17:00 - 17:20'),(33,'17:20 - 17:40'),(34,'17:40 - 18:00'),(35,'18:00 - 18:20'),(36,'18:20 - 18:40'),(37,'18:40 - 19:00'),(38,'19:00 - 19:20'),(39,'19:20 - 19:40'),(40,'19:40 - 20:00'),(41,'20:00 - 24:00');
/*!40000 ALTER TABLE `list_of_time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2025_05_16_070731_drop_users_table',1),(2,'2025_05_18_183214_create_sessions_table',1),(3,'2025_05_29_000001_create_vehicle_types_table',1),(4,'2025_05_29_000002_create_list_of_time_slots_table',1),(5,'2025_05_29_000003_create_reservations_table',1),(6,'2025_05_29_000004_create_system_config_table',1),(7,'2025_05_29_000005_create_admins_table',1),(8,'2025_05_29_222658_create_cache_table',1),(9,'2025_05_29_230310_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (1,'available_parking_slots',7,'2025-05-30 09:15:33');
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vehicle_types`
--

LOCK TABLES `vehicle_types` WRITE;
/*!40000 ALTER TABLE `vehicle_types` DISABLE KEYS */;
INSERT INTO `vehicle_types` VALUES (1,'8+1 mjesta (manji kombi)',20.00),(2,'9-23 mjesta (mini bus)',40.00),(3,'23+ mjesta (veliki autobus)',50.00);
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

-- Dump completed on 2025-05-30 12:24:43
