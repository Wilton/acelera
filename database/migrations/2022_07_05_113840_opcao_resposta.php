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
        Schema::create('opcao_resposta', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('resposta_id');
            $table->string('resposta',300)->nullable();
            $table->integer('escala')->nullable();
            $table->integer('ordenacao')->nullable();
            $table->foreignId('pergunta_id')->constrained()->references('id')->on('pergunta')->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId('questionario_id')->constrained()->references('id')->on('questionario')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('opcao_resposta');
    }
};
