<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PaymentConfirmation extends Mailable
{
    use Queueable, SerializesModels;

    public $pdf;

    // Konstruktor koji prima PDF fajl
    public function __construct($pdf)
    {
        $this->pdf = $pdf;
    }

    // Izgradnja email poruke
    public function build()
    {
        return $this->subject('Potvrda o plaćanju')
                    ->view('emails.confirmation')
                    ->attachData($this->pdf->output(), 'potvrda_o_plaćanju.pdf', [
                        'mime' => 'application/pdf',
                    ]);
    }
}