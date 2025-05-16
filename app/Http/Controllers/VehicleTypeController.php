<?php

namespace App\Http\Controllers;

use App\Models\VehicleType;
use Illuminate\Http\Request;

class VehicleTypeController extends Controller
{
    /**
     * Prikazuje sve tipove vozila.
     *
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function index()
    {
        return VehicleType::all();
    }

    /**
     * Prikazuje pojedinačni tip vozila na osnovu ID-a.
     *
     * @param int $id
     * @return \App\Models\VehicleType
     */
    public function show($id)
    {
        return VehicleType::findOrFail($id);
    }

    /**
     * Kreira novi tip vozila.
     *
     * @param \Illuminate\Http\Request $request
     * @return \App\Models\VehicleType
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string',
        ]);
        return VehicleType::create($validated);
    }

    /**
     * Ažurira postojeći tip vozila.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \App\Models\VehicleType
     */
    public function update(Request $request, $id)
    {
        $vehicleType = VehicleType::findOrFail($id);
        $vehicleType->update($request->all());
        return $vehicleType;
    }

    /**
     * Briše tip vozila.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $vehicleType = VehicleType::findOrFail($id);
        $vehicleType->delete();
        return response()->json(['message' => 'Deleted']);
    }
}