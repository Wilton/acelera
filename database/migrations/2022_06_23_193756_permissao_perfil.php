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

        Schema::create('permissao_perfil', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('perfil_id')->unsigned();
            $table->bigInteger('permissao_id')->unsigned();
            $table->foreign('perfil_id')->references('id')->on('perfil')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign('permissao_id')->references('id')->on('permissao')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('permissao_perfil');
    }
};
