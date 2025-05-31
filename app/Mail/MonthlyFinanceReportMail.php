<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;

/**
 * Klasa za slanje mjesečnog finansijskog izvještaja na email.
 * PDF izvještaj se generiše i automatski šalje kao atačment.
 */
class MonthlyFinanceReportMail extends Mailable
{
    use Queueable, SerializesModels;

    public $month;
    public $year;
    public $financeData;

    /**
     * Konstruktor prima mjesec, godinu i podatke finansijskog izvještaja.
     */
    public function __construct($month, $year, $financeData)
    {
        $this->month = $month;
        $this->year = $year;
        $this->financeData = $financeData;
    }

    /**
     * Kreira email sa PDF izvještajem kao atačment.
     */
    public function build()
    {
        $title = "Mjesečni finansijski izvještaj za {$this->month}.{$this->year}";
        // Kreiranje PDF-a iz blade view-a
        $pdf = Pdf::loadView('reports.monthly_finance_report_pdf', [
            'title' => $title,
            'financeData' => $this->financeData,
            'month' => $this->month,
            'year' => $this->year,
        ]);

        return $this->subject($title)
            ->view('emails.monthly_finance_report')
            ->attachData($pdf->output(), 'mjesečni_finansijski_izvjestaj.pdf', [
                'mime' => 'application/pdf',
            ]);
    }
}