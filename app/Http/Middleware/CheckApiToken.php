<?php

namespace App\Http\Middleware;

use Closure;
use App\User;
use Illuminate\Support\Facades\Auth;
use Str;
class CheckApiToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if(!empty(trim($request->bearerToken())))
        {
          // dd($request->bearerToken());           
            $is_exists = User::where('id' , Auth::guard('api')->id())->exists();            
            if($is_exists){
                return $next($request);
            }
        }
        elseif(empty(trim($request->bearerToken()))){
            return response()->json('Unauthorized', 401);
        }
        return response()->json('Invalid Token', 401);
    }


}
