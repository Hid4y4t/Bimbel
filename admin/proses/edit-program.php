<?php
include '../../koneksi/koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_programpilihan = $_POST['id_programpilihan'];
    $pilihanprogram = $_POST['pilihanprogram'];
    $biayaprogram = $_POST['biayaprogram'];

    $sql = "UPDATE programpilihan SET pilihanprogram = ?, biayaprogram = ? WHERE id_programpilihan = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssi", $pilihanprogram, $biayaprogram, $id_programpilihan);

    if ($stmt->execute()) {
        // Redirect to admin/?page=data-program after successful update
        header("Location: ../?page=data-program");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

$conn->close();
?>