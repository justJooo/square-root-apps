<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\Akar;
use Illuminate\Support\Facades\DB;

class APIController extends Controller
{
    public function tampil()
    {
        $response = Akar::latest('id')->take(5)->get(); // Mengambil semua data dari tabel items

        return view('akar_kuadrat', compact('response'));
    }


    public function postAPI(Request $request)
    {
        $request->validate(
            [
                'bilanganAPI' => 'required|numeric|min:0|max:1000000000',
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
            'bilanganPL' => 'required|numeric|min:0|max:1000000000',
        ]);

        if ($request->bilanganPL > 0) {
            DB::select('CALL hitungAkar(?)', array($request->bilanganPL));
            if ($request->bilanganPL >= 1000000000) {
                return redirect('/akar-kuadrat');
            }
        }

        $end_time = microtime(true);
        $execution_time = ($end_time - $start_time) * 1000;
        $response = Akar::latest('id')->first();

        $response->waktu = $execution_time;

        $response->update();

        return redirect('/akar-kuadrat');
    }
}
