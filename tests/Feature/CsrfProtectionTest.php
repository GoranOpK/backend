<?php

namespace Tests\Feature;

use Tests\TestCase;

class CsrfProtectionTest extends TestCase
{
    /**
     * Test POST zahtjeva bez CSRF tokena (ruta sa CSRF zaštitom).
     */
    public function testPostRouteWithoutCsrfToken()
    {
        // Simulira sesiju za CSRF zaštitu
        $this->startSession();

        // Simulira POST zahtjev bez CSRF tokena
        $response = $this->post('/ruta-bez-tokena', []); // Bez CSRF tokena
        $response->assertStatus(419); // Očekuje se greška 419 (Page Expired)
    }

    /**
     * Test POST zahtjeva sa ispravnim CSRF tokenom.
     */
    public function testPostRouteWithCsrfToken()
    {
        // Simulira sesiju za CSRF zaštitu
        $this->startSession();

        // Simulira POST zahtjev sa CSRF tokenom
        $response = $this->post('/ruta-sa-tokenom', [
            '_token' => csrf_token(),
        ]);
        $response->assertStatus(200); // Očekuje se uspješan odgovor
    }
}