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
        Schema::create('parte_interessada', function (Blueprint $table) {
            $table->id();
            $table->string('parte_interessada',100)->nullable();
            $table->string('funcao',300)->nullable();
            $table->string('telefone',50)->nullable();
            $table->string('email',50)->nullable();
            $table->string('nivel_influencia',10)->nullable();
            $table->string('observacao',200)->nullable();
            $table->string('tp_permissao',1)->nullable()->default('1');
            $table->foreignId('pessoa_interna_id')->constrained()->references('id')->on('pessoa');
            $table->foreignId('projeto_id')->constrained()->references('id')->on('projeto');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('parte_interessada');
    }
};
