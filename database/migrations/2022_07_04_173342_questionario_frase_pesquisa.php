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
        Schema::create('questionario_frase_pesquisa', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('questionario_pesquisa_id')->unsigned();
            $table->bigInteger('frase_pesquisa_id')->unsigned();
            $table->integer('ordem');
            $table->string('obrigatoriedade',1)->default('N');
            $table->foreign('frase_pesquisa_id')->references('id')->on('frase_pesquisa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('questionario_pesquisa_id')->references('id')->on('questionario_pesquisa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questionario_frase_pesquisa');
    }
};
