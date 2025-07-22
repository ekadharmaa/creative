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
        Schema::create('invitations', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid');
            $table->bigInteger('customer_id')->unsigned();
            $table->string('order_id');
            $table->string('slug')->unique();
            $table->string('template');
            $table->string('title')->nullable();
            $table->string('groom')->nullable();
            $table->string('bride')->nullable();
            $table->string('groom_photo')->nullable();
            $table->string('bride_photo')->nullable();
            $table->string('groom_desc')->nullable();
            $table->string('bride_desc')->nullable();
            $table->date('wedding_date')->nullable();
            $table->longText('gallery')->nullable();
            $table->text('location')->nullable();
            $table->text('qr_code')->nullable();
            $table->text('music')->nullable();
            $table->timestamps();

            $table->foreign('customer_id')->references('id')->on('customers')->onDelete('cascade');
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invitations');
    }
};
