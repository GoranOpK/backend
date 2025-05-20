<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('vehicle_types', function (Blueprint $table) {
            $table->id(); // Primarni ključ
            $table->string('type_name', 100)->unique(); // Naziv tipa vozila
            $table->text('description')->nullable(); // Opis vozila
            $table->decimal('price', 10, 2); // Cijena
            $table->timestamps(); // Kreira kolone created_at i updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('vehicle_types');
    }
};