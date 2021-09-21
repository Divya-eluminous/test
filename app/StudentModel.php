<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class StudentModel extends Model
{
	use HasApiTokens;
    protected $table='student';
    protected $fillable = ['name','email','password'];
}
