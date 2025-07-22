<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\ImageHelper;
use App\Http\Requests\ImageUploadRequest;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class ImageController extends Controller
{
    public function uploadImage(ImageUploadRequest $request)
    {
        try {
            $data = $request->validated();
            $name = $data['name'];
            $filePath = ImageHelper::uploadImage($data['image']);

            \Log::info('Uploading image: ' . $filePath);
            $data = ['response' => [
                $name => $filePath
            ]];

            return redirect()->back()->with($data);
        } catch (\Throwable $th) {
            Log::error('Error uploading image: ' . $th->getMessage());
            return redirect()->back()->withErrors([
                'message' => 'Gagal mengupload gambar, silahkan coba lagi.'
            ]);
        }
    }

    public function uploadBulkImage(ImageUploadRequest $request)
    {
        try {
            $data = $request->validated();
            $max = 4;
            $name = $data['name'];
            $images = $data['images'];
            $current = $request->get('current', []);

            // Validasi jumlah gambar
            if (count($current) + count($images) > $max) {
                return redirect()->back()->withErrors([
                    'message' => 'Maksimal upload ' . $max . ' gambar.'
                ]);
            }

            $filePaths = ImageHelper::bulkUploadImages($images, $current, $max);


            \Log::info('Uploading image: ' . json_encode($filePaths));

            $data = ['response' => [
                $name => $filePaths
            ]];
            return redirect()->back()->with($data);
        } catch (\Throwable $th) {
            \Log::error('Error uploading bulk images: ' . $th->getMessage());
            return redirect()->back()->withErrors([
                'message' => 'Gagal mengupload gambar, silahkan coba lagi.'
            ]);
        }
    }

    public function deleteFromBulk(ImageUploadRequest $request)
    {
        try {
            $data = $request->validated();
            $name = $data['name'];
            $current = $data['current'];
            $filePath = $data['filePath'];

            $current = ImageHelper::deleteFromCurrent($filePath, $current);

            return redirect()->back()->with(['response' => [
                $name => $current
            ]]);
        } catch (\Throwable $th) {
            Log::error('Error deleting image: ' . $th->getMessage());
            return redirect()->back()->withErrors([
                'message' => 'Gagal menghapus gambar, silahkan coba lagi.'
            ]);
        }
    }
}
