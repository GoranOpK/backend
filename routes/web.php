<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\BookController;
use App\Http\Controllers\Admin\Auth\LoginController;

<<<<<<< HEAD
// Prikaz admin login forme (nije zaštićena)
Route::get('admin/login', [LoginController::class, 'showLoginForm'])->name('admin.login');

// Obrada admin login forme (POST)
Route::post('admin/login', [LoginController::class, 'login'])->name('admin.login.submit');

// Sve ispod je dostupno SAMO ako je admin prijavljen
Route::middleware('auth:admin')->group(function () {
    // CRUD rute za knjige (BookController)
    Route::resource('books', BookController::class);

    // Admin logout ruta (POST)
    Route::post('admin/logout', [LoginController::class, 'logout'])->name('admin.logout');

    // Admin dashboard primjer
    Route::get('admin/dashboard', function () {
        return view('admin.dashboard');
    })->name('admin.dashboard');
=======
Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth.custom'])->group(function () {
    Route::get('/protected', function () {
        return response()->json(['message' => 'Samo za autentifikovane korisnike!']);
    });
});

Route::middleware(['auth.custom', 'role:admin'])->group(function () {
    Route::get('/admin', function () {
        return response()->json(['message' => 'Samo za admina!']);
    });
>>>>>>> 1f7d296 (Privremeni commit pre rebase)
});