<?php
include '../../koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama_guru = $_POST['nama_guru'];
    $alamat = $_POST['alamat'];
    $no_telp = $_POST['no_telp'];
    $email = $_POST['email'];
    $tanggal_lahir = $_POST['tanggal_lahir'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $pendidikan_terakhir = $_POST['pendidikan_terakhir'];
    $bidang_keahlian = $_POST['bidang_keahlian'];
    $tanggal_mulai_kerja = $_POST['tanggal_mulai_kerja'];
    $status_aktif = $_POST['status_aktif'];

    $sql = "INSERT INTO guru (nama_guru, alamat, no_telp, email, tanggal_lahir, jenis_kelamin, pendidikan_terakhir, bidang_keahlian, tanggal_mulai_kerja, status_aktif) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssssss", $nama_guru, $alamat, $no_telp, $email, $tanggal_lahir, $jenis_kelamin, $pendidikan_terakhir, $bidang_keahlian, $tanggal_mulai_kerja, $status_aktif);

    if ($stmt->execute()) {
        // Redirect to admin/?page=data-guru after successful insertion
        header("Location: ../?page=data-guru");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

$conn->close();
?>