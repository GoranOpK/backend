<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\PaymentConfirmationMail;
use App\Mail\InvoiceMail;

class PaymentController extends Controller
{
    public function process(Request $request)
    {
        // 1. Validacija podataka (uključujući email korisnika)
        $validated = $request->validate([
            'email' => 'required|email',
            // ... ostatak podataka za plaćanje
        ]);

        // 2. Obrada plaćanja (ovo je pseudo-kod, zamijeni sa tvojim payment gateway kodom)
        $paymentSuccess = true; // ovdje bi išao tvoj kod za provjeru
        $paymentDetails = [/* podaci o plaćanju */];

        if($paymentSuccess){
            // 3. Generiši račun (npr. generiši PDF i sačuvaj putanju)
            $pdfPath = storage_path('app/invoices/invoice123.pdf');
            // ... tvoj kod za generisanje PDF-a

            // 4. Pošalji email sa potvrdom i računom u attach-u
            Mail::to($validated['email'])->send(new PaymentConfirmationMail($paymentDetails, $pdfPath));
            
            return response()->json(['message' => 'Plaćanje uspješno, provjerite email za potvrdu i račun!']);
        } else {
            return response()->json(['error' => 'Plaćanje nije uspjelo.'], 400);
        }
    }
}