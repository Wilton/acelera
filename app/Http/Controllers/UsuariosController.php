<?php

namespace App\Http\Controllers;

use App\Http\Requests\UsuarioRequest;
use App\Models\Usuarios;
use Illuminate\Http\Request;
use Illuminate\Support\Str;


class UsuariosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $usuarios = Usuarios::all();
        return response()->json($usuarios);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UsuarioRequest $request)
    {
        $usuario = new Usuarios();
        $usuario->name = $request->name;
        $usuario->email = $request->email;
        $usuario->email_verified_at = now();
        $usuario->password = bcrypt($request->password);
        $usuario->remember_token = Str::random(10);
        $usuario->created_at = now();
        $usuario->updated_at = now();
        $res = $usuario->save();
        if ($res) {

            $last = Usuarios::orderBy('id', 'DESC')->first();

            return response()->json(
                [
                    "msg" => "validado com sucesso",
                    "data" => $last
                ]
            );
        }
    }

    public function show(Usuarios $usuario)
    {
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Usuarios $usuario)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Usuarios  $usuarios
     * @return \Illuminate\Http\Response
     */
    public function destroy(Usuarios $usuarios)
    {
        //
    }
}
