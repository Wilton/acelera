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

        Schema::create('modulo', function (Blueprint $table) {
            $table->id();
            $table->integer('sequencial')->nullable();
            $table->string('nome_item_menu', 30);
            $table->string('url', 50)->nullable();
            $table->string('ativo', 1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('modulo');
    }
};
