<?php
include '../../koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama_kelompok = $_POST['nama_kelompok'];
    $id_guru = $_POST['id_guru'];
    $hari = $_POST['hari'];
    $jam = $_POST['jam'];
    $alamat = $_POST['alamat'];

    $sql = "INSERT INTO kelompok_bimbel (nama_kelompok, id_guru, hari, jam, alamat) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sisss", $nama_kelompok, $id_guru, $hari, $jam, $alamat);

    if ($stmt->execute()) {
        // Redirect to jadwal-bimbel.php after successful insertion
        header("Location:  ../?page=jadwal-bimbel");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

$conn->close();
?>