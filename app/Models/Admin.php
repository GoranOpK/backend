<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use Notifiable;

    // Polja koja se mogu masovno popunjavati
    protected $fillable = [
        'name',
        'email',
        'password',
        'role', // Polje za ulogu
    ];

    // Polja koja se sakrivaju prilikom serijalizacije
    protected $hidden = [
        'password',
        'remember_token',
    ];

    // Automatsko kastovanje polja
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Mutator za automatsko šifrovanje lozinke
    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }

    // Relacija sa rezervacijama (ako postoji)
    public function reservations()
    {
        return $this->hasMany(Reservation::class);
    }
}