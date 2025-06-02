USE web_base;

-- Ubacivanje ili ažuriranje tipova vozila
INSERT INTO vehicle_types (description_vehicle, price) VALUES
('8+1 mjesta (manji kombi)', 20.00),
('9-23 mjesta (mini bus)', 40.00),
('23+ mjesta (veliki autobus)', 50.00)
ON DUPLICATE KEY UPDATE
description_vehicle = VALUES(description_vehicle),
price = VALUES(price);

-- Ubacivanje vremenskih slotova
INSERT INTO list_of_time_slots (time_slot) VALUES 
('00:00 - 07:00'),
('07:00 - 07:20'),
('07:20 - 07:40'),
('07:40 - 08:00'),
('08:00 - 08:20'),
('08:20 - 08:40'),
('08:40 - 09:00'),
('09:00 - 09:20'),
('09:20 - 09:40'),
('09:40 - 10:00'),
('10:00 - 10:20'),
('10:20 - 10:40'),
('10:40 - 11:00'),
('11:00 - 11:20'),
('11:20 - 11:40'),
('11:40 - 12:00'),
('12:00 - 12:20'),
('12:20 - 12:40'),
('12:40 - 13:00'),
('13:00 - 13:20'),
('13:20 - 13:40'),
('13:40 - 14:00'),
('14:00 - 14:20'),
('14:20 - 14:40'),
('14:40 - 15:00'),
('15:00 - 15:20'),
('15:20 - 15:40'),
('15:40 - 16:00'),
('16:00 - 16:20'),
('16:20 - 16:40'),
('16:40 - 17:00'),
('17:00 - 17:20'),
('17:20 - 17:40'),
('17:40 - 18:00'),
('18:00 - 18:20'),
('18:20 - 18:40'),
('18:40 - 19:00'),
('19:00 - 19:20'),
('19:20 - 19:40'),
('19:40 - 20:00'),
('20:00 - 24:00');

-- Ubacivanje administratorskog naloga
INSERT INTO admins (username, password_hash, email) 
VALUES ('admin', SHA2('secure_password', 256), 'admin@example.com')
ON DUPLICATE KEY UPDATE 
    password_hash = SHA2('secure_password', 256),
    email = 'admin@example.com';

-- Postavljanje broja dostupnih parking mjesta
INSERT INTO system_config (name, value) 
VALUES ('available_parking_slots', 7);