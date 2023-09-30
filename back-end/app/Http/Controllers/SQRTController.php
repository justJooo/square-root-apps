<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Models\Akar;
use Symfony\Component\HttpFoundation\Response;

class SQRTController extends Controller
{
    public function getData(): JsonResponse
    {
        $data = Akar::orderBy('id', 'desc')->take(5)->get();

        return response()->json([
            'status' => 'success',
            'message' => 'Berhasil mendapatkan data',
            'data' => $data,
        ], Response::HTTP_OK);
    }

    public function API2(Request $request): JsonResponse
    {
        $start_time = microtime(true);
        $input = $request->number;

        $guess = $input / 2;
        $epsilon = 0.00001;

        while (abs($guess * $guess - $input) > $epsilon) {
            $new_guess = ($guess + $input / $guess) / 2;
            $guess = $new_guess;
        }

        $end_time = microtime(true); // Selesai mengukur waktu proses
        $execution_time = ($end_time - $start_time) * 1000; // Hasil waktu eksekusi dalam milisecond

        $perhitungan = new Akar();
        $perhitungan->input = $input;
        $perhitungan->angka = $guess;
        $perhitungan->waktu = $execution_time;
        $perhitungan->jenis = 'API';
        $perhitungan->save();

        return response()->json([
            'status' => 'success',
            'message' => 'Berhasil mendapatkan hasil akar kuadrat',
            'data' => [
                'input' => $input,
                'hasil' => $guess,
                'waktu' => $execution_time,
                'jenis' => 'API',
            ],
        ], Response::HTTP_OK);
    }
}
