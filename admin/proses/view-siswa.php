<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM siswa WHERE id_siswa = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo "<style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-bottom: 20px;
                }
                td {
                    padding: 10px;
                    border-bottom: 1px solid #ddd;
                }
                .button {
                    display: inline-block;
                    padding: 10px 20px;
                    font-size: 16px;
                    cursor: pointer;
                    text-align: center;
                    text-decoration: none;
                    outline: none;
                    color: #fff;
                    background-color: #4CAF50;
                    border: none;
                    border-radius: 15px;
                    box-shadow: 0 9px #999;
                }
                .button:hover {background-color: #3e8e41}
                .button:active {
                    background-color: #3e8e41;
                    box-shadow: 0 5px #666;
                    transform: translateY(4px);
                }
              </style>";
        echo "<table>";
        echo "<tr><td><strong>Nama:</strong></td><td>" . $row['nama'] . "</td></tr>";
        echo "<tr><td><strong>Tempat Lahir:</strong></td><td>" . $row['tempatlahir'] . "</td></tr>";
        echo "<tr><td><strong>Tanggal Lahir:</strong></td><td>" . $row['tanggallahir'] . "</td></tr>";
        echo "<tr><td><strong>Asal Sekolah:</strong></td><td>" . $row['asalsekolah'] . "</td></tr>";
        echo "<tr><td><strong>Kelas:</strong></td><td>" . $row['kelas'] . "</td></tr>";
        echo "<tr><td><strong>Jenis Kelamin:</strong></td><td>" . $row['jeniskelamin'] . "</td></tr>";
        echo "<tr><td><strong>Alamat:</strong></td><td>" . $row['alamat'] . "</td></tr>";
        echo "<tr><td><strong>No HP:</strong></td><td>" . $row['nohp'] . "</td></tr>";
        echo "<tr><td><strong>Tempat Les:</strong></td><td>" . $row['tempat_les'] . "</td></tr>";
        echo "<tr><td><strong>Pilihan Program:</strong></td><td>" . $row['pilihanprogram'] . "</td></tr>";
        echo "<tr><td><strong>Tanggal Pendaftaran:</strong></td><td>" . $row['tglpendaftaran'] . "</td></tr>";
        echo "<tr><td><strong>Keterangan:</strong></td><td>" . $row['keterangan'] . "</td></tr>";
        echo "</table>";
        echo "<a href='index.php' class='button'>Kembali</a>";
    } else {
        echo "<p>Data tidak ditemukan.</p>";
    }

    $stmt->close();
} else {
    echo "<p>ID tidak ditemukan.</p>";
}

$conn->close();
?>