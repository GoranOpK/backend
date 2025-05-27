USE my_mysql;

-- Ubacivanje ili ažuriranje tipova vozila
INSERT INTO vehicle_types (type_name, description, price) VALUES
('Tip A', '8+1 mjesta (manji kombi)', 20.00),
('Tip B', '9-23 mjesta (mini bus)', 40.00),
('Tip C', '23+ mjesta (veliki autobus)', 50.00)
ON DUPLICATE KEY UPDATE
description = VALUES(description),
price = VALUES(price);

-- Ubacivanje vremenskih slotova
INSERT INTO time_slots (start_time, end_time, type, status) 
VALUES 
('07:00', '07:20', 'drop_off', 'available'),
('07:20', '07:40', 'drop_off', 'available'),
('07:40', '08:00', 'drop_off', 'available'),
('08:00', '08:20', 'drop_off', 'available'),
('08:20', '08:40', 'drop_off', 'available'),
('08:40', '09:00', 'drop_off', 'available'),
('09:00', '09:20', 'drop_off', 'available'),
('09:20', '09:40', 'drop_off', 'available'),
('09:40', '10:00', 'drop_off', 'available'),
('10:00', '10:20', 'drop_off', 'available'),
('10:20', '10:40', 'drop_off', 'available'),
('10:40', '11:00', 'drop_off', 'available'),
('11:00', '11:20', 'drop_off', 'available'),
('11:20', '11:40', 'drop_off', 'available'),
('11:40', '12:00', 'drop_off', 'available'),
('12:00', '12:20', 'drop_off', 'available'),
('12:20', '12:40', 'drop_off', 'available'),
('12:40', '13:00', 'drop_off', 'available'),
('13:00', '13:20', 'drop_off', 'available'),
('13:20', '13:40', 'drop_off', 'available'),
('13:40', '14:00', 'drop_off', 'available'),
('14:00', '14:20', 'drop_off', 'available'),
('14:20', '14:40', 'drop_off', 'available'),
('14:40', '15:00', 'drop_off', 'available'),
('15:00', '15:20', 'drop_off', 'available'),
('15:20', '15:40', 'drop_off', 'available'),
('15:40', '16:00', 'drop_off', 'available'),
('16:00', '16:20', 'drop_off', 'available'),
('16:20', '16:40', 'drop_off', 'available'),
('16:40', '17:00', 'drop_off', 'available'),
('17:00', '17:20', 'drop_off', 'available'),
('17:20', '17:40', 'drop_off', 'available'),
('17:40', '18:00', 'drop_off', 'available'),
('18:00', '18:20', 'drop_off', 'available'),
('18:20', '18:40', 'drop_off', 'available'),
('18:40', '19:00', 'drop_off', 'available'),
('19:00', '19:20', 'drop_off', 'available'),
('19:20', '19:40', 'drop_off', 'available'),
('19:40', '20:00', 'drop_off', 'available'),

('07:00', '07:20', 'pick_up', 'available'),
('07:20', '07:40', 'pick_up', 'available'),
('07:40', '08:00', 'pick_up', 'available'),
('08:00', '08:20', 'pick_up', 'available'),
('08:20', '08:40', 'pick_up', 'available'),
('08:40', '09:00', 'pick_up', 'available'),
('09:00', '09:20', 'pick_up', 'available'),
('09:20', '09:40', 'pick_up', 'available'),
('09:40', '10:00', 'pick_up', 'available'),
('10:00', '10:20', 'pick_up', 'available'),
('10:20', '10:40', 'pick_up', 'available'),
('10:40', '11:00', 'pick_up', 'available'),
('11:00', '11:20', 'pick_up', 'available'),
('11:20', '11:40', 'pick_up', 'available'),
('11:40', '12:00', 'pick_up', 'available'),
('12:00', '12:20', 'pick_up', 'available'),
('12:20', '12:40', 'pick_up', 'available'),
('12:40', '13:00', 'pick_up', 'available'),
('13:00', '13:20', 'pick_up', 'available'),
('13:20', '13:40', 'pick_up', 'available'),
('13:40', '14:00', 'pick_up', 'available'),
('14:00', '14:20', 'pick_up', 'available'),
('14:20', '14:40', 'pick_up', 'available'),
('14:40', '15:00', 'pick_up', 'available'),
('15:00', '15:20', 'pick_up', 'available'),
('15:20', '15:40', 'pick_up', 'available'),
('15:40', '16:00', 'pick_up', 'available'),
('16:00', '16:20', 'pick_up', 'available'),
('16:20', '16:40', 'pick_up', 'available'),
('16:40', '17:00', 'pick_up', 'available'),
('17:00', '17:20', 'pick_up', 'available'),
('17:20', '17:40', 'pick_up', 'available'),
('17:40', '18:00', 'pick_up', 'available'),
('18:00', '18:20', 'pick_up', 'available'),
('18:20', '18:40', 'pick_up', 'available'),
('18:40', '19:00', 'pick_up', 'available'),
('19:00', '19:20', 'pick_up', 'available'),
('19:20', '19:40', 'pick_up', 'available'),
('19:40', '20:00', 'pick_up', 'available'),
('20:00', '20:20', 'pick_up', 'available');

-- Ubacivanje administratorskog naloga
INSERT INTO admins (username, password_hash, email) 
VALUES ('admin', PASSWORD('secure_password'), 'admin@example.com')
ON DUPLICATE KEY UPDATE 
    password_hash = PASSWORD('secure_password'),
    email = 'admin@example.com';

-- Postavljanje broja dostupnih parking mjesta
INSERT INTO system_config (name, value) 
VALUES ('available_parking_slots', 7);

-- Dodavanje rezervacija (koristi proceduru)
CALL AddReservation(1, STR_TO_DATE('12-05-25', '%d-%m-%y'), 'Goran', 'Croatia', 'ZG1234AA', 2, 'goran@example.com');
CALL AddReservation(2, STR_TO_DATE('13-05-25', '%d-%m-%y'), 'Ana', 'Croatia', 'ZG5678BB', 3, 'ana@example.com');