<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\Api\WebSettingController;
use App\Http\Controllers\ProfileController;

Route::post('/transaction/notifications', [OrderController::class, 'notify'])->name('verify.notifications');
Route::get('/web-settings', [WebSettingController::class, 'getSettings']);
Route::middleware(['auth'])->group(function () {
    Route::post('/profile/update', [ProfileController::class, 'update']);
});
