<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Mjesečni izvještaj o rezervacijama po tipu vozila</title>
</head>
<body>
    <h2>Mjesečni izvještaj o rezervacijama po tipu vozila za {{ $month }}.{{ $year }}.</h2>
    <table border="1" cellpadding="6" cellspacing="0">
        <thead>
            <tr>
                <th>Tip vozila</th>
                <th>Broj rezervacija</th>
            </tr>
        </thead>
        <tbody>
        @forelse ($reservationsByType as $row)
            <tr>
                <td>{{ $row->tip_vozila }}</td>
                <td>{{ $row->broj_rezervacija }}</td>
            </tr>
        @empty
            <tr>
                <td colspan="2" style="text-align: center;">Nema rezervacija za izabrani mjesec.</td>
            </tr>
        @endforelse
        </tbody>
    </table>
</body>
</html>