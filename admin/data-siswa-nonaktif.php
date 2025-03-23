<?php
include '../koneksi/koneksi.php';

// Query untuk mendapatkan data siswa yang statusnya "Aktif"
$sql = "SELECT id_siswa, nama, tempat_les, pilihanprogram FROM siswa WHERE status_siswa = 'Tidak Aktif'";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Siswa Aktif</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="aset/style-data-siswa.css">
</head>

<body>

    <div class="page-data">
        <div class="page-data_header">
            <h2>Data Siswa Tidak Aktif</h2>
            
        </div>
       
        <div class="page-data_table">
            <table id="siswaTable" class="display">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>Tempat Les</th>
                        <th>Pilihan Program</th>
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
                            echo "<td>" . $row['nama'] . "</td>";
                            echo "<td>" . $row['tempat_les'] . "</td>";
                            echo "<td>" . $row['pilihanprogram'] . "</td>";
                            echo "<td>
                                    <button class='btn view-btn' data-id='" . $row['id_siswa'] . "' style='background-color: #28a745;'><i class='fas fa-eye'></i></button>
                                    <button class='btn edit-btn' data-id='" . $row['id_siswa'] . "' style='background-color: #ffc107;'><i class='fas fa-edit'></i></button>
                                    <button class='btn delete-btn' data-id='" . $row['id_siswa'] . "' style='background-color: #dc3545;'><i class='fas fa-trash'></i></button>
                                  </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='5'>Tidak ada data siswa aktif</td></tr>";
                    }
                    ?>
                </tbody>
                
            </table>
        </div>
    </div>

    <!-- Modal View Siswa -->
    <div id="viewSiswaModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Detail Siswa</h2>
            <div id="viewSiswaDetail"></div>
        </div>
    </div>

    <!-- Modal Edit Siswa -->
    <div id="editSiswaModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Edit Siswa</h2>
            <form id="editSiswaForm" action="proses/edit-siswa-nonaktif.php" method="POST">
                <input type="hidden" id="edit_id_siswa" name="id_siswa">
                <label for="edit_nama">Nama:</label>
                <input type="text" id="edit_nama" name="nama" disabled>
                
                <label for="edit_tempatlahir">Tempat Lahir:</label>
                <input type="text" id="edit_tempatlahir" name="tempatlahir" disabled>
                
                <label for="edit_tanggallahir">Tanggal Lahir:</label>
                <input type="date" id="edit_tanggallahir" name="tanggallahir" disabled>
                
                <label for="edit_asalsekolah">Asal Sekolah:</label>
                <input type="text" id="edit_asalsekolah" name="asalsekolah" disabled>
                
                <label for="edit_kelas">Kelas:</label>
                <input type="text" id="edit_kelas" name="kelas" disabled>
                
                <label for="edit_jeniskelamin">Jenis Kelamin:</label>
                <select id="edit_jeniskelamin" name="jeniskelamin" disabled>
                    <option value="Laki-laki">Laki-laki</option>
                    <option value="Perempuan">Perempuan</option>
                </select>
                
                <label for="edit_alamat">Alamat:</label>
                <textarea id="edit_alamat" name="alamat" disabled></textarea>
                
                <label for="edit_nohp">No HP:</label>
                <input type="text" id="edit_nohp" name="nohp" disabled>
                
                <label for="edit_tempat_les">Tempat Les:</label>
                <select id="edit_tempat_les" name="tempat_les" disabled>
                    <option value="Bimbel">Bimbel</option>
                    <option value="Rumah">Rumah</option>
                </select>
                
                <label for="edit_pilihanprogram">Pilihan Program:</label>
                <input type="text" id="edit_pilihanprogram" name="pilihanprogram" disabled>
                
                <label for="status_siswa">Status Siswa:</label>
                <input type="text" id="status_siswa" name="status_siswa" required>

                <label for="keterangan">Keterangan:</label>
                <textarea id="edit_keterangan" name="keterangan" disabled></textarea>
                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

 <script src="aset/script-data-siswa-nonaktif.js"></script>

</body>

</html>

<?php
$conn->close();
?>