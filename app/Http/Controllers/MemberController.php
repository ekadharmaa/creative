<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use App\Models\Order;
use App\Models\Customer;
use App\Models\Invitation;
use App\Helpers\ImageHelper;
use Illuminate\Http\Request;
use App\Helpers\PaymentHelper;
use App\Helpers\TemplateHelper;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class MemberController extends Controller
{

    public function middleware()
    {
        $this->middleware('auth:member');
    }
    /**
     * Display dashboard for member.
     */
    public function index(Request $request)
    {
        $user = Auth::guard('member')->user();

        $invitations = DB::table('invitations')
            ->join('customers', 'invitations.customer_id', '=', 'customers.id')
            ->join('orders', 'invitations.order_id', '=', 'orders.id')
            ->select('invitations.uuid as id', 'orders.order_id', 'invitations.slug', 'invitations.created_at', 'orders.status', 'invitations.template', 'orders.payment_token')
            ->orderBy('invitations.created_at', 'desc')
            ->where('customers.id', $user->id)
            ->get();

        $template_list = json_decode(file_get_contents(resource_path('js/data/templates.json')), true);

        // check status
        $order_id = $request->order_id;
        $status_code = $request->status_code;
        $transaction_status = $request->transaction_status;

        if ($status_code == 200 && $transaction_status == 'settlement') {
            $order = Order::where('order_id', $order_id)->first();
            $order->status = 'success';
            $order->save();
        }

        $invitations = $invitations->map(function ($invitation) use ($template_list) {

            $template = $template_list[array_search($invitation->template, array_column($template_list, 'slug'))];
            unset($template['template_name']);


            return [
                'id' => $invitation->id,
                'order_id' => $invitation->order_id,
                'slug' => $invitation->slug,
                'created_at' => $invitation->created_at,
                'status' => $invitation->status,
                'template' => $template,
                'payment_token' => $invitation->payment_token,
            ];
        });


        return Inertia::render('Member/Index', [
            'user' => $user,
            'invitations' => $invitations,
        ]);
    }

    public function showInvitation($slug)
    {
        $invitation = DB::table('invitations')
            ->join('customers', 'invitations.customer_id', '=', 'customers.id')
            ->join('orders', 'invitations.order_id', '=', 'orders.id')
            ->select('invitations.*', 'orders.order_id', 'orders.status')
            ->where('invitations.slug', $slug)
            ->first();

        // // Cari customer berdasarkan subdomain
        // $customer = Customer::where('subdomain', $subdomain)->firstOrFail();

        // // Cari invitation berdasarkan customer_id
        // $invitation = Invitation::where('customer_id', $customer->id)
        //     ->with('order')
        //     ->firstOrFail();

        $template = TemplateHelper::getBySlug($invitation->template);

        $data = json_decode($invitation->data, true);
        $invitation->data = $data;


        if (!$invitation->data) {
            $data = $template['data'];
            $invitation->data = $data;
            Invitation::where('customer_id',)->update(['data' => $data]);
        }

        $invitation->editableFields = $template['editable_fields'];

        $guests = DB::table('invitation_guests')
            ->where('invitation_id', $invitation->id)
            ->get();

        session()->reflash();

        return Inertia::render('Member/Invitation', [
            'invitation' => $invitation,
            'guests' => $guests,
            'template' => $template,
            'sessionResponse' => session('response'),
        ]);
    }
}
