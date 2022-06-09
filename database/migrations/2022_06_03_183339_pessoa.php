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
        Schema::create('pessoa', function (Blueprint $table) {
            $table->id();
            $table->string('nome',100);
            $table->text('observacao');
            $table->string('telefone_fixo',16);
            $table->string('email',100);
            $table->integer('matricula');
            $table->string('funcao',50);
            $table->integer('unidade_id');
            $table->string('cargo',10);
            $table->integer('servidor_id');
            $table->string('agenda',1);
            $table->string('cpf',11);
            $table->integer('siape');
            $table->string('versaosistema',10);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pessoa');
    }
};
