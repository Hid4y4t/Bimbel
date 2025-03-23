<?php
include '../koneksi/koneksi.php';

// Query untuk mendapatkan data program
$sql = "SELECT id_programpilihan, pilihanprogram, biayaprogram FROM programpilihan";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Program</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="aset/style-data-program.css">
</head>
<body>
    
<div class="page-program container mt-5">
    <div class="program-head">
        <h2>Data Program</h2>
        <button id="addProgramBtn" class="btn-primary">
            <i class="fas fa-plus"></i> Tambah Program
        </button>

        <!-- Modal Tambah Program -->
        <div id="addProgramModal" class="modal">
            <div class="modal-content">
            <span class="close1">&times;</span>
            <h2>Tambah Program</h2>
            <form id="addProgramForm" action="proses/tambah-program.php" method="POST">
                <label for="pilihanprogram">Nama Program:</label>
                <input type="text" id="pilihanprogram" name="pilihanprogram" required>
                
                <label for="biayaprogram">Biaya:</label>
                <input type="text" id="biayaprogram" name="biayaprogram" required>
                
                <button type="submit" class="btn-primary">Tambah</button>
            </form>
            </div>
        </div>
    </div>
    <div class="program-data">
        <table id="programTable" class="table display">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Program</th>
                    <th>Biaya</th>
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
                        echo "<td>" . $row['pilihanprogram'] . "</td>";
                        echo "<td>" . $row['biayaprogram'] . "</td>";
                        echo "<td>
                                <button class='btn-sm btn-warning edit-btn' data-id='" . $row['id_programpilihan'] . "'><i class='fas fa-edit'></i></button>
                                <button class='btn-sm btn-danger delete-btn' data-id='" . $row['id_programpilihan'] . "'><i class='fas fa-trash'></i></button>
                              </td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='4'>Tidak ada data program</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal Edit Program -->
<div id="editProgramModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Edit Program</h2>
        <form id="editProgramForm" action="proses/edit-program.php" method="POST">
            <input type="hidden" id="edit_id_programpilihan" name="id_programpilihan">
            <label for="edit_pilihanprogram">Nama Program:</label>
            <input type="text" id="edit_pilihanprogram" name="pilihanprogram" required>
            
            <label for="edit_biayaprogram">Biaya:</label>
            <input type="text" id="edit_biayaprogram" name="biayaprogram" required>
            
            <button type="submit" class="btn-primary">Simpan</button>
        </form>
    </div>
</div>

<script src="aset/script-data-program.js"></script>

</body>
</html>

<?php
$conn->close();
?>