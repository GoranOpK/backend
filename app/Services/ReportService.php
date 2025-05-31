<?php

namespace App\Services;

use App\Models\Reservation;
use Illuminate\Support\Facades\DB;

class ReportService
{
    /**
     * Dnevni izvještaj: broj rezervacija po tipu vozila za određeni dan.
     *
     * @param  string $date  Datum (npr. '2025-05-31')
     * @return \Illuminate\Support\Collection
     */
    public function dailyVehicleReservationsByType($date)
    {
        return Reservation::whereDate('reservation_date', $date)
            ->join('vehicle_types', 'reservations.vehicle_type_id', '=', 'vehicle_types.id')
            ->select('vehicle_types.name as tip_vozila', DB::raw('COUNT(*) as broj_rezervacija'))
            ->groupBy('vehicle_types.name')
            ->get();
    }

    /**
     * Mjesečni izvještaj: broj rezervacija po tipu vozila za određeni mjesec i godinu.
     *
     * @param  int $month  Mjesec (1-12)
     * @param  int $year   Godina
     * @return \Illuminate\Support\Collection
     */
    public function monthlyVehicleReservationsByType($month, $year)
    {
        return Reservation::whereYear('reservation_date', $year)
            ->whereMonth('reservation_date', $month)
            ->join('vehicle_types', 'reservations.vehicle_type_id', '=', 'vehicle_types.id')
            ->select('vehicle_types.name as tip_vozila', DB::raw('COUNT(*) as broj_rezervacija'))
            ->groupBy('vehicle_types.name')
            ->get();
    }

    /**
     * Godišnji izvještaj: broj rezervacija po tipu vozila za određenu godinu.
     *
     * @param  int $year  Godina
     * @return \Illuminate\Support\Collection
     */
    public function yearlyVehicleReservationsByType($year)
    {
        return Reservation::whereYear('reservation_date', $year)
            ->join('vehicle_types', 'reservations.vehicle_type_id', '=', 'vehicle_types.id')
            ->select('vehicle_types.name as tip_vozila', DB::raw('COUNT(*) as broj_rezervacija'))
            ->groupBy('vehicle_types.name')
            ->get();
    }
}