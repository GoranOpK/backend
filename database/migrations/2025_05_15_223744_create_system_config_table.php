<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('system_config')) { // Provera da li tabela postoji
            Schema::create('system_config', function (Blueprint $table) {
                $table->id();
                $table->string('config_key')->unique();
                $table->text('config_value')->nullable();
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('system_config');
    }
};