<?php
include '../../koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
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
    $keterangan = $_POST['keterangan'];
    $tglpendaftaran = date('Y-m-d'); // Mengisi tglpendaftaran dengan tanggal saat ini

    $sql = "INSERT INTO siswa (nama, tempatlahir, tanggallahir, asalsekolah, kelas, jeniskelamin, alamat, nohp, tempat_les, pilihanprogram, tglpendaftaran, status_siswa, keterangan) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Aktif', ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssssssss", $nama, $tempatlahir, $tanggallahir, $asalsekolah, $kelas, $jeniskelamin, $alamat, $nohp, $tempat_les, $pilihanprogram, $tglpendaftaran, $keterangan);

    if ($stmt->execute()) {
        // Redirect to admin/?page=data-siswa-aktif after successful insertion
        header("Location: ../?page=data-siswa-aktif");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

$conn->close();
?>