<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\PaymentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Ovdje su sve rute za web aplikaciju.
| - Korisnici mogu koristiti aplikaciju i izvršiti plaćanje BEZ logovanja.
| - Nakon uspješnog plaćanja, automatski dobijaju potvrdu i račun na email.
| - Admin panel je zaštićen autentiikacijom ('auth:admin' middleware).
|
*/

// Početna stranica - dostupna svima
Route::get('/', function () {
    return view('welcome');
});

// ======= JAVNE KORISNIČKE RUTE =======

// Prikaz forme za unos podataka i plaćanje (ako postoji posebna forma)
Route::get('/placanje', function () {
    return view('placanje.forma'); // zamijeni sa nazivom svog view-a
})->name('placanje.forma');

// Ruta za obradu online plaćanja - dostupno svima (bez autentikacije)
Route::post('/procesiraj-placanje', [PaymentController::class, 'process'])
    ->name('process.payment');

// ================== ADMIN PANEL ==================
Route::prefix('admin')->name('admin.')->group(function () {

    // Prikazuje login formu za admina (nije zaštićeno)
    Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');

    // Obrada login forme, sa zaštitom od brute-force napada
    Route::post('login', [LoginController::class, 'login'])
        ->name('login.submit')
        ->middleware('throttle:5,1');

    // Sve ispod ovoga je dostupno SAMO ulogovanom adminu
    Route::middleware('auth:admin')->group(function () {

        // Logout ruta za admina
        Route::post('logout', [LoginController::class, 'logout'])->name('logout');

        // Admin dashboard
        Route::get('dashboard', function () {
            return view('admin.dashboard');
        })->name('dashboard');

        // Izvještaj - samo admin ima pristup
        Route::get('izvjestaj', [ReportController::class, 'generate'])
            ->name('izvjestaj');

        // ========== TEST/DEV RUTE (ukloni u produkciji) ==========

        // Testiranje sesije
        Route::get('/test-session', function () {
            session(['key' => 'value']);
            return session('key');
        });

        // Testiranje čuvanja kolačića
        Route::get('/test-encrypt-cookie', function () {
            cookie()->queue(cookie('test_cookie', 'test_value', 10));
            return response()->json(['message' => 'Cookie set!']);
        });

        // Testiranje čitanja kolačića
        Route::get('/test-decrypt-cookie', function () {
            $cookieValue = request()->cookie('test_cookie');
            return response()->json(['cookie_value' => $cookieValue]);
        });

        // Testiranje CSRF zaštite (bez tokena)
        Route::middleware(['web'])->post('/ruta-bez-tokena', function () {
            return response()->json(['message' => 'Zahtjev bez CSRF tokena']);
        });

        // Testiranje CSRF zaštite (sa tokenom)
        Route::post('/ruta-sa-tokenom', function () {
            return response()->json(['message' => 'Zahtjev sa CSRF tokenom'], 200);
        });

    }); // end middleware('auth:admin')

}); // end admin prefix group

/*
|--------------------------------------------------------------------------
| Napomena za produkciju
|--------------------------------------------------------------------------
| Sve test/development rute (test-session, test-cookie, csrf...) ukloni
| ili dodatno zaštiti prije nego što aplikaciju postaviš u produkciju!
*/