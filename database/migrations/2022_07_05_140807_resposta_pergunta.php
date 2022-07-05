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
        Schema::create('resposta_pergunta', function (Blueprint $table) {
            $table->id();
            $table->text('resposta_descritiva')->nullable();
            $table->bigInteger('nr_questionario');
            $table->foreignId('resposta_id')->constrained()->references('id')->on('resposta')->onDelete('cascade');
            $table->foreignId('pergunta_id')->constrained()->references('id')->on('pergunta')->onDelete('cascade');
            $table->foreignId('diagnostico_id')->constrained()->references('id')->on('diagnostico')->onDelete('cascade');
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
        Schema::dropIfExists('resposta_pergunta');
    }
};
