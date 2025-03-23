<?php
include '../../koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_siswa = $_POST['id_siswa'];
    $nama = $_POST['nama'];
    $tempatlahir = $_POST['tempatlahir'];
    $tanggallahir = $_POST['tanggallahir'];
    $asalsekolah = $_POST['asalsekolah'];
    $kelas = $_POST['kelas'];
    $jeniskelamin = $_POST['jeniskelamin'];
    $alamat = $_POST['alamat'];
    $nohp = $_POST['nohp'];
    $tempat_les = $_POST['tempat_les'];
    $pilihanprogram = $_POST['pilihanprogram'];
    $status_siswa = $_POST['status_siswa'];
    $keterangan = $_POST['keterangan'];

    $sql = "UPDATE siswa SET nama = ?, tempatlahir = ?, tanggallahir = ?, asalsekolah = ?, kelas = ?, jeniskelamin = ?, alamat = ?, nohp = ?, tempat_les = ?, pilihanprogram = ?, status_siswa = ?, keterangan = ? WHERE id_siswa = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssssssssi", $nama, $tempatlahir, $tanggallahir, $asalsekolah, $kelas, $jeniskelamin, $alamat, $nohp, $tempat_les, $pilihanprogram, $status_siswa, $keterangan, $id_siswa);

    if ($stmt->execute()) {
        // Redirect to admin/?page=data-siswa-aktif after successful update
        header("Location: ../?page=data-siswa-aktif");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

$conn->close();
?>