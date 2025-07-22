<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rules\Password;
use Illuminate\Foundation\Http\FormRequest;

class CheckoutRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $isLoggedIn = auth('member')->check();

        return [
            'name' => ['required', 'string'],
            'email' => ['required', 'email'],
            'password' => $isLoggedIn ? ['nullable'] : ['required', Password::defaults()],
            'phone' => $isLoggedIn ? ['nullable'] : ['required', 'string'],
            'template' => ['required', 'string'],
            'total' => ['required', 'numeric'],
        ];
    }
}
