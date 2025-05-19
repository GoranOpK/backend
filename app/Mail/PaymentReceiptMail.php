<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PaymentReceiptMail extends Mailable
{
    use Queueable, SerializesModels;

    public $pdf;
    public $paymentDetails;

    public function __construct($pdf, $paymentDetails)
    {
        $this->pdf = $pdf;
        $this->paymentDetails = $paymentDetails;
    }

    public function build()
    {
        return $this->subject('Potvrda o plaćanju')
                    ->view('emails.confirmation')
                    ->attachData($this->pdf->output(), 'racun.pdf', [
                        'mime' => 'application/pdf',
                    ]);
    }
}