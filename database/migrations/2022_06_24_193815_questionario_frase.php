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
        Schema::create('questionario_frase', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('frase_id')->unsigned();
            $table->bigInteger('questionario_id')->unsigned();
            $table->integer('num_ordem_pergunta');
            $table->string('obrigatoriedade',1);
            $table->foreign('frase_id')->references('id')->on('frase')->onDelete('restrict')->onUpdate('restrict');
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
        Schema::dropIfExists('questionario_frase');
    }
};
