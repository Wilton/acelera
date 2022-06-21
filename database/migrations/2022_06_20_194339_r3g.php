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

        Schema::create('r3g', function (Blueprint $table) {
            $table->id();
            $table->integer('projeto_id')->nullable();
            $table->date('deteccao_data')->nullable();
            $table->text('planejado')->nullable();
            $table->text('realizado')->nullable();
            $table->text('causa')->nullable();
            $table->text('consequencia')->nullable();
            $table->text('contramedida')->nullable();
            $table->date('data_prazo_contramedida')->nullable();
            $table->date('data_prazo_contramedida_atraso')->nullable();
            $table->string('responsavel',100)->nullable();
            $table->text('obs')->nullable();
            $table->decimal('dom_tipo',1,1)->nullable();
            $table->decimal('dom_corprazo_projeto',1,1)->nullable();
            $table->decimal('dom_status_contramedida',1,1)->nullable();
            $table->decimal('flag_contramedida_efetiva',1,1)->nullable();
            

            

            

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('r3g');
    }
};
