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

        Schema::create('evento_avaliacao', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('evento_id')->unsigned();
            $table->text('destaque')->nullable();
            $table->text('observacao')->nullable();
            $table->integer('avaliador_id')->nullable();
            $table->integer('avaliado_id')->nullable();
            $table->integer('pontualidade')->nullable();
            $table->integer('ordem')->nullable();
            $table->integer('respeito_chefia')->nullable();
            $table->integer('respeito_colega')->nullable();
            $table->integer('urbanidade')->nullable();
            $table->integer('equilibrio')->nullable();
            $table->integer('comprometimento')->nullable();
            $table->integer('esforco')->nullable();
            $table->integer('trabalho_equipe')->nullable();
            $table->integer('auxiliou_equipe')->nullable();
            $table->integer('aceitou_sugestao')->nullable();
            $table->integer('conhecimento_norma')->nullable();
            $table->integer('alternativa_problema')->nullable();
            $table->integer('iniciativa')->nullable();
            $table->integer('tarefa_complexa')->nullable();
            $table->integer('nota_avaliador')->nullable();
            $table->integer('media')->nullable();
            $table->integer('media_final')->nullable();
            $table->integer('total_avaliado')->nullable();
            $table->bigInteger('tipo_avaliacao_id')->unsigned();
            $table->foreign('evento_id')->references('id')->on('evento')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign('tipo_avaliacao_id')->references('id')->on('tipo_avaliacao')->onUpdate('restrict')->onDelete('restrict');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('evento_avaliacao');
    }
};
