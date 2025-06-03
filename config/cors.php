<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Putanje za CORS
    |--------------------------------------------------------------------------
    |
    | Ovdje navodiš na koje rute se CORS pravila odnose.
    | Najčešće je to 'api/*' da bi se pravila odnosila samo na API rute,
    | a ne na cijeli sajt. 'sanctum/csrf-cookie' se koristi ako koristiš Sanctum za autentifikaciju.
    */
    'paths' => ['api/*', 'sanctum/csrf-cookie'],

    /*
    |--------------------------------------------------------------------------
    | Dozvoljene HTTP metode
    |--------------------------------------------------------------------------
    |
    | Ovdje navodiš koje HTTP metode su dozvoljene sa drugih domena (GET, POST, PUT, DELETE...).
    | '*' znači da su sve metode dozvoljene.
    */
    'allowed_methods' => ['*'],

    /*
    |--------------------------------------------------------------------------
    | Dozvoljeni origini (domeni)
    |--------------------------------------------------------------------------
    |
    | Ovdje navodiš sa kojih domena/portova dozvoljavaš pristup tvom API-ju.
    | Nikada nemoj koristiti '*' u produkciji, već navedi tačno domene koje želiš da dozvoliš.
    | Dodaj ovdje i lokalne i mrežne adrese koje koristiš za razvoj i produkciju.
    */
    'allowed_origins' => [
        'http://localhost:3000',            // Lokalni razvoj (React/Vue dev server)
        'https://localhost:3000',           // Lokalni razvoj preko HTTPS-a
        'http://192.168.115.106:3000',      // Pristup sa druge mašine preko mreže (http)
        'https://192.168.115.106:3000',     // Pristup sa druge mašine preko mreže (https)
        'https://tvoj-frontend.com',        // Produkcija (zamijeni sa stvarnim domenom)
    ],

    /*
    |--------------------------------------------------------------------------
    | Dozvoljeni origin paterni
    |--------------------------------------------------------------------------
    |
    | Ako koristiš wildcard domene (npr. *.mojsajt.com), ovdje možeš navesti regex.
    | U većini slučajeva ovo može ostati prazno.
    */
    'allowed_origins_patterns' => [],

    /*
    |--------------------------------------------------------------------------
    | Dozvoljena zaglavlja
    |--------------------------------------------------------------------------
    |
    | Ovdje navodiš koja HTTP zaglavlja frontend može slati.
    | '*' znači da su dozvoljena sva zaglavlja.
    */
    'allowed_headers' => ['*'],

    /*
    |--------------------------------------------------------------------------
    | Izložena zaglavlja
    |--------------------------------------------------------------------------
    |
    | Ovako određuješ koja zaglavlja frontend može da pročita iz odgovora.
    | Ako ti ništa specijalno ne treba, može ostati prazno.
    */
    'exposed_headers' => [],

    /*
    |--------------------------------------------------------------------------
    | Maksimalno trajanje CORS preflight zahtjeva (u sekundama)
    |--------------------------------------------------------------------------
    |
    | Koliko dugo browser može da kešira odgovor na preflight OPTIONS zahtjev.
    | 0 znači da se svaki put šalje novi preflight zahtjev.
    */
    'max_age' => 0,

    /*
    |--------------------------------------------------------------------------
    | Podrška za kredencijale (cookies, auth...)
    |--------------------------------------------------------------------------
    |
    | Ako koristiš autentifikaciju/cookies između domena, ovo treba biti true.
    | Ako ne koristiš, može na false.
    */
    'supports_credentials' => true,

];