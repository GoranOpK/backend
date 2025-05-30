<!DOCTYPE html>
<html>
<head>
    <title>Payment Confirmation</title>
</head>
<body>
    <p>Dear {{ $reservation->user_name }},</p>
    <p>Thank you for completing your payment for your reservation.</p>
    <ul>
        <li><strong>Date:</strong> {{ $reservation->reservation_date->format('d.m.Y') }}</li>
        <li><strong>License Plate:</strong> {{ $reservation->license_plate }}</li>
        <li><strong>Vehicle Type:</strong> {{ $reservation->vehicleType->description_vehicle ?? '-' }}</li>
        <li><strong>Amount:</strong> {{ number_format($reservation->vehicleType->price ?? 0, 2) }} €</li>
    </ul>
    <p>Attached you will find your payment confirmation and invoice.</p>
    <p>Best regards,</p>
    <p>Municipality of Kotor</p>
</body>
</html>