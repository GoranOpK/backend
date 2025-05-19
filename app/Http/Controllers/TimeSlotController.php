<?php

namespace App\Http\Controllers;

use App\Models\TimeSlot;
use Illuminate\Http\Request;

class TimeSlotController extends Controller
{
    /**
     * Prikazuje sve vremenske slotove sa paginacijom.
     *
     * @return \Illuminate\Contracts\Pagination\LengthAwarePaginator
     */
    public function index()
    {
        return TimeSlot::paginate(10); // Vraća po 10 slotova po stranici
    }

    /**
     * Prikazuje pojedinačni vremenski slot na osnovu ID-a.
     *
     * @param int $id
     * @return \App\Models\TimeSlot
     */
    public function show($id)
    {
        return TimeSlot::findOrFail($id);
    }

    /**
     * Kreira novi vremenski slot.
     *
     * @param \Illuminate\Http\Request $request
     * @return \App\Models\TimeSlot
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
            'type' => 'required|string|max:255',
            'status' => 'required|in:available,booked,canceled',
        ]);
        return TimeSlot::create($validated);
    }

    /**
     * Ažurira postojeći vremenski slot.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \App\Models\TimeSlot
     */
    public function update(Request $request, $id)
    {
        $slot = TimeSlot::findOrFail($id);

        $validated = $request->validate([
            'start_time' => 'sometimes|required|date_format:H:i',
            'end_time' => 'sometimes|required|date_format:H:i|after:start_time',
            'type' => 'sometimes|required|string|max:255',
            'status' => 'sometimes|required|in:available,booked,canceled',
        ]);

        $slot->update($validated);
        return $slot;
    }

    /**
     * Briše vremenski slot.
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $slot = TimeSlot::findOrFail($id);
        $slot->delete();
        return response()->json(['message' => 'Deleted']);
    }
}