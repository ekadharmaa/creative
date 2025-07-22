<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Customer; // Import model Customer
use Inertia\Inertia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpKernel\Exception\HttpException;

class UserController extends Controller
{
    // Menampilkan semua pengguna (users)
    public function index(Request $request)
    {
        $per_page = 10;
        $sort_by = $request->input('sort_by', 'created_at');
        $sort_dir = $request->input('direction', 'desc');
        $search_query = $request->input('search_query', '');

        // Mengambil data users (admin)
        $users = User::when($search_query, function ($query, $search_query) {
            $query->where(function ($query) use ($search_query) {
                $query->where('name', 'like', "%$search_query%")
                    ->orWhere('email', 'like', "%$search_query%");
            });
        })
        ->orderBy($sort_by, $sort_dir)
        ->paginate($per_page);

        // Mengambil data members (customers)
        $members = Customer::when($search_query, function ($query, $search_query) {
            $query->where(function ($query) use ($search_query) {
                $query->where('name', 'like', "%$search_query%")
                    ->orWhere('email', 'like', "%$search_query%");
            });
        })
        ->orderBy($sort_by, $sort_dir)
        ->paginate($per_page);

        return Inertia::render('User/Index', [
            'users' => $users,
            'members' => $members, // Menyertakan members
            'sortFields' => ['name', 'email']
        ]);
    }

    // Form untuk menambah admin (create)
    public function createAdmin()
    {
        return Inertia::render('User/CreateAdmin');  // Render form untuk menambah admin baru
    }

    // Hapus Admin
    public function destroyAdmin($id)
    {
        // Temukan user admin berdasarkan ID
        $admin = User::find($id);

        // Jika admin tidak ditemukan, tampilkan error 404
        if (!$admin) {
            throw new HttpException(404, 'Admin not found');
        }

        // Menghapus admin dari database
        $admin->delete();

        // Redirect kembali ke daftar users dengan pesan sukses
        return redirect()->route('users.index')->with('success', 'Admin deleted successfully');
    }

    // Membuat Admin
    public function storeAdmin(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required|email|unique:users,email',
            'username' => 'required|string|max:255',
            'password' => 'required|string|min:6',
        ]);

        // Membuat admin baru
        User::create([
            'name' => $validated['username'],
            'email' => $validated['email'],
            'password' => Hash::make($validated['password']),
        ]);

        return redirect()->route('users.index')->with('success', 'Admin created successfully');
    }

    // Edit Admin
    public function editAdmin($id)
    {
        // Temukan admin berdasarkan ID
        $admin = User::find($id);

        if (!$admin) {
            throw new HttpException(404, 'Admin not found');
        }

        // Render form untuk mengedit admin
        return Inertia::render('User/EditAdmin', [
            'admin' => $admin // Passing the admin data
        ]);
    }


    // Update Admin
    public function updateAdmin(Request $request, $id)
    {
        // Temukan admin berdasarkan ID
        $admin = User::find($id);

        if (!$admin) {
            throw new HttpException(404, 'Admin not found');
        }

        // Validasi input
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'password' => 'nullable|string|min:6', // Password boleh kosong jika tidak ada perubahan
        ]);

        // Jika password diubah, hash password baru
        if ($request->has('password') && !empty($request->password)) {
            $validated['password'] = Hash::make($request->password); // Update password jika ada perubahan
        }

        // Update admin
        $admin->update($validated);

        // Redirect ke halaman daftar admin dengan pesan sukses
        return redirect()->route('users.index')->with('success', 'Admin updated successfully');
    }

    // Form untuk menambah member (create)
    public function createMember()
    {
        return Inertia::render('User/CreateMember');  // Render form untuk menambah member baru
    }

    // Membuat Member
    public function storeMember(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required|email|unique:customers,email',
            'username' => 'required|string|max:255',
            'phone' => 'required|string|max:15|unique:customers,phone',
            'password' => 'required|string|min:6',
        ]);

        // Membuat member baru
        Customer::create([
            'name' => $validated['username'],
            'email' => $validated['email'],
            'phone' => $validated['phone'],
            'password' => Hash::make($validated['password']),
        ]);

        return redirect()->route('members.index')->with('success', 'Member created successfully');
    }

    // Edit Member
    public function edit($id)
    {
        $member = Customer::find($id);

        if (!$member) {
            throw new HttpException(404, 'Member not found');
        }

        return Inertia::render('User/EditMember', [
            'member' => $member
        ]);
    }

    // Update Member
    public function update(Request $request, $id)
    {
        $member = Customer::find($id);

        if (!$member) {
            throw new HttpException(404, 'Member not found');
        }

        // Validasi input
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'password' => 'nullable|string|min:6',
        ]);

        // Jika password diubah, hash password baru
        if ($request->has('password') && !empty($request->password)) {
            $validated['password'] = Hash::make($request->password); // Update password jika ada perubahan
        }

        // Update member
        $member->update($validated);

        return redirect()->route('members.index')->with('success', 'Member updated successfully');
    }

    // Hapus Member
    public function destroy($id)
    {
        $member = Customer::find($id);

        if (!$member) {
            throw new HttpException(404, 'Member not found');
        }

        $member->delete();

        return redirect()->route('members.index')->with('success', 'Member deleted successfully');
    }
}
