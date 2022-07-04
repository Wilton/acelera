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
        Schema::create('portfolio', function (Blueprint $table) {
            $table->id();
            $table->string('nome',100);
            $table->string('ativo',1);
            $table->tinyInteger('tipo');
            $table->foreignId('escritorio_id')->constrained()->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('responsavel_id')->constrained()->references('id')->on('responsavel')->onDelete('restrict')->onUpdate('restrict');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('portfolio');
    }
};
