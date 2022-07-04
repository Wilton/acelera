<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('portfolio_programa', function (Blueprint $table) {
            $table->id();
            $table->foreignId('portfolio_id')->constrained()->references('id')->on('portfolio')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('programa_id')->constrained()->references('id')->on('programa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('portifolio_programa');
    }
};
