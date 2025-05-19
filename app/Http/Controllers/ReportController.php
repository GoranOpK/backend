<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class ReportController extends Controller
{
    public function generate()
    {
        // Podaci za izvještaj
        $data = [
            'naslov' => 'Ovo je PDF izvještaj',
            'datum' => now()->format('d.m.Y.'),
            // Dodaj još podataka po potrebi
        ];

        // Generiši PDF iz blade view-a
        $pdf = Pdf::loadView('reports.izvjestaj', $data);

        // Vrati PDF kao odgovor (download)
        return $pdf->download('izvjestaj.pdf');
    }
}