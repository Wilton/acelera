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
        Schema::create('assina_documento', function (Blueprint $table) {
            $table->id();
            $table->timestamp('assinado');
            $table->integer('tipo_doc');
            $table->string('hash_doc',100);
            $table->string('situacao',1);
            $table->string('funcao',1);
            $table->foreignId('pessoa_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('projeto_id')->constrained()->references('id')->on('projeto')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('aceite_id')->constrained()->references('id')->on('aceite')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('assina_documento');
    }
};
