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
        Schema::create('linha_tempo', function (Blueprint $table) {
            $table->id();
            $table->string('funcao_projeto',300);
            $table->string('tp_acao',1);
            $table->timestamp('dt_acao');
            $table->foreignId('pessoa_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('projeto_id')->constrained()->references('id')->on('projeto')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('recurso_id')->constrained()->references('id')->on('recurso')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('linha_tempo');
    }
};
