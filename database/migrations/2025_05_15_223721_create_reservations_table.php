<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('reservations')) { // Provera da li tabela postoji
            Schema::create('reservations', function (Blueprint $table) {
                $table->id();
                $table->foreignId('time_slot_id')->constrained()->cascadeOnDelete();
                $table->date('reservation_date');
                $table->string('user_name', 255);
                $table->string('country', 100);
                $table->string('license_plate', 50);
                $table->foreignId('vehicle_type_id')->constrained()->cascadeOnDelete();
                $table->string('email');
                $table->enum('status', ['paid', 'pending'])->default('pending');
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('reservations');
    }
};