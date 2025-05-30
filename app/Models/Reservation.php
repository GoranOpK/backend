<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

// Model za tabelu 'reservations' (rezervacije)
class Reservation extends Model
{
    // Ime tabele u bazi (nije obavezno ako je ime modela isto kao ime tabele u množini)
    protected $table = 'reservations';

    // Polja koja mogu biti masovno dodijeljena (mass assignment)
    protected $fillable = [
        'drop_off_time_slot_id',    // ID vremenskog slota za iskrcaj putnika
        'pick_up_time_slot_id',     // ID vremenskog slota za ukrcaj putnika
        'reservation_date',         // Datum rezervacije
        'user_name',                // Ime korisnika koji pravi rezervaciju
        'country',                  // Država korisnika
        'license_plate',            // Registarski broj vozila
        'vehicle_type_id',          // ID tipa vozila
        'email',                    // Email korisnika
        'status',                   // Status rezervacije (npr. pending, confirmed, cancelled)
    ];

    // Automatska konverzija tipa polja prilikom čitanja iz baze
    protected $casts = [
        'reservation_date' => 'date', // 'reservation_date' će biti instanca Carbon klase (datum)
    ];

    // Relacija: rezervacija pripada vremenskom slotu za iskrcaj putnika
    public function dropOffTimeSlot()
    {
        return $this->belongsTo(TimeSlot::class, 'drop_off_time_slot_id');
    }

    // Relacija: rezervacija pripada vremenskom slotu za ukrcaj putnika
    public function pickUpTimeSlot()
    {
        return $this->belongsTo(TimeSlot::class, 'pick_up_time_slot_id');
    }

    // Relacija: rezervacija pripada određenom tipu vozila
    public function vehicleType()
    {
        return $this->belongsTo(VehicleType::class, 'vehicle_type_id');
    }
}