<?php

namespace App\Http\Controllers;

use App\Models\TimeSlot;
use Illuminate\Http\Request;

class TimeSlotController extends Controller
{
    /**
     * Prikazuje sve vremenske slotove.
     *
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function index()
    {
        return TimeSlot::all();
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
            'start_time' => 'required',
            'end_time' => 'required',
            'type' => 'required',
            'status' => 'required',
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
        $slot->update($request->all());
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