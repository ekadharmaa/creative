<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddGuestRequest;
use App\Http\Requests\RsvpRequest;
use App\Models\Invitation;
use App\Models\InvitationGuest;
use Illuminate\Http\Request;

class InvitationGuestController extends Controller
{
    public function rsvp($slug, RsvpRequest $request)
    {
        $invitation = Invitation::where('slug', $slug)->firstOrFail();
        $invitation_guest = InvitationGuest::where('invitation_id', $invitation->id)
            ->where('name', $request->get('name'))
            ->first();

        if (!$invitation_guest) {
            return redirect()->back()->with('error', 'Invitation not found');
        }

        $invitation_guest->update($request->validated());
        return redirect()->back()->with('success', 'RSVP submitted successfully');
    }

    public function addGuest($slug, AddGuestRequest $request)
    {
        $invitation = Invitation::where('slug', $slug)->firstOrFail();
        $guestsForm = $request->get('guests'); // example "Jhon Doe, Jane Doe, Foo Bar"
        try {
            // mass insert guests
            $guests = array_map(function ($name) use ($invitation) {
                return [
                    'invitation_id' => $invitation->id,
                    'name' => $name,
                ];
            }, explode(',', str_replace(', ', ',', $guestsForm)));
            InvitationGuest::upsert($guests, ['invitation_id', 'name'], ['name']);
        } catch (\Throwable $th) {
            return redirect()->back()->withErrors([
                'message' => 'Failed to add guests',
            ]);
        }

        return redirect()->back()->with('success', 'Guest added successfully');
    }

    public function destroy($id)
    {
        InvitationGuest::findOrFail($id)->delete();
        return redirect()->back()->with('success', 'Guest deleted successfully');
    }
}
