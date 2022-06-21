<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
   
    
    public $autoInccrent = false;


    public function up()
    {
        
        Schema::create('acordo_entidade_externa', function (Blueprint $table) {
            $table->integer('id');
            $table->integer('entidade_externa_id');
            $table->primary(['id','entidade_externa_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('acordo_entidade_externa');
    }
};
