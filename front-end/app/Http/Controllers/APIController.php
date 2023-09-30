<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\Akar;
use Illuminate\Support\Facades\DB;

class APIController extends Controller
{
    //
    public function tampil()
    {

        $response = Akar::latest('id')->take(5)->get(); // Mengambil semua data dari tabel items

        return view('akar_kuadrat', compact('response'));
    }


    public function postAPI(Request $request)
    {
        $request->validate(
            [
                'bilangan' => 'required|numeric|min:0|max:1000000000',
            ],
            [
                'bilangan.required' => 'Tidak boleh kosong',
                'bilangan.numeric' => 'Harus berupa angka',
                'bilangan.min' => 'Tidak boleh kurang dari 0',
                'bilangan.max' => 'Tidak boleh lebih dari 10 digit',
            ],
        );

        Http::post('http://127.0.0.1:8080/api/hitung-akar', [
            'number' => $request->bilangan,
        ]);
        $response = Akar::latest('id')->first();
        $response->update();
        return redirect('/akar-kuadrat');
    }

    public function postPLSQL(Request $request)
    {
        $start_time = microtime(true);

        $request->validate([
            'bilangan1' => 'required|numeric|min:0|max:1000000000',
        ], [
            'bilangan1.required' => 'Tidak boleh kosong',
            'bilangan1.numeric' => 'Harus berupa angka',
            'bilangan1.min' => 'Tidak boleh kurang dari 0',
            'bilangan1.max' => 'Tidak boleh lebih dari 10 digit',
        ]);

        DB::select('CALL hitungAkar(?)', array($request->bilangan1));
        $end_time = microtime(true);
        $execution_time = ($end_time - $start_time) * 1000;
        $response = Akar::latest('id')->first();

        $response->waktu = $execution_time;

        $response->update();

        return redirect('/akar-kuadrat');
    }
}
