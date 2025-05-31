<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;

class SendInvoiceToUserMail extends Mailable
{
    use Queueable, SerializesModels;

    public $reservation;

    /**
     * Konstruktor - ovdje prosljeđujemo podatke o rezervaciji
     */
    public function __construct($reservation)
    {
        $this->reservation = $reservation;
    }

    /**
     * Priprema i slanje mail-a sa PDF potvrdom o plaćanju i fakturom korisniku, sve na engleskom jeziku
     */
    public function build()
    {
        // Generišemo PDF za potvrdu o plaćanju koristeći odgovarajući blade šablon (na engleskom jeziku)
        $confirmationPdf = Pdf::loadView('reports.payment_confirmation_info_pdf', ['reservation' => $this->reservation]);
        // Generišemo PDF za fakturu koristeći odgovarajući blade šablon (na engleskom jeziku)
        $invoicePdf = Pdf::loadView('reports.invoice_pdf', ['reservation' => $this->reservation]);

        // Vraćamo mail sa subject-om, tijelom poruke i dva PDF atačmenta
        return $this->subject('Your Payment Confirmation and Invoice') // Subject na engleskom jeziku
            ->text('emails.empty') // Telo maila (možeš ovdje staviti i html view ili plain text)
            // Prilažemo potvrdu o plaćanju
            ->attachData(
                $confirmationPdf->output(),
                'payment_confirmation.pdf',
                ['mime' => 'application/pdf']
            )
            // Prilažemo fakturu
            ->attachData(
                $invoicePdf->output(),
                'invoice.pdf',
                ['mime' => 'application/pdf']
            );
    }
}