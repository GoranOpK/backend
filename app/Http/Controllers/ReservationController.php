<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    /**
     * Prikazuje sve rezervacije.
     *
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function index()
    {
        return Reservation::all();
    }

    /**
     * Prikazuje pojedinačnu rezervaciju na osnovu ID-a.
     *
     * @param int $id
     * @return \App\Models\Reservation
     */
    public function show($id)
    {
        return Reservation::findOrFail($id);
    }

    /**
     * Kreira novu rezervaciju.
     *
     * @param \Illuminate\Http\Request $request
     * @return \App\Models\Reservation
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'time_slot_id' => 'required|integer',
            'reservation_date' => 'required|date',
            'user_name' => 'required|string',
            'country' => 'required|string',
            'license_plate' => 'required|string',
            'vehicle_type_id' => 'required|integer',
            'email' => 'required|email',
            'status' => 'required',
        ]);
        return Reservation::create($validated);
    }

    /**
     * Ažurira postojeću rezervaciju.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \App\Models\Reservation
     */
    public function update(Request $request, $id)
    {
        $reservation = Reservation::findOrFail($id);
        $reservation->update($request->all());
        return $reservation;
    }

    /**
     * Briše rezervaciju.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $reservation = Reservation::findOrFail($id);
        $reservation->delete();
        return response()->json(['message' => 'Deleted']);
    }
}