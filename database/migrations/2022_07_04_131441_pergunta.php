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
            $table->integer('posicao')->nullable();
            $table->tinyInteger('tipo_registro')->nullable();
            $table->string('ds_titulo',200)->nullable();
            $table->foreignId('secao_id')->constrained()->references('id')->on('secao')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('questionario_id')->constrained()->references('id')->on('diagnostico')->onDelete('restrict')->onUpdate('restrict');
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
