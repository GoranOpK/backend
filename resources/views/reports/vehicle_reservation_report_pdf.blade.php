<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{ $title ?? 'Izvještaj o rezervacijama po tipu vozila' }}</title>
    <style>
        /* Stilovi za tabelu i tekst u PDF-u */
        body { font-family: DejaVu Sans, Arial, sans-serif; }
        table { border-collapse: collapse; width: 100%; margin-top: 24px; }
        th, td { border: 1px solid #cccccc; padding: 8px 12px; text-align: left; }
        th { background: #eeeeee; }
    </style>
</head>
<body>
    <!-- Naslov izvještaja -->
    <h2>{{ $title ?? 'Izvještaj o rezervacijama po tipu vozila' }}</h2>
    <!-- Dinamički prikaz perioda izvještaja -->
    @if(isset($date))
        <p>Datum: {{ $date }}</p>
    @endif
    @if(isset($month) && isset($year))
        <p>Mjesec: {{ $month }} / {{ $year }}</p>
    @endif
    @if(isset($year) && !isset($month))
        <p>Godina: {{ $year }}</p>
    @endif
    <table>
        <thead>
            <tr>
                <th>Tip vozila</th>
                <th>Broj rezervacija</th>
            </tr>
        </thead>
        <tbody>
        <!-- Petlja kroz sve vrste vozila i prikaz broja rezervacija za svaku -->
        @foreach ($reservationsByType as $row)
            <tr>
                <td>
                    <!-- Prikaz imena tipa vozila -->
                    @if(isset($row->tip_vozila))
                        {{ $row->tip_vozila }}
                    @elseif(isset($row->vehicleType) && isset($row->vehicleType->name))
                        {{ $row->vehicleType->name }}
                    @else
                        Nepoznat tip
                    @endif
                </td>
                <td>
                    <!-- Prikaz broja rezervacija za taj tip vozila -->
                    @if(isset($row->broj_rezervacija))
                        {{ $row->broj_rezervacija }}
                    @elseif(isset($row->count))
                        {{ $row->count }}
                    @else
                        0
                    @endif
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</body>
</html>