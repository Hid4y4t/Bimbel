<?php
include 'koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT); // Hash password

    // Query untuk menyimpan data ke database
    $sql = "INSERT INTO admin (username, password) VALUES ('$email', '$password')";

    if ($conn->query($sql)) {
        echo json_encode(['status' => 'success', 'message' => 'Registrasi berhasil!']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Registrasi gagal: ' . $conn->error]);
    }

    $conn->close();
}
?>