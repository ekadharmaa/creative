<?php

namespace App\Http\Controllers;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpKernel\Exception\HttpException;

class TestController extends Controller
{
    /**
     * Display test page.
     */
    public function index(Request $request): Response
    {
        return Inertia::render('Test/Index', [
            'name' => Auth::user()->name,
        ]);
    }

    /**
     * Test exception handling.
     */
    public function exception(): HttpException
    {
        throw new HttpException(403, 'Forbidden');
    }
}
