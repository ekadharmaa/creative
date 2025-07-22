<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Inertia\Inertia;
use App\Models\Order;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    public function index()
    {
        // Format orderAmount to IDR
        $orderAmount = Order::where('status', 'success')->sum('total');
        $formattedOrderAmount = number_format($orderAmount, 0, ',', '.'); // Format as IDR

        return Inertia::render('Dashboard', [
            'stats' => [
                'totalUsers' => User::count(),
                'totalCustomers' => Customer::count(),
                'totalOrders' => Order::count(),
                'orderAmount' => $formattedOrderAmount, // Pass the formatted amount
                'recentOrders' => Order::with('customer')
                    ->orderBy('created_at', 'desc')
                    ->take(5)
                    ->get()
                    ->map(function ($order) {
                        return [
                            'id' => $order->id,
                            'order_id' => $order->order_id,
                            'customer_name' => $order->customer->name,
                            'total' => 'Rp ' . number_format($order->total, 0, ',', '.'), // Format as IDR for each order
                            'status' => $order->status,
                            'created_at' => $order->created_at
                        ];
                    })
            ]
        ]);
    }

}
