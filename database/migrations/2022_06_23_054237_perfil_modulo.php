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

        Schema::create('perfil_modulo', function (Blueprint $table) {
            $table->id();
            $table->foreignId('perfil_id')->constrained()->references('id')->on('perfil')->onUpdate('restrict')->onDelete('restrict');
            $table->foreignId('modulo_id')->constrained()->references('id')->on('modulo')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('perfil_modulo');
    }
};
