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
        Schema::create('diagnostico', function (Blueprint $table) {
            $table->id();
            $table->string('descricao',100);
            $table->integer('unidade_principal_id');
            $table->date('created_at')->nullable();
            $table->date('encerramento')->nullable();
            $table->date('cadastro');
            $table->boolean('ativo')->default(true);
            $table->integer('diagnostico');
            $table->integer('ano');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('diagnostico');
    }
};
