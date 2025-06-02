<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TimeSlotController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\VehicleTypeController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\SystemConfigController;
use App\Http\Controllers\ExampleController;
use App\Http\Controllers\MailController;

// ---------------------------
// JAVNE RUTE (korisnici bez logovanja)
// ---------------------------
Route::group([], function () {
    // Prikaz slotova za određeni dan
    Route::get('reservations/slots', [ReservationController::class, 'showSlots']);

    // Rezervacija slota (sa throttle zaštitom)
    Route::post('reservations/reserve', [ReservationController::class, 'reserve'])->middleware('throttle:10,1');

    // Pregled svih vremenskih slotova
    Route::get('timeslots', [TimeSlotController::class, 'index']);

    // Slobodni slotovi za određeni dan i tip vozila
    Route::get('timeslots/available', [TimeSlotController::class, 'availableSlots']);

    // Pregled svih tipova vozila
    Route::apiResource('vehicle-types', VehicleTypeController::class)->only(['index', 'show']);

    // Pregled rezervacija po datumu (npr. za kalendar)
    Route::get('reservations/by-date', [ReservationController::class, 'byDate']);
});

// ---------------------------
// ADMIN RUTE (zaštićene, potrebna autentifikacija i admin uloga)
// ---------------------------
Route::middleware(['auth:sanctum', 'role:admin'])->group(function () {
    // Upravljanje slotovima (osim index prikaza)
    Route::apiResource('timeslots', TimeSlotController::class)->except(['index']);

    // Upravljanje rezervacijama (pregled svih, prikaz pojedinačne, brisanje)
    Route::apiResource('reservations', ReservationController::class)->only(['index', 'show', 'destroy']);

    // Upravljanje tipovima vozila (kreiranje, izmjena, brisanje)
    Route::apiResource('vehicle-types', VehicleTypeController::class)->except(['index', 'show']);

    // Upravljanje admin korisnicima
    Route::apiResource('admins', AdminController::class);

    // Promjena statusa rezervacije
    Route::patch('reservations/{id}/status', [ReservationController::class, 'updateStatus']);

    // Postavljanje sistemske konfiguracije
    Route::post('system-config', [SystemConfigController::class, 'store']);
});

// ---------------------------
// AUTENTIFIKACIJA ADMINA
// ---------------------------
Route::post('admin/login', [AdminController::class, 'login']);
Route::post('admin/logout', [AdminController::class, 'logout'])->middleware('auth:sanctum');

// ---------------------------
// PRIMJER RESTful RUTA ZA ExampleController
// ---------------------------
Route::apiResource('examples', ExampleController::class);

// ---------------------------
// RUTE ZA SLANJE EMAIL-OVA
// ---------------------------
Route::group([], function () {
    Route::post('send-payment-confirmation', [MailController::class, 'sendPaymentConfirmation'])
        ->name('api.mail.payment-confirmation');
    Route::post('send-reservation-confirmation', [MailController::class, 'sendReservationConfirmation'])
        ->name('api.mail.reservation-confirmation');
});

// ---------------------------
// TEST RUTE
// ---------------------------
Route::get('test', fn() => response()->json(['ok' => true]));
Route::get('testjson', fn() => response()->json(['ok' => true]));

// ---------------------------
// NAPOMENA:
// - Ne trebaš duplirati rute za rezervacije (index, show, destroy, reserve, slots...)
// - Sva admin zaštita je centralizovana u admin grupi
// - Svi javni prikazi su u prvoj grupi
// - Sve je jasno odvojeno i nema preklapanja
// - Ako želiš dodatnu zaštitu za readonly admina, samo dodaj 'prevent.readonly' middleware u admin grupu!