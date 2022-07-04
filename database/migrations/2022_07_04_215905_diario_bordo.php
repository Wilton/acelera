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
        Schema::create('diario_bordo', function (Blueprint $table) {
            $table->id();
            $table->date('diario_bordo_data')->nullable();
            $table->string('referencia',20)->nullable();
            $table->tinyInteger('semafaro')->nullable();
            $table->text('diario_bordo');
            $table->foreignId('alterador_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('projeto_id')->constrained()->references('id')->on('projeto')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('diario_bordo');
    }
};
