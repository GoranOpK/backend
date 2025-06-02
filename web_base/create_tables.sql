-- Kreiranje baze podataka (ako ne postoji)
CREATE DATABASE IF NOT EXISTS web_base;
USE web_base;

-- Tabela za tipove vozila
CREATE TABLE IF NOT EXISTS vehicle_types (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za tip vozila
    description_vehicle TEXT, -- Opis karakteristika tipa vozila
    price DECIMAL(10, 2) NOT NULL -- Cijena vezana za tip vozila
);

-- Tabela za vremenske slotove
CREATE TABLE IF NOT EXISTS list_of_time_slots (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za vremenski slot
    time_slot TEXT -- Vremenski period na koji se slot odnosi
);

-- Opis dinamičke tabele
-- CREATE TABLE IF NOT EXISTS past_time (
--     id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za redni broj
--     time_slot_id INT NOT NULL, -- Strani kljuc na vremenski slot (veza sa tabelom list_of_time_slots)
--     remaining INT NOT NULL DEFAULT 7, -- system_config (value), -- Broj preostalih mesta za dati time_slot
--     available BOOLEAN DEFAULT TRUE, -- Logički status dostupnosti za dati time_slot
--     FOREIGN KEY (time_slot_id) REFERENCES list_of_time_slots(id) -- Povezivanje sa tabelom time_slots
-- );

-- Tabela za rezervacije
CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za rezervaciju
    drop_off_time_slot_id INT NOT NULL, -- Strani kljuc na vremenski slot (veza sa tabelom list_of_time_slots)
    pick_up_time_slot_id INT NOT NULL, -- Strani kljuc na vremenski slot (veza sa tabelom list_of_time_slots)
    reservation_date DATE NOT NULL, -- Datum rezervacije
    user_name VARCHAR(255) NOT NULL, -- Naziv firme ili ime korisnika
    country VARCHAR(100) NOT NULL,  -- Zemlja porijekla firme ili korisnika
    license_plate VARCHAR(50) NOT NULL, -- Registarske oznake
    vehicle_type_id INT NOT NULL, -- Tip vozila
    email VARCHAR(255) NOT NULL, -- e-mail
    status ENUM('paid', 'pending') DEFAULT 'pending', -- Status rezervacije (placeno ili na cekanju)
    FOREIGN KEY (drop_off_time_slot_id) REFERENCES list_of_time_slots(id), -- Povezivanje sa tabelom time_slots
    FOREIGN KEY (pick_up_time_slot_id) REFERENCES list_of_time_slots(id), -- Povezivanje sa tabelom time_slots
    FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types(id) -- Povezivanje sa tabelom vehicle_types
);

-- Tabela za globalnu konfiguraciju
CREATE TABLE system_config (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za konfiguraciju
    name VARCHAR(255) NOT NULL UNIQUE, -- Naziv konfiguracione opcije
    value INT NOT NULL, -- Vrijednost konfiguracione opcije
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Datum i vrijeme posljednje izmene konfiguracije
);

-- Tabela za administratorske naloge
CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Jedinstveni identifikator za administratora
    username VARCHAR(255) NOT NULL UNIQUE, -- Korisnicko ime administratora (jedinstveno)
    password_hash VARCHAR(255) NOT NULL, -- Hash lozinke administratora
    email VARCHAR(255) NOT NULL UNIQUE, -- Email adresa administratora (jedinstveno)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Datum i vrijeme kreiranja administratorskog naloga
);