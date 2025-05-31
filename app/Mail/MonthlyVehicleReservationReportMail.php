<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;

/**
 * Klasa za slanje mjesečnog izvještaja o rezervacijama po tipu vozila.
 * PDF izvještaj se automatski generiše i šalje kao atačment.
 */
class MonthlyVehicleReservationReportMail extends Mailable
{
    use Queueable, SerializesModels;

    public $month;
    public $year;
    public $reservationsByType;

    /**
     * Konstruktor prima mjesec, godinu i grupisane rezervacije po tipu vozila.
     */
    public function __construct($month, $year, $reservationsByType)
    {
        $this->month = $month;
        $this->year = $year;
        $this->reservationsByType = $reservationsByType;
    }

    /**
     * Kreira email i prilaže PDF izvještaj kao atačment.
     */
    public function build()
    {
        $title = "Mjesečni izvještaj o rezervacijama po tipu vozila za {$this->month}.{$this->year}";
        // Generisanje PDF-a iz blade view-a
        $pdf = Pdf::loadView('reports.vehicle_reservation_report_pdf', [
            'title' => $title,
            'reservationsByType' => $this->reservationsByType,
            'month' => $this->month,
            'year' => $this->year,
        ]);

        return $this->subject($title)
            ->view('emails.monthly_vehicle_reservation_report')
            ->attachData($pdf->output(), 'mjesečni_izvjestaj_rezervacije_vozila.pdf', [
                'mime' => 'application/pdf',
            ]);
    }
}