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
        Schema::create('acordo', function (Blueprint $table) {
            $table->id();
            $table->string('nome',100)->nullable();
            $table->string('telefone_responsavel_interno',30)->nullable();
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
            $table->text('contato_externo')->nullable();
            $table->date('publicacao')->nullable();
            $table->string('cargo_fiscal',100)->nullable();
            $table->string('caminho',100)->nullable();
            $table->foreignId('acordo_especie_instrumento_id')->constrained()->references('id')->on('acordo_especie_instrumento')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('acordo_pai_id')->constrained()->references('id')->on('acordo')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('fiscal_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('fiscal_2_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('fiscal_3_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('responsavel_interno_id')->constrained()->references('id')->on('pessoa')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('setor_id')->constrained()->references('id')->on('setor')->onDelete('restrict')->onUpdate('restrict');
            $table->foreignId('tipo_acordo_id')->constrained()->references('id')->on('tipo_acordo')->onDelete('restrict')->onUpdate('restrict');




        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('acordo');
    }
};
