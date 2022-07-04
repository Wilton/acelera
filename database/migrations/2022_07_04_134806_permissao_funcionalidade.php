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
        Schema::create('permissao_funcionalidade', function (Blueprint $table) {
            $table->id();
            $table->string('principal',1);
            $table->string('publicada',1);
            $table->date('data_publicada');
            $table->foreignId('funcionalidade_id')->constrained()->references('id')->on('funcionalidade')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('permissao_id')->constrained()->references('id')->on('permissao')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('permissao_funcionalidade');
    }
};
