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

        Schema::create('perfil_pessoa', function (Blueprint $table) {
            $table->id();
            $table->integer('pessoa_id');
            $table->string('ativo', 1);
            $table->foreignId('escritorio_id')->references('id')->on('escritorio')->onUpdate('restrict')->onDelete('restrict');
            $table->foreignId('perfil_id')->constrained()->references('id')->on('perfil')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('perfil_pessoa');
    }
};
