<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
use App\Http\Controllers\WebController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\InvitationController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\InvitationGuestController;
use App\Http\Controllers\TemplatePreviewController;
use App\Http\Controllers\Admin\WebSettingController;
use App\Http\Controllers\Auth\MemberLoginController;
use App\Http\Middleware\AuthenticateAdmin;
use App\Http\Middleware\AuthenticateMember;
use App\Http\Controllers\BackupController;


// WEB ROUTE
Route::get('/', [WebController::class, 'index'])->name('web.index');
Route::get('/checkout', [WebController::class, 'showCheckout'])->name('web.showCheckout');
Route::get('/template', [WebController::class, 'showTemplate'])->name('web.showTemplate');
Route::get('/price', [WebController::class, 'showPrice'])->name('web.showPrice');
Route::get('/tutorial', [WebController::class, 'showTutorial'])->name('web.showTutorial');

Route::post('/checkout', [WebController::class, 'checkout'])->name('web.checkout');
Route::post('/reset-session', [WebController::class, 'resetSession'])->name('web.resetSession');

// Admin Routes
Route::middleware(AuthenticateAdmin::class)->prefix('admin')->group(function () {

    // Dashboard
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('admin.dashboard');

    // Profile Routes
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Orders Management
    Route::get('/orders', [OrderController::class, 'index'])->name('orders.index');
    Route::get('/orders/add', [OrderController::class, 'addForm'])->name('orders.add');
    Route::get('/orders/{id}', [OrderController::class, 'editForm'])->name('orders.edit');
    Route::put('/orders/{id}', [OrderController::class, 'update'])->name('orders.update');
    Route::delete('/orders/{id}', [OrderController::class, 'destroy'])->name('orders.destroy');
    // Route::delete('/admin/orders/{id}', [OrderController::class, 'destroy'])->name('orders.destroy');

    // Users & Members Management
    Route::get('/users', [UserController::class, 'index'])->name('users.index');
    Route::get('/users/add', [UserController::class, 'createAdmin'])->name('user.add');
    Route::post('/users/store', [UserController::class, 'storeAdmin'])->name('user.store');
    Route::get('/members', [UserController::class, 'index'])->name('members.index');
    Route::get('/members/add', [UserController::class, 'createMember'])->name('members.add');
    Route::post('/members/store', [UserController::class, 'storeMember'])->name('members.store');
    Route::get('/members/{id}', [UserController::class, 'edit'])->name('members.edit');
    Route::put('/members/{id}', [UserController::class, 'update'])->name('members.update');
    Route::delete('/members/{id}', [UserController::class, 'destroy'])->name('members.destroy');
    Route::delete('/admin/users/{id}', [UserController::class, 'destroyAdmin'])->name('users.destroy');
    Route::get('/admin/users/{id}/edit', [UserController::class, 'editAdmin'])->name('users.edit');
    Route::put('/admin/users/{id}', [UserController::class, 'updateAdmin'])->name('users.update');




    // Web Settings
    Route::get('/web-settings/edit', [WebSettingController::class, 'edit'])->name('web-settings.edit');
    Route::post('/web-settings/update', [WebSettingController::class, 'update'])->name('web-settings.update');

    // Reports
    Route::get('/reports', [ReportController::class, 'index'])->name('reports.index');
    Route::get('/report/export/{type}', [ReportController::class, 'export'])->name('report.export');
    Route::get('/report/export/{type}', [\App\Http\Controllers\ReportController::class, 'export'])->name('report.export');
    Route::get('/database/backup', [\App\Http\Controllers\BackupController::class, 'export'])->name('database.backup');
    // Route::post('/database/backup', [BackupController::class, 'backup'])->name('database.backup');

});

// Member Routes
Route::prefix('member')->group(function () {
    Route::get('login', [MemberLoginController::class, 'showLoginForm'])->name('member.login');
    Route::post('signin', [MemberLoginController::class, 'login'])->name('member.signin');
    Route::get('register', [MemberLoginController::class, 'showRegisterForm'])->name('member.register');
    Route::post('signup', [MemberLoginController::class, 'register'])->name('member.signup');
});

Route::middleware(AuthenticateMember::class)->group(function () {
    Route::prefix('member')->group(function () {
        Route::get('dashboard', [MemberController::class, 'index'])->name('member.dashboard');
        Route::get('invitation/{slug}', [MemberController::class, 'showInvitation'])->name('member.invitation');
        Route::post('invitation/{uuid}', [InvitationController::class, 'update'])->name('member.invitation.update');
        Route::post('invitation/{slug}/guests', [InvitationGuestController::class, 'addGuest'])->name('member.invitation.guests');
        Route::delete('invitation/guests/{id}', [InvitationGuestController::class, 'destroy'])->name('member.invitation.guests.destroy');

        // Image Upload
        Route::post('image-upload', [ImageController::class, 'uploadImage'])->name('member.image-upload');
        Route::post('image-upload-bulk', [ImageController::class, 'uploadBulkImage'])->name('member.image-upload.bulk');
        Route::post('image-delete', [ImageController::class, 'deleteFromBulk'])->name('member.image-delete');

        // File Upload
        Route::post('file-upload', [FileController::class, 'uploadFile'])->name('member.file-upload');

        // logout
        Route::post('logout', [MemberLoginController::class, 'logout'])->name('member.logout');
    });
});

// Orders Routes for Non-admin (Accessible to members as well)
Route::post('/orders', [OrderController::class, 'create'])->name('orders.create');

// Template Preview
Route::get('/preview/{template_slug}', [TemplatePreviewController::class, 'index'])->name('template.index');

// Invitations Routes
Route::get('/undangan/{slug}', [InvitationController::class, 'index'])->name('invitation.index');
Route::post('/undangan/rsvp/{slug}', [InvitationGuestController::class, 'rsvp'])->name('invitation.rsvp');
Route::post('/undangan/custom-domain/{uuid}', [InvitationController::class, 'updateCustomDomain'])->name('invitation.updateDomain');

require __DIR__ . '/auth.php';
