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
        Schema::create('atividade', function (Blueprint $table) {
            $table->id();
            $table->string('atividade',100)->nullable();
            $table->text('descricao')->nullable();
            $table->bigInteger('responsavel_id')->unsigned();
            $table->date('alizacao')->nullable();
            $table->date('inicio')->nullable();
            $table->date('meta')->nullable();
            $table->date('real')->nullable();
            $table->tinyInteger('continua')->nullable();
            $table->integer('percentual_concluido')->nullable();
            $table->tinyInteger('cancelada');
            $table->bigInteger('escritorio_id')->unsigned();
            $table->foreign('escritorio_id')->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('responsavel_id')->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('atividade');
    }
};
