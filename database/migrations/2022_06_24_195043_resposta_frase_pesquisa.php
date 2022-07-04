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
        Schema::create('respostafrase_pesquisa', function (Blueprint $table) {
            $table->id();
            $table->foreignId('frase_pesquisa_id')->constrained()->references('id')->on('frase_pesquisa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('resposta_pesquisa_id')->constrained()->references('id')->on('resposta_pesquisa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('respostafrase_pesquisa');
    }
};
