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

        Schema::create('bloqueio_projeto', function (Blueprint $table) {
            $table->id();
            $table->integer('pessoa_id')->nullable();
            $table->date('data_bloqueio');
            $table->date('data_desbloqueio');
            $table->text('justificativa');
            $table->integer('projeto_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bloqueio_projeto');
    }
};
