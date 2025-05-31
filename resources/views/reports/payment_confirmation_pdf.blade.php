<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{ $title ?? 'Potvrda o uplati' }}</title>
    <style>
        body { font-family: DejaVu Sans, Arial, sans-serif; }
        table { border-collapse: collapse; width: 60%; margin-top: 24px; }
        th, td { border: 1px solid #cccccc; padding: 8px 12px; text-align: left; }
        th { background: #eeeeee; }
    </style>
</head>
<body>
    <h2>{{ $title ?? 'Potvrda o uplati' }}</h2>
    <table>
        <tr>
            <th>Broj transakcije</th>
            <td>{{ $payment->transaction_number ?? '-' }}</td>
        </tr>
        <tr>
            <th>Iznos</th>
            <td>{{ number_format($payment->amount ?? 0, 2, ',', '.') }} €</td>
        </tr>
        <tr>
            <th>Datum uplate</th>
            <td>{{ $payment->date ?? '-' }}</td>
        </tr>
        <tr>
            <th>Plaćeno od</th>
            <td>{{ $payment->payer_name ?? '-' }}</td>
        </tr>
        <tr>
            <th>Svrha uplate</th>
            <td>{{ $payment->description ?? '-' }}</td>
        </tr>
    </table>
</body>
</html>