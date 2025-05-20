<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('time_slots')) { // Provera da li tabela postoji
            Schema::create('time_slots', function (Blueprint $table) {
                $table->id();
                $table->time('start_time');
                $table->time('end_time');
                $table->enum('type', ['drop_off', 'pick_up']);
                $table->enum('status', ['available', 'full', 'unavailable'])->default('available');
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('time_slots');
    }
};