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
        Schema::create('historico_publicacao', function (Blueprint $table) {
            $table->id();
            $table->timestamp('publicacao')->nullable();
            $table->timestamp('encerramento')->nullable();
            $table->foreignId('pesquisa_id')->constrained()->references('id')->on('pesquisa')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('historico_publicacao');
    }
};
