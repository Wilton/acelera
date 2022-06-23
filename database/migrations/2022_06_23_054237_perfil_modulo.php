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

        Schema::create('perfil_modulo', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('perfil_id')->unsigned();
            $table->bigInteger('modulo_id')->unsigned();
            $table->foreign('perfil_id')->references('id')->on('perfil')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign('modulo_id')->references('id')->on('modulo')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('perfil_modulo');
    }
};
