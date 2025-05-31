<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;

/**
 * Klasa za slanje dnevnog finansijskog izvještaja putem email-a.
 * PDF izvještaj se automatski generiše i šalje kao atačment.
 */
class DailyFinanceReportMail extends Mailable
{
    use Queueable, SerializesModels;

    public $date;
    public $financeData;

    /**
     * Konstruktor prima datum izvještaja i podatke finansijskog izvještaja.
     */
    public function __construct($date, $financeData)
    {
        $this->date = $date;
        $this->financeData = $financeData;
    }

    /**
     * Kreira email, generiše PDF i dodaje ga kao atačment.
     */
    public function build()
    {
        $title = "Dnevni finansijski izvještaj za {$this->date}";
        // Generisanje PDF-a iz blade view-a
        $pdf = Pdf::loadView('reports.daily_finance_report_pdf', [
            'title' => $title,
            'financeData' => $this->financeData,
            'date' => $this->date,
        ]);

        // Vraća email sa PDF izvještajem u prilogu
        return $this->subject($title)
            ->view('emails.daily_finance_report')
            ->attachData($pdf->output(), 'dnevni_finansijski_izvjestaj.pdf', [
                'mime' => 'application/pdf',
            ]);
    }
}