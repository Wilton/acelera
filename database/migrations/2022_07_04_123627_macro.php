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
        Schema::create('marco', function (Blueprint $table) {
            $table->id();
            $table->integer('projeto_id');
            $table->integer('sequencia');
            $table->string('nome',100)->nullable();
            $table->date('planejado')->nullable();
            $table->date('previsto')->nullable();
            $table->date('encerrado')->nullable();
            $table->foreignId('responsavel_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('marco');
    }
};
