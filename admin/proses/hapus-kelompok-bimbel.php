<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id_kelompok'])) {
    $id_kelompok = $_GET['id_kelompok'];

    // Query untuk menghapus data kelompok bimbel berdasarkan id_kelompok
    $sql = "DELETE FROM kelompok_bimbel WHERE id_kelompok = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_kelompok);

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