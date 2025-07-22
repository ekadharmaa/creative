<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use App\Models\Customer;
use App\Models\Invitation;
use Illuminate\Support\Str;
use App\Helpers\ImageHelper;
use Illuminate\Http\Request;
use App\Helpers\TemplateHelper;
use App\Models\InvitationGuest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\InvitationUpdateRequest;

class InvitationController extends Controller
{
    public function index($slug, Request $request)
    {
        $name = $request->get('for', 'John Doe');

        // Cari customer berdasarkan subdomain
        $invitation = Invitation::where('slug', $slug)->firstOrFail();

        $invitation = DB::table('invitations')
            ->join('orders', 'invitations.order_id', '=', 'orders.id')
            ->select('invitations.*', 'orders.status')
            ->where('slug', $slug)
            ->first();

        if (!$invitation || $invitation->status !== 'success') {
            abort(403);
        }


        // Cek tamu undangan
        // $guest = $invitation->guests()->where('name', $name)->first();

        // if (Auth::guard('member')->check()) {
        //     $guest = $invitation->guests()->firstOrCreate(['name' => $name]);
        // }

        // if ($request->for === 'demouser') {
        //     $guest = $invitation->guests()->firstOrCreate(['name' => $request->for]);  // Menetapkan $guest menjadi null agar tidak memicu 404
        // }

        // if (Auth::guard('member')->check() && !$guest) {
        //     abort(404);
        // }

        // if ($invitation->guests()->count() >= 50 || !$guest) {
        //     abort(404);
        // }

        // check invitation guests count
        $guestsCount = InvitationGuest::where('invitation_id', $invitation->id)->count();
        $guest = InvitationGuest::where('invitation_id', $invitation->id)
            ->where('name', $name)->first();

        // find or create guest
        if (Auth::guard('member')->check()) {
            $guest = InvitationGuest::firstOrCreate([
                'invitation_id' => $invitation->id,
                'name' => $name
            ]);
        }

        if ($guestsCount === 50 || !$guest) {
            abort(404);
        }

        // Ambil template & data
        $template = TemplateHelper::getBySlug($invitation->template);
        $data = $invitation->data ? json_decode($invitation->data, true) : $template['data'];

        if (!$invitation->data) {
            DB::table('invitations')->where('id', $invitation->id)->update(['data' => $data]);
        }

        return Inertia::render('Templates/' . $template['template_name'], array_merge($data, [
            'name' => $name,
            'rsvp' => $guest,
        ]));
    }

    public function update($uuid, Request $request)
    {
        // $invitation = Invitation::where('uuid', $uuid)->firstOrFail();
        $data = $request->input('dataJson');
        // dd($data);
        Invitation::where('uuid', $uuid)->update(['data' => $data]);
        return redirect()->back();
    }

    public function updateCustomDomain($uuid, Request $request)
    {
        $invitation = Invitation::where('uuid', $uuid)->firstOrFail();

        // Validasi custom domain
        $request->validate([
            'custom_domain' => 'nullable|url|max:255',
        ]);

        // Update custom domain jika ada
        $invitation->update(['custom_domain' => $request->input('custom_domain')]);

        return redirect()->back()->with('success', 'Custom domain berhasil diperbarui.');
    }
}
