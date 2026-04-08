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
        Schema::table('reservations', function (Blueprint $table) {
            // Note: status column is a string, so we can just use 'cancelled' 
            // no schema change needed, this migration serves as documentation.
        });
    }

    public function down(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
            // No reverse action needed
        });
    }
};
