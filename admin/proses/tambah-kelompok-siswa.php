<?php
include '../../koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_kelompok = $_POST['id_kelompok'];
    $id_siswa = $_POST['id_siswa'];

    $sql = "INSERT INTO kelompok_siswa (id_kelompok, id_siswa) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $id_kelompok, $id_siswa);

    if ($stmt->execute()) {
        // Redirect to jadwal-bimbel.php after successful insertion
        header("Location: ../?page=jadwal-bimbel");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

$conn->close();
?>