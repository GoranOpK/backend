<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\PaymentController;

// Početna stranica dostupna svim korisnicima
Route::get('/', function () {
    return view('welcome'); // Prikazuje početnu stranicu
});

// Rute za administraciju
Route::prefix('admin')->name('admin.')->group(function () {

    // Prikazuje login formu za administratora
    Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');

    // Obrada login zahtjeva sa zaštitom od brute-force napada (5 pokušaja u 1 minuti)
    Route::post('login', [LoginController::class, 'login'])
        ->name('login.submit')
        ->middleware('throttle:5,1');

    // Zaštićene rute za administratore (samo za autentifikovane korisnike)
    Route::middleware('auth:admin')->group(function () {

        // Logout administratora
        Route::post('logout', [LoginController::class, 'logout'])->name('logout');

        // Prikazuje dashboard za administratora
        Route::get('dashboard', function () {
            return view('admin.dashboard');
        })->name('dashboard');
    });
});

// Ruta za testove
Route::get('/test-session', function () {
    session(['key' => 'value']); // Postavljanje vrednosti u sesiju
    return session('key'); // Dohvatanje vrednosti iz sesije
});

// Ruta za generisanje izvještaja
Route::get('/izvjestaj', [ReportController::class, 'generate'])
    ->name('izvjestaj')
    ->middleware('auth');

// Rute za testiranje CSRF zaštite

// Ruta bez CSRF tokena (za testiranje CSRF zaštite)
Route::middleware(['web'])->post('/ruta-bez-tokena', function () {
    return response()->json(['message' => 'Zahtjev bez CSRF tokena']);
});

// Ruta sa CSRF tokenom (za testiranje)
Route::post('/ruta-sa-tokenom', function () {
    return response()->json(['message' => 'Zahtjev sa CSRF tokenom'], 200);
})->middleware('web');

// Ruta za slanje email adrese za potvrdu plaćanja
Route::post('/send-confirmation', [PaymentController::class, 'sendConfirmation'])->name('payment.confirmation');