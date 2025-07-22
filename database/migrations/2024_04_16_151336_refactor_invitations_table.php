<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('invitations', function (Blueprint $table) {
            $table->dropColumn('title');
            $table->dropColumn('groom');
            $table->dropColumn('bride');
            $table->dropColumn('groom_photo');
            $table->dropColumn('bride_photo');
            $table->dropColumn('groom_desc');
            $table->dropColumn('bride_desc');
            $table->dropColumn('wedding_date');
            $table->dropColumn('location');
            $table->dropColumn('gallery');
            $table->dropColumn('qr_code');

            $table->longText('data')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('invitations', function (Blueprint $table) {
            $table->string('title')->nullable();
            $table->string('groom')->nullable();
            $table->string('bride')->nullable();
            $table->string('groom_photo')->nullable();
            $table->string('bride_photo')->nullable();
            $table->text('groom_desc')->nullable();
            $table->text('bride_desc')->nullable();
            $table->date('wedding_date')->nullable();
            $table->string('location')->nullable();
            $table->text('gallery')->nullable();
            $table->string('qr_code')->nullable();

            $table->dropColumn('data');
        });
    }
};
