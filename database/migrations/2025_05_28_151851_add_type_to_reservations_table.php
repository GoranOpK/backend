<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
            $table->enum('type', ['drop_off', 'pick_up'])->default('drop_off');
        });
    }

    public function down(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
    $table->enum('type', ['drop_off', 'pick_up'])->default('drop_off')->after('id')->change();
});
    }
};