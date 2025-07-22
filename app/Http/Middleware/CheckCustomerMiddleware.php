<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckCustomerMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        if (config('app.env') !== 'production') {
            Log::info('CheckCustomerMiddleware bypassed in non-production environment.');
            return $next($request);
        }

        $customer = $request->route('customer'); // Subdomain
        $slug = $request->route('slug'); // Slug dari URL

        // Validasi slug dan ambil data undangan
        $invitation = Invitation::where('slug', $slug)->first();

        if (!$invitation) {
            abort(404, 'Undangan tidak ditemukan.');
        }

        // Decode data JSON
        $data = json_decode($invitation->data, true);

        if (!isset($data['couple']['groom_name']['value']) || !isset($data['couple']['bride_name']['value'])) {
            abort(404, 'Data pengantin tidak lengkap.');
        }

        // Pastikan subdomain sesuai dengan format groomandbride
        $expectedSubdomain = strtolower(Str::slug($data['couple']['groom_name']['value']) . 'and' . Str::slug($data['couple']['bride_name']['value']));
        if ($customer !== $expectedSubdomain) {
            abort(404, 'Subdomain tidak valid.');
        }

        // Lanjutkan request jika validasi lolos
        return $next($request);
    }
}
