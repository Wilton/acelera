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
        Schema::create('questionario_diagnostico_respondido', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('numero');
            $table->date('dt_resposta');
            $table->foreignId('questionario_id')->constrained()->references('id')->on('questionario')->onDelete('cascade');
            $table->foreignId('diagnostico_id')->constrained()->references('id')->on('diagnostico')->onDelete('cascade');
        });
       
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questionario_diagnostico_respondido');
    }
};
