<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;

// Početna stranica (dostupna svima)
Route::get('/', function () {
    return view('welcome');
});

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