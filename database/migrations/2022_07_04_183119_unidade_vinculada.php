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
        Schema::create('unidade_vinculada', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('unidade_principal_id')->unsigned();
            $table->bigInteger('diagnostico_id')->unsigned();
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
        Schema::dropIfExists('unidade_vinculada');
    }
};
