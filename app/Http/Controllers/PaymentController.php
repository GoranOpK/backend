<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Mail\PaymentReceiptMail;

class PaymentController extends Controller
{
    public function processPayment(Request $request)
    {
        // 1. Validacija email adrese (opciono)
        $request->validate([
            'email' => 'required|email',
        ]);

        // 2. Obrada plaćanja (simulacija)
        $paymentDetails = [
            'name' => 'Marko Marković', // Ovo može biti dinamičko
            'amount' => '50.00 EUR',
            'date' => now()->format('Y-m-d'),
        ];

        // 3. Generisanje PDF-a
        $pdf = Pdf::loadView('emails.receipt', $paymentDetails);

        // 4. Slanje email-a sa PDF-om
        Mail::to($request->email)->send(new PaymentReceiptMail($pdf, $paymentDetails));

        // 5. Povratni odgovor korisniku
        return response()->json(['message' => 'Email sa potvrdom je poslat.']);
    }
}