<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\RegisterMemberRequest;
use App\Models\Customer;
use Inertia\Inertia;

class RegisterMemberController extends Controller
{
    public function show()
    {
        return Inertia::render('Auth/RegisterMember');
    }

    public function create(RegisterMemberRequest $request)
    {
        try {
            Customer::create($request->validated());
            $request->authenticate();

            return redirect()->route('verify.form');
        } catch (\Exception $e) {
            return back()->with('error', 'Failed to create member');
        }
    }
}
