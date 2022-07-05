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
        Schema::create('atividade_cronograma', function (Blueprint $table) {
            $table->id();
            $table->string('atividade_cronograma', 255);
            $table->tinyInteger('tipo_atividade');
            $table->text('observacao')->nullable();
            $table->integer('numerto_dias');
            $table->bigInteger('valor_atividade_baseline')->nullable()->default(0);
            $table->bigInteger('valor_atividade')->nullable()->default(0);
            $table->integer('folga')->nullable()->default(0);;
            $table->text('criterio_aceitacao')->nullable();
            $table->date('data_inicio_baseline')->nullable();
            $table->date('data_fim_baseline')->nullable();
            $table->string('flag_aquisicao', 1)->nullable();
            $table->string('flag_informatica', 1)->nullable();
            $table->string('flag_cancelada', 1)->nullable();
            $table->date('data_inicio')->nullable();
            $table->date('data_fim')->nullable();
            $table->decimal('percentual_concluido',5,2)->nullable();
            $table->integer('dias_baseline')->nullable();
            $table->integer('dias_realizados')->nullable()->default(0);
            $table->integer('sequencia')->default(0);
            $table->string('flag_ordenacao',1)->default('S');
            $table->date('data_atividade_concluida')->nullable();
            $table->foreignId('elemento_despesa_id')->constrained()->references('id')->on('elemento_despesa')->onDelete('restrict')->onUpdate('cascade');
            $table->foreignId('marco_anterior_id')->constrained()->references('id')->on('atividade_cronograma')->onDelete('restrict')->onUpdate('cascade');
            $table->foreignId('projeto_id')->constrained()->references('id')->on('atividade_cronograma')->onDelete('cascade')->onUpdate('restrict');
            $table->foreignId('grupo_id')->constrained()->references('id')->on('atividade_cronograma')->onDelete('cascade')->onUpdate('restrict');
            $table->foreignId('responsavel_id')->constrained()->references('id')->on('parte_interessada');
            $table->foreignId('parte_interessada_id')->constrained()->references('id')->on('parte_interessada');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('atividade_cronograma');
    }
};
