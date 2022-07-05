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
        Schema::create('comunicacao', function (Blueprint $table) {
            $table->id();
            $table->integer('projeto_id');
            $table->string('informacao', 255)->nullable();
            $table->string('informado', 255)->nullable();
            $table->string('origem', 255)->nullable();
            $table->string('frequencia', 255)->nullable();
            $table->string('transmissao', 255)->nullable();
            $table->string('armazenamento', 255)->nullable();
            $table->string('responsavel', 255)->nullable();
            $table->foreignId('responsavel_id')->constrained()->references('id')->on('parte_interessada')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comunicacao');
    }
};
