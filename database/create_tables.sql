-- Kreiranje baze podataka (ako ne postoji)
CREATE DATABASE IF NOT EXISTS my_mysql;
USE my_mysql;

-- Tabela za tipove vozila
CREATE TABLE vehicle_types (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za tip vozila
    type_name VARCHAR(100) NOT NULL UNIQUE, -- Naziv tipa vozila
    description TEXT, -- Opis karakteristika tipa vozila
    price DECIMAL(10, 2) NOT NULL -- Cijena vezana za tip vozila
);

-- Tabela za vremenske slotove
CREATE TABLE time_slots (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za vremenski slot
    start_time TIME NOT NULL, -- Početak vremenskog intervala
    end_time TIME NOT NULL, -- Kraj vremenskog intervala
    type ENUM('drop_off', 'pick_up') NOT NULL, -- Tip vremenskog slot-a (iskrcaj ili ukrcaj putnika)
    status ENUM('available', 'full', 'unavailable') DEFAULT 'available' -- Status vremenskog slot-a
);

-- Tabela za rezervacije
CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za rezervaciju
    time_slot_id INT NOT NULL, -- Strani ključ na vremenski slot (veza sa tabelom time_slots)
    reservation_date DATE NOT NULL, --datum rezervacije
    user_name VARCHAR(255) NOT NULL, -- naziv firme ili ime korisnika
    country VARCHAR(100) NOT NULL,  -- zemlja porijekla firme ili korisnika
    license_plate VARCHAR(50) NOT NULL, -- registarske oznake
    vehicle_type_id INT NOT NULL, -- tip vozila
    email VARCHAR(255) NOT NULL, -- e-mail
    status ENUM('paid', 'pending') DEFAULT 'pending', -- Status rezervacije (plaćeno ili na čekanju)
    FOREIGN KEY (time_slot_id) REFERENCES time_slots(id), -- Povezivanje sa tabelom time_slots
    FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types(id) -- Povezivanje sa tabelom vehicle_types
);

-- Tabela za administratorske naloge
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za administratora
    username VARCHAR(255) NOT NULL UNIQUE, -- Korisničko ime administratora (jedinstveno)
    password_hash VARCHAR(255) NOT NULL, -- Hash lozinke administratora
    email VARCHAR(255) NOT NULL UNIQUE, -- Email adresa administratora (jedinstveno)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Datum i vrijeme kreiranja administratorskog naloga
);
);

-- Tabela za globalnu konfiguraciju
CREATE TABLE system_config (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za konfiguraciju
    name VARCHAR(255) NOT NULL UNIQUE, -- Naziv konfiguracione opcije
    value INT NOT NULL, -- Vrijednost konfiguracione opcije
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Datum i vrijeme posljednje izmene konfiguracije
);
);