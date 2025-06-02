<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\SupportController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Sve rute za web aplikaciju.
| - Korisnici mogu koristiti aplikaciju i izvršiti plaćanje bez logovanja.
| - Nakon uspješnog plaćanja, automatski dobijaju potvrdu i račun na email.
| - Admin panel je zaštićen 'auth:admin' middleware-om.
|
*/

// Početna stranica - dostupna svima
Route::get('/', function () {
    return view('welcome');
});

// ======= JAVNE KORISNIČKE RUTE =======

// Prikaz forme za unos podataka i plaćanje
Route::get('/placanje', function () {
    return view('payment');
})->name('placanje.forma');

// Obrada online plaćanja (rezervacija i plaćanje)
Route::post('/procesiraj-placanje', [ReservationController::class, 'processPayment'])
    ->name('process.payment');

// Kontakt/podrška - korisnici šalju upite na bus@kotor.me
Route::get('/podrska', [SupportController::class, 'showForm'])->name('support.form');
Route::post('/podrska', [SupportController::class, 'send'])->name('support.send');

// ================== ADMIN PANEL ==================
Route::prefix('admin')->name('admin.')->group(function () {

    // Login forma za admina (nije zaštićeno)
    Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');

    // Obrada login forme, zaštita od brute-force napada
    Route::post('login', [LoginController::class, 'login'])
        ->name('login.submit')
        ->middleware('throttle:5,1');

    // Sve ispod ovoga dostupno je SAMO ulogovanom adminu
    Route::middleware('auth:admin')->group(function () {

        // Logout ruta za admina
        Route::post('logout', [LoginController::class, 'logout'])->name('logout');

        // Admin dashboard
        Route::get('dashboard', function () {
            return view('admin.dashboard');
        })->name('dashboard');

        // Prikaz PDF izvještaja - koristi servis ili kontroler za izvještaje
        Route::get('izvjestaj', [ReportController::class, 'generate'])->name('report');

        // ========== TEST/DEV RUTE (ukloni ili zaštiti u produkciji) ==========
        if (app()->environment('local')) {
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
        }
        // ========== KRAJ TEST/DEV RUTA ==========

    }); // end middleware('auth:admin')

}); // end admin prefix group

/*
|--------------------------------------------------------------------------
| Napomena za produkciju
|--------------------------------------------------------------------------
| Sve test/development rute (test-session, test-cookie, csrf...) OBAVEZNO ukloni
| ili dodatno zaštiti prije nego što aplikaciju postaviš u produkciju!
| Preporuka: koristi uslov app()->environment('local') da se ove rute izvršavaju
| samo u razvojnom okruženju.
*/