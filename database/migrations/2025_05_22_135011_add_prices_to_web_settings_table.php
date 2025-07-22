<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('web_settings', function (Blueprint $table) {
            $table->integer('basic_price')->default(50000);
            $table->integer('premium_price')->default(80000);
        });
    }

    public function down(): void
    {
        Schema::table('web_settings', function (Blueprint $table) {
            $table->dropColumn(['basic_price', 'premium_price']);
        });
    }
};

