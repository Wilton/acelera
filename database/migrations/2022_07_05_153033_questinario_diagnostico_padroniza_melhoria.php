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
        Schema::create('questinario_diagnostico_padroniza_melhoria', function (Blueprint $table) {
            $table->id();
            $table->text('revisada');
            $table->integer('prazo_id');
            $table->integer('impacto_id');
            $table->integer('esforco_id');
            $table->decimal('pontuacao',5,2)->nullable();
            $table->decimal('incidencia',5,2)->nullable();
            $table->integer('votacao');
            $table->boolean('flag_agrupadora')->nullable();
            $table->text('titulo_grupo')->nullable();
            $table->text('informacoes_complementares')->nullable();
            $table->bigInteger('melhoria_agrupadora')->nullable();
            $table->foreignId('melhoria_id')->constrained()->references('id')->on('questionario_diagnostico_melhoria')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questinario_diagnostico_padroniza_melhoria');
    }
};
