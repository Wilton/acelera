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
        Schema::create('pergunta', function (Blueprint $table) {
            $table->id();
            $table->string('descricao',300);
            $table->tinyInteger('tipo');
            $table->boolean('ativa')->default(false);
            $table->bigInteger('questionario_id')->unsigned();
            $table->integer('posicao')->nullable();
            $table->bigInteger('secao_id')->unsigned();
            $table->tinyInteger('tipo_registro')->nullable();
            $table->string('ds_titulo',200)->nullable();
            $table->foreign('secao_id')->references('id')->on('secao')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('questionario_id')->references('id')->on('diagnostico')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pergunta');
    }
};
