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
        Schema::create('processo', function (Blueprint $table) {
            $table->id();
            $table->string('codigo',20)->nullable();
            $table->string('processo',100)->nullable();
            $table->text('descricao')->nullable();
            $table->integer('dono_id');
            $table->integer('executor_id');
            $table->integer('gestor_id');
            $table->integer('consultor_id');
            $table->integer('validade')->nullable();
            $table->date('updated_at')->nullable();
            $table->foreignId('setor_id')->constrained()->references('id')->on('setor')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('processo');
    }
};
