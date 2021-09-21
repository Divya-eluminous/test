<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\User;

class AuthController extends Controller
{
    
	private $status = 200; // set status default to 200
    public function register(Request $request)
    {
        header('Access-Control-Allow-Origin', 'http://localhost:4200');
        header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');

        
    	$form_data = $request->all();
        dd($form_data);
    	
    	//Give validation 
    	$validator = Validator::make($form_data,[
    		'name'=>'required',
    		'email'=>'required|email|unique:users',
           // 'file'=>'required|image:jpg,gif,png,jpeg,bmp,svg',
    		'password'=>'required|min:5|max:8'

    	]);

    	if($validator->fails())
    	{
    		return response(['errors'=>$validator->errors()]);
    	}

         // $file = $request->file('file');
         // $upload_path = public_path('uploads/user/'); 
         // $extention  =  $file->getClientOriginalExtension();
         // $name  =  $file->getClientOriginalName();
         // $path = $file->move($upload_path,$name);
         // $form_data['image'] = $name;
    	 $form_data['password'] = Hash::make($request->password);
    	 $user = User::create($form_data);

    	//create access token
    	$accesstoken = $user->createToken('testtoken')->accessToken;
    	if(isset($user) && !empty($user))
    	{
    		return response(['user'=>$user,'Status'=>$this->status,'Message'=>'User created successfully']);

    	}
    	else
    	{
    		return response(['Status'=>'Failed','Message'=>'Something went wrong']);
    	}

    }//register

    public function login(Request $request)
    {

    	$form_data = $request->all();
    	$validator = Validator::make($form_data,[
    		'email'=>'required|email',
    		'password' =>'required'
    	]);

    	if($validator->fails())
    	{
    		return response(['errors'=>$validator->errors()]);
    	}
    	if (!Auth::attempt($form_data)) {
            return response(['Status'=>'Failed','Message' => 'Invalid Credentials']);
        }
    	else
    	{
    		$accesstoken = Auth::user()->createToken('testtoken')->accessToken;
    	    return response(['Status'=>$this->status,'user'=>Auth::user(),'accesstoken'=>$accesstoken,'Message'=>'Logged in successfully']);
    	}
    	
    }//login

    public function get_user_details($id)
    {
    	$getuser = User::find($id);
    	if(isset($getuser) && !empty($getuser))
    	{
    		$getuser = $getuser->toArray();
    		return response(['status'=>$this->status,'User'=>$getuser]);
    	}
    	else
    	{
    		return response(['status'=>'Failed','Message'=>'Something went wrong']);
    	}
    }//get_user_details

    public function get_all_users()
    {
    	$users = User::orderBy('id','desc')->get();
    	if(isset($users) && !empty($users))
    	{
    		return response(['status'=>$this->status,'User'=>$users]);
    	}
    	else
    	{
			return response(['status'=>'Failed','Message'=>'Something went wrong']);
    	}
    }//get_all_users

    public function delete_user($id)
    {
    	if($id)
    	{
    		$getuser = User::find($id);
    		if(!empty($getuser))
    		{
    			$delete = User::where('id',$id)->delete();
    			return response(['status'=>$this->status,'Message'=>'User deleted successfully']);
    		}
    		else
    		{
    		  return response(['status'=>'Failed','Message'=>'User does not exists']);
    	    }
    		
    	}
    	else{
    		return response(['status'=>'Failed','Message'=>'Something went wrong']);
    	}
    }//delete_user
    public function update_user($id,Request $request)
    {   
        $form_data = $request->all();
        $userid = $id;
        $validator = Validator::make($form_data,[
            'email'=>'required|email',
            'name' =>'required'
        ]);
        if($validator->fails())
        {
            return response(['errors'=>$validator->errors()]);
        }

        $user = User::where('id',$userid)->update($form_data);

        //create access token
       // $accesstoken = $user->createToken('testtoken')->accessToken;
        if(isset($user) && !empty($user))
        {
            return response(['user'=>$user,'Status'=>$this->status,'Message'=>'User updated successfully']);

        }
        else
        {
            return response(['Status'=>'Failed','Message'=>'Something went wrong']);
        }


    }//update_user
}
