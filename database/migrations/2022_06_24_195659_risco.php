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
        Schema::create('risco', function (Blueprint $table) {
            $table->id();
            $table->Integer('projeto_id');
            $table->date('data_deteccao')->nullable();
            $table->text('descricao')->nullable();
            $table->tinyInteger('cor_probabilidade')->nullable();
            $table->tinyInteger('cor_impacto')->nullable();
            $table->tinyInteger('cor_risco')->nullable();
            $table->text('causa')->nullable();
            $table->tinyInteger('ativo')->nullable();
            $table->date('data_encerramento')->nullable();
            $table->integer('tratamento')->nullable();
            $table->string('nome',50)->nullable();
            $table->tinyInteger('aprovado')->nullable();
            $table->date('data_inatividade')->nullable();
            $table->foreignId('etapa_id')->constrained()->references('id')->on('etapa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('origem_risco_id')->constrained()->references('id')->on('origem_risco')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('tipo_risco_id')->constrained()->references('id')->on('tipo_risco')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('risco');
    }
};
