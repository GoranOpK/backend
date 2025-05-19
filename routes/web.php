<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\ReportController;

// Početna stranica
Route::get('/', function () {
    return view('welcome');
});

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