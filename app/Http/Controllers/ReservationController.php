<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\TimeSlot;
use App\Services\SlotService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

// Dodajemo neophodne klase za slanje maila
use Illuminate\Support\Facades\Mail;
use App\Mail\SendInvoiceToUserMail;

class ReservationController extends Controller
{
    // Servis za rad sa slotovima (terminima)
    protected $slotService;

    // Konstruktor - injektuje servis za slotove
    public function __construct(SlotService $slotService)
{
    $this->slotService = $slotService;

    // Samo admini koji NISU admin_readonly smiju praviti, mijenjati i brisati
    $this->middleware('role:admin|superadmin')->only(['store', 'update', 'destroy', 'reserve']);
}

    // Prikaz svih rezervacija sa mogućnošću filtriranja po slot vremenu
    public function index(Request $request)
    {
        // Pravimo query objekat za rezervacije
        $query = Reservation::query();

        // Ako je korisnik readonly admin, prikazujemo samo osnovne podatke
        if (auth()->user() && auth()->user()->hasRole('admin_readonly')) {
            // Prikazujemo samo tip vozila, tablice, slot i tip slota
            $query->select('vehicle_type_id', 'license_plate', 'time_slot_id', 'type', 'reservation_date');
        }

        // Ako postoji filter za vrijeme termina, primijeni ga
        if ($request->has('slot_time') && !empty($request->slot_time)) {
            // slot_time se očekuje u formatu 'Y-m-d\TH:i' pa ga konvertujemo u 'H:i:s'
            try {
                $slotTime = Carbon::parse($request->slot_time)->format('H:i:s');
            } catch (\Exception $e) {
                $slotTime = $request->slot_time;
            }
            // Filtriramo po povezanom TimeSlot modelu
            $query->whereHas('timeslot', function ($q) use ($slotTime) {
                $q->where('start_time', $slotTime);
            });
        }

        $reservations = $query->get();

        // Ako koristiš API vraćaj JSON, ako koristiš blade vraćaj view
        // return response()->json($reservations, 200);
        return view('reservations.index', compact('reservations'));
    }

    // Prikaz pojedinačne rezervacije po ID-u
    public function show($id)
    {
        $reservation = Reservation::findOrFail($id);

        // Ako je korisnik readonly admin, prikazujemo samo osnovne podatke
        if (auth()->user() && auth()->user()->hasRole('admin_readonly')) {
            // Prikazujemo samo tip vozila, tablice i slot info (možeš proširiti po potrebi)
            $reservation = $reservation->only(['vehicle_type_id', 'license_plate', 'time_slot_id', 'type', 'reservation_date']);
        }

        return response()->json($reservation, 200);
    }

    // Kreiranje nove rezervacije
    public function store(Request $request)
    {
        // Validacija podataka iz zahtjeva
        $validated = $request->validate([
            'time_slot_id'      => 'required|integer|exists:list_of_time_slots,id', // ID termina
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

        // --- AUTOMATSKO SLANJE MAILA KORISNIKU NAKON USPJEŠNOG PLAĆANJA ---
        // Ovdje šaljemo korisniku račun i potvrdu čim je rezervacija potvrđena i kada je status "confirmed"
        if ($reservation->status === 'confirmed') {
            // Slanje maila korisniku na email koji je unio prilikom rezervacije, sa dva PDF atačmenta
            Mail::to($reservation->email)->send(new SendInvoiceToUserMail($reservation));
        }

        return response()->json([
            'message' => 'Reservation created successfully',
            'reservation' => $reservation,
        ], 201);
    }

    // Metoda za slanje računa i potvrde mailom korisniku na osnovu ID-a rezervacije
    public function sendInvoiceToUser($id)
    {
        $reservation = Reservation::findOrFail($id);

        if (!$reservation->email) {
            return response()->json(['error' => 'Email adresa nije pronađena za ovu rezervaciju.'], 422);
        }

        // Slanje maila korisniku na email koji je unio prilikom rezervacije, sa dva PDF atačmenta
        Mail::to($reservation->email)->send(new SendInvoiceToUserMail($reservation));

        return response()->json(['success' => 'Invoice and payment confirmation sent to user email.']);
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

        // Ako se status promijeni na 'confirmed', šaljemo automatski mail sa računom i potvrdom
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

        // Ako je korisnik readonly admin, prikazujemo samo tip vozila, tablice i slot info
        if (auth()->user() && auth()->user()->hasRole('admin_readonly')) {
            $reservations = Reservation::whereDate('reservation_date', $date)
                ->select('vehicle_type_id', 'license_plate', 'time_slot_id', 'type', 'reservation_date')
                ->get();
        } else {
            $reservations = Reservation::whereDate('reservation_date', $date)->get();
        }

        return response()->json($reservations);
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