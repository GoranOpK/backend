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

-- Dump completed on 2025-05-30 12:24:19
