<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdminsTable extends Migration
{
    /**
     * Pokreće migraciju za kreiranje tabele 'admins'.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->id(); // Primarni ključ
            $table->string('name'); // Ime administratora
            $table->string('email')->unique(); // Jedinstven email administratora
            $table->string('password'); // Lozinka (šifrovana)
            $table->string('role')->default('admin'); // Uloga administratora, podrazumijevano 'admin'
            $table->timestamps(); // Automatska polja za vrijeme kreiranja i ažuriranja
            $table->softDeletes(); // Polje za "meko brisanje" (deleted_at)
            $table->index('name'); // Indeks na polju 'name' za bržu pretragu
        });
    }

    /**
     * Vraća promjene kreirane ovom migracijom.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admins'); // Briše tabelu 'admins' ako postoji
    }
}