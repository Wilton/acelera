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

        Schema::create('aceite_atividade_cronograma', function (Blueprint $table) {
            $table->id();
            $table->integer('entrega_id');
            $table->integer('projeto_id');
            $table->integer('marco_id');
            $table->string('aceito',1);
            $table->integer('pessoa_id')->nullable();
            $table->date('created_at')->nullable();
            $table->foreignid('aceite_id')->constrained()->references('id')->on('aceite')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('aceite_atividade_cronograma');
    }
};
