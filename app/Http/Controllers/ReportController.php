<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ReportController extends Controller
{
    public function export(Request $request, $type)
    {
        $year = $request->input('year', Carbon::now()->year); // Default ke tahun sekarang

        $data = $this->getReportData($year);

        if ($type === 'pdf') {
            return Pdf::loadView('exports.report-pdf', ['data' => $data, 'year' => $year])
                ->setPaper('a4', 'portrait')
                ->download("laporan-{$year}.pdf");
        }

        return abort(404, 'Unsupported export type');
    }

    private function getReportData($year)
    {
        // === 1. Total berdasarkan status pesanan ===
        $orderStatusData = Order::select('status', DB::raw('count(*) as total'))
            ->whereYear('created_at', $year)
            ->groupBy('status')
            ->pluck('total', 'status')
            ->toArray();

        // === 2. Total transaksi per bulan ===
        $monthlySales = Order::selectRaw("DATE_FORMAT(created_at, '%b') as month, SUM(total) as total")
            ->whereYear('created_at', $year)
            ->groupBy(DB::raw("MONTH(created_at)"))
            ->orderBy(DB::raw("MONTH(created_at)"))
            ->pluck('total', 'month')
            ->toArray();

        // === 3. Total transaksi tahunan (3 tahun terakhir) ===
        $yearlySales = Order::selectRaw("YEAR(created_at) as year, SUM(total) as total")
            ->where('created_at', '>=', now()->subYears(3))
            ->groupBy('year')
            ->orderBy('year')
            ->pluck('total', 'year')
            ->toArray();

        return [
            'orderStatusData' => $orderStatusData,
            'monthlySales' => $monthlySales,
            'yearlySales' => $yearlySales,
        ];
    }
}
