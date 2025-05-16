<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AuthorizeRole
{
    public function handle(Request $request, Closure $next, $role)
    {
        // Pretpostavka: korisnik ima 'role' polje u bazi/modelu
        if (!$request->user() || $request->user()->role !== $role) {
            return response()->json(['error' => 'Forbidden.'], 403);
        }
        return $next($request);
    }
}