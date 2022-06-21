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

        Schema::create('programa', function (Blueprint $table) {
            $table->id();
            $table->string('nome',100);
            $table->text('descricao');
            $table->string('flag_ativo',1);
            $table->integer('responsavel_id')->nullable();
            $table->integer('simpr_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('programa');
    }
};
