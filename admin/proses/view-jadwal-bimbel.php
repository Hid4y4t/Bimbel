<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id_bimbel'])) {
    $id_bimbel = $_GET['id_bimbel'];
    $sql = "SELECT jb.*, s.nama AS nama_siswa, g.nama_guru 
            FROM jadwal_bimbel jb
            JOIN siswa s ON jb.id_siswa = s.id_siswa
            JOIN guru g ON jb.id_guru = g.id_guru
            WHERE jb.id_bimbel = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_bimbel);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        ?>
        <table>
            <tr>
                <th>Nama Siswa</th>
                <td><?php echo $row['nama_siswa']; ?></td>
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
                <th>Guru</th>
                <td><?php echo $row['nama_guru']; ?></td>
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