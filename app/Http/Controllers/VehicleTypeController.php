<?php

namespace App\Http\Controllers;

use App\Models\VehicleType;
use Illuminate\Http\Request;

class VehicleTypeController extends Controller
{
    /**
     * Prikazuje sve tipove vozila.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return response()->json(VehicleType::all());
    }

    /**
     * Prikazuje pojedinačni tip vozila na osnovu ID-a.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        return response()->json(VehicleType::findOrFail($id));
    }

    /**
     * Kreira novi tip vozila.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'description_vehicle' => 'required|string',
            'price' => 'required|numeric',
        ]);
        $vehicleType = VehicleType::create($validated);
        return response()->json($vehicleType, 201);
    }

    /**
     * Ažurira postojeći tip vozila.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $vehicleType = VehicleType::findOrFail($id);
        $validated = $request->validate([
            'description_vehicle' => 'sometimes|required|string',
            'price' => 'sometimes|required|numeric',
        ]);
        $vehicleType->update($validated);
        return response()->json($vehicleType);
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