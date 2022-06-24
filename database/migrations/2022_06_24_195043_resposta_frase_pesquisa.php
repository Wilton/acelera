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
        Schema::create('respostafrase_pesquisa', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('frase_pesquisa_id')->unsigned();
            $table->bigInteger('resposta_pesquisa_id')->unsigned();
            $table->foreign('frase_pesquisa_id')->references('id')->on('frase_pesquisa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('resposta_pesquisa_id')->references('id')->on('resposta_pesquisa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('respostafrase_pesquisa');
    }
};
