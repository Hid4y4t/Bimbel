<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id_kelompok'])) {
    $id_kelompok = $_GET['id_kelompok'];
    $sql = "SELECT kb.*, g.nama_guru FROM kelompok_bimbel kb
            JOIN guru g ON kb.id_guru = g.id_guru
            WHERE kb.id_kelompok = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_kelompok);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        ?>
        <table>
            <tr>
                <th>Nama Kelompok</th>
                <td><?php echo $row['nama_kelompok']; ?></td>
            </tr>
            <tr>
                <th>Guru</th>
                <td><?php echo $row['nama_guru']; ?></td>
            </tr>
            <tr>
                <th>Hari</th>
                <td><?php echo $row['hari']; ?></td>
            </tr>
            <tr>
                <th>Jam</th>
                <td><?php echo $row['jam']; ?></td>
            </tr>
            <tr>
                <th>Alamat</th>
                <td><?php echo $row['alamat']; ?></td>
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