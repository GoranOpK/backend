<?php

namespace App\Http\Controllers;

use App\Models\TimeSlot;
use Illuminate\Http\Request;

class TimeSlotController extends Controller
{
    /**
     * Prikazuje sve vremenske slotove sa paginacijom.
     */
    public function index()
    {
        return TimeSlot::paginate(10);
    }

    /**
     * Prikazuje pojedinačni vremenski slot na osnovu ID-a.
     */
    public function show($id)
    {
        return TimeSlot::findOrFail($id);
    }

    /**
     * Kreira novi vremenski slot.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
            'type' => 'required|in:drop_off,pick_up',
            'status' => 'required|in:available,full,unavailable',
        ]);
        return TimeSlot::create($validated);
    }

    /**
     * Ažurira postojeći vremenski slot.
     */
    public function update(Request $request, $id)
    {
        $slot = TimeSlot::findOrFail($id);

        $validated = $request->validate([
            'start_time' => 'sometimes|required|date_format:H:i',
            'end_time' => 'sometimes|required|date_format:H:i|after:start_time',
            'type' => 'sometimes|required|in:drop_off,pick_up',
            'status' => 'sometimes|required|in:available,full,unavailable',
        ]);

        $slot->update($validated);
        return $slot;
    }

    /**
     * Briše vremenski slot.
     */
    public function destroy($id)
    {
        $slot = TimeSlot::findOrFail($id);
        $slot->delete();
        return response()->json(['message' => 'Deleted']);
    }

    /**
     * Vraća dostupne vremenske slotove za odabrani datum i tip.
     */
    public function availableSlots(Request $request)
    {
        $date = $request->query('date');
        $type = $request->query('type'); // 'drop_off' ili 'pick_up'

        if (!$date || !$type) {
            return response()->json(['error' => 'Date and type parameters are required.'], 400);
        }

        // Slot je slobodan ako nije rezervisan za dati dan i tip i status mu je available
        $reservedSlotIds = \DB::table('reservations')
            ->join('time_slots', 'reservations.time_slot_id', '=', 'time_slots.id')
            ->where('reservations.reservation_date', $date)
            ->where('time_slots.type', $type)
            ->pluck('time_slot_id');

        $availableSlots = TimeSlot::where('type', $type)
            ->where('status', 'available')
            ->whereNotIn('id', $reservedSlotIds)
            ->get();

        return response()->json($availableSlots);
    }
}