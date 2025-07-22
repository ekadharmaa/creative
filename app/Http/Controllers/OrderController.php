<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderRequest;
use App\Http\Requests\OrderUpdateRequest;
use App\Models\Order;
use App\Models\Customer;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpKernel\Exception\HttpException;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $perPage = 10;
        $sortBy = $request->input('sort_by', 'created_at');
        $sortDir = $request->input('direction', 'desc');
        $searchQuery = $request->input('search_query', '');

        $orders = Order::query()
            ->select([
                'orders.*',
                'customers.name as name',
                'customers.email as email',
                'customers.phone as phone'
            ])
            ->leftJoin('customers', 'orders.customer_id', '=', 'customers.id')
            ->when(
                $searchQuery,
                fn($query) =>
                $query->where('customers.name', 'like', "%$searchQuery%")
                    ->orWhere('customers.email', 'like', "%$searchQuery%")
            )
            ->orderBy($sortBy, $sortDir)
            ->paginate($perPage);


        return Inertia::render('Order/Index', [
            'orders' => $orders,
            'sortFields' => ['name', 'email', 'total', 'order_id', 'created_at'],
        ]);
    }

    public function addForm()
    {
        $customerOptions = Customer::select('id', 'name')
            ->get()
            ->map(fn($customer) => ['value' => $customer->id, 'label' => $customer->name]);

        return Inertia::render('Order/Add', [
            'customerOptions' => $customerOptions
        ]);
    }

    public function editForm($id)
    {
        $order = Order::with('customer')->find($id);

        abort_if(!$order, 404, 'Order not found');

        return Inertia::render('Order/Edit', [
            'order' => $order
        ]);
    }

    public function create(OrderRequest $request)
    {
        try {
            Order::create($request->validated());
            return redirect()->route('orders.index')->with('status', 'Order created successfully')->setStatusCode(201);
        } catch (\Exception $ex) {
            return redirect()->back()->withErrors(['message' => $ex->getMessage()])->setStatusCode(500);
        }
    }

    public function update(OrderUpdateRequest $request, $id)
    {
        try {
            $order = Order::findOrFail($id);
            $order->update($request->validated());
            return redirect()->route('orders.index')->with('status', 'Order updated successfully');
        } catch (\Exception $ex) {
            return redirect()->back()->withErrors(['message' => $ex->getMessage()]);
        }
    }


    

    public function destroy($id)
    {
        try {
            $order = Order::findOrFail($id); // Pastikan order ditemukan
            $order->delete();  // Menghapus order

            // Mengembalikan respons sukses sebagai JSON
            return response()->json(['message' => 'Order deleted successfully'], 200);
        } catch (\Exception $ex) {
            // Menangani error dan mengembalikan respons error sebagai JSON
            return response()->json(['message' => 'Error deleting order'], 500);
        }
    }



    

    public function notify(Request $request)
    {
        Log::info('Midtrans Notification: ', $request->all());

        $notif = $request->all();

        $orderId = $notif['order_id'];
        $statusCode = $notif['status_code'];
        $grossAmount = $notif['gross_amount'];
        $transactionStatus = $notif['transaction_status'];
        $signatureKey = $notif['signature_key'];
        $serverKey = env('MIDTRANS_SERVER_KEY');

        $expectedSignatureKey = hash('SHA512', $orderId . $statusCode . $grossAmount . $serverKey);

        if ($signatureKey !== $expectedSignatureKey) {
            return response()->json(['message' => 'Invalid signature'], 403); // 403 Forbidden
        }

        $order = Order::where('order_id', $orderId)->first();

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404); // 404 Not Found
        }

        switch ($transactionStatus) {
            case 'capture':
                return response()->json(['message' => 'Transaction successfully captured'], 200); // 200 OK
            case 'settlement':
                $order->status = 'success';
                $order->save();
                return response()->json(['message' => 'Transaction settled'], 200); // 200 OK
            case 'pending':
                return response()->json(['message' => 'Transaction is pending'], 202); // 202 Accepted
            case 'deny':
                return response()->json(['message' => 'Transaction is denied'], 400); // 400 Bad Request
            case 'expire':
                return response()->json(['message' => 'Transaction expired'], 400); // 400 Bad Request
            case 'cancel':
                return response()->json(['message' => 'Transaction canceled'], 400); // 400 Bad Request
            default:
                return response()->json(['message' => 'Unknown transaction status'], 400); // 400 Bad Request
        }

        return response()->json(['message' => 'Notification handled successfully'], 200); // 200 OK
    }
}
