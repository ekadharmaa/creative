<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Http\Response;

class BackupController extends Controller
{
    public function export()
    {
        try {
            // Jalankan perintah backup database
            Artisan::call('backup:run --only-db');

            // Tunggu proses selesai dan flush log output
            $output = Artisan::output();
            \Log::info("Backup executed: " . $output);

            // Ambil semua file di folder Laravel (default dari spatie/laravel-backup)
            $files = Storage::disk('local')->files('Laravel');

            if (empty($files)) {
                return response()->json(['message' => 'File backup tidak ditemukan.'], 404);
            }

            // Ambil file terbaru berdasarkan waktu modifikasi
            $latestFile = collect($files)->sortByDesc(function ($file) {
                return Storage::disk('local')->lastModified($file);
            })->first();

            // Pastikan file benar-benar ada
            if (!Storage::disk('local')->exists($latestFile)) {
                return response()->json(['message' => 'File backup tidak ditemukan.'], 404);
            }

            // Unduh file
            return Storage::disk('local')->download($latestFile, basename($latestFile));
        } catch (\Exception $e) {
            \Log::error("Gagal backup: " . $e->getMessage());
            return response()->json(['message' => 'Terjadi kesalahan saat membuat backup.'], 500);
        }
    }
}
