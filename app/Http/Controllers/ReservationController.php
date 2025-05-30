<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\TimeSlot;
use App\Services\SlotService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class ReservationController extends Controller
{
    protected $slotService;

    public function index()
    {
        $reservations = Reservation::all();
        return response()->json($reservations, 200);
    }

    public function show($id)
    {
        $reservation = Reservation::findOrFail($id);
        return response()->json($reservation, 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'time_slot_id'      => 'required|integer|exists:time_slots,id',
            'reservation_date'  => 'required|date',
            'user_name'         => 'required|string|max:255',
            'country'           => 'required|string|max:100',
            'license_plate'     => 'required|string|max:20',
            'vehicle_type_id'   => 'required|integer|exists:vehicle_types,id',
            'email'             => 'required|email|max:255',
            'status'            => 'sometimes|string|in:pending,confirmed,canceled',
            'type'              => 'required|string|in:drop_off,pick_up', // dodato polje za tip
        ]);

        // --- Pravilo 1: dozvoli samo rezervaciju za isti dan (drop off i pick up) ---
        // Ovdje podrazumijevamo da je svaki zahtjev za pojedinačan tip, ali možeš proširiti logiku po potrebi!

        $date = $validated['reservation_date'];
        $reg = $validated['license_plate'];
        $type = $validated['type']; // drop_off ili pick_up

        // --- Pravilo 2: max 3 rezervacije po tipu i danu i registarskoj oznaci ---
        $count = Reservation::where('license_plate', $reg)
            ->where('reservation_date', $date)
            ->where('type', $type)
            ->count();

        if ($count >= 3) {
            return response()->json([
                'message' => "Dozvoljeno je najviše 3 rezervacije za $type za ovu registarsku oznaku na ovaj dan."
            ], 422);
        }

        // --- Pravilo 3: rezervacija moguća najkasnije minut prije termina ---
        $slot = TimeSlot::find($validated['time_slot_id']);
        if (!$slot) {
            return response()->json(['message' => 'Nepostojeći termin!'], 422);
        }
        $dateTime = Carbon::parse($date . ' ' . $slot->start_time);

        if (now()->diffInMinutes($dateTime, false) < 1) {
            return response()->json([
                'message' => 'Rezervacija je moguća najkasnije minut prije termina.'
            ], 422);
        }

        // Default status na pending, osim ako nije specificirano
        if (!isset($validated['status'])) {
            $validated['status'] = 'pending';
        }

        $reservation = Reservation::create($validated);

        return response()->json([
            'message' => 'Reservation created successfully',
            'reservation' => $reservation,
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $reservation = Reservation::findOrFail($id);

        $validated = $request->validate([
            'time_slot_id'      => 'sometimes|required|integer|exists:time_slots,id',
            'reservation_date'  => 'sometimes|required|date',
            'user_name'         => 'sometimes|required|string|max:255',
            'country'           => 'sometimes|required|string|max:100',
            'license_plate'     => 'sometimes|required|string|max:20',
            'vehicle_type_id'   => 'sometimes|required|integer|exists:vehicle_types,id',
            'email'             => 'sometimes|required|email|max:255',
            'status'            => 'sometimes|required|string|in:pending,confirmed,canceled',
            'type'              => 'sometimes|required|string|in:drop_off,pick_up',
        ]);

        $reservation->update($validated);

        return response()->json([
            'message' => 'Reservation updated successfully',
            'reservation' => $reservation,
        ], 200);
    }

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

    public function __construct(SlotService $slotService)
    {
        $this->slotService = $slotService;
    }

    public function showSlots(Request $request)
    {
        $date = $request->input('date', now()->toDateString());
        $slots = $this->slotService->getSlotsForDate($date);
        return response()->json($slots);
    }

    public function reserve(Request $request)
    {
        $date = $request->input('date');
        $slotId = $request->input('slot_id');
        $this->slotService->reserveSlot($date, $slotId);
        return response()->json(['status' => 'success']);
    }
}
