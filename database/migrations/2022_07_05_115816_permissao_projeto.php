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
        Schema::create('permissao_projeto', function (Blueprint $table) {
            $table->id();
            $table->date('created_at');
            $table->string('ativo', 1)->default('S');
            $table->string('tp_permissao', 1)->nullable()->default('1');
            $table->foreignId('parte_interessada_id')->constrained()->references('id')->on('parte_interessada')->onDelete('cascade');
            $table->foreignId('permissao_id')->constrained()->references('id')->on('permissao')->onDelete('restrict')->onUpdate('restrict');
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
        Schema::dropIfExists('permissao_projeto');
    }
};
