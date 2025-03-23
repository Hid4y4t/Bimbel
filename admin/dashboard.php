<?php
include '../koneksi/koneksi.php';

// Query untuk mendapatkan data siswa
$sql = "SELECT COUNT(*) as total_siswa, 
               SUM(status_siswa = 'Aktif') as siswa_aktif, 
               SUM(status_siswa = 'Tidak Aktif') as siswa_tidak_aktif, 
               SUM(tempat_les = 'Bimbel') as tempat_les_bimbel, 
               SUM(tempat_les = 'Rumah') as tempat_les_rumah 
        FROM siswa";
$result = $conn->query($sql);

$data = $result->fetch_assoc();

// Query untuk mendapatkan data jumlah siswa berdasarkan pilihanprogram
$sql_program = "SELECT pilihanprogram, COUNT(*) as jumlah_siswa 
                FROM siswa 
                GROUP BY pilihanprogram";
$result_program = $conn->query($sql_program);

$programs = [];
$jumlah_siswa = [];

while ($row = $result_program->fetch_assoc()) {
    $programs[] = $row['pilihanprogram'];
    $jumlah_siswa[] = $row['jumlah_siswa'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <link rel="stylesheet" href="aset/style-dashboard.css">
</head>

<body>
    <div class="page-card">
        <div class="data-card">
            <div class="icon">
                <i class="fas fa-user-graduate"></i>
            </div>
            <div class="text">
                <div class="title">Jumlah Siswa</div>
                <div class="jumlah-data"><?php echo $data['total_siswa']; ?></div>
            </div>
        </div>

        <div class="data-card">
            <div class="icon">
                <i class="fas fa-user-check"></i>
            </div>
            <div class="text">
                <div class="title">Siswa Aktif</div>
                <div class="jumlah-data"><?php echo $data['siswa_aktif']; ?></div>
            </div>
        </div>

        <div class="data-card">
            <div class="icon">
                <i class="fas fa-user-times"></i>
            </div>
            <div class="text">
                <div class="title">Siswa Tidak Aktif</div>
                <div class="jumlah-data"><?php echo $data['siswa_tidak_aktif']; ?></div>
            </div>
        </div>

        <div class="data-card">
            <div class="icon">
                <i class="fas fa-school"></i>
            </div>
            <div class="text">
                <div class="title">Tempat Les Bimbel</div>
                <div class="jumlah-data"><?php echo $data['tempat_les_bimbel']; ?></div>
            </div>
        </div>

        <div class="data-card">
            <div class="icon">
                <i class="fas fa-home"></i>
            </div>
            <div class="text">
                <div class="title">Tempat Les Rumah</div>
                <div class="jumlah-data"><?php echo $data['tempat_les_rumah']; ?></div>
            </div>
        </div>
    </div>

    <div class="grafik">
        <div class="grf-batang">
        <h2>Data peminatan program</h2>
            <button id="showChart"><i class="fas fa-chart-bar"></i> Tampilkan data Dalam Grafik</button>
            <button id="showTable"><i class="fas fa-table"></i> Tampilkan data Dalam Tabel</button>
           
           
           
            
           
            <div style="overflow-x:auto;">
                <table id="programTable" class="display">
                    <thead>
                        <tr>
                            <th>Program</th>
                            <th>Jumlah Siswa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($programs as $key => $program) : ?>
                            <tr>
                                <td><?php echo $program; ?></td>
                                <td><?php echo $jumlah_siswa[$key]; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <canvas id="barChart"></canvas>
        </div>
       
    </div>

    <script>
      $(document).ready(function() {
    $('#programTable').DataTable({
        "pageLength": 10
    });

    $('#showChart').click(function() {
        $('#barChart').show();
        $('#programTable_wrapper').hide();
    });

    $('#showTable').click(function() {
        $('#barChart').hide();
        $('#programTable_wrapper').show();
    });

    var ctx = document.getElementById('barChart').getContext('2d');
    var barChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: <?php echo json_encode($programs); ?>,
            datasets: [{
                label: 'Jumlah Siswa',
                data: <?php echo json_encode($jumlah_siswa); ?>,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
});
    </script>
</body>

</html>

<?php
$conn->close();
?>