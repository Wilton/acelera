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

        Schema::create('permissao', function (Blueprint $table) {
            $table->id();
            $table->string('descricao',200)->nullable();
            $table->string('nome', 50)->nullable();
            $table->boolean('visualizar')->default(false)->nullable();
            $table->string('tipo',1)->nullable();
            $table->foreignId('recurso_id')->constrained()->references('id')->on('recurso')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('permissao');
    }
};
