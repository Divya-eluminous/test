<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\StudentModel;
use Laravel\Socialite\Facades\Socialite;

class LoginController extends Controller
{
    public function index()
    {
      return view('login');	
    }

    public function redirectToProvider()
    {
    	
        return Socialite::driver('facebook')->redirect();
    }

     public function handleProviderCallback()
    {
        $user = Socialite::driver('facebook')->user();
        dd($user);

        // $user->token;
    }

}
