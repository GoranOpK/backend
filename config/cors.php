<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Putanje za CORS
    |--------------------------------------------------------------------------
    |
    | Ovdje navodiš na koje rute se CORS pravila odnose. Najčešće je to 'api/*'.
    |
    */
    'paths' => ['api/*', 'sanctum/csrf-cookie'],

    /*
    |--------------------------------------------------------------------------
    | Dozvoljene HTTP metode
    |--------------------------------------------------------------------------
    |
    | Koje HTTP metode su dozvoljene sa drugih domena (GET, POST, PUT, DELETE...).
    | '*' znači sve metode.
    |
    */
    'allowed_methods' => ['*'],

    /*
    |--------------------------------------------------------------------------
    | Dozvoljeni origini (domeni)
    |--------------------------------------------------------------------------
    |
    | Ovdje navodiš sa kojih domena/portova dozvoljavaš pristup API-ju.
    | Nikad nemoj koristiti '*' u produkciji, već navedi tačno domene!
    |
    */
    'allowed_origins' => [
        'http://localhost:3000',      // za lokalni razvoj (npr. React/Vue dev server)
        'http://192.168.115.106:3000', // za razvoj sa drugog racunara
        'https://tvoj-frontend.com',  // za produkciju - zamijeni sa tvojim frontend domenom
    ],

    /*
    |--------------------------------------------------------------------------
    | Dozvoljeni origin paterni
    |--------------------------------------------------------------------------
    |
    | Ako koristiš wildcard domene (npr. subdomene), navedi regex ovdje.
    |
    */
    'allowed_origins_patterns' => [],

    /*
    |--------------------------------------------------------------------------
    | Dozvoljena zaglavlja
    |--------------------------------------------------------------------------
    |
    | HTTP zaglavlja koja frontend može slati. '*' znači sva zaglavlja.
    |
    */
    'allowed_headers' => ['*'],

    /*
    |--------------------------------------------------------------------------
    | Izložena zaglavlja
    |--------------------------------------------------------------------------
    |
    | Koja zaglavlja frontend može da čita iz odgovora.
    |
    */
    'exposed_headers' => [],

    /*
    |--------------------------------------------------------------------------
    | Maksimalno trajanje CORS preflight zahtjeva (u sekundama)
    |--------------------------------------------------------------------------
    |
    | Koliko dugo browser može da kešira odgovor na preflight OPTIONS zahtjev.
    |
    */
    'max_age' => 0,

    /*
    |--------------------------------------------------------------------------
    | Podrška za kredencijale (cookies, auth...)
    |--------------------------------------------------------------------------
    |
    | Ako koristiš autentifikaciju/cookies između domena, postavi na true.
    |
    */
    'supports_credentials' => true,

];