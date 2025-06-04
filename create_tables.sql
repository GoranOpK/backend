-- Kreiranje baze podataka (ako ne postoji)
CREATE DATABASE IF NOT EXISTS web_base;
USE web_base;

-- Tabela za tipove vozila
CREATE TABLE IF NOT EXISTS vehicle_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description_vehicle TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Tabela za vremenske slotove
CREATE TABLE IF NOT EXISTS list_of_time_slots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    time_slot TEXT
);

-- Tabela za rezervacije
CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    drop_off_time_slot_id INT NOT NULL,
    pick_up_time_slot_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    country VARCHAR(100) NOT NULL,
    license_plate VARCHAR(50) NOT NULL,
    vehicle_type_id INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    status ENUM('paid', 'pending') DEFAULT 'pending',
    FOREIGN KEY (drop_off_time_slot_id) REFERENCES list_of_time_slots(id),
    FOREIGN KEY (pick_up_time_slot_id) REFERENCES list_of_time_slots(id),
    FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types(id)
);

-- Tabela za globalnu konfiguraciju
CREATE TABLE IF NOT EXISTS system_config (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    value INT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela za administratorske naloge
CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);