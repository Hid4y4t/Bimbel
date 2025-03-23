<?php
include '../../koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_siswa = $_POST['id_siswa'];
    $hari = $_POST['hari'];
    $jam = $_POST['jam'];
    $id_guru = $_POST['id_guru'];
    $alamat = $_POST['alamat'];

    $sql = "INSERT INTO jadwal_bimbel (id_siswa, hari, jam, id_guru, alamat) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("issss", $id_siswa, $hari, $jam, $id_guru, $alamat);

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