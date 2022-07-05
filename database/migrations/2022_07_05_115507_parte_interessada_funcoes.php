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
        Schema::create('parte_interessada_funcoes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('parte_interessada_funcao_id')->constrained()->references('id')->on('parte_interessada_funcao');
            $table->foreignId('parte_interessada_id')->constrained()->references('id')->on('parte_interessada');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('parte_interessada_funcoes');
    }
};
