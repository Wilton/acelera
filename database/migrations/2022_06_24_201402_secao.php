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
        Schema::create('secao', function (Blueprint $table) {
            $table->id();
            $table->string('descricao',200)->nullable();
            $table->boolean('ativa')->default(true);
            $table->string('tipo_questionario',1);
            $table->boolean('macro_processo')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('secao');
    }
};
