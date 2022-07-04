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
        Schema::create('projeto', function (Blueprint $table) {
            $table->id();
            $table->string('codigo', 50)->nullable();
            $table->string('sigla', 20)->nullable();
            $table->string('nome', 100)->nullable();
            $table->text('descricao')->nullable();
            $table->text('objetivo')->nullable();
            $table->date('data_inicio')->nullable();
            $table->date('data_fim')->nullable();
            $table->integer('periodicidade_atualizacao')->nullable();
            $table->integer('criterio_farol')->nullable();
            $table->string('tipo_projeto', 20)->nullable();
            $table->string('publicado', 1)->nullable();
            $table->string('aprovado', 1)->nullable();
            $table->text('resultados_obtidos')->nullable();
            $table->text('pontos_fortes')->nullable();
            $table->text('pontos_fracos')->nullable();
            $table->text('sugestoes')->nullable();
            $table->text('escritorio_id')->nullable();
            $table->string('alta_gestao', 1)->nullable();
            $table->string('copa', 1)->nullable();
            $table->bigInteger('valor_orcamento_disponivel')->nullable()->default(0);
            $table->text('justificativa')->nullable();
            $table->date('data_inicio_plano')->nullable();
            $table->date('data_fim_plano')->nullable();
            $table->text('escopo')->nullable();
            $table->text('nao_escopo')->nullable();
            $table->text('premissa')->nullable();
            $table->text('restricao')->nullable();
            $table->integer('sequencia_projeto')->nullable();
            $table->integer('ano_projeto')->nullable();
            $table->text('consideracao_final')->nullable();
            $table->string('proponente', 100)->nullable();
            $table->integer('status_projeto');
            $table->tinyInteger('ano');
            $table->decimal('percentual_concluido', 5, 0)->nullable()->default(0);
            $table->decimal('percentual_previsto', 5, 0)->nullable()->default(0);
            $table->string('processo_sei', 20)->nullable();
            $table->string('atraso', 20)->nullable()->default(0);
            $table->decimal('percentual_concluido_marco', 5, 2)->nullable();
            $table->string('cor_atraso', 10)->nullable();
            $table->decimal('qtde_atividade_iniciada', 5, 2)->nullable()->default(0);
            $table->decimal('percentual_iniciado', 5, 2)->nullable()->default(0);
            $table->decimal('qtnde_atividade_nao_iniciada', 5, 2)->nullable()->default(0);
            $table->decimal('percentual_nao_iniciado', 5, 2)->nullable()->default(0);
            $table->decimal('qtde_atividade_concluida', 5, 2)->nullable()->default(0);
            $table->decimal('num_percentual_atividade_concluido', 5, 2)->nullable()->default(0);
            $table->foreignId('acao_id')->constrained()->references('id')->on('acao')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('gerente_adjunto_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('demandante_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('gerente_projeto_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('patrocinador_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            # $table->foreignId('patrocinador_id')->constrained('fk_projeto_pesssoa_patrocinador')->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('natureza_id')->constrained()->references('id')->on('natureza')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('objetivo_id')->constrained()->references('id')->on('objetivo')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('programa_id')->constrained()->references('id')->on('programa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('setor_id')->constrained()->references('id')->on('setor')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('tipo_iniciativa_id')->constrained()->references('id')->on('tipo_iniciativa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('projeto');
    }
};
