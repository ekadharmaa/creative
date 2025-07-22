<?php

namespace App\Http\Controllers\Admin;

use Inertia\Inertia;
use App\Models\WebSetting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class WebSettingController extends Controller
{
    public function edit()
    {
        $settings = WebSetting::first() ?? new WebSetting([
            'app_name' => env('APP_NAME', 'Default App Name'),
            'logo' => null,
            'favicon' => null,
            'basic_price' => 50000,
            'premium_price' => 80000,
        ]);

        return Inertia::render('Admin/WebSettings/Edit', [
            'settings' => $settings,
        ]);
    }

    public function update(Request $request)
    {
        $request->validate([
            'app_name' => 'required|string|max:255',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'favicon' => 'nullable|image|mimes:ico,png|max:1024',
            'basic_price' => 'required|integer|min:1000',
            'premium_price' => 'required|integer|min:1000',
        ]);

        $settings = WebSetting::firstOrNew([]);
        $settings->app_name = $request->app_name;
        $settings->basic_price = $request->basic_price;
        $settings->premium_price = $request->premium_price;

        if ($request->hasFile('logo')) {
            $settings->logo = $request->file('logo')->store('logos', 'public');
        }

        if ($request->hasFile('favicon')) {
            $settings->favicon = $request->file('favicon')->store('favicons', 'public');
        }

        $settings->save();

        return redirect()->back()->with('success', 'Settings updated successfully.');
    }
}
