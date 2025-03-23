<?php
include '../../koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $pilihanprogram = $_POST['pilihanprogram'];
    $biayaprogram = $_POST['biayaprogram'];

    $sql = "INSERT INTO programpilihan (pilihanprogram, biayaprogram) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $pilihanprogram, $biayaprogram);

    if ($stmt->execute()) {
        // Redirect to admin/?page=data-program after successful insertion
        header("Location: ../?page=data-program");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

$conn->close();
?>