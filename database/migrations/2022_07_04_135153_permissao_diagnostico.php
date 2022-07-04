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
            $table->bigInteger('parte_diagnostico_id')->unsigned();
            $table->bigInteger('diagnostico_id')->unsigned();
            $table->bigInteger('recurso_id')->unsigned();
            $table->bigInteger('permissao_id')->unsigned();
            $table->bigInteger('pessoa_id')->unsigned();
            $table->date('data');
            $table->string('ativo',1)->default('S');
            $table->foreign('diagnostico_id')->references('id')->on('diagnostico')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('parte_diagnostico_id')->references('id')->on('parte_diagnostico')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('permissao_id')->references('id')->on('permissao')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('pessoa_id')->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('recurso_id')->references('id')->on('recurso')->onDelete('restrict')->onUpdate('restrict');
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
