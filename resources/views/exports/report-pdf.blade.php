<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Laporan Transaksi</title>
    <style>
        body {
            font-family: sans-serif;
            font-size: 12px;
            padding: 30px;
        }
        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px 10px;
            text-align: center;
        }
        th {
            background-color: #f3f4f6;
        }
        .section-title {
            margin-top: 40px;
            text-align: left;
            font-weight: bold;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <h1>Laporan Transaksi</h1>

    {{-- STATUS PESANAN --}}
    <div class="section-title">Status Pesanan</div>
    <table>
        <thead>
            <tr>
                <th>Status</th>
                <th>Jumlah</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data['orderStatusData'] as $status => $count)
                <tr>
                    <td>{{ $status }}</td>
                    <td>{{ $count }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    {{-- TRANSAKSI BULANAN --}}
    <div class="section-title">Total Transaksi Bulanan</div>
    <table>
        <thead>
            <tr>
                <th>Bulan</th>
                <th>Total (Rp)</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data['monthlySales'] as $month => $total)
                <tr>
                    <td>{{ $month }}</td>
                    <td>Rp {{ number_format($total, 0, ',', '.') }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    {{-- TRANSAKSI TAHUNAN (Opsional) --}}
    @if (!empty($data['yearlySales']))
        <div class="section-title">Total Transaksi Tahunan</div>
        <table>
            <thead>
                <tr>
                    <th>Tahun</th>
                    <th>Total (Rp)</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data['yearlySales'] as $year => $total)
                    <tr>
                        <td>{{ $year }}</td>
                        <td>Rp {{ number_format($total, 0, ',', '.') }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif

</body>
</html>
