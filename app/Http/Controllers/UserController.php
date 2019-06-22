<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;

/**
 *
 * @author wim
 */
class UserController extends LbsBaseController{
    //put your code here
    public function __construct()
    {
        parent::__construct(new User());
    } 
}
