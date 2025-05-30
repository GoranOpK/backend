<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TimeSlot extends Model
{
    protected $table = 'list_of_time_slots';

    protected $fillable = [
        'time_slot',
    ];

    public function dropOffReservations()
    {
        return $this->hasMany(Reservation::class, 'drop_off_time_slot_id');
    }

    public function pickUpReservations()
    {
        return $this->hasMany(Reservation::class, 'pick_up_time_slot_id');
    }
}