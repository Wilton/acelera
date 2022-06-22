
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

        Schema::create('mudanca', function (Blueprint $table) {
            $table->id();
            $table->integer('projeto_id');
            $table->string('solicitante', 100)->nullable();
            $table->date('created_at')->nullable();
            $table->date('data_decisao')->nullable();
            $table->text('descricao')->nullable();
            $table->text('justificativa')->nullable();
            $table->text('parecere')->nullable();
            $table->text('aprovadores')->nullable();
            $table->text('descricao_aprovadores')->nullable();
            $table->bigInteger('tipo_mudanca_id')->unsigned();
            $table->string('aprovada', 1)->nullable();

            $table->foreign('tipo_mudanca_id')->references('id')->on('tipo_mudanca')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mudanca');
    }
};
