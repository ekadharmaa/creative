<?php

namespace App\Http\Controllers;

use App\Helpers\FileHelper;
use App\Http\Requests\FileUploadRequest;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use Exception;

class FileController extends Controller
{
    public function uploadFile(FileUploadRequest $request)
    {
        try {
            $data = $request->validated();
            $name = $data['name'];
            $filePath = FileHelper::uploadFile($data['file']);

            Log::info("File berhasil diupload", [
                "name" => $name,
                "filePath" => $filePath
            ]);

            return redirect()->back()->with(['response' => [
                $name => $filePath
            ]]);
        } catch (Exception $e) {
            Log::error("Terjadi kesalahan saat mengupload file: " . $e->getMessage(), [
                "name" => $request->input('name'),
                "file" => $request->file('file')
            ]);

            return redirect()->back()->withErrors("Terjadi kesalahan saat mengupload file.");
        }
    }
}
