<?php
include '../koneksi/koneksi.php';

// Query untuk mendapatkan data guru
$sql = "SELECT id_guru, nama_guru, no_telp, bidang_keahlian FROM guru";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Guru</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="aset/style-data-guru.css">
</head>

<body>

    <div class="page-data">
        <div class="page-data_header">
            <h2>Data Guru</h2>
            <button class="btn" id="tambahGuruBtn"><i class="fas fa-plus"></i> Tambah Guru</button>
        </div>

        <div class="page-data_table">
            <table id="guruTable" class="display">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>No Telpon</th>
                        <th>Keahlian</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result->num_rows > 0) {
                        $no = 1;
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $no++ . "</td>";
                            echo "<td>" . $row['nama_guru'] . "</td>";
                            echo "<td>" . $row['no_telp'] . "</td>";
                            echo "<td>" . $row['bidang_keahlian'] . "</td>";
                            echo "<td>
                                    <button class='btn view-btn' data-id='" . $row['id_guru'] . "' style='background-color: #28a745;'><i class='fas fa-eye'></i></button>
                                    <button class='btn edit-btn' data-id='" . $row['id_guru'] . "' style='background-color: #ffc107;'><i class='fas fa-edit'></i></button>
                                    <button class='btn delete-btn' data-id='" . $row['id_guru'] . "' style='background-color: #dc3545;'><i class='fas fa-trash'></i></button>
                                  </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='5'>Tidak ada data guru</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal Tambah Guru -->
    <div id="tambahGuruModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Tambah Guru</h2>
            <form id="tambahGuruForm" action="proses/tambah-guru.php" method="POST">
                <label for="nama_guru">Nama:</label>
                <input type="text" id="nama_guru" name="nama_guru" required>
                
                <label for="alamat">Alamat:</label>
                <textarea id="alamat" name="alamat" required></textarea>
                
                <label for="no_telp">No Telpon:</label>
                <input type="text" id="no_telp" name="no_telp" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="tanggal_lahir">Tanggal Lahir:</label>
                <input type="date" id="tanggal_lahir" name="tanggal_lahir" required>
                
                <label for="jenis_kelamin">Jenis Kelamin:</label>
                <select id="jenis_kelamin" name="jenis_kelamin" required>
                    <option value="Laki-laki">Laki-laki</option>
                    <option value="Perempuan">Perempuan</option>
                </select>
                
                <label for="pendidikan_terakhir">Pendidikan Terakhir:</label>
                <input type="text" id="pendidikan_terakhir" name="pendidikan_terakhir" required>
                
                <label for="bidang_keahlian">Bidang Keahlian:</label>
                <input type="text" id="bidang_keahlian" name="bidang_keahlian" required>
                
                <label for="tanggal_mulai_kerja">Tanggal Mulai Kerja:</label>
                <input type="date" id="tanggal_mulai_kerja" name="tanggal_mulai_kerja" required>
                
                <label for="status_aktif">Status Aktif:</label>
                <select id="status_aktif" name="status_aktif" required>
                    <option value="Aktif">Aktif</option>
                    <option value="Tidak Aktif">Tidak Aktif</option>
                </select>
                
                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

    <!-- Modal Edit Guru -->
    <div id="editGuruModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Edit Guru</h2>
            <form id="editGuruForm" action="proses/edit-guru.php" method="POST">
                <input type="hidden" id="edit_id_guru" name="id_guru">
                <label for="edit_nama_guru">Nama:</label>
                <input type="text" id="edit_nama_guru" name="nama_guru" required>
                
                <label for="edit_alamat">Alamat:</label>
                <textarea id="edit_alamat" name="alamat" required></textarea>
                
                <label for="edit_no_telp">No Telpon:</label>
                <input type="text" id="edit_no_telp" name="no_telp" required>
                
                <label for="edit_email">Email:</label>
                <input type="email" id="edit_email" name="email" required>
                
                <label for="edit_tanggal_lahir">Tanggal Lahir:</label>
                <input type="date" id="edit_tanggal_lahir" name="tanggal_lahir" required>
                
                <label for="edit_jenis_kelamin">Jenis Kelamin:</label>
                <select id="edit_jenis_kelamin" name="jenis_kelamin" required>
                    <option value="Laki-laki">Laki-laki</option>
                    <option value="Perempuan">Perempuan</option>
                </select>
                
                <label for="edit_pendidikan_terakhir">Pendidikan Terakhir:</label>
                <input type="text" id="edit_pendidikan_terakhir" name="pendidikan_terakhir" required>
                
                <label for="edit_bidang_keahlian">Bidang Keahlian:</label>
                <input type="text" id="edit_bidang_keahlian" name="bidang_keahlian" required>
                
                <label for="edit_tanggal_mulai_kerja">Tanggal Mulai Kerja:</label>
                <input type="date" id="edit_tanggal_mulai_kerja" name="tanggal_mulai_kerja" required>
                
                <label for="edit_status_aktif">Status Aktif:</label>
                <select id="edit_status_aktif" name="status_aktif" required>
                    <option value="Aktif">Aktif</option>
                    <option value="Tidak Aktif">Tidak Aktif</option>
                </select>
                
                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

    <!-- Modal View Guru -->
    <div id="viewGuruModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Detail Guru</h2>
            <div id="viewGuruDetail"></div>
        </div>
    </div>

    <script src="aset/script-data-guru.js"></script>

</body>

</html>

<?php
$conn->close();
?>