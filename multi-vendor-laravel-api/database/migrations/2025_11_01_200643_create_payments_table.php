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
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('transaction_id')->nullable();
            $table->enum('method', ['sslcommerz', 'stripe', 'paypal', 'cod']);
            $table->decimal('amount', 10, 2);
            $table->string('currency', 10)->default('BDT');
            $table->enum('status', ['pending', 'success', 'failed', 'refunded'])->default('pending');
            $table->dateTime('payment_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
