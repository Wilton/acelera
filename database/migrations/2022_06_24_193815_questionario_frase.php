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
            $table->integer('num_ordem_pergunta');
            $table->string('obrigatoriedade',1);
            $table->foreignId('frase_id')->constrained()->references('id')->on('frase')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('questionario_id')->constrained()->references('id')->on('questionario')->onDelete('restrict')->onUpdate('restrict');
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
