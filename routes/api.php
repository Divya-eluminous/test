<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });




Route::post('/register','AuthController@register')->middleware('cors');
Route::post('/login','AuthController@login');


Route::middleware(['auth:api','CheckApiToken'])->group(function () {
  //  Route::get('get_user_details/{id}','AuthController@get_user_details');
  //  Route::get('get_all_users','AuthController@get_all_users');
   // Route::delete('delete_user/{id}','AuthController@delete_user');//commented for testing ang
});
 //Route::get('get_all_users','AuthController@get_all_users')->middleware('CheckApiToken');
  Route::get('get_all_users','AuthController@get_all_users');

// Route::group(['prefix'=>'api','middleware'=>['auth:api']],function () {
//     Route::get('get_user_details/{id}','AuthController@get_user_details');
//     Route::get('get_all_users','AuthController@get_all_users');
//     Route::delete('delete_user/{id}','AuthController@delete_user');
// });


Route::post('/createstudent','StudentController@createstudent');
Route::post('/studentlogin','StudentController@login');
//Route::get('/get_students','StudentController@get_students')->middleware('CheckApiToken');
Route::get('/get_students','StudentController@get_students');

Route::post('/uploadphoto','StudentController@upload_photo')->middleware('CheckApiToken');
Route::post('/uploadmultipleimages','StudentController@upload_multipleimages')->middleware('CheckApiToken');


Route::get('get_user_details/{id}','AuthController@get_user_details');//for testing ang
Route::post('update_user/{userid}','AuthController@update_user');//for testing ang
Route::delete('delete_user/{id}','AuthController@delete_user');//for testing ang