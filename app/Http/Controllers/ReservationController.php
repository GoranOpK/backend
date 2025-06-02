<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\TimeSlot;
use App\Services\SlotService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendInvoiceToUserMail;

class ReservationController extends Controller
{
    protected $slotService;

    public function __construct(SlotService $slotService)
    {
        $this->slotService = $slotService;
    }

    // Prikaz svih rezervacija sa opcijom filtriranja po slot vremenu
    public function index(Request $request)
    {
        $query = Reservation::query();

        if ($request->has('slot_time') && !empty($request->slot_time)) {
            try {
                $slotTime = Carbon::parse($request->slot_time)->format('H:i:s');
            } catch (\Exception $e) {
                $slotTime = $request->slot_time;
            }
            $query->whereHas('timeslot', function ($q) use ($slotTime) {
                $q->where('start_time', $slotTime);
            });
        }

        $reservations = $query->get();
        return response()->json($reservations, 200);
    }

    // Prikaz pojedinačne rezervacije po ID-u
    public function show($id)
    {
        $reservation = Reservation::findOrFail($id);
        return response()->json($reservation, 200);
    }

    // Kreiranje nove rezervacije (API)
    public function store(Request $request)
    {
        $validated = $request->validate([
            'time_slot_id'      => 'required|integer|exists:list_of_time_slots,id',
            'reservation_date'  => 'required|date',
            'type'              => 'required|string|in:drop_off,pick_up',
            'user_name'         => 'required|string|max:255',
            'country'           => 'required|string|max:100',
            'license_plate'     => 'required|string|max:20',
            'vehicle_type_id'   => 'required|integer|exists:vehicle_types,id',
            'email'             => 'required|email|max:255',
            'status'            => 'sometimes|string|in:pending,confirmed,canceled',
        ]);

        // Pravilo: max 3 rezervacije po tipu, danu i registarskoj oznaci
        $date = $validated['reservation_date'];
        $reg = $validated['license_plate'];
        $type = $validated['type'];

        $count = Reservation::where([
            ['license_plate', $reg],
            ['reservation_date', $date],
            ['type', $type]
        ])->count();

        if ($count >= 3) {
            return response()->json([
                'message' => "Dozvoljeno je najviše 3 rezervacije za $type za ovu registarsku oznaku na ovaj dan."
            ], 422);
        }

        // Pravilo: rezervacija moguća najkasnije minut prije termina
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

        $validated['status'] = $validated['status'] ?? 'pending';

        $reservation = Reservation::create($validated);

        // Slanje maila kad je rezervacija potvrđena
        if ($reservation->status === 'confirmed') {
            Mail::to($reservation->email)->send(new SendInvoiceToUserMail($reservation));
        }

        return response()->json([
            'success' => true,
            'message' => 'Reservation created successfully',
            'reservation' => $reservation,
        ], 201);
    }

    // Nova API metoda za rezervaciju iz frontenda
    public function reserve(Request $request)
    {
        $validated = $request->validate([
            'time_slot_id'      => 'required|integer|exists:list_of_time_slots,id',
            'reservation_date'  => 'required|date',
            'type'              => 'required|string|in:drop_off,pick_up',
            'user_name'         => 'required|string|max:255',
            'country'           => 'required|string|max:100',
            'license_plate'     => 'required|string|max:20',
            'vehicle_type_id'   => 'required|integer|exists:vehicle_types,id',
            'email'             => 'required|email|max:255',
        ]);

        // Pravilo: max 3 rezervacije po tipu, danu i registarskoj oznaci
        $date = $validated['reservation_date'];
        $reg = $validated['license_plate'];
        $type = $validated['type'];

        $count = Reservation::where([
            ['license_plate', $reg],
            ['reservation_date', $date],
            ['type', $type]
        ])->count();

        if ($count >= 3) {
            return response()->json([
                'success' => false,
                'message' => "Dozvoljeno je najviše 3 rezervacije za $type za ovu registarsku oznaku na ovaj dan."
            ], 422);
        }

        // Pravilo: rezervacija moguća najkasnije minut prije termina
        $slot = TimeSlot::find($validated['time_slot_id']);
        if (!$slot) {
            return response()->json(['success' => false, 'message' => 'Nepostojeći termin!'], 422);
        }
        $dateTime = Carbon::parse($date . ' ' . $slot->start_time);
        if (now()->diffInMinutes($dateTime, false) < 1) {
            return response()->json([
                'success' => false,
                'message' => 'Rezervacija je moguća najkasnije minut prije termina.'
            ], 422);
        }

        $validated['status'] = 'pending';
        $reservation = Reservation::create($validated);

        // Slanje maila možeš dodati ovde ako treba

        return response()->json([
            'success' => true,
            'message' => 'Reservation created successfully',
            'reservation' => $reservation,
        ], 201);
    }

    // Slanje računa i potvrde mailom korisniku na osnovu ID-a rezervacije
    public function sendInvoiceToUser($id)
    {
        $reservation = Reservation::findOrFail($id);

        if (!$reservation->email) {
            return response()->json(['error' => 'Email adresa nije pronađena za ovu rezervaciju.'], 422);
        }

        Mail::to($reservation->email)->send(new SendInvoiceToUserMail($reservation));
        return response()->json(['success' => 'Invoice and payment confirmation sent to user email.']);
    }

    // Ažuriranje postojeće rezervacije
    public function update(Request $request, $id)
    {
        $reservation = Reservation::findOrFail($id);

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

        // Slanje maila kad je status promijenjen u 'confirmed'
        if (
            isset($validated['status']) &&
            $validated['status'] === 'confirmed' &&
            $reservation->email
        ) {
            Mail::to($reservation->email)->send(new SendInvoiceToUserMail($reservation));
        }

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
        if (!$date) {
            return response()->json(['error' => 'Date parameter is required.'], 400);
        }

        $reservations = Reservation::whereDate('reservation_date', $date)->get();

        return response()->json($reservations);
    }

    // Prikaz svih slotova za određeni datum
    public function showSlots(Request $request)
    {
        $date = $request->input('date', now()->toDateString());
        $slots = $this->slotService->getSlotsForDate($date);
        return response()->json($slots);
    }
}