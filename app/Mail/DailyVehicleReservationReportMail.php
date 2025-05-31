<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;

/**
 * Klasa za slanje dnevnog izvještaja o rezervacijama po tipu vozila.
 * PDF izvještaj se generiše i šalje kao atačment uz email.
 */
class DailyVehicleReservationReportMail extends Mailable
{
    use Queueable, SerializesModels;

    public $date;
    public $reservationsByType;

    /**
     * Konstruktor prima datum i grupisane rezervacije po tipu vozila.
     */
    public function __construct($date, $reservationsByType)
    {
        $this->date = $date;
        $this->reservationsByType = $reservationsByType;
    }

    /**
     * Kreira email sa PDF izvještajem u prilogu.
     */
    public function build()
    {
        $title = "Dnevni izvještaj o rezervacijama po tipu vozila za {$this->date}";
        // Generisanje PDF-a iz blade view-a
        $pdf = Pdf::loadView('reports.vehicle_reservation_report_pdf', [
            'title' => $title,
            'reservationsByType' => $this->reservationsByType,
            'date' => $this->date,
        ]);

        return $this->subject($title)
            ->view('emails.daily_vehicle_reservation_report')
            ->attachData($pdf->output(), 'dnevni_izvjestaj_rezervacije_vozila.pdf', [
                'mime' => 'application/pdf',
            ]);
    }
}