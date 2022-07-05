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
        Schema::create('resposta_questionarior_diagnostico', function (Blueprint $table) {
            $table->id();
            $table->foreignId('diagnostico_id')->constrained()->references('id')->on('questionario_diagnostico_respondido')->onDelete('cascade');
            $table->foreignId('questionario_id')->constrained()->references('id')->on('questionario_diagnostico_respondido')->onDelete('cascade');
            $table->foreignId('numero')->constrained()->references('id')->on('questionario_diagnostico_respondido')->onDelete('cascade');
            $table->foreignId('id_resposta_pergunta')->constrained()->references('id')->on('resposta_pergunta')->onDelete('cascade');
        });
       
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('resposta_questionarior_diagnostico');
    }
};
