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

        Schema::create('escritorio', function (Blueprint $table) {
            $table->id();
            $table->string('nome',100);
            $table->string('ativo',1);
            $table->string('email',100)->nullable();
            $table->string('telefone',16)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('escritorio');
    }
};
