# My-MySQL

## Opis projekta
Projekat sadrži SQL skripte za kreiranje i upravljanje bazom podataka za sistem rezervacija vozila, uključujući vremenske slotove, tipove vozila i rezervacije.

---

## Struktura baze podataka

### Tabele

1. **admins**:
   - Služi za čuvanje administratorskih naloga.
   - **Kolone**: `id`, `username`, `password_hash`, `email`, `created_at`.

2. **vehicle_types**:
   - Sadrži tipove vozila (npr. kombi, mini bus, autobus).
   - **Kolone**: `id`, `type_name`, `description`, `price`.

3. **time_slots**:
   - Vremenski slotovi za prevoz.
   - **Kolone**: `id`, `start_time`, `end_time`, `slot_type`, `status`.

4. **reservations**:
   - Čuva podatke o rezervacijama.
   - **Kolone**: `id`, `time_slot_id`, `reservation_date`, `company_name`, `country`, `license_plate`, `email`, `is_data_accurate`, `is_terms_accepted`, `payment_method`, `payment_status`.

---

## SQL fajlovi u repozitorijumu

Evo spiska svih SQL fajlova dostupnih u ovom repozitorijumu i njihove namene:

1. **`create_tables.sql`**:
   - Koristi se za kreiranje svih potrebnih tabela u bazi podataka.
   - **Pokretanje**:
     ```bash
     mysql -u root -p my_mysql < database/create_tables.sql
     ```

2. **`seed_data.sql`**:
   - Dodaje osnovne podatke u bazu, kao što su tipovi vozila.
   - **Pokretanje**:
     ```bash
     mysql -u root -p my_mysql < database/seed_data.sql
     ```

3. **`update_base.sql`**:
   - Sadrži naknadne izmene i ažuriranja baze.
   - **Pokretanje**:
     ```bash
     mysql -u root -p my_mysql < database/update_base.sql
     ```

4. **`database_procedures.sql`**:
   - Sadrži definicije procedura za rad sa rezervacijama, vremenskim slotovima i tipovima vozila.
   - **Pokretanje**:
     ```bash
     mysql -u root -p my_mysql < database/database_procedures.sql
     ```

---

## Inicijalizacija baze

Da biste postavili bazu podataka, pratite sledeće korake:

1. Kreirajte tabele:
   ```bash
   mysql -u root -p my_mysql < database/create_tables.sql
   ```

2. Ubacite inicijalne podatke:
   ```bash
   mysql -u root -p my_mysql < database/seed_data.sql
   ```

3. Ažurirajte bazu (ako je potrebno):
   ```bash
   mysql -u root -p my_mysql < database/update_base.sql
   ```

4. Dodajte procedure:
   ```bash
   mysql -u root -p my_mysql < database/database_procedures.sql
   ```

---

## Autor
GORAN GROVIK