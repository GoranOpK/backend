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
     * Vraća sve slobodne vremenske slotove za dati datum.
     */
    public function availableSlots(Request $request)
    {
        $date = $request->query('date');
        if (!$date) {
            return response()->json(['error' => 'Date parameter is required.'], 400);
        }

        // Dinamičko određivanje imena tabele za zadati datum (format: Ymd)
        $table = date('Ymd', strtotime($date));
        $exists = \DB::selectOne(
            "SELECT COUNT(*) as cnt FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = ?",
            [$table]
        );
        if (!$exists || $exists->cnt == 0) {
            // Ako tabela ne postoji, nema slobodnih slotova
            return response()->json([]);
        }

        // Iz tabele za taj dan izvuci sve slotove koji su available
        $rows = \DB::select("SELECT time_slot_id FROM `$table` WHERE available = 1");
        $slotIds = array_map(fn($r) => $r->time_slot_id, $rows);

        // Vrati podatke o slotovima (npr. vreme) za te id-jeve
        $slots = TimeSlot::whereIn('id', $slotIds)->get();

        return response()->json($slots);
    }

    /**
     * Proverava dostupnost pojedinačnog vremenskog slota za određeni dan.
     */
    public function availability($slot_id, Request $request)
    {
        $date = $request->query('date');
        if (!$date) {
            return response()->json(['error' => 'Date is required'], 400);
        }

        $table = date('Ymd', strtotime($date));
        $exists = \DB::selectOne(
            "SELECT COUNT(*) as cnt FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = ?",
            [$table]
        );
        if (!$exists || $exists->cnt == 0) {
            return response()->json(['error' => 'Tabela za taj datum ne postoji'], 404);
        }

        $row = \DB::selectOne("SELECT available FROM `$table` WHERE time_slot_id = ?", [$slot_id]);
        if (!$row) {
            return response()->json(['error' => 'Taj slot ne postoji za taj datum'], 404);
        }

        return response()->json(['available' => (bool)$row->available]);
    }
}