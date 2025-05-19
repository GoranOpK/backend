<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\PaymentController;

// Početna stranica (dostupna svima)
Route::get('/', function () {
    return view('welcome');
});

// Rute za administraciju
Route::prefix('admin')->name('admin.')->group(function () {

    // Login za admina
    Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');

    // Login zahtjev sa zaštitom od brute-force napada (throttle)
    Route::post('login', [LoginController::class, 'login'])
        ->name('login.submit')
        ->middleware('throttle:5,1');

    // Zaštićene admin rute (samo za autentifikovane administratore)
    Route::middleware('auth:admin')->group(function () {

        // Logout za admina
        Route::post('logout', [LoginController::class, 'logout'])->name('logout');

        // Dashboard za admina
        Route::get('dashboard', function () {
            return view('admin.dashboard');
        })->name('dashboard');
    });
});

// Ruta za generisanje izvještaja
Route::get('/izvjestaj', [ReportController::class, 'generate'])->name('izvjestaj');

// Rute za testiranje CSRF zaštite

// Ruta bez CSRF tokena (za testiranje)
Route::post('/ruta-bez-tokena', function () {
    return response()->json(['message' => 'Zahtjev bez CSRF tokena'], 200);
});

// Ruta sa CSRF tokenom (za testiranje)
Route::post('/ruta-sa-tokenom', function () {
    return response()->json(['message' => 'Zahtjev sa CSRF tokenom'], 200);
})->middleware('web');

// Ruta za unos email adrese za potvrdu plaćanja
Route::post('/send-confirmation', [PaymentController::class, 'sendConfirmation'])->name('payment.confirmation');