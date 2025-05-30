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
            'time_slot' => 'required|string|max:255',
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
            'time_slot' => 'sometimes|required|string|max:255',
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
     * Vraća sve vremenske slotove. (Prilagođeno jer nema status/type)
     */
    public function availableSlots(Request $request)
    {
        // Ovde možeš filter po ID-jevima koji su zauzeti za određeni datum, ako ima smisla.
        // Pošto tvoja tabela nema "status", filtriraćeš samo po zauzetosti u reservations.

        $date = $request->query('date');
        if (!$date) {
            return response()->json(['error' => 'Date parameter is required.'], 400);
        }

        // Pronađi slotove koji su rezervisani za taj datum
        $reservedDropOffSlotIds = \DB::table('reservations')
            ->where('reservation_date', $date)
            ->pluck('drop_off_time_slot_id')
            ->toArray();

        $reservedPickUpSlotIds = \DB::table('reservations')
            ->where('reservation_date', $date)
            ->pluck('pick_up_time_slot_id')
            ->toArray();

        $reservedSlotIds = array_unique(array_merge($reservedDropOffSlotIds, $reservedPickUpSlotIds));

        // Slobodni slotovi su svi koji NISU u rezervisanim
        $availableSlots = TimeSlot::whereNotIn('id', $reservedSlotIds)->get();

        return response()->json($availableSlots);
    }
}