<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Akar extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('akar', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('input');
            $table->decimal('angka', 10, 2, true);
            $table->string('waktu');
            $table->string('jenis');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('akar', function (Blueprint $table) {
            $table->dropColumn('input');
            $table->dropColumn('angka');
            $table->dropColumn('waktu');
            $table->dropColumn('jenis');
        });
    }
}
