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
            $table->bigInteger('secao_id')->unsigned();
            $table->integer('ativo')->default(true);
            $table->bigInteger('questionario_diagnostico_id')->unsigned();
            $table->foreign('questionario_diagnostico_id')->references('id')->on('questionario_diagnostico')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('secao_id')->references('id')->on('secao')->onDelete('restrict')->onUpdate('restrict');
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
