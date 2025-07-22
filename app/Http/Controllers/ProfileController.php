<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request; // Pastikan Request di-import dengan benar
use Illuminate\Support\Facades\Log; // Pastikan Log di-import
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Inertia\Response;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): Response
    {
        return Inertia::render('Profile/Edit', [
            'mustVerifyEmail' => $request->user() instanceof MustVerifyEmail,
            'status' => session('status'),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        // Log semua data yang diterima untuk memastikan data sampai di backend
        Log::info('Profile Update Request Data:', $request->all());

        // Log avatar jika ada file yang dikirim
        Log::info('Avatar File:', $request->file('avatar'));

        // Ambil user yang sedang login
        $user = $request->user();

        // Jika ada file avatar, simpan gambar tersebut
        if ($request->hasFile('avatar')) {
            // Simpan gambar ke direktori public
            $avatarPath = $request->file('avatar')->store('avatars', 'public');
            $user->avatar = $avatarPath;
        }

        // Perbarui nama dan email
        $user->name = $request->name;
        $user->email = $request->email;

        // Jika email diperbarui, set ulang email_verified_at
        if ($user->isDirty('email')) {
            $user->email_verified_at = null;
        }

        // Simpan perubahan
        $user->save();

        // Redirect setelah berhasil
        return Redirect::route('profile.edit');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        // Validasi password sebelum menghapus akun
        $request->validate([
            'password' => ['required', 'current_password'],
        ]);

        // Ambil user yang sedang login
        $user = $request->user();

        // Logout user
        Auth::logout();

        // Hapus akun user
        $user->delete();

        // Hapus session dan regenerasi token
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        // Redirect ke halaman utama
        return Redirect::to('/');
    }
}
