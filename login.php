<?php
session_start(); // Mulai session
include 'koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Query untuk mencari admin berdasarkan email
    $sql = "SELECT * FROM admin WHERE username = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            // Simpan informasi login di session
            $_SESSION['admin_id'] = $row['id'];
            $_SESSION['admin_email'] = $row['username'];

            // Kirim respons JSON untuk sukses
            echo json_encode(['status' => 'success', 'message' => 'Login berhasil!']);
            exit();
        } else {
            // Jika password salah
            echo json_encode(['status' => 'error', 'message' => 'Password salah!']);
        }
    } else {
        // Jika email tidak ditemukan
        echo json_encode(['status' => 'error', 'message' => 'Email tidak ditemukan!']);
    }

    $conn->close();
}
?>