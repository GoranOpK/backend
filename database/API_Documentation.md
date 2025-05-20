# API Dokumentacija

Ova dokumentacija opisuje API endpoint-e za proces rezervacije.

## 1. Kreiranje rezervacije

**Endpoint**: `/api/reservations/create`  
**Metoda**: `POST`  
**Opis**: Kreira novu rezervaciju sa unetim podacima.

### Podaci za slanje:
```json
{
  "company_name": "Naziv firme",
  "country": "Država",
  "license_plate": "Registarske oznake",
  "email": "email@primer.com",
  "unloading_slot_id": 1,
  "loading_slot_id": 2,
  "is_data_accurate": true,
  "is_terms_accepted": true
}
```

### Odgovor:
- **200 OK**: Rezervacija je uspešno kreirana.
- **400 Bad Request**: Nedostaju potrebni podaci ili su podaci nevalidni.

---

## 2. Plaćanje rezervacije

**Endpoint**: `/api/reservations/pay`  
**Metoda**: `POST`  
**Opis**: Obradjuje plaćanje za rezervaciju.

### Podaci za slanje:
```json
{
  "reservation_id": 123,
  "payment_method": "credit_card"
}
```

### Odgovor:
- **200 OK**: Plaćanje je uspešno.
- **400 Bad Request**: Greška u podacima za plaćanje.
- **402 Payment Required**: Plaćanje nije uspelo.

---

## 3. Slanje potvrde e-mailom

**Endpoint**: `/api/reservations/confirm`  
**Metoda**: `POST`  
**Opis**: Šalje potvrdu rezervacije na unetu e-mail adresu.

### Podaci za slanje:
```json
{
  "reservation_id": 123
}
```

### Odgovor:
- **200 OK**: Potvrda je poslata.
- **404 Not Found**: Rezervacija nije pronađena.