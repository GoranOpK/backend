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
            'drop_off_time_slot_id' => 'required|integer|exists:list_of_time_slots,id',
            'pick_up_time_slot_id'  => 'required|integer|exists:list_of_time_slots,id',
            'reservation_date'      => 'required|date',
            'user_name'             => 'required|string|max:255',
            'country'               => 'required|string|max:100',
            'license_plate'         => 'required|string|max:20',
            'vehicle_type_id'       => 'required|integer|exists:vehicle_types,id',
            'email'                 => 'required|email|max:255',
            'status'                => 'sometimes|string|in:pending,paid',
        ]);

        // Opcionalno: validacija da slotovi nisu isti, ili neki custom uslov

        // Pravilo: najviše 3 rezervacije za istu tablicu i datum po slotu (primer)
        $date = $validated['reservation_date'];
        $reg = $validated['license_plate'];
        $count = Reservation::where([
            ['license_plate', $reg],
            ['reservation_date', $date],
            ['drop_off_time_slot_id', $validated['drop_off_time_slot_id']],
            ['pick_up_time_slot_id', $validated['pick_up_time_slot_id']]
        ])->count();

        if ($count >= 3) {
            return response()->json([
                'success' => false,
                'message' => "Dozvoljeno je najviše 3 rezervacije za ovu registarsku oznaku na ovaj dan i slot."
            ], 422);
        }

        // Pravilo: rezervacija moguća najkasnije minut prije termina drop-off
        $slot = TimeSlot::find($validated['drop_off_time_slot_id']);
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

        $validated['status'] = $validated['status'] ?? 'pending';

        $reservation = Reservation::create($validated);

        if ($reservation->status === 'paid') {
            Mail::to($reservation->email)->send(new SendInvoiceToUserMail($reservation));
        }

        return response()->json([
            'success' => true,
            'message' => 'Reservation created successfully',
            'reservation' => $reservation,
        ], 201);
    }

    // Rezervacija iz frontenda (možeš koristiti samo store, nema potrebe za duplikatom!)
    public function reserve(Request $request)
     {
       // \Log::info('Reserve metoda pozvana!');
        // Možeš pozvati $this->store($request) ili, još bolje, koristi samo jednu metodu (store)
        return $this->store($request);
       // return response()->json(['message' => 'Radi!'], 200);
    }

    public function sendInvoiceToUser($id)
    {
        $reservation = Reservation::findOrFail($id);

        if (!$reservation->email) {
            return response()->json(['error' => 'Email adresa nije pronađena za ovu rezervaciju.'], 422);
        }

        Mail::to($reservation->email)->send(new SendInvoiceToUserMail($reservation));
        return response()->json(['success' => 'Invoice and payment confirmation sent to user email.']);
    }

    public function update(Request $request, $id)
    {
        $reservation = Reservation::findOrFail($id);

        $validated = $request->validate([
            'drop_off_time_slot_id' => 'sometimes|required|integer|exists:list_of_time_slots,id',
            'pick_up_time_slot_id'  => 'sometimes|required|integer|exists:list_of_time_slots,id',
            'reservation_date'      => 'sometimes|required|date',
            'user_name'             => 'sometimes|required|string|max:255',
            'country'               => 'sometimes|required|string|max:100',
            'license_plate'         => 'sometimes|required|string|max:20',
            'vehicle_type_id'       => 'sometimes|required|integer|exists:vehicle_types,id',
            'email'                 => 'sometimes|required|email|max:255',
            'status'                => 'sometimes|required|string|in:pending,paid',
        ]);

        $reservation->update($validated);

        // Možeš dodati slanje maila kad je status promijenjen u 'paid'
        if (
            isset($validated['status']) &&
            $validated['status'] === 'paid' &&
            $reservation->email
        ) {
            Mail::to($reservation->email)->send(new SendInvoiceToUserMail($reservation));
        }

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
        if (!$date) {
            return response()->json(['error' => 'Date parameter is required.'], 400);
        }

        $reservations = Reservation::whereDate('reservation_date', $date)->get();

        return response()->json($reservations);
    }

    public function showSlots(Request $request)
    {
        $date = $request->input('date', now()->toDateString());
        $slots = $this->slotService->getSlotsForDate($date);
        return response()->json($slots);
    }
}