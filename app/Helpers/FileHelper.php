<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class FileHelper
{
    public static function uploadFile($file)
    {
        $fileName = Str::random(20) . '.' . $file->getClientOriginalExtension();
        $filePath = $file->storeAs('files', $fileName, 'public');
        return asset('storage/' . $filePath);
    }

    public static function deleteFile($filePath)
    {
        $path = str_replace(asset('storage/'), '', $filePath);
        if (Storage::disk('public')->exists($path)) {
            Storage::disk('public')->delete($path);
            return true;
        }
        return false;
    }
}
