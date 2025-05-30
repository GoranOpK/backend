<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    protected $table = 'reservations';

    protected $fillable = [
        'drop_off_time_slot_id',
        'pick_up_time_slot_id',
        'reservation_date',
        'user_name',
        'country',
        'license_plate',
        'vehicle_type_id',
        'email',
        'status',
    ];

    protected $casts = [
        'reservation_date' => 'date',
    ];

    public function dropOffTimeSlot()
    {
        return $this->belongsTo(TimeSlot::class, 'drop_off_time_slot_id');
    }

    public function pickUpTimeSlot()
    {
        return $this->belongsTo(TimeSlot::class, 'pick_up_time_slot_id');
    }

    public function vehicleType()
    {
        return $this->belongsTo(VehicleType::class, 'vehicle_type_id');
    }
}