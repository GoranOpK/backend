<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookController;
use App\Http\Controllers\Admin\Auth\LoginController;


// Prikaz admin login forme (nije zaštićena)

// Rute za admin login (nije zaštićeno)
 22b512a (Dodate sigurnosne i performansne optimizacije)
Route::get('admin/login', [LoginController::class, 'showLoginForm'])->name('admin.login');
Route::post('admin/login', [LoginController::class, 'login'])
    ->name('admin.login.submit')
    ->middleware('throttle:5,1'); // Dodata zaštita od brute-force napada

// Rute dostupne samo prijavljenim adminima
Route::middleware('auth:admin')->group(function () {
    // CRUD rute za knjige
    Route::resource('books', BookController::class);

    // Admin logout ruta
    Route::post('admin/logout', [LoginController::class, 'logout'])->name('admin.logout');

    // Admin dashboard
    Route::get('admin/dashboard', function () {
        return view('admin.dashboard');
    })->name('admin.dashboard');

});

// Početna stranica
 22b512a (Dodate sigurnosne i performansne optimizacije)
Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth.custom'])->group(function () {

// Rute dostupne samo autentifikovanim korisnicima
Route::middleware('auth.custom')->group(function () {
22b512a (Dodate sigurnosne i performansne optimizacije)
    Route::get('/protected', function () {
        return response()->json(['message' => 'Samo za autentifikovane korisnike!']);
    });
});

// Rute dostupne samo adminima (auth.custom i role:admin middleware)
22b512a (Dodate sigurnosne i performansne optimizacije)
Route::middleware(['auth.custom', 'role:admin'])->group(function () {
    Route::get('/admin', function () {
        return response()->json(['message' => 'Samo za admina!']);
    });
 22b512a (Dodate sigurnosne i performansne optimizacije)
});