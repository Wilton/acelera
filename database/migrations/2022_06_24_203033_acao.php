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
            $table->bigInteger('escritorio_id')->default(0)->unsigned();
            $table->date('created_at');
            $table->integer('tipo_risco_id');
            $table->foreign('escritorio_id')->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
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
