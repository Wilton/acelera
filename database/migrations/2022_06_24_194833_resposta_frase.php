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
        Schema::create('resposta_frase', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('frase_id')->unsigned();
            $table->bigInteger('resposta_id')->unsigned();
            $table->foreign('frase_id')->references('id')->on('frase')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('resposta_id')->references('id')->on('resposta')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('resposta_frase');
    }
};
