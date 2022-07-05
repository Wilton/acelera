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
        Schema::create('atividade_ocultar', function (Blueprint $table) {
            $table->id();
            $table->integer('projeto_id');
            $table->integer('atividade_cronograma_id');
            $table->date('data_cadastro')->nullable()->default(now());
            $table->foreignId('pessoa_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('atividade_ocultar');
    }
};
