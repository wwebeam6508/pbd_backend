<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

$router->group(['prefix' => 'v1'], function($router){
    $router->post('login', ['as'=> 'login', 'uses'=> 'Auth\LoginController@login']);
});

$router->group(['prefix' => 'v2', 'middleware' => 'auth:api'], function($router){
    $router->get('get_users', 'UserController@index');
});