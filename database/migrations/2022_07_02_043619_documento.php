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
        Schema::create('documento', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('escritorio_id')->unsigned();
            $table->string('nome',100)->nullable();
            $table->bigInteger('documento_tipo_id')->unsigned();
            $table->string('caminho',50)->nullable();
            $table->date('created_at')->nullable();
            $table->text('observacao')->nullable();
            $table->string('flaativo',1)->nullable();
            $table->foreign('escritorio_id')->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('documento_tipo_id')->references('id')->on('tipo_documento')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('documento');
    }
};
