<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    protected $fillable = [
        'time_slot_id',
        'reservation_date',
        'user_name',
        'country',
        'license_plate',
        'vehicle_type_id',
        'email',
        'status',
        'type', // drop_off ili pick_up
    ];
}