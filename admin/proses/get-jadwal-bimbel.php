<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id_bimbel'])) {
    $id_bimbel = $_GET['id_bimbel'];
    $sql = "SELECT jb.*, s.nama AS nama, g.nama_guru 
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
        echo json_encode($row);
    } else {
        echo json_encode(['error' => 'Data tidak ditemukan.']);
    }

    $stmt->close();
} else {
    echo json_encode(['error' => 'ID tidak ditemukan.']);
}

$conn->close();
?>