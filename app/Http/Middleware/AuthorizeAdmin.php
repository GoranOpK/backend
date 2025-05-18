<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AuthorizeAdmin
{
    /**
     * Obradjuje dolazni zahtjev i osigurava da samo administrator ima pristup.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Provjera da li postoji autentifikovani korisnik i da li je admin.
        if (!$request->user() || $request->user()->role !== 'admin') {
            abort(403, 'Unauthorized action.'); // "Neovlašćena akcija"
        }

        // Ako je korisnik admin, zahtjev se prosljeđuje dalje.
        return $next($request);
    }
}