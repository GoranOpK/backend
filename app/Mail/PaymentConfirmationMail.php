<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

// Ova klasa predstavlja email koji se šalje korisniku nakon uspješnog plaćanja.
// U emailu se nalazi potvrda o plaćanju i račun (PDF) u prilogu.

class PaymentConfirmationMail extends Mailable
{
    use Queueable, SerializesModels;

    // Podaci o plaćanju (npr. iznos, ime kupca, datum...)
    public $details;

    // Putanja do PDF fajla (računa) koji se šalje kao prilog
    public $pdfPath;

    // Konstruktor prima podatke o plaćanju i putanju do PDF-a
    public function __construct($details, $pdfPath)
    {
        $this->details = $details;
        $this->pdfPath = $pdfPath;
    }

    // Konfiguriše email: podešava subject, view i attach-uje PDF fajl kao račun
    public function build()
    {
        return $this->subject('Potvrda o plaćanju i račun') // Naslov emaila
            ->view('emails.payment_confirmation') // Blade view koji prikazuje sadržaj emaila
            ->attach($this->pdfPath, [ // Prilaže PDF račun kao attachment
                'as' => 'racun.pdf', // Ime fajla u emailu
                'mime' => 'application/pdf', // MIME tip za PDF
            ]);
    }
}