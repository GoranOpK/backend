<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Payment Confirmation</title>
    <style>
        /* Stilizacija za PDF prikaz */
        body { font-family: DejaVu Sans, Arial, sans-serif; font-size: 14px; color: #222; }
        ul { margin: 16px 0 24px 0; padding-left: 18px; }
        li { margin-bottom: 6px; }
        .footer { margin-top: 40px; font-size: 12px; color: #888; }
    </style>
</head>
<body>
    <!-- Pozdrav korisniku -->
    <p>Dear {{ $reservation->user_name }},</p>

    <!-- Poruka o uspješnom plaćanju -->
    <p>Thank you for completing your payment for your reservation.</p>

    <!-- Prikaz detalja rezervacije u listi -->
    <ul>
        <li><strong>Date:</strong> {{ $reservation->reservation_date->format('d.m.Y') }}</li>
        <li><strong>License Plate:</strong> {{ $reservation->license_plate }}</li>
        <li><strong>Vehicle Type:</strong> {{ $reservation->vehicleType->description_vehicle ?? '-' }}</li>
        <li><strong>Amount:</strong> {{ number_format($reservation->vehicleType->price ?? 0, 2) }} €</li>
    </ul>

    <!-- Informacija o priloženoj potvrdi i fakturi -->
    <p>Attached you will find your payment confirmation and invoice.</p>

    <!-- Pozdrav od opštine -->
    <p>Best regards,</p>
    <p>Municipality of Kotor</p>

    <!-- Futer (opciono) -->
    <div class="footer">
        Generated by Municipality of Kotor – {{ \Carbon\Carbon::now()->format('Y-m-d H:i') }}
    </div>
</body>
</html>