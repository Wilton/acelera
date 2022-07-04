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
        Schema::create('agenda', function (Blueprint $table) {
            $table->id();
            $table->string('descricao',100);
            $table->date('created_at')->nullable();
            $table->text('agenda')->nullable();
            $table->timestamp('hora_agendada')->nullable();
            $table->string('local',30)->nullable();
            $table->tinyInteger('email')->nullable();
            $table->foreignId('escritorio_id')->constrained()->references('id')->on('escritorio')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('agenda');
    }
};
