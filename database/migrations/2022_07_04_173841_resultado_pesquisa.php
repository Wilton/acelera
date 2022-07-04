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
        Schema::create('resultado_pesquisa', function (Blueprint $table) {
            $table->id();
            $table->integer('resultado_id');
            $table->text('resposta',1)->nullable();
            $table->string('cpf',11)->nullable();
            $table->foreignId('frase_pesquisa_id')->constrained()->references('id')->on('frase_pesquisa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('questionario_pesquisa_id')->constrained()->references('id')->on('questionario_pesquisa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('resultado_pesquisa');
    }
};
