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

        Schema::create('escritorio_responsaveis', function (Blueprint $table) {
            $table->id();
            $table->string('atibo',1);
            $table->bigInteger('responsavel_id')->unsigned();
            $table->foreign('responsavel_id')->references('id')->on('escritorio')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('escritorio_responsaveis');
    }
};
