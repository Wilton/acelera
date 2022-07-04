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
        Schema::create('objetivo', function (Blueprint $table) {
            $table->id();
            $table->string('nome',100);
            $table->string('ativo',1)->nullable()->default('s');
            $table->text('descricao')->nullable();
            $table->bigInteger('codigo_escritorio')->default(0)->unsigned();
            $table->integer('sequencia')->nullable()->default(0);
            $table->foreign('codigo_escritorio')->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('objetivo');
    }
};
