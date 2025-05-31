<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Godišnji finansijski izvještaj</title>
</head>
<body>
    <h2>Godišnji finansijski izvještaj za {{ $year }}</h2>
    <table border="1" cellpadding="6" cellspacing="0">
        <thead>
            <tr>
                <th>Mjesec</th>
                <th>Prihod (€)</th>
            </tr>
        </thead>
        <tbody>
        @foreach ($financePerMonth as $row)
            <tr>
                <td>{{ $row->mjesec }}</td>
                <td>{{ $row->prihod }}</td>
            </tr>
        @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th>Ukupno</th>
                <th>{{ $totalFinance }}</th>
            </tr>
        </tfoot>
    </table>
</body>
</html>