<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

// Seeder za tabelu "admins" sa poljima: id, username, password_hash, email, created_at

class AdminsSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('admins')->updateOrInsert(
            ['username' => 'admin'], // ključ po kojem tražimo admina

            [   // vrijednosti koje upisujemo ili ažuriramo
                'password_hash' => Hash::make('bidonkaktus123'), // promijeni 'tvoja_lozinka' u željenu lozinku
                'email' => 'kotorbus@kotor.me', // zamijeni po potrebi
                'created_at' => now(),
            ]
        );
    }
}