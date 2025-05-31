<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;

/**
 * Klasa za slanje godišnjeg finansijskog izvještaja putem email-a.
 * PDF izvještaj se automatski generiše i prilaže kao atačment.
 */
class YearlyFinanceReportMail extends Mailable
{
    use Queueable, SerializesModels;

    public $year;
    public $financeData;

    /**
     * Konstruktor prima godinu i podatke finansijskog izvještaja.
     */
    public function __construct($year, $financeData)
    {
        $this->year = $year;
        $this->financeData = $financeData;
    }

    /**
     * Kreira email sa PDF izvještajem kao atačment.
     */
    public function build()
    {
        $title = "Godišnji finansijski izvještaj za {$this->year}";
        // Kreiranje PDF-a iz blade view-a
        $pdf = Pdf::loadView('reports.yearly_finance_report_pdf', [
            'title' => $title,
            'financeData' => $this->financeData,
            'year' => $this->year,
        ]);

        return $this->subject($title)
            ->view('emails.yearly_finance_report')
            ->attachData($pdf->output(), 'godišnji_finansijski_izvjestaj.pdf', [
                'mime' => 'application/pdf',
            ]);
    }
}