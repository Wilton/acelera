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
        Schema::create('contramedida', function (Blueprint $table) {
            $table->id();
            $table->text('descricao')->nullable();
            $table->date('contramedida_prazo')->nullable();
            $table->date('contramedida_prazo_atraso')->nullable();
            $table->tinyInteger('contramedida_status')->nullable();
            $table->tinyInteger('contramedida_efetiva')->nullable();
            $table->string('responsavel_descricao',100)->nullable();
            $table->integer('contramedida_tipo_id');
            $table->string('nome',100)->nullable();
            $table->foreignId('risco_id')->constrained()->references('id')->on('risco')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contramedida');
    }
};
