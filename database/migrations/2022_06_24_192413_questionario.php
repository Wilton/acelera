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
        Schema::create('questionario', function (Blueprint $table) {
            $table->id();
            $table->string('nome',255)->nullable();
            $table->text('observacao')->nullable();
            $table->tinyInteger('tipo')->nullable();
            $table->tinyInteger('disponivel');
            $table->foreignId('escritorio_id')->constrained()->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questionario');
    }
};
