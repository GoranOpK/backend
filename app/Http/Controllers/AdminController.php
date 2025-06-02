<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    /**
     * Prikazuje sve admine.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $admins = Admin::all();
        return response()->json($admins, 200);
    }

    /**
     * Prikazuje pojedinačnog admina na osnovu ID-a.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $admin = Admin::findOrFail($id);
        return response()->json($admin, 200);
    }

    /**
     * Kreira novog admina.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        // Blokada readonly admina
        if (auth()->check() && auth()->user()->role === 'admin_readonly') {
            return response()->json(['message' => 'Readonly admin ne može menjati podatke.'], 403);
        }

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:admins|max:255',
            'password' => 'required|string|min:6',
        ]);

        $validated['password'] = Hash::make($validated['password']); // Šifrira lozinku

        $admin = Admin::create($validated);
        return response()->json($admin, 201);
    }

    /**
     * Ažurira postojeće podatke o adminu.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        // Blokada readonly admina
        if (auth()->check() && auth()->user()->role === 'admin_readonly') {
            return response()->json(['message' => 'Readonly admin ne može menjati podatke.'], 403);
        }

        $admin = Admin::findOrFail($id);

        $validated = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|email|unique:admins,email,' . $id,
            'password' => 'sometimes|required|string|min:6',
        ]);

        // Ako se menja password, šifruj ga
        if (isset($validated['password'])) {
            $validated['password'] = Hash::make($validated['password']);
        }

        $admin->update($validated);
        return response()->json($admin, 200);
    }

    /**
     * Briše admina.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        // Blokada readonly admina
        if (auth()->check() && auth()->user()->role === 'admin_readonly') {
            return response()->json(['message' => 'Readonly admin ne može menjati podatke.'], 403);
        }

        $admin = Admin::findOrFail($id);
        $admin->delete();
        return response()->json(['message' => 'Admin deleted successfully'], 200);
    }

    /**
     * Prijava administratora i generisanje tokena.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            // Proveri da li je korisnik admin
            if ($user->role === 'admin') {
                $token = $user->createToken('admin-token', ['role:admin'])->plainTextToken;

                return response()->json([
                    'token' => $token,
                    'message' => 'Login successful',
                ], 200);
            }

            return response()->json([
                'message' => 'Access restricted to administrators only',
            ], 403);
        }

        return response()->json([
            'message' => 'Invalid credentials',
        ], 401);
    }
}