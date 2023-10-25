<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calculator Square Root</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style type="text/css">
        h1 {

            text-align: center
        }

        .btn {

            font-family: sans-serif;
            font-size: 12px;
            font-weight: bold;
            color: white;
            border-radius: 10px;
            padding: 8px 11px;
            margin-top: 10px;
        }

        .table {
            margin-top: 25px;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input {
            margin-top: 5px
        }
    </style>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>

    <script>
        const SERVER_URL = 'https://square-apps-backend.fly.dev';
        window.onload = function() {
            updateTable();
        }

        function submitFormPL() {
            const form = document.getElementById('akar-form-pl-sql');
            const formData = new FormData(form);
            const number = document.getElementById('bilanganPL').value;
            console.log(number)
            if (isNaN(number)) {
                alert('Input harus berupa angka');
                return;
            } else if (number == 0) {
                alert('Input tidak boleh 0');
            } else if (number < 0) {
                alert('Input tidak boleh negatif');
            } else if (number.length >= 10) {
                alert('Input tidak boleh lebih dari 10 digit');
            } else {
                updateTable();
            }
        }

        function submitForm() {
            const form = document.getElementById('akar-form');
            const formData = new FormData(form);
            const number = document.getElementById('bilanganAPI').value;
            if (isNaN(number)) {
                alert('Input harus berupa angka');
                return;
            } else if (number == 0) {
                alert('Input tidak boleh 0');
            } else if (number < 0) {
                alert('Input tidak boleh negatif');
            } else if (number.length >= 10) {
                alert('Input tidak boleh lebih dari 10 digit');
            } else {
                formData.append('number', number);
                callAPI('POST', `${SERVER_URL}/api/hitung-akar`, formData, function(response) {
                    console.log(response);
                    updateTable();
                });
            }
        }

        function callAPI(method, url, data, callback) {
            const xhr = new XMLHttpRequest();
            xhr.open(method, url);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    callback(xhr.responseText);
                }
            };
            xhr.send(data);
        }

        function updateTable() {
            const tableBody = document.getElementById('table-body');
            tableBody.innerHTML = '';

            callAPI('GET', `${SERVER_URL}/api/data`, null, function(response) {
                const data = JSON.parse(response);
                const result = data.data
                console.log(result);
                result.forEach(function(row) {
                    const tr = document.createElement('tr');

                    const inputTd = document.createElement('td');
                    inputTd.innerText = row.input;
                    tr.appendChild(inputTd);

                    const angkaTd = document.createElement('td');
                    angkaTd.innerText = row.angka;
                    tr.appendChild(angkaTd);

                    const jenisTd = document.createElement('td');
                    jenisTd.innerText = row.jenis;
                    tr.appendChild(jenisTd);

                    const waktuTd = document.createElement('td');
                    waktuTd.innerText = row.waktu;
                    tr.appendChild(waktuTd);

                    tableBody.appendChild(tr);
                });
            });
        }
    </script>
</head>

<body>
    <div class="container">
        <div class="row" style="display:flex; flex-direction:col; justify-content:center; align-items: center;">
            <h1>Akar Kuadrat Bilangan</h1>
            <div class="col" style="display:flex; flex-direction:col; justify-content:center; align-items: center;">
                <div class="col-md-6">
                    <form id="akar-form">
                        @csrf
                        <label for="bilanganAPI">Masukan Bilangan:</label><br>
                        <input id="bilanganAPI" class="form form-control @error('bilanganAPI') is invalid @enderror"
                            name="bilanganAPI"><br>
                        {{-- @error('bilanganAPI')
                            <div class="invalid-feedback" style="display:block">
                                {{ $message }}
                            </div>
                        @enderror --}}
                        <button type="button" class="btn btn-success" onclick="submitForm()">submit API</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <form id='akar-form-pl-sql' action="{{ route('hitung-akar-plsql') }}" method="POST">
                        @csrf
                        <label for="bilanganPL">Masukan Bilangan:</label><br>
                        <input id="bilanganPL" class="form form-control @error('bilanganPL') is invalid @enderror"
                            name="bilanganPL"><br>
                        {{-- @error('bilanganPL')
                            <div class="invalid-feedback" style="display:block">
                                {{ $message }}
                            </div>
                        @enderror --}}
                        <button type="submit" class="btn btn-primary" onclick="submitFormPL()">submit PLSQL</button>
                    </form>
                </div>
            </div>
        </div>
        <table class="table">
            <thead class="table table-primary">
                <tr>
                    <th scope="col">Input</th>
                    <th scope="col">Angka</th>
                    <th scope="col">Metode</th>
                    <th scope="col">Waktu</th>
                </tr>
            </thead>
            <tbody id="table-body">
            </tbody>
        </table>
    </div>
    {{-- <script>
        updateTable()
    </script> --}}

    </tbody>
</body>

</html>
