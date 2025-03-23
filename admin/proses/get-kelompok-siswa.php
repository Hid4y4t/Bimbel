<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id_kelompok_siswa'])) {
    $id_kelompok_siswa = $_GET['id_kelompok_siswa'];
    $sql = "SELECT ks.*, s.nama AS nama_siswa, kb.nama_kelompok 
            FROM kelompok_siswa ks
            JOIN siswa s ON ks.id_siswa = s.id_siswa
            JOIN kelompok_bimbel kb ON ks.id_kelompok = kb.id_kelompok
            WHERE ks.id_kelompok_siswa = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_kelompok_siswa);
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