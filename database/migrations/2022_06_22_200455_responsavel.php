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
        Schema::create('responsavel', function (Blueprint $table) {
            $table->id();
            $table->string('nome', 100);
            $table->text('observacao')->nullable();
            $table->string('telefone_fixo', 16)->nullable();
            $table->string('email', 100)->nullable();
            $table->integer('matricula')->nullable();
            $table->string('funcao', 50)->nullable();
            $table->integer('unidade_id')->nullable();
            $table->string('cargo', 10);
            $table->integer('servidor_id')->nullable();
            $table->string('agenda', 1);
            $table->string('cpf', 11);
            $table->integer('siape');
            $table->string('versaosistema', 10);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('responsavel');
    }
};
