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
        Schema::create('atividade_cronograma_predecessora', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('atividade_cronograma_id')->unsigned();
            $table->bigInteger('projeto_cronograma_id')->unsigned();
            $table->bigInteger('atividade_predecessora_id')->unsigned();
            $table->foreign('atividade_cronograma_id','cronograma')->constrained()->references('id')->on('atividade_cronograma')->onDelete('cascade');
            $table->foreign('projeto_cronograma_id','prjeto')->constrained()->references('id')->on('atividade_cronograma')->onDelete('cascade');
            $table->foreign('atividade_predecessora_id','predecessora')->constrained()->references('id')->on('atividade_cronograma')->onDelete('cascade');
        });
       
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('atividade_cronograma_predecessora');
    }
};
