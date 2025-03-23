<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM guru WHERE id_guru = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        ?>
        <table>
            <tr>
                <th style="text-align: left;">Nama</th>
                <td>: <?php echo $row['nama_guru']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">Alamat</th>
                <td>: <?php echo $row['alamat']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">No Telpon</th>
                <td>: <?php echo $row['no_telp']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">Email</th>
                <td>: <?php echo $row['email']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">Tanggal Lahir</th>
                <td>: <?php echo $row['tanggal_lahir']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">Jenis Kelamin</th>
                <td>: <?php echo $row['jenis_kelamin']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">Pendidikan Terakhir</th>
                <td>: <?php echo $row['pendidikan_terakhir']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">Bidang Keahlian</th>
                <td>: <?php echo $row['bidang_keahlian']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">Tanggal Mulai Kerja</th>
                <td>: <?php echo $row['tanggal_mulai_kerja']; ?></td>
            </tr>
            <tr>
                <th style="text-align: left;">Status Aktif</th>
                <td>: <?php echo $row['status_aktif']; ?></td>
            </tr>
        </table>
        <?php
    } else {
        echo "Data tidak ditemukan.";
    }

    $stmt->close();
} else {
    echo "ID tidak ditemukan.";
}

$conn->close();
?>