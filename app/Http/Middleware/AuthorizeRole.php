<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AuthorizeRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string  $role
     * @return mixed
     */
    public function handle(Request $request, Closure $next, string $role)
    {
        // Provera da li je korisnik prijavljen
        if (!$request->user()) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Provera da li korisnik ima odgovarajuću ulogu
        if ($request->user()->role !== $role) {
            return response()->json(['message' => 'Forbidden'], 403);
        }

        return $next($request);
    }
}