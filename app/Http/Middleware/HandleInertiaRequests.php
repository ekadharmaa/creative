<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request): string|null
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @return array<string, mixed>
     */
    public function share(Request $request): array
    {
        return array_merge(parent::share($request), [
            // Data auth untuk admin dan member
            'auth' => [
                'admin' => Auth::guard('admin')->user() ? [
                    'id' => Auth::guard('admin')->user()->id,
                    'name' => Auth::guard('admin')->user()->name,
                    'email' => Auth::guard('admin')->user()->email,
                    'avatar' => Auth::guard('admin')->user()->avatar,
                ] : null,

                'member' => Auth::guard('member')->user() ? [
                    'id' => Auth::guard('member')->user()->id,
                    'name' => Auth::guard('member')->user()->name,
                    'email' => Auth::guard('member')->user()->email,
                ] : null,
            ],

            // Flash messages (opsional)
            'flash' => [
                'response' => fn() => $request->session()->get('response'),
                'success' => fn() => $request->session()->get('success'),
                'error' => fn() => $request->session()->get('error'),
            ],
        ]);
    }
}
