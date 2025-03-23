<?php
// Mulai session
session_start();

// Hapus semua data session
session_unset();

// Hancurkan session
session_destroy();

// Redirect pengguna ke halaman login
header('Location: ../index.php');
exit(); // Pastikan tidak ada kode yang dieksekusi setelah redirect
?>