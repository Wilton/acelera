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
        Schema::create('parte_diagnostico', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('diagnostico_id')->unsigned();
            $table->string('qualificacao',1)->nullable()->default('1');
            $table->string('tp_permissao',1)->nullable()->default('1');
            $table->integer('pessoa_id');
            $table->foreign('diagnostico_id')->references('id')->on('diagnostico')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('parte_diagnostico');
    }
};
