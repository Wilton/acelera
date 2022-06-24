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
            $table->bigInteger('responsavel_id')->unsigned();
            $table->bigInteger('escritorio_id')->unsigned();
            $table->foreign('escritorio_id')->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('responsavel_id')->references('id')->on('responsavel')->onDelete('restrict')->onUpdate('restrict');

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
