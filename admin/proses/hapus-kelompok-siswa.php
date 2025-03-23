<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id_kelompok_siswa'])) {
    $id_kelompok_siswa = $_GET['id_kelompok_siswa'];

    // Query untuk menghapus data kelompok siswa berdasarkan id_kelompok_siswa
    $sql = "DELETE FROM kelompok_siswa WHERE id_kelompok_siswa = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_kelompok_siswa);

    if ($stmt->execute()) {
        // Redirect to jadwal-bimbel.php after successful deletion
        header("Location: ../?page=jadwal-bimbel");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

$conn->close();
?>