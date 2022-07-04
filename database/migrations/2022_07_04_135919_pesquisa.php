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
        Schema::create('pesquisa', function (Blueprint $table) {
            $table->id();
            $table->tinyInteger('situacao');
            $table->timestamp('data_publicacao');
            $table->integer('publicacao_id');
            $table->integer('encerramento_id');
            $table->bigInteger('questionario_id')->unsigned();
            $table->timestamp('data_encerramento')->nullable();
            $table->foreign('questionario_id')->references('id')->on('questionario')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pesquisa');
    }
};
