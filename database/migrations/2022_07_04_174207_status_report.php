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
        Schema::create('status_report', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('projeto_id')->unsigned();
            $table->date('data_acompanhamento')->nullable();
            $table->text('atividade_concluida')->nullable();
            $table->text('atividade_andamento')->nullable();
            $table->text('motivo_atraso')->nullable();
            $table->text('irregularidade')->nullable();
            $table->integer('marco_id')->nullable();
            $table->date('data_marco_tendencia')->nullable();
            $table->date('data_fim_projeto_tendencia')->nullable();
            $table->tinyInteger('flag_aprovado')->nullable();
            $table->tinyInteger('cor_risco')->nullable();
            $table->text('contramedida')->nullable();
            $table->text('risco')->nullable();
            $table->integer('status_projeto');
            $table->date('data_provacao')->nullable();
            $table->decimal('percentual_concluido',5,2)->nullable()->default(0);
            $table->decimal('percentual_previsto',5,2)->nullable()->default(0);
            $table->integer('dias_projeto')->nullable()->default(0);
            $table->decimal('percentual_marcos',5,2)->nullable()->default(0);
            $table->decimal('percentual_diferenca',5,2)->nullable()->default(0);
            $table->decimal('percentual_custo_real',5,2)->nullable()->default(0);
            $table->bigInteger('custo_real_total')->nullable()->default(0);
            $table->integer('responsavel_aceitacao_id')->default(0);
            $table->string('pgp_assinado',1)->nullable()->default('N');
            $table->string('tep_assinado',1)->nullable()->default('N');
            $table->text('andamento_projeto')->nullable();
            $table->decimal('percentual_concluido_marco',5,2)->nullable();
            $table->integer('dia_atraso')->nullable();
            $table->string('cor_atraso',10)->nullable();
            $table->integer('criterio_farol')->nullable();
            $table->date('fim_projeto')->nullable();
            $table->foreign('projeto_id')->references('id')->on('projeto')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('status_report');
    }
};
