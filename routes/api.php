<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TimeSlotController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\VehicleTypeController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\SystemConfigController;

// Public rute (svi mogu pristupiti)
Route::apiResource('vehicle-types', VehicleTypeController::class)->only(['index', 'show']);
Route::get('timeslots/available', [TimeSlotController::class, 'availableSlots']); // custom ruta primer

// Custom rute za rezervacije
Route::get('reservations/search/{email}', [ReservationController::class, 'searchByEmail']);
Route::post('reservations/{id}/status', [ReservationController::class, 'changeStatus']);

// Autentifikovane rute (mora biti ulogovan korisnik)
Route::middleware(['auth:api'])->group(function () {
    Route::apiResource('reservations', ReservationController::class)->except(['index', 'show']);
    Route::post('timeslots', [TimeSlotController::class, 'store']);
});

// Samo admin pristup
Route::middleware(['auth:api', 'role:admin'])->group(function () {
    Route::apiResource('admins', AdminController::class);
    Route::post('system-config', [SystemConfigController::class, 'store']);
});

// RESTful rute za osnovne CRUD operacije
Route::apiResource('timeslots', TimeSlotController::class);
Route::apiResource('reservations', ReservationController::class);
Route::apiResource('vehicle-types', VehicleTypeController::class);
Route::apiResource('admins', AdminController::class);

// Custom rute za specifične zahteve
Route::get('reservations/search/{email}', [ReservationController::class, 'searchByEmail']);
Route::post('reservations/{id}/status', [ReservationController::class, 'changeStatus']);