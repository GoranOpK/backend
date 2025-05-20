# Struktura baze podataka

## Tabela: `vehicle_types`
- `id` (INT, PRIMARY KEY, AUTO_INCREMENT): Jedinstveni ID tipa vozila.
- `type_name` (VARCHAR(100), UNIQUE): Naziv tipa vozila.
- `description` (TEXT): Opis vozila.
- `price` (DECIMAL(10, 2)): Cena za određeni tip vozila.

## Tabela: `time_slots`
- `id` (INT, PRIMARY KEY, AUTO_INCREMENT): Jedinstveni ID vremenskog slota.
- `start_time` (TIME): Početno vreme.
- `end_time` (TIME): Krajnje vreme.
- `type` (ENUM): Tip slota ('drop_off' ili 'pick_up').
- `status` (ENUM): Status slota ('available', 'full', 'unavailable').

## Tabela: `reservations`
- `id` (INT, PRIMARY KEY, AUTO_INCREMENT): Jedinstveni ID rezervacije.
- `time_slot_id` (INT, FOREIGN KEY): Povezan sa `time_slots.id`.
- `reservation_date` (DATE): Datum rezervacije.
- `user_name` (VARCHAR(255)): Ime korisnika.
- `country` (VARCHAR(100)): Država korisnika.
- `license_plate` (VARCHAR(50)): Registarska oznaka vozila.
- `vehicle_type_id` (INT, FOREIGN KEY): Povezan sa `vehicle_types.id`.
- `email` (VARCHAR(255)): Email korisnika.
- `status` (ENUM): Status rezervacije ('paid', 'pending').

## Relacije
- `reservations.vehicle_type_id` → `vehicle_types.id`
- `reservations.time_slot_id` → `time_slots.id`