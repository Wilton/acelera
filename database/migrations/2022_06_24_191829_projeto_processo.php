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
        Schema::create('projeto_processo', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('processo_id')->unsigned();
            $table->tinyInteger('ano')->nullable();
            $table->tinyInteger('situacao')->nullable();
            $table->date('data_situacao')->nullable();
            $table->integer('responsavel_id')->nullable();
            $table->text('descricao')->nullable();
            $table->date('data_inicio_previsto')->nullable();
            $table->date('data_termino_previsto')->nullable();
            $table->integer('valor_orcamento');
            $table->foreign('processo_id')->references('id')->on('processo')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('projeto_processo');
    }
};
