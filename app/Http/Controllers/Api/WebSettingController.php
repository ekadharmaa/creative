<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\WebSetting;
use Illuminate\Http\Request;

class WebSettingController extends Controller
{
    public function getSettings()
    {
        // Ambil pengaturan aplikasi dari model atau file konfigurasi
        $settings = WebSetting::first(); // Sesuaikan dengan struktur tabel pengaturan kamu

        return response()->json([
            'app_name' => $settings->app_name,
            'logo' => $settings->logo,
        ]);
    }
}
