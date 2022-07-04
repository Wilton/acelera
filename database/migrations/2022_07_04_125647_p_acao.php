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
        Schema::create('p_acao', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('projeto_processo_id')->unsigned();
            $table->string('nome',100);
            $table->text('descricao')->nullable();
            $table->date('inicio_previsto')->nullable();
            $table->date('inicio_real')->nullable();
            $table->date('termino_previsto')->nullable();
            $table->date('termino_real')->nullable();
            $table->bigInteger('responsavel_setor_id')->nullable()->default(0)->unsigned();
            $table->string('cancelada',1);
            $table->string('sequencia',10);
            $table->integer('responsavel_id')->nullable();
            $table->foreign('projeto_processo_id')->references('id')->on('projeto_processo')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('responsavel_setor_id')->references('id')->on('setor')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('p_acao');
    }
};
