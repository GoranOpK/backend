<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    /**
     * Prikazuje sve admine.
     *
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function index()
    {
        return Admin::all();
    }

    /**
     * Prikazuje pojedinačnog admina na osnovu ID-a.
     *
     * @param int $id
     * @return \App\Models\Admin
     */
    public function show($id)
    {
        return Admin::findOrFail($id);
    }

    /**
     * Kreira novog admina.
     *
     * @param \Illuminate\Http\Request $request
     * @return \App\Models\Admin
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:admins',
            'password' => 'required|string|min:6',
        ]);
        $validated['password'] = Hash::make($validated['password']); // Šifrira lozinku
        return Admin::create($validated);
    }

    /**
     * Ažurira postojeće podatke o adminu.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \App\Models\Admin
     */
    public function update(Request $request, $id)
    {
        $admin = Admin::findOrFail($id);

        $data = $request->all();

        // Ako se menja password, šifruj ga
        if (isset($data['password'])) {
            $data['password'] = Hash::make($data['password']);
        }

        $admin->update($data);
        return $admin;
    }

    /**
     * Briše admina.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $admin = Admin::findOrFail($id);
        $admin->delete();
        return response()->json(['message' => 'Deleted']);
    }
}