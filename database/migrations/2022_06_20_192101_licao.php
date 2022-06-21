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

        Schema::create('licao', function (Blueprint $table) {
            $table->id();
            $table->integer('projeto_id');
            $table->integer('entrega_id')->nullable();
            $table->text('resultados_obtidos')->nullable();
            $table->text('pontos_fortes')->nullable();
            $table->text('pontos_fracos')->nullable();
            $table->text('sugestoes')->nullable();
            $table->integer('associada_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('licao');
    }
};
