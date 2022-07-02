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
        Schema::create('aquisicao', function (Blueprint $table) {
            $table->id();
            $table->string('aquisicao',100)->nullable();
            $table->integer('projeto_id');
            $table->integer('entrega_id');
            $table->string('contrato',100)->nullable();
            $table->string('fornecedor',100)->nullable();
            $table->integer('valor');
            $table->date('aquisicao_prazo');
            $table->string('quantidade',20);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('aquisicao');
    }
};
