<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\LbsBaseController;

class LoginController extends LbsBaseController
{
    public function login(Request $request){
        $cred = $request->only(['username', 'password']);
        if(!$token = auth('api')->setTTL(86400)->attempt($cred)){
            return $this->responseRequestError('Not True');
        }
        return $this->responseRequestSuccess($token);
    }
}
