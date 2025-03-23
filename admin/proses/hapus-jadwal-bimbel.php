<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id_bimbel'])) {
    $id_bimbel = $_GET['id_bimbel'];

    // Query untuk menghapus data jadwal bimbel berdasarkan id_jadwal
    $sql = "DELETE FROM jadwal_bimbel WHERE id_bimbel = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_bimbel);

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