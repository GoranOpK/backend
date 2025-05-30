<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\TimeSlot;
use App\Services\SlotService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class ReservationController extends Controller
{
    // Servis za rad sa slotovima (terminima)
    protected $slotService;

    // Prikaz svih rezervacija
    public function index()
    {
        $reservations = Reservation::all();
        return response()->json($reservations, 200);
    }

    // Prikaz pojedinačne rezervacije po ID-u
    public function show($id)
    {
        $reservation = Reservation::findOrFail($id);
        return response()->json($reservation, 200);
    }

    // Kreiranje nove rezervacije
    public function store(Request $request)
    {
        // Validacija podataka iz zahtjeva
        $validated = $request->validate([
            'time_slot_id'      => 'required|integer|exists:time_slots,id', // ID termina
            'reservation_date'  => 'required|date',                         // Datum rezervacije
            'type'              => 'required|string|in:drop_off,pick_up',   // Tip rezervacije (ostavljanje ili preuzimanje)
            'user_name'         => 'required|string|max:255',               // Ime korisnika
            'country'           => 'required|string|max:100',               // Država korisnika
            'license_plate'     => 'required|string|max:20',                // Registarske tablice
            'vehicle_type_id'   => 'required|integer|exists:vehicle_types,id', // Tip vozila
            'email'             => 'required|email|max:255',                // Email korisnika
            'status'            => 'sometimes|string|in:pending,confirmed,canceled', // Status rezervacije
            
        ]);

        // --- Pravilo 1: dozvoli samo rezervaciju za isti dan (drop off i pick up) ---
        // Ovdje podrazumijevamo da je svaki zahtjev za pojedinačan tip, ali možeš proširiti logiku po potrebi!
        $date = $validated['reservation_date'];
        $reg = $validated['license_plate'];
        $type = $validated['type']; // drop_off ili pick_up

        // --- Pravilo 2: max 3 rezervacije po tipu, danu i registarskoj oznaci ---
        $count = Reservation::where('license_plate', $reg)
            ->where('reservation_date', $date)
            ->where('type', $type)
            ->count();

        if ($count >= 3) {
            // Ako korisnik ima već 3 rezervacije tog tipa za taj dan i tablice, vraća se greška
            return response()->json([
                'message' => "Dozvoljeno je najviše 3 rezervacije za $type za ovu registarsku oznaku na ovaj dan."
            ], 422);
        }

        // --- Pravilo 3: rezervacija moguća najkasnije minut prije termina ---
        $slot = TimeSlot::find($validated['time_slot_id']);
        if (!$slot) {
            // Ako ne postoji termin sa datim ID-jem
            return response()->json(['message' => 'Nepostojeći termin!'], 422);
        }
        $dateTime = Carbon::parse($date . ' ' . $slot->start_time);

        // Provjera da li je moguće rezervisati (najkasnije minut prije početka termina)
        if (now()->diffInMinutes($dateTime, false) < 1) {
            return response()->json([
                'message' => 'Rezervacija je moguća najkasnije minut prije termina.'
            ], 422);
        }

        // Ako nije definisan status, postavi na "pending"
        if (!isset($validated['status'])) {
            $validated['status'] = 'pending';
        }

        // Kreiranje rezervacije u bazi
        $reservation = Reservation::create($validated);

        return response()->json([
            'message' => 'Reservation created successfully',
            'reservation' => $reservation,
        ], 201);
    }

    // Ažuriranje postojeće rezervacije
    public function update(Request $request, $id)
    {
        $reservation = Reservation::findOrFail($id);

        // Validacija podataka koji se ažuriraju
        $validated = $request->validate([
            'time_slot_id'      => 'sometimes|required|integer|exists:list_of_time_slots,id',
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

    // Brisanje rezervacije
    public function destroy($id)
    {
        $reservation = Reservation::findOrFail($id);
        $reservation->delete();

        return response()->json(['message' => 'Reservation deleted successfully'], 200);
    }

    // Prikaz rezervacija za određeni datum
    public function byDate(Request $request)
    {
        $date = $request->query('date');
        $reservations = Reservation::whereDate('reservation_date', $date)->get();
        return response()->json($reservations);
    }

    // Konstruktor - injektuje servis za slotove
    public function __construct(SlotService $slotService)
    {
        $this->slotService = $slotService;
    }

    // Prikaz svih slotova (termina) za određeni datum
    public function showSlots(Request $request)
    {
        $date = $request->input('date', now()->toDateString());
        $slots = $this->slotService->getSlotsForDate($date);
        return response()->json($slots);
    }

    // Rezervacija termina preko servisa
    public function reserve(Request $request)
    {
        $date = $request->input('date');
        $slotId = $request->input('slot_id');
        $this->slotService->reserveSlot($date, $slotId);
        return response()->json(['status' => 'success']);
    }
}
