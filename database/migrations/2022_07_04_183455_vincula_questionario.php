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
        Schema::create('vincula_questionario', function (Blueprint $table) {
            $table->id();
            $table->string('disponivel',1)->default(2);
            $table->date('disponibilidade');
            $table->date('encerrramento')->nullable();
            $table->foreignId('diagnostico_id')->constrained()->references('id')->on('diagnostico')->onDelete('restrict')->onUpdate('restrict');
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
        Schema::dropIfExists('vincula_questionario');
    }
};
