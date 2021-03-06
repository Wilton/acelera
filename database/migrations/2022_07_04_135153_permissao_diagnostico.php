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
        Schema::create('permissao_diagnostico', function (Blueprint $table) {
            $table->id();
            $table->date('data');
            $table->string('ativo',1)->default('S');
            $table->foreignId('diagnostico_id')->constrained()->references('id')->on('diagnostico')->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId('parte_diagnostico_id')->constrained()->references('id')->on('parte_diagnostico')->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId('permissao_id')->constrained()->references('id')->on('permissao')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('pessoa_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
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
        Schema::dropIfExists('permissao_diagnostico');
    }
};
