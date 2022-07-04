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
        Schema::create('status_report', function (Blueprint $table) {
            $table->id();
            $table->integer('acordo_pai_id')->nullable();
            $table->integer('tipoa_cordo_id')->nullable();
            $table->string('nome',100)->nullable();
            $table->integer('responsavel_interno_id');
            $table->string('telefone_responsavel_interno',30)->nullable();
            $table->integer('setor_id');
            $table->integer('fiscal_id');
            $table->string('telefone_fiscal',30)->nullable();
            $table->string('palavra_chave',100)->nullable();
            $table->text('objeto')->nullable();
            $table->text('observacao')->nullable();
            $table->date('assinatura')->nullable();
            $table->date('inicio_vigencia')->nullable();
            $table->date('fim_vigencia');
            $table->integer('prazo_vigencia')->nullable();
            $table->date('atualizacao')->nullable();
            $table->string('flag_rescindido',1)->nullable()->default('n');
            $table->tinyInteger('flag_situacao_atual')->nullable();
            $table->string('siapro',25)->nullable();
            $table->text('contato_externo',10)->nullable();
            $table->integer('criterio_farol')->nullable();
            $table->date('fim_projeto')->nullable();
            $table->foreign('projeto_id')->references('id')->on('projeto')->onDelete('restrict')->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('status_report');
    }
};
