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
        Schema::create('comentario', function (Blueprint $table) {
            $table->id();
            $table->string('comentario',400);
            $table->timestamp('data_comentario');
            $table->foreignId('atividade_cronograma_id')->constrained()->references('id')->on('atividade_cronograma')->onDelete('cascade');
            $table->foreignId('projeto_id')->constrained()->references('id')->on('projeto')->onDelete('cascade');
            $table->foreignId('pessoa_id')->constrained()->references('id')->on('pessoa')->onDelete('cascade');
          
        });
    }

    
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comentario');
    }
};
