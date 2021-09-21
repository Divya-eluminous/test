<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('createpdflist','StudentController@createpdflist');
Route::get('exportpdf','StudentController@exportpdf');
Route::get('exportexcel/{type}','StudentController@exportexcel');
Route::get('createzip','StudentController@createzip');


Route::get('login', 'LoginController@index');

Route::get('login/facebook', 'LoginController@redirectToProvider');
Route::get('login/facebook/callback', 'LoginController@handleProviderCallback');
