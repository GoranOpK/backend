<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    /**
     * Prikazuje sve rezervacije.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $reservations = Reservation::all();
        return response()->json($reservations, 200);
    }

    /**
     * Prikazuje pojedinačnu rezervaciju na osnovu ID-a.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $reservation = Reservation::findOrFail($id);
        return response()->json($reservation, 200);
    }

    /**
     * Kreira novu rezervaciju.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'time_slot_id' => 'required|integer|exists:time_slots,id',
            'reservation_date' => 'required|date',
            'user_name' => 'required|string|max:255',
            'country' => 'required|string|max:100',
            'license_plate' => 'required|string|max:20',
            'vehicle_type_id' => 'required|integer|exists:vehicle_types,id',
            'email' => 'required|email|max:255',
            'status' => 'required|string|in:pending,confirmed,canceled',
        ]);

        $reservation = Reservation::create($validated);

        return response()->json([
            'message' => 'Reservation created successfully',
            'reservation' => $reservation,
        ], 201);
    }

    /**
     * Ažurira postojeću rezervaciju.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $reservation = Reservation::findOrFail($id);

        $validated = $request->validate([
            'time_slot_id' => 'sometimes|required|integer|exists:time_slots,id',
            'reservation_date' => 'sometimes|required|date',
            'user_name' => 'sometimes|required|string|max:255',
            'country' => 'sometimes|required|string|max:100',
            'license_plate' => 'sometimes|required|string|max:20',
            'vehicle_type_id' => 'sometimes|required|integer|exists:vehicle_types,id',
            'email' => 'sometimes|required|email|max:255',
            'status' => 'sometimes|required|string|in:pending,confirmed,canceled',
        ]);

        $reservation->update($validated);

        return response()->json([
            'message' => 'Reservation updated successfully',
            'reservation' => $reservation,
        ], 200);
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

        return response()->json(['message' => 'Reservation deleted successfully'], 200);
    }

    public function byDate(Request $request)
    {
        $date = $request->query('date');
        $reservations = Reservation::whereDate('reservation_date', $date)->get();
        return response()->json($reservations);
    }
}