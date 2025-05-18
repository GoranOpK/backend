<?php

namespace App\Http;

use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * These middleware are run during every request to your application.
     *
     * @var array<int, class-string|string>
     */
    protected $middleware = [

        // \App\Http\Middleware\TrustHosts::class,
        \App\Http\Middleware\TrustProxies::class,
        \Illuminate\Http\Middleware\HandleCors::class,
        \App\Http\Middleware\PreventRequestsDuringMaintenance::class,
        \Illuminate\Foundation\Http\Middleware\ValidatePostSize::class,
        \App\Http\Middleware\TrimStrings::class,
        \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,

        // Middleware za povjerenje hostova (opcionalno)
        // \App\Http\Middleware\TrustHosts::class,
        \App\Http\Middleware\TrustProxies::class, // Povjerenje proxy serverima
        \Illuminate\Http\Middleware\HandleCors::class, // Upravljanje CORS pravilima
        \App\Http\Middleware\PreventRequestsDuringMaintenance::class, // Sprječava zahtjeve tokom održavanja
        \Illuminate\Foundation\Http\Middleware\ValidatePostSize::class, // Validacija veličine POST podataka
        \App\Http\Middleware\TrimStrings::class, // Trimovanje stringova
        \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class, // Konvertovanje praznih stringova u null
22b512a (Dodate sigurnosne i performansne optimizacije)
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array<string, array<int, class-string|string>>
     */
    protected $middlewareGroups = [
        'web' => [

            \App\Http\Middleware\EncryptCookies::class,
            \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
            \Illuminate\Session\Middleware\StartSession::class,
            // \Illuminate\Session\Middleware\AuthenticateSession::class,
            \Illuminate\View\Middleware\ShareErrorsFromSession::class,
            \App\Http\Middleware\VerifyCsrfToken::class,
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ],

        'api' => [
            // \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
            'throttle:api',
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
            \App\Http\Middleware\EncryptCookies::class, // Šifrovanje kolačića
            \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class, // Dodavanje kolačića u odgovor
            \Illuminate\Session\Middleware\StartSession::class, // Startovanje sesije
            // \Illuminate\Session\Middleware\AuthenticateSession::class, // Autentifikacija sesije (opcionalno)
            \Illuminate\View\Middleware\ShareErrorsFromSession::class, // Dijeljenje grešaka iz sesije
            \App\Http\Middleware\VerifyCsrfToken::class, // CSRF zaštita
            \Illuminate\Routing\Middleware\SubstituteBindings::class, // Zamjena parametara ruta
        ],

        'api' => [
            // Middleware za Sanctum autentifikaciju (opcionalno)
            // \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
            'throttle:api', // Ograničenje zahtjeva
            \Illuminate\Routing\Middleware\SubstituteBindings::class, // Zamjena parametara ruta
 22b512a (Dodate sigurnosne i performansne optimizacije)
        ],
    ];

    /**
     * The application's route middleware.
     *
     * These middleware may be assigned to groups or used individually.
     *
     * @var array<string, class-string|string>
     */
    protected $routeMiddleware = [

        'auth' => \App\Http\Middleware\Authenticate::class,
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'auth.session' => \Illuminate\Session\Middleware\AuthenticateSession::class,
        'cache.headers' => \Illuminate\Http\Middleware\SetCacheHeaders::class,
        'can' => \Illuminate\Auth\Middleware\Authorize::class,
        'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
        'password.confirm' => \Illuminate\Auth\Middleware\RequirePassword::class,
        'signed' => \Illuminate\Routing\Middleware\ValidateSignature::class,
        'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
        'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,

        // Custom middleware example:
        'auth.custom' => \App\Http\Middleware\AuthenticateCustom::class,
        'role' => \App\Http\Middleware\AuthorizeRole::class,
        'auth' => \App\Http\Middleware\Authenticate::class, // Osnovna autentifikacija
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class, // Basic HTTP autentifikacija
        'auth.session' => \Illuminate\Session\Middleware\AuthenticateSession::class, // Sesijska autentifikacija
        'cache.headers' => \Illuminate\Http\Middleware\SetCacheHeaders::class, // Postavljanje keš zaglavlja
        'can' => \Illuminate\Auth\Middleware\Authorize::class, // Provjera dozvola
        'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class, // Preusmjeravanje ako je korisnik već autentifikovan
        'password.confirm' => \Illuminate\Auth\Middleware\RequirePassword::class, // Potvrda lozinke
        'signed' => \Illuminate\Routing\Middleware\ValidateSignature::class, // Validacija potpisanih URL-ova
        'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class, // Ograničenje zahtjeva
        'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class, // Provjera verifikacije emaila

        // Prilagođeni (custom) middleware:
        'auth.custom' => \App\Http\Middleware\AuthenticateCustom::class, // Prilagođena autentifikacija
        'role' => \App\Http\Middleware\AuthorizeRole::class, // Provjera uloge korisnika
 22b512a (Dodate sigurnosne i performansne optimizacije)
    ];
}