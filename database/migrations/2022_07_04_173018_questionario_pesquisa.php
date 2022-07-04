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
        Schema::create('questionario_pesquisa', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('pesquisa_id')->unsigned();
            $table->string('nome',255)->nullable();
            $table->text('observacao')->nullable();
            $table->bigInteger('tipo_questionario')->nullable();
            $table->bigInteger('escritorio_id')->unsigned();
            $table->foreign('escritorio_id')->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('pesquisa_id')->references('id')->on('pesquisa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questionario_pesquisa');
    }
};
