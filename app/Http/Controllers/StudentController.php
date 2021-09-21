<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\StudentModel;
use App\Banner_images;

use PDF;
use ZipArchive;
use File;

class StudentController extends Controller
{
	public function __construct(StudentModel $StudentModel)
	{
		$this->studentmodel = $StudentModel;
	}
    public function createstudent(Request $request)
    {
    	$form_data = $request->all();

    	$validator = Validator::make($form_data,[
    		"name"=>"required",
    		"email"=>"required|email|unique:student",
    		"password"=>"required|min:6|max:8"

    	]); 

    	if($validator->fails())
    	{
    		return response()->json(['error'=>$validator->errors()]);
    	}
    	$form_data['password'] = Hash::make($request->password);
    	$student = 	StudentModel::create($form_data);
    	$accesstoken =   $student->createToken('authtoken')->accessToken;
    	if(isset($student) && !empty($student))
    	{
    		return response()->json(['success'=>'Student created successfully','accesstoken'=>$accesstoken,'Student'=>$student]);
    	}    	
    }//createstudent
    public function login(Request $request)
    {
    	$form_data = $request->all();
    	$validatedata = Validator::make($form_data,[
    		'email'=>'required|email',
    		'password'=>'required'
    	]);

    	if($validatedata->fails())
    	{
    		return response()->json(['error'=>$validatedata->errors()]);
    	}

    	if(!Auth::attempt($form_data))
    	{
    	   return response()->json(['status'=>'Failed','error'=>'Invalid credentials']);
    	}
    	else
    	{
    		$accesstoken = Auth::user()->createToken('authtoken')->accessToken;
    		return response()->json(['status'=>'Success','success'=>'Student login successfully','accesstoken'=>$accesstoken]);
    	}
    }//login

    public function get_students(Request $request)
    {	
    	$defaultpage =1;
    	$perpage = 15;

   		$offset = ($request->page-1)*$perpage;    	
    	
    	$students = $this->studentmodel->orderBy('id','desc');
    	if($request->has('id'))
    	{
    		$students =$students->where('id',$request->id);
    	}
    	if($request->has('name'))
    	{
    		$students =$students->where('name',$request->name);
    	}
    	$total_records = $students->count();
    	$last_page = $total_records/$perpage;
    	$students = $students->offset($offset)->limit($perpage)->get();
    	if(isset($students))
    	{
    		return response()->json(['status'=>'success','students'=>$students,'page'=>$request->page,'Total'=>$total_records,'Last page'=>ceil($last_page)]);
    	}
    	else
    	{
    		return response()->json(['status'=>'success','students'=>'Records not availiable']);
    	}
    }//get_students


    public function createpdflist()
    {
    	$all_students = $this->studentmodel->get()->toArray();
    	return view('welcome',compact('all_students'));

    }//pdf
    public function exportpdf()
    {
     	  $data = $this->studentmodel->get()->toArray();
     	  
     	  // $html = '<table border=1 align="center" style="width:400;height:400"><tr><th>Sr.No.</th><th>Name</th><th>Email</th></tr>';
     	  // $i=1;
     	  // foreach($data as $v)
     	  // {
     	  // 	$html .='<tr><td>'.$i.'</td><td>'.$v['name'].'</td><td>'.$v['email'].'</td></tr>';
     	  // 	$i++;
     	  // }
     	  // $html .='</table>';
     	  //$pdf = PDF::loadView('pdf', ['html'=>$html]);
		  $pdf = PDF::loadView('pdf', ['data'=>$data]);
		  return $pdf->stream('document.pdf');


    }//pdf

    public function exportexcel($type)
    {
    	 // $data = $this->studentmodel->get()->toArray();
      //    return Excel::create('laravelcode', function($excel) use ($data) {
      //       $excel->sheet('mySheet', function($sheet) use ($data)
      //       {
      //           $sheet->fromArray($data);
      //       });
      //   })->download($type);
    }

    public function createzip()
    {
    	$zip  = new \ZipArchive;
    	$filename = "Myzip.zip";
    	if($zip->open(public_path($filename),ZipArchive::CREATE)==TRUE)
    	{
    		//$files = File::files(public_path('myzipfiles'));
    		$files = File::files(app_path('console'));

    		foreach($files as $k=>$v)
    		{
    			$relativefilename = basename($v);
    			$zip->addFile($v,$relativefilename);
    		}

    		$files = File::files(app_path('console'));

    		foreach($files as $k=>$v)
    		{
    			$relativefilename = basename($v);
    			$zip->addFile($v,$relativefilename);
    		}


    		$zip->close();
    	}
    	return response()->download(public_path($filename));

    }//zip

    public function upload_photo(Request $request)
    {
         if($request->hasFile('image')) {
           
            $validation = Validator::make($request->all(),
                [
                    'student_id'=>'required',
                    'image'=>'required|image:jpg,gif,png,jpeg,bmp,svg'
                ]
             );

            if($validation->fails())
            {
                return response()->json(['error'=>$validation->errors()]);
            }
            else
            {
               $student_id = $request->student_id;
               $old_file = $request->hidden_old_file;
               $old_file_path =public_path('uploads/studentphoto/'.$old_file);


               $file = $request->file('image');
               $upload_path = public_path('uploads/studentphoto/'); 
               $extention  =  $file->getClientOriginalExtension();
               $name  =  $file->getClientOriginalName();
               
              
               $student = StudentModel::find($student_id);
               if($student)
               {
                    if(isset($old_file) && file_exists($old_file_path))
                    {
                        unlink($old_file_path);
                    }
                   
                    $path = $file->move($upload_path,$name);

                    $upload_arr = [];
                    $upload_arr['photo'] = $name;
                    $upload_arr['photo_path'] = $path;
                    StudentModel::where('id',$student_id)->update($upload_arr);
                     return response()->json(['success'=>'Image uploaded successfully']);
               }
               else
               {
                 return response()->json(['error'=>'Student not found']);
               }
              
            }//else
        }else{
          return response()->json(['error'=>'File not found']);
        }  
    }//upload image api

    public function upload_multipleimages(Request $request)
    {
        if($request->hasFile('bannerimages')){


         $files = $request->file('bannerimages'); 
         $allwoextentions = ['png','jpg','bmp','gif','svg'];
         foreach ($request->file('bannerimages') as $f) {  
            $extension = $f->getClientOriginalExtension();
            if(!in_array($extension,$allwoextentions))
            {
               return response()->json(['error'=>'Invalid file format']);
            }else
            {
                $db_images=''; $uploadedimages=[];
                foreach($request->bannerimages as $banners){
                    
                    $imagepath = public_path('uploads/banner_images');
                    $name= rand().'_'.$banners->getClientOriginalName();
                    $path = $banners->move($imagepath,$name);
                    $b_images = [];
                    $b_images['image'] = $name;
                    $b_images['path'] = $path;
                    Banner_images::create($b_images);

                    $uploadedimages[] = $name;
                   
                }//foreach   

                 $db_images=  implode(",",$uploadedimages);             
                return response()->json(['success'=>'Image uploaded successfully','images'=>$db_images]);
            }
         }//foreach

        }else
        {
            return response()->json(['error'=>'File not found']);
        }         
         
    }//upload_multipleimages
}
