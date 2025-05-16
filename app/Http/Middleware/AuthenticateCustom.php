<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AuthenticateCustom
{
    public function handle(Request $request, Closure $next)
    {
        // Provera da li je korisnik prijavljen (možeš koristiti token, sesiju ili nešto drugo)
        if (!$request->user()) {
            return response()->json(['error' => 'Unauthenticated.'], 401);
        }
        return $next($request);
    }
}