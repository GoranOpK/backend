<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    use HasFactory;

    // Dozvoljena polja za masovno popunjavanje
    protected $fillable = ['title', 'author'];
}