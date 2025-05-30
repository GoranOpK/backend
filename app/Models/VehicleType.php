<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VehicleType extends Model
{
    protected $table = 'vehicle_types';

    protected $fillable = [
        'description_vehicle',
        'price',
    ];

    public function reservations()
    {
        return $this->hasMany(Reservation::class, 'vehicle_type_id');
    }
}