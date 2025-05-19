<?php

namespace Tests\Feature;

use Tests\TestCase;

class CsrfProtectionTest extends TestCase
{
    /**
     * Metoda koja se automatski izvršava prije svakog testa.
     * Ovdje postavljamo APP_KEY kako bi testovi radili ispravno.
     */
    protected function setUp(): void
    {
        parent::setUp();

        // Postavljanje APP_KEY za testove
        putenv('APP_KEY=base64:TdWMnAyRudCfTDPnLcUOVjC8VQY0GE+v8C9/bSv1hP0=');
    }

    /**
     * Test POST zahtjeva bez CSRF tokena (ruta sa CSRF zaštitom).
     *
     * Očekuje se da zahtjev bez CSRF tokena rezultira greškom 419 (Page Expired).
     */
    public function testPostRouteWithoutCsrfToken()
    {
        // Pokreće sesiju za CSRF zaštitu
        $this->startSession();

        // Simulira POST zahtjev na rutu bez CSRF tokena
        $response = $this->post('/ruta-bez-tokena', []); // Bez CSRF tokena
        $response->assertStatus(419); // Očekuje se greška 419 (Page Expired)
    }

    /**
     * Test POST zahtjeva sa ispravnim CSRF tokenom.
     *
     * Očekuje se da zahtjev sa validnim CSRF tokenom uspješno prođe.
     */
    public function testPostRouteWithCsrfToken()
    {
        // Pokreće sesiju za CSRF zaštitu
        $this->startSession();

        // Simulira POST zahtjev na rutu sa validnim CSRF tokenom
        $response = $this->post('/ruta-sa-tokenom', [
            '_token' => csrf_token(), // Dodaje validan CSRF token
        ]);
        $response->assertStatus(200); // Očekuje se uspješan odgovor
    }
}