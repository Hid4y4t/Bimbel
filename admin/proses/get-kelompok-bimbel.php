<?php
include '../../koneksi/koneksi.php';

if (isset($_GET['id_kelompok'])) {
    $id_kelompok = $_GET['id_kelompok'];
    $sql = "SELECT * FROM kelompok_bimbel WHERE id_kelompok = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_kelompok);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode($row);
    } else {
        echo json_encode(['error' => 'Data tidak ditemukan.']);
    }

    $stmt->close();
} else {
    echo json_encode(['error' => 'ID tidak ditemukan.']);
}

$conn->close();
?>