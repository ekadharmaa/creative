<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class AuthenticateMember
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Cek apakah user terautentikasi dengan guard 'member'
        if (!Auth::guard('member')->check()) {
            return redirect()->route('member.login')->with('error', 'Unauthorized access.');
            // return abort(401, 'Unauthorized access');
        }

        return $next($request);
    }
}
