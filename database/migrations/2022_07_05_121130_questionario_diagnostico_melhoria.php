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
        Schema::create('questionario_diagnostico_melhoria', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('melhoria_id');
            $table->date('data_melhoria');
            $table->text('melhoria');
            $table->string('flag_abrangencia');
            $table->integer('area_melhoria_id')->nullable();
            $table->integer('situacao_id')->nullable();
            $table->integer('matricula_proponente')->nullable();
            $table->date('dt_resposta');
            $table->bigInteger('objetivo_institucional_id')->unsigned();
            $table->bigInteger('macro_processo_melhorar_id')->unsigned();
            $table->bigInteger('macro_processo_trabalho_id')->unsigned();
            $table->bigInteger('unidade_responsavel_implantacao_id')->unsigned();
            $table->bigInteger('unidade_responsavel_proposta_id')->unsigned();
            $table->foreignId('acao_estrategica_id')->constrained()->references('id')->on('acao')->onDelete('restrict');
            $table->foreignId('diagnostico_id')->constrained()->references('id')->on('diagnostico')->onDelete('cascade');
            $table->foreign('objetivo_institucional_id','objetivo')->references('id')->on('objetivo')->onDelete('restrict');
            $table->foreign('macro_processo_melhorar_id','macro')->constrained()->references('id')->on('processo')->onDelete('restrict');
            $table->foreign('macro_processo_trabalho_id','marcro_trabalho')->constrained()->references('id')->on('processo')->onDelete('restrict');
            $table->foreign('unidade_responsavel_implantacao_id','unidade')->constrained()->references('id')->on('unidade_vinculada')->onDelete('restrict');
          //  $table->foreign('diagnostico_id')->constrained()->references('id')->on('unidade_vinculada')->onDelete('restrict');
            $table->foreignId('unidade_principal_id')->constrained()->references('id')->on('unidade_vinculada')->onDelete('restrict');
            $table->foreign('unidade_responsavel_proposta_id','responsavel')->constrained()->references('id')->on('unidade_vinculada')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questionario_diagnostico_melhoria');
    }
};
