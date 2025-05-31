<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;

/**
 * Klasa za slanje godišnjeg izvještaja o rezervacijama po tipu vozila.
 * PDF izvještaj se generiše i automatski šalje kao atačment na email.
 */
class YearlyVehicleReservationReportMail extends Mailable
{
    use Queueable, SerializesModels;

    public $year;
    public $reservationsByType;

    /**
     * Konstruktor prima godinu i grupisane rezervacije po tipu vozila.
     */
    public function __construct($year, $reservationsByType)
    {
        $this->year = $year;
        $this->reservationsByType = $reservationsByType;
    }

    /**
     * Kreira email i prilaže PDF izvještaj kao atačment.
     */
    public function build()
    {
        $title = "Godišnji izvještaj o rezervacijama po tipu vozila za {$this->year}";
        // Generisanje PDF-a iz blade view-a
        $pdf = Pdf::loadView('reports.vehicle_reservation_report_pdf', [
            'title' => $title,
            'reservationsByType' => $this->reservationsByType,
            'year' => $this->year,
        ]);

        return $this->subject($title)
            ->view('emails.yearly_vehicle_reservation_report')
            ->attachData($pdf->output(), 'godišnji_izvjestaj_rezervacije_vozila.pdf', [
                'mime' => 'application/pdf',
            ]);
    }
}