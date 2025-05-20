<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TimeSlotController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\VehicleTypeController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\SystemConfigController;
use App\Http\Controllers\ExampleController;
use App\Http\Controllers\MailController; // Dodavanje MailController-a

// Javne rute za korisnike (bez logovanja)
Route::group([], function () {
    // Ruta za kreiranje rezervacije (s throttling zaštitom)
    Route::post('reservations', [ReservationController::class, 'store'])->middleware('throttle:10,1'); // 10 zahtjeva po minuti

    // Ruta za pregled svih vremenskih slotova
    Route::get('timeslots', [TimeSlotController::class, 'index']);

    // Ruta za dostupne vremenske slotove
    Route::get('timeslots/available', [TimeSlotController::class, 'availableSlots']);

    // Pregled tipova vozila
    Route::apiResource('vehicle-types', VehicleTypeController::class)->only(['index', 'show']);
});

// Zaštićene rute za administratore (potrebno logovanje)
Route::middleware(['auth:sanctum', 'role:admin'])->group(function () {
    // Upravljanje vremenskim slotovima
    Route::apiResource('timeslots', TimeSlotController::class)->except(['index']);

    // Upravljanje rezervacijama
    Route::apiResource('reservations', ReservationController::class)->only(['index', 'show', 'destroy']);

    // Upravljanje tipovima vozila
    Route::apiResource('vehicle-types', VehicleTypeController::class)->except(['index', 'show']);

    // Upravljanje adminima
    Route::apiResource('admins', AdminController::class);

    // Promjena statusa rezervacije
    Route::patch('reservations/{id}/status', [ReservationController::class, 'updateStatus']);

    // Postavljanje sistemske konfiguracije
    Route::post('system-config', [SystemConfigController::class, 'store']);
});

// Rute za prijavu i odjavu administratora
Route::post('admin/login', [AdminController::class, 'login']); // Prijava administratora
Route::post('admin/logout', [AdminController::class, 'logout'])->middleware('auth:sanctum'); // Odjava administratora

// RESTful rute za ExampleController
Route::apiResource('examples', ExampleController::class); // Dodavanje punih RESTful ruta za ExampleController

// Rute za slanje email-a
Route::group([], function () {
    // Ruta za slanje potvrde o plaćanju
    Route::post('send-payment-confirmation', [MailController::class, 'sendPaymentConfirmation'])
        ->name('api.mail.payment-confirmation');

    // Ruta za slanje potvrde o rezervaciji
    Route::post('send-reservation-confirmation', [MailController::class, 'sendReservationConfirmation'])
        ->name('api.mail.reservation-confirmation');
});