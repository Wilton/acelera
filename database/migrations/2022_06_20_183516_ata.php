<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use League\CommonMark\Extension\Table\TableRow;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */

    public function up()
    {

        Schema::create('ata', function (Blueprint $table) {
            $table->id();
            $table->integer('projeto_id');
            $table->string('assunto',100)->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->string('local',100);
            $table->text('participantes');
            $table->text('ponto_discutido');
            $table->text('decisao');
            $table->text('ponto_atencao');
            $table->text('proximo_passo');
            $table->string('hora_reuniao',8);


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ata');
    }
};
