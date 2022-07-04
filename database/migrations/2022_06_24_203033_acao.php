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
        Schema::create('acao', function (Blueprint $table) {
            $table->id();
            $table->integer('obejtivo_id');
            $table->string('nome',100);
            $table->string('ativo',1)->default('s');
            $table->text('descricao')->nullable();
            $table->date('created_at');
            $table->integer('tipo_risco_id');
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
        Schema::dropIfExists('acao');
    }
};
