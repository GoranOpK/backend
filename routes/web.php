<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
<<<<<<< HEAD
use App\Http\Controllers\ReportController;

// Početna stranica
=======

// Početna stranica (dostupna svima)
>>>>>>> e1f3c705f8aa549936aa9cbd8331e51f8b05d0c2
Route::get('/', function () {
    return view('welcome');
});

<<<<<<< HEAD
// Admin rute
Route::prefix('admin')->name('admin.')->group(function () {
    // Login
    Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('login', [LoginController::class, 'login'])
        ->name('login.submit')
        ->middleware('throttle:5,1');

    // Zaštićene admin rute
    Route::middleware('auth:admin')->group(function () {
        Route::post('logout', [LoginController::class, 'logout'])->name('logout');
        Route::get('dashboard', function () {
            return view('admin.dashboard');
        })->name('dashboard');
    });
});

// Izvještaj
Route::get('/izvjestaj', [ReportController::class, 'generate']);

// Test POST rute (CSRF zaštita je podrazumevana u web.php)
Route::post('/ruta-bez-tokena', function () {
    return response()->json(['message' => 'Zahtjev bez CSRF tokena'], 200);
});

Route::post('/ruta-sa-tokenom', function () {
    return response()->json(['message' => 'Zahtjev sa CSRF tokenom'], 200);
});
=======
// Rute za admin login (nije zaštićeno)
Route::get('admin/login', [LoginController::class, 'showLoginForm'])->name('admin.login');
Route::post('admin/login', [LoginController::class, 'login'])
    ->name('admin.login.submit')
    ->middleware('throttle:5,1'); // Dodata zaštita od brute-force napada

// Rute dostupne samo autentifikovanim adminima
Route::middleware('auth:admin')->group(function () {

    // Admin logout ruta
    Route::post('admin/logout', [LoginController::class, 'logout'])->name('admin.logout');

    // Admin dashboard
    Route::get('admin/dashboard', function () {
        return view('admin.dashboard');
    })->name('admin.dashboard');
});

// Rute za testiranje CSRF zaštite

// Ruta sa CSRF zaštitom, ali bez tokena u testu
Route::post('/ruta-bez-tokena', function () {
    return response()->json(['message' => 'Zahtjev bez CSRF tokena'], 200);
})->middleware('web'); // `web` middleware uključuje CSRF zaštitu

// Ruta sa CSRF zaštitom i validnim tokenom
Route::post('/ruta-sa-tokenom', function () {
    return response()->json(['message' => 'Zahtjev sa CSRF tokenom'], 200);
})->middleware('web');
>>>>>>> e1f3c705f8aa549936aa9cbd8331e51f8b05d0c2
