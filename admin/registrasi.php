<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        
        .page-data {
            max-width: 1200px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .page-data_header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .page-data_header h2 {
            margin: 0;
            color: #343a40;
        }

        .btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            margin: 5px 0;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .page-data_search {
            display: flex;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .page-data_search input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px 0 0 5px;
            margin-bottom: 0;
            min-width: 0;
        }

        .page-data_search button {
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            min-width: 50px;
        }

        .page-data_search button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .page-data_table table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        .page-data_table th, .page-data_table td {
            padding: 15px;
            border: 1px solid #dee2e6;
            text-align: left;
        }

        .page-data_table th {
            background-color: #f8f9fa;
            color: #495057;
        }

        .page-data_table tr:nth-child(even) {
            background-color: #f1f3f5;
        }

        .page-data_table tr:hover {
            background-color: #e9ecef;
        }

        .page-data_table a.btn {
            margin-right: 5px;
        }

        @media (max-width: 768px) {
            .page-data_header {
                flex-direction: column;
                align-items: flex-start;
            }

            .page-data_header h2 {
                text-align: left;
            }

            .page-data_search {
                flex-direction: column;
            }

            .page-data_search input {
                border-radius: 5px;
                margin-bottom: 10px;
            }

            .page-data_search button {
                border-radius: 5px;
            }

            .page-data_table th, .page-data_table td {
                padding: 10px;
            }

            .page-data_table {
                overflow-x: auto;
            }

            .page-data_table a {
                width: 70px;
                margin-top: 30px;
                display: inline-block;
                text-align: center;
            }
        }

        @media (max-width: 576px) {
            .page-data_header {
                align-items: center;
            }

            .page-data_header h2 {
                text-align: center;
            }

            .page-data_search {
                align-items: center;
            }

            .page-data_search input, .page-data_search button {
                width: 90%;
                margin-bottom: 10px;
            }

            .page-data_table th, .page-data_table td {
                padding: 8px;
            }

            .page-data_table a {
                width: 30px;
                margin-top: 10px;
                display: inline-block;
                text-align: center;
            }
        }
    </style>
</head>

<body>

    <div class="page-data">
        <div class="page-data_header">
            <h2>Data Siswa Registrasi</h2>

        </div>
        <div class="page-data_search">
            <input type="text" placeholder="Cari Siswa">
            <button><i class="fas fa-search"></i></button>
        </div>
        <div class="page-data_table">
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>NISN</th>
                        <th>Kelas</th>
                        <th>Alamat</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Andi</td>
                        <td>001</td>
                        <td>XII RPL 1</td>
                        <td>Jl. Jend. Sudirman No. 1</td>
                        <td>
                            <a href="edit-siswa.php?id=3" class="btn" style="background-color: #28a745;"><i class="fas fa-eye"></i> </a>
                            <a href="edit-siswa.php?id=3" class="btn" style="background-color: #ffc107;"><i class="fas fa-edit"></i> </a>
                            <a href="hapus-siswa.php?id=3" class="btn" style="background-color: #dc3545;"><i class="fas fa-trash"></i> </a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Budi</td>
                        <td>002</td>
                        <td>XII RPL 2</td>
                        <td>Jl. Jend. Sudirman No. 2</td>
                        <td>
                            <a href="edit-siswa.php?id=3" class="btn" style="background-color: #28a745;"><i class="fas fa-eye"></i> </a>
                            <a href="edit-siswa.php?id=3" class="btn" style="background-color: #ffc107;"><i class="fas fa-edit"></i> </a>
                            <a href="hapus-siswa.php?id=3" class="btn" style="background-color: #dc3545;"><i class="fas fa-trash"></i> </a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Caca</td>
                        <td>003</td>
                        <td>XII RPL 3</td>
                        <td>Jl. Jend. Sudirman No. 3</td>
                        <td>
                            <a href="edit-siswa.php?id=3" class="btn" style="background-color: #28a745;"><i class="fas fa-eye"></i> </a>
                            <a href="edit-siswa.php?id=3" class="btn" style="background-color: #ffc107;"><i class="fas fa-edit"></i> </a>
                            <a href="hapus-siswa.php?id=3" class="btn" style="background-color: #dc3545;"><i class="fas fa-trash"></i> </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>