<?php
include '../koneksi/koneksi.php';

// Query untuk mendapatkan data siswa yang statusnya "Aktif"
$sql = "SELECT id_siswa, nama, tempat_les, pilihanprogram FROM siswa WHERE status_siswa = 'Aktif'";
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
            <h2>Data Siswa Aktif</h2>
            <button class="btn" id="tambahSiswaBtn"><i class="fas fa-plus"></i> Tambah Siswa</button>
            
            <!-- Modal -->
            <div id="tambahSiswaModal" class="modal">
                <div class="modal-content">
                    <span class="close1">&times;</span>
                    <h2>Tambah Siswa</h2>
                    <form id="tambahSiswaForm" action="proses/tambah-siswa.php" method="POST">
                        <label for="nama">Nama:</label>
                        <input type="text" id="nama" name="nama" required>
                        
                        <label for="tempatlahir">Tempat Lahir:</label>
                        <input type="text" id="tempatlahir" name="tempatlahir" required>
                        
                        <label for="tanggallahir">Tanggal Lahir:</label>
                        <input type="date" id="tanggallahir" name="tanggallahir" required>
                        
                        <label for="asalsekolah">Asal Sekolah:</label>
                        <input type="text" id="asalsekolah" name="asalsekolah" required>
                        
                        <label for="kelas">Kelas:</label>
                        <input type="text" id="kelas" name="kelas" required>
                        
                        <label for="jeniskelamin">Jenis Kelamin:</label>
                        <select id="jeniskelamin" name="jeniskelamin" required>
                            <option value="Laki-laki">Laki-laki</option>
                            <option value="Perempuan">Perempuan</option>
                        </select>
                        
                        <label for="alamat">Alamat:</label>
                        <textarea id="alamat" name="alamat" required></textarea>
                        
                        <label for="nohp">No HP:</label>
                        <input type="text" id="nohp" name="nohp" required>
                        
                        <label for="tempat_les">Tempat Les:</label>
                        <select id="tempat_les" name="tempat_les" required>
                            <option value="Bimbel">Bimbel</option>
                            <option value="Rumah">Rumah</option>
                        </select>
                        
                        <label for="pilihanprogram">Pilihan Program:</label>
                        <select id="pilihanprogram" name="pilihanprogram" required>
                            <?php
                            if ($conn) {
                                $programSql = "SELECT id_programpilihan, pilihanprogram FROM programpilihan";
                                $programResult = $conn->query($programSql);
                                if ($programResult->num_rows > 0) {
                                    while ($programRow = $programResult->fetch_assoc()) {
                                        echo "<option value='" . $programRow['pilihanprogram'] . "'>" . $programRow['pilihanprogram'] . "</option>";
                                    }
                                } else {
                                    echo "<option value=''>Tidak ada program tersedia</option>";
                                }
                            } else {
                                echo "<option value=''>Koneksi database gagal</option>";
                            }
                            ?>
                        </select>

                        <label for="keterangan">Keterangan:</label>
                        <textarea id="keterangan" name="keterangan" required></textarea>
                        <button type="submit" class="btn">Simpan</button>
                    </form>
                </div>
            </div>
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
            <form id="editSiswaForm" action="proses/edit-siswa.php" method="POST">
                <input type="hidden" id="edit_id_siswa" name="id_siswa">
                <label for="edit_nama">Nama:</label>
                <input type="text" id="edit_nama" name="nama" required>
                
                <label for="edit_tempatlahir">Tempat Lahir:</label>
                <input type="text" id="edit_tempatlahir" name="tempatlahir" required>
                
                <label for="edit_tanggallahir">Tanggal Lahir:</label>
                <input type="date" id="edit_tanggallahir" name="tanggallahir" required>
                
                <label for="edit_asalsekolah">Asal Sekolah:</label>
                <input type="text" id="edit_asalsekolah" name="asalsekolah" required>
                
                <label for="edit_kelas">Kelas:</label>
                <input type="text" id="edit_kelas" name="kelas" required>
                
                <label for="edit_jeniskelamin">Jenis Kelamin:</label>
                <select id="edit_jeniskelamin" name="jeniskelamin" required>
                    <option value="Laki-laki">Laki-laki</option>
                    <option value="Perempuan">Perempuan</option>
                </select>
                
                <label for="edit_alamat">Alamat:</label>
                <textarea id="edit_alamat" name="alamat" required></textarea>
                
                <label for="edit_nohp">No HP:</label>
                <input type="text" id="edit_nohp" name="nohp" required>
                
                <label for="edit_tempat_les">Tempat Les:</label>
                <select id="edit_tempat_les" name="tempat_les" required>
                    <option value="Bimbel">Bimbel</option>
                    <option value="Rumah">Rumah</option>
                </select>
                
                <label for="edit_pilihanprogram">Pilihan Program:</label>
                <input type="text" id="edit_pilihanprogram" name="pilihanprogram" required>
                
                <label for="status_siswa">Status Siswa:</label>
                <input type="text" id="status_siswa" name="status_siswa" required>

                <label for="keterangan">Keterangan:</label>
                <textarea id="edit_keterangan" name="keterangan" ></textarea>
                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

   <script src="aset/script-data-siswa.js"></script>

</body>

</html>

<?php
$conn->close();
?>