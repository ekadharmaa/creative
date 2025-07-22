<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Carbon\Carbon;
use Inertia\Inertia;
use Inertia\Response;

class ReportController extends Controller
{
    public function index(): Response
    {
        // Ambil jumlah pesanan berdasarkan status
        $orderStatusData = Order::selectRaw('status, COUNT(*) as count')
            ->groupBy('status')
            ->pluck('count', 'status');

        // Transaksi harian dalam 7 hari terakhir
        $dailySales = Order::selectRaw('DATE(created_at) as day, SUM(total) as total')
            ->where('created_at', '>=', Carbon::now()->subDays(6)) // 7 hari termasuk hari ini
            ->groupBy('day')
            ->orderBy('day')
            ->pluck('total', 'day');

        // Transaksi bulanan dalam 12 bulan terakhir
        $monthlySales = Order::selectRaw('DATE_FORMAT(created_at, "%Y-%m") as month, SUM(total) as total')
            ->where('created_at', '>=', Carbon::now()->subYear())
            ->groupBy('month')
            ->orderBy('month')
            ->pluck('total', 'month');

        // Transaksi tahunan dalam 5 tahun terakhir
        $yearlySales = Order::selectRaw('YEAR(created_at) as year, SUM(total) as total')
            ->where('created_at', '>=', Carbon::now()->subYears(5))
            ->groupBy('year')
            ->orderBy('year')
            ->pluck('total', 'year');

        return Inertia::render('Admin/Reports/Index', [
            'orderStatusData' => $orderStatusData,
            'dailySales' => $dailySales,
            'monthlySales' => $monthlySales,
            'yearlySales' => $yearlySales,
        ]);
    }
}
