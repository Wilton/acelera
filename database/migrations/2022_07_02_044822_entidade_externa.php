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
        Schema::create('entidade_externa', function (Blueprint $table) {
            $table->id();
            $table->string('descricao',200);
            $table->integer('ativo')->default(true);
            $table->foreignId('questionario_diagnostico_id')->constrained()->references('id')->on('questionario_diagnostico')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('secao_id')->references('id')->constrained()->on('secao')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('entidade_externa');
    }
};
