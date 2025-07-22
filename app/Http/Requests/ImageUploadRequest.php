<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ImageUploadRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "name" => "required|string",
            "image" => "sometimes|image|mimes:jpeg,png,jpg,gif,svg,webp|max:4096",
            "images.*" => "sometimes|image|mimes:jpeg,png,jpg,gif,svg,webp|max:4096",
            "filePath" => "sometimes|string"
        ];
    }
}
