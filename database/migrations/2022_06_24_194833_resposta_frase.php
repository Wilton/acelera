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
        Schema::create('resposta_frase', function (Blueprint $table) {
            $table->id();
            $table->foreignId('frase_id')->constrained()->references('id')->on('frase')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('resposta_id')->constrained()->references('id')->on('resposta')->onDelete('restrict')->onUpdate('restrict');
        });
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('resposta_frase');
    }
};
