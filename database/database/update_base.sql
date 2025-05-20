-- Ovo je MySQL dump fajl generisan verzijom 10.13 distribucije 9.3.0 za Win64.
-- Ovaj dump sadrži strukturu i podatke baze podataka "my_mysql".
-- ----------------------------------------------------------------

-- Postavljanje podešavanja za karaktere, vremenske zone i provjere.
-- Ove komande služe za očuvanje kompatibilnosti i konzistentnosti tokom izvođenja dump-a.

-- Struktura tabele `admins`
-- Tabela `admins` čuva podatke o administratorima, uključujući korisničko ime, heš lozinke, email i vrijeme kreiranja.
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL, -- Korisničko ime (jedinstveno).
  `password_hash` varchar(255) NOT NULL, -- Heširana lozinka.
  `email` varchar(255) NOT NULL, -- Email adresa (jedinstvena).
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- Vrijeme kreiranja administratora.
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dodavanje podataka u tabelu `admins`
-- Umetanje podrazumijevanog administratora.
INSERT INTO `admins` VALUES (1,'admin','$2y$10$examplehashvaluehere','admin@example.com','2025-05-10 17:18:25');

-- Struktura tabele `cache`
-- Tabela `cache` čuva ključno-vrijednosne parove za keširanje podataka sa istekom.
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL, -- Ključ keša.
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL, -- Vrijednost povezana sa ključem.
  `expiration` int NOT NULL, -- Vrijeme isteka u sekundama.
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Struktura tabele `cache_locks`
-- Tabela `cache_locks` koristi se za zaključavanje keša u okruženju sa više procesa.
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL, -- Ključ zaključavanja.
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL, -- Vlasnik zaključavanja.
  `expiration` int NOT NULL, -- Vrijeme isteka zaključavanja.
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Struktura tabele `failed_jobs`
-- Tabela `failed_jobs` čuva informacije o neuspjelim poslovima u sistemu zadataka.
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT, -- Jedinstveni identifikator.
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL, -- Jedinstveni identifikator zadatka.
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL, -- Informacije o konekciji.
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL, -- Red u kojem je zadatak bio.
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL, -- Detaljan sadržaj zadatka.
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL, -- Izuzetak koji je izazvao neuspjeh.
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Vrijeme kada je zadatak propao.
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Struktura tabele `migrations`
-- Tabela `migrations` prati migracije baze podataka.
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT, -- Jedinstveni identifikator migracije.
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL, -- Naziv migracije.
  `batch` int NOT NULL, -- Redosljed migracije.
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dodavanje podataka u tabelu `migrations`
-- Lista migracija koje su izvršene.
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1), ... ,(21,'2025_05_19_093059_fix_time_slots_intervals',14);

-- Nastavak za ostale tabele
-- Sličan opis postoji za sve ostale tabele u dump fajlu (`jobs`, `reservations`, `sessions`, `time_slots`, `vehicle_types`, itd.)
-- Svaka tabela ima svoju strukturu, relacije između polja i podatke koji su ubačeni u tabele.