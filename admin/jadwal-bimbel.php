<?php
include '../koneksi/koneksi.php';

// Query untuk mendapatkan data kelompok siswa
$sql_kelompok_siswa = "SELECT ks.*, s.nama AS nama_siswa, kb.nama_kelompok 
                       FROM kelompok_siswa ks
                       JOIN siswa s ON ks.id_siswa = s.id_siswa
                       JOIN kelompok_bimbel kb ON ks.id_kelompok = kb.id_kelompok";
$result_kelompok_siswa = $conn->query($sql_kelompok_siswa);

// Query untuk mendapatkan data kelompok bimbel
$sql_kelompok_bimbel = "SELECT kb.*, g.nama_guru 
                        FROM kelompok_bimbel kb
                        JOIN guru g ON kb.id_guru = g.id_guru";
$result_kelompok_bimbel = $conn->query($sql_kelompok_bimbel);

// Query untuk mendapatkan data jadwal bimbel
$sql_jadwal_bimbel = "SELECT jb.*, s.nama AS nama_siswa, g.nama_guru 
                      FROM jadwal_bimbel jb
                      JOIN siswa s ON jb.id_siswa = s.id_siswa
                      JOIN guru g ON jb.id_guru = g.id_guru";
$result_jadwal_bimbel = $conn->query($sql_jadwal_bimbel);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jadwal Bimbel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="aset/style-jadwal-bimbel.css">
</head>

<body>

    <div class="page-data">
        <div class="page-data_header">
            <h2>Kelompok Bimbel</h2>
            <button class="btn" id="tambahKelompokBimbelBtn"><i class="fas fa-plus"></i> Tambah Kelompok Bimbel</button>
        </div>

        <div class="page-data_table">
            <table id="kelompokBimbelTable" class="display">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Kelompok</th>
                        <th>Guru</th>
                        <th>Hari</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result_kelompok_bimbel->num_rows > 0) {
                        $no = 1;
                        while ($row = $result_kelompok_bimbel->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $no++ . "</td>";
                            echo "<td>" . $row['nama_kelompok'] . "</td>";
                            echo "<td>" . $row['nama_guru'] . "</td>";
                            echo "<td>" . $row['hari'] . "</td>";
                            echo "<td>
                                    <button class='btn view-btn-kelompok' data-id='" . $row['id_kelompok'] . "' style='background-color: #28a745;'><i class='fas fa-eye'></i></button>
                                    <button class='btn edit-btn-kelompok' data-id='" . $row['id_kelompok'] . "' style='background-color: #ffc107;'><i class='fas fa-edit'></i></button>
                                    <button class='btn delete-btn-kelompok' data-id='" . $row['id_kelompok'] . "' style='background-color: #dc3545;'><i class='fas fa-trash'></i></button>
                                  </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='5'>Tidak ada data kelompok bimbel</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <div class="page-data">
        <div class="page-data_header">
            <h2>Kelompok Siswa</h2>
            <button class="btn" id="tambahKelompokSiswaBtn"><i class="fas fa-plus"></i> Tambah Kelompok Siswa</button>
        </div>

        <div class="page-data_table">
            <table id="kelompokSiswaTable" class="display">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Kelompok</th>
                        <th>Nama Siswa</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result_kelompok_siswa->num_rows > 0) {
                        $no = 1;
                        while ($row = $result_kelompok_siswa->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $no++ . "</td>";
                            echo "<td>" . $row['nama_kelompok'] . "</td>";
                            echo "<td>" . $row['nama_siswa'] . "</td>";
                            echo "<td>
                                    <button class='btn view-btn-siswa' data-id='" . $row['id_kelompok_siswa'] . "' style='background-color: #28a745;'><i class='fas fa-eye'></i></button>
                                    <button class='btn edit-btn-siswa' data-id='" . $row['id_kelompok_siswa'] . "' style='background-color: #ffc107;'><i class='fas fa-edit'></i></button>
                                    <button class='btn delete-btn-siswa' data-id='" . $row['id_kelompok_siswa'] . "' style='background-color: #dc3545;'><i class='fas fa-trash'></i></button>
                                  </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>Tidak ada data kelompok siswa</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <div class="page-data">
        <div class="page-data_header">
            <h2>Bimbel Private</h2>
            <button class="btn" id="tambahJadwalBimbelBtn"><i class="fas fa-plus"></i> Tambah Jadwal</button>
        </div>

        <div class="page-data_table">
            <table id="jadwalBimbelTable" class="display">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Siswa</th>
                        <th>Hari</th>
                        <th>Guru</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result_jadwal_bimbel->num_rows > 0) {
                        $no = 1;
                        while ($row = $result_jadwal_bimbel->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $no++ . "</td>";
                            echo "<td>" . $row['nama_siswa'] . "</td>";
                            echo "<td>" . $row['hari'] . "</td>";
                            echo "<td>" . $row['nama_guru'] . "</td>";
                            echo "<td>
                                    <button class='btn view-btn-jadwal' data-id='" . $row['id_bimbel'] . "' style='background-color: #28a745;'><i class='fas fa-eye'></i></button>
                                   
                                    <button class='btn delete-btn-jadwal' data-id='" . $row['id_bimbel'] . "' style='background-color: #dc3545;'><i class='fas fa-trash'></i></button>
                                  </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='5'>Tidak ada data jadwal bimbel</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal Tambah Kelompok Bimbel -->
    <div id="tambahKelompokBimbelModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Tambah Kelompok Bimbel</h2>
            <form id="tambahKelompokBimbelForm" action="proses/tambah-kelompok-bimbel.php" method="POST">
                <label for="nama_kelompok">Nama Kelompok:</label>
                <input type="text" id="nama_kelompok" name="nama_kelompok" required>

                <label for="guru">Guru:</label>
                <select id="guru" name="id_guru" required>
                    <?php
                    $sql_guru = "SELECT id_guru, nama_guru FROM guru";
                    $result_guru = $conn->query($sql_guru);
                    if ($result_guru->num_rows > 0) {
                        while ($row_guru = $result_guru->fetch_assoc()) {
                            echo "<option value='" . $row_guru['id_guru'] . "'>" . $row_guru['nama_guru'] . "</option>";
                        }
                    }
                    ?>
                </select>

                <label for="hari">Hari:</label>
                <select id="hari" name="hari" required>
                    <option value="Senin">Senin</option>
                    <option value="Selasa">Selasa</option>
                    <option value="Rabu">Rabu</option>
                    <option value="Kamis">Kamis</option>
                    <option value="Jumat">Jumat</option>
                    <option value="Sabtu">Sabtu</option>
                    <option value="Minggu">Minggu</option>
                </select>

                <label for="jam">Jam:</label>
                <input type="time" id="jam" name="jam" required>

                <label for="alamat">Alamat:</label>
                <input type="text" id="alamat" name="alamat" required>

                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

    <!-- Modal Tambah Kelompok Siswa -->
    <div id="tambahKelompokSiswaModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Tambah Kelompok Siswa</h2>
            <form id="tambahKelompokSiswaForm" action="proses/tambah-kelompok-siswa.php" method="POST">
                <label for="nama_kelompok">Nama Kelompok:</label>
                <select id="nama_kelompok" name="id_kelompok" required>
                    <?php
                    $sql_kelompok = "SELECT id_kelompok, nama_kelompok FROM kelompok_bimbel";
                    $result_kelompok = $conn->query($sql_kelompok);
                    if ($result_kelompok->num_rows > 0) {
                        while ($row_kelompok = $result_kelompok->fetch_assoc()) {
                            echo "<option value='" . $row_kelompok['id_kelompok'] . "'>" . $row_kelompok['nama_kelompok'] . "</option>";
                        }
                    }
                    ?>
                </select>

                <label for="nama_siswa">Nama Siswa:</label>
                <select id="nama_siswa" name="id_siswa" required>
                    <?php
                    $sql_siswa = "SELECT id_siswa, nama FROM siswa";
                    $result_siswa = $conn->query($sql_siswa);
                    if ($result_siswa->num_rows > 0) {
                        while ($row_siswa = $result_siswa->fetch_assoc()) {
                            echo "<option value='" . $row_siswa['id_siswa'] . "'>" . $row_siswa['nama'] . "</option>";
                        }
                    }
                    ?>
                </select>

                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

    <!-- Modal Tambah Jadwal Bimbel -->
    <div id="tambahJadwalBimbelModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Tambah Jadwal Bimbel</h2>
            <form id="tambahJadwalBimbelForm" action="proses/tambah-jadwal-bimbel.php" method="POST">
                <label for="nama_siswa">Nama Siswa:</label>
                <select id="nama_siswa" name="id_siswa" required>
                    <?php
                    $sql_siswa = "SELECT id_siswa, nama FROM siswa";
                    $result_siswa = $conn->query($sql_siswa);
                    if ($result_siswa->num_rows > 0) {
                        while ($row_siswa = $result_siswa->fetch_assoc()) {
                            echo "<option value='" . $row_siswa['id_siswa'] . "'>" . $row_siswa['nama'] . "</option>";
                        }
                    }
                    ?>
                </select>

                <label for="hari">Hari:</label>
                <select id="hari" name="hari" required>
                    <option value="Senin">Senin</option>
                    <option value="Selasa">Selasa</option>
                    <option value="Rabu">Rabu</option>
                    <option value="Kamis">Kamis</option>
                    <option value="Jumat">Jumat</option>
                    <option value="Sabtu">Sabtu</option>
                    <option value="Minggu">Minggu</option>
                </select>

                <label for="jam">Jam:</label>
                <input type="time" id="jam" name="jam" required>

                <label for="guru">Guru:</label>
                <select id="guru" name="id_guru" required>
                    <?php
                    $sql_guru = "SELECT id_guru, nama_guru FROM guru";
                    $result_guru = $conn->query($sql_guru);
                    if ($result_guru->num_rows > 0) {
                        while ($row_guru = $result_guru->fetch_assoc()) {
                            echo "<option value='" . $row_guru['id_guru'] . "'>" . $row_guru['nama_guru'] . "</option>";
                        }
                    }
                    ?>
                </select>

                <label for="alamat">Alamat:</label>
                <input type="text" id="alamat" name="alamat" required>

                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

    <!-- Modal View Kelompok Bimbel -->
    <div id="viewKelompokBimbelModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div id="viewKelompokBimbelDetail"></div>
        </div>
    </div>

    <!-- Modal Edit Kelompok Bimbel -->
    <div id="editKelompokBimbelModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Edit Kelompok Bimbel</h2>
            <form id="editKelompokBimbelForm" action="proses/edit-kelompok-bimbel.php" method="POST">
                <input type="hidden" id="edit_kelompok_bimbel_id" name="id_kelompok">
                <label for="edit_nama_kelompok">Nama Kelompok:</label>
                <input type="text" id="edit_nama_kelompok" name="nama_kelompok" required>
                <label for="edit_guru">Guru:</label>
                <select id="edit_guru" name="id_guru" required>
                    <?php
                    $sql_guru = "SELECT id_guru, nama_guru FROM guru";
                    $result_guru = $conn->query($sql_guru);
                    if ($result_guru->num_rows > 0) {
                        while ($row_guru = $result_guru->fetch_assoc()) {
                            echo "<option value='" . $row_guru['id_guru'] . "'>" . $row_guru['nama_guru'] . "</option>";
                        }
                    }
                    ?>
                </select>
                <label for="edit_hari">Hari:</label>
                <select id="edit_hari" name="hari" required>
                    <option value="Senin">Senin</option>
                    <option value="Selasa">Selasa</option>
                    <option value="Rabu">Rabu</option>
                    <option value="Kamis">Kamis</option>
                    <option value="Jumat">Jumat</option>
                    <option value="Sabtu">Sabtu</option>
                    <option value="Minggu">Minggu</option>
                </select>
                <label for="edit_jam">Jam:</label>
                <input type="time" id="edit_jam" name="jam" required>
                <label for="edit_alamat">Alamat:</label>
                <input type="text" id="edit_alamat" name="alamat" required>
                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

    <!-- Modal View Kelompok Siswa -->
    <div id="viewKelompokSiswaModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div id="viewKelompokSiswaDetail"></div>
        </div>
    </div>

    <!-- Modal Edit Kelompok Siswa -->
    <div id="editKelompokSiswaModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Edit Kelompok Siswa</h2>
            <form id="editKelompokSiswaForm" action="proses/edit-kelompok-siswa.php" method="POST">
                <input type="hidden" id="edit_kelompok_siswa_id" name="id_kelompok_siswa">
                <label for="edit_nama_kelompok">Nama Kelompok:</label>
                <select id="edit_nama_kelompok" name="id_kelompok" required>
                    <?php
                    $sql_kelompok = "SELECT id_kelompok, nama_kelompok FROM kelompok_bimbel";
                    $result_kelompok = $conn->query($sql_kelompok);
                    if ($result_kelompok->num_rows > 0) {
                        while ($row_kelompok = $result_kelompok->fetch_assoc()) {
                            echo "<option value='" . $row_kelompok['id_kelompok'] . "'>" . $row_kelompok['nama_kelompok'] . "</option>";
                        }
                    }
                    ?>
                </select>
                <label for="edit_nama_siswa">Nama Siswa:</label>
                <select id="edit_nama_siswa" name="id_siswa" required>
                    <?php
                    $sql_siswa = "SELECT id_siswa, nama FROM siswa";
                    $result_siswa = $conn->query($sql_siswa);
                    if ($result_siswa->num_rows > 0) {
                        while ($row_siswa = $result_siswa->fetch_assoc()) {
                            echo "<option value='" . $row_siswa['id_siswa'] . "'>" . $row_siswa['nama'] . "</option>";
                        }
                    }
                    ?>
                </select>
                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>
    </div>

    <!-- Modal View Jadwal Bimbel -->
    <div id="viewJadwalBimbelModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div id="viewJadwalBimbelDetail"></div>
        </div>
    </div>


    <script src="aset/script-jadwal-bimbel.js"></script>

</body>

</html>