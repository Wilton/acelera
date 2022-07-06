<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UsuarioRequest extends FormRequest
{
    // protected $redirect = 'api/user';
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [

            'name' => 'required',
            'email'=>'unique:usuarios|required'
        ];
    }

    public function messages()
    {
        return  [
            'name.required' => 'digite o nome',
            'email.unique' => 'email já cadastrado',
            'email.required' => 'insira o email'
        ];
    }
}
