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

        Schema::create('frase_pesquisa', function (Blueprint $table) {
            $table->id();
            $table->tinyInteger('tipo')->nullable();
            $table->string('ativo',1)->nullable();
            $table->string('descricao', 255)->nullable();
            $table->foreignId('escritorio_id')->constrained()->references('id')->on('escritorio')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('frase_pesquisa');
    }
};
