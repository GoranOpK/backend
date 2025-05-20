USE my_mysql;

-- 1. Procedura za dodavanje nove rezervacije
DELIMITER $$
CREATE PROCEDURE AddReservation (
    IN timeSlotId INT,
    IN reservationDate DATE,
    IN userName VARCHAR(255),
    IN country VARCHAR(100),
    IN licensePlate VARCHAR(50),
    IN vehicleTypeName VARCHAR(100),
    IN email VARCHAR(255)
)
BEGIN
    DECLARE vehicleTypeId INT;

    -- Pronađi ID tipa vozila na osnovu naziva
    SELECT id INTO vehicleTypeId
    FROM vehicle_types
    WHERE type_name = vehicleTypeName;

    -- Ako ID nije pronađen, podigni grešku
    IF vehicleTypeId IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tip vozila nije validan.';
    END IF;

    -- Provjeri dostupnost vremenskog slota
    IF (SELECT status FROM time_slots WHERE id = timeSlotId) = 'available' THEN
        -- Dodaj rezervaciju u tabelu
        INSERT INTO reservations (time_slot_id, reservation_date, user_name, country, license_plate, vehicle_type_id, email, status)
        VALUES (timeSlotId, reservationDate, userName, country, licensePlate, vehicleTypeId, email, 'pending');
        
        -- Ažuriraj status vremenskog slota
        UPDATE time_slots SET status = 'full' WHERE id = timeSlotId;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vremenski slot nije dostupan za rezervaciju.';
    END IF;
END$$
DELIMITER ;

-- 2. Procedura za provjeru statusa vremenskog slota
DELIMITER $$
CREATE PROCEDURE CheckTimeSlotAvailability (
    IN timeSlotId INT,
    OUT isAvailable BOOLEAN
)
BEGIN
    -- Provjeri da li je status vremenskog slota 'available'
    SET isAvailable = (SELECT status = 'available' FROM time_slots WHERE id = timeSlotId);
END$$
DELIMITER ;

-- 3. Procedura za ažuriranje broja dostupnih parking mjesta
DELIMITER $$
CREATE PROCEDURE UpdateAvailableParking (
    IN newValue INT
)
BEGIN
    -- Ažuriraj vrijednost u tabeli system_config
    UPDATE system_config SET value = newValue WHERE name = 'available_parking_slots';
END$$
DELIMITER ;