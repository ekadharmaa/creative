<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ImageHelper
{
    public static function uploadImage($file)
    {
        $fileName = Str::random(20) . '.' . $file->getClientOriginalExtension();
        $filePath = $file->storeAs('images', $fileName, 'public');
        return asset('storage/' . $filePath);
    }

    public static function deleteImage($filePath)
    {
        $path = str_replace(asset('storage/'), '', $filePath);
        if (Storage::disk('public')->exists($path)) {
            Storage::disk('public')->delete($path);
            return true;
        }
        return false;
    }

    public static function bulkUploadImages($files, $current = [], $max = 4)
    {
        if (count($current) + count($files) > $max) {
            return $current;
        }

        $filePaths = $current;
        foreach ($files as $file) {
            $fileName = Str::random(20) . '.' . $file->getClientOriginalExtension();
            $filePath = $file->storeAs('images', $fileName, 'public');
            $filePaths[] = asset('storage/' . $filePath);
        }
        return $filePaths;
    }

    public static function deleteFromCurrent($filePath, $current)
    {
        $path = str_replace(asset('storage/'), '', $filePath);
        if (Storage::disk('public')->exists($path)) {
            Storage::disk('public')->delete($path);
            $key = array_search($filePath, $current);
            if ($key !== false) {
                unset($current[$key]);
            }
        } else {
            $key = array_search($filePath, $current);
            if ($key !== false) {
                unset($current[$key]);
            }
        }
        return $current;
    }
}
