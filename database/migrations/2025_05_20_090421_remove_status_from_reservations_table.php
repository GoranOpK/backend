<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemoveStatusFromReservationsTable extends Migration
{
    /**
     * Pokrenuti migraciju.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('reservations', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }

    /**
     * Poništiti migraciju.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('reservations', function (Blueprint $table) {
            $table->string('status')->nullable(); // Ponovo dodavanje kolone
        });
    }
}