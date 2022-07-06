<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use App\Http\Controllers\UsuariosController;
use Illuminate\Database\Schema\IndexDefinition;
use Tests\TestCase;

class MeuPrimeiroTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_example()
    {
       
        $user  = new UsuariosController();

        $user->index();

    }
}
