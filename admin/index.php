<?php
session_start(); // Mulai session

// Periksa apakah admin sudah login
if (!isset($_SESSION['admin_id'])) {
    header('Location: ../index.php'); // Redirect ke halaman login jika belum login
    exit();
}

// Jika sudah login, tampilkan halaman admin
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="aset/style.css">
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            min-height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color:rgb(237, 248, 254);
        }
       
        .sidebar {
            width: 200px;
            background-color:rgb(220, 240, 252);
            color: rgb(24, 24, 24);
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            padding: 15px;
            flex-shrink: 0;
        }

        .sidebar .logo {
            text-align: center;
            margin-bottom: 20px;
            width: 100%;
        }
        .sidebar .logo img {
            
            width: 40%;
        }

        .sidebar a {
            color: rgb(86, 86, 86);
            font-size: 20px;
            text-decoration: none;
            display: block;
            padding: 20px 10px;
            margin:  0;
            border-radius: 8px;
            border-bottom: 1px solid rgb(255, 255, 255);

        }
        .sidebar a i {
            margin-right: 10px;
        }

        .sidebar a:hover {
            background-color: rgba(75, 115, 236, 0.8);
            color: rgb(255, 255, 255);
        }

        .menu-item {
            padding: 15px;
            text-decoration: none;
            color: white;
            display: block;
        }

        .menu-item:hover {
            background-color: #575757;
        }

        .content {
            flex-grow: 1;
            margin-left: 220px;
            padding: 20px;
            width: calc(100% - 220px);
            overflow: auto;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 50px;
                height: auto;
                position: relative;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .sidebar a {
                padding: 10px;
                text-align: center;
            }

            .sidebar a span {
                display: none;
            }

            .sidebar .logo img {
            
            width: 50%;
        }

            .content {
                margin-left: 10px;
                width: calc(100% - 60px);
                padding: 5px;
            }
        }
    </style>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
    <div class="sidebar">
        <div class="logo">
            <img src="aset/img/success.png" alt="Logo" >
        </div>
        
        <a href="?page=dashboard" class="menu-item">
            <i class="fas fa-tachometer-alt"></i> <span>Dashboard</span>
        </a>
        <a href="?page=data-siswa-aktif" class="menu-item">
            <i class="fas fa-user-graduate"></i> <span>Siswa Aktif</span>
        </a>
        <a href="?page=data-siswa-nonaktif" class="menu-item">
            <i class="fas fa-user-slash"></i> <span>Siswa Non Aktif</span>
        </a>
        <a href="?page=data-program" class="menu-item">
            <i class="fas fa-book"></i> <span>Program</span>
        </a>
        <a href="?page=data-guru" class="menu-item">
            <i class="fas fa-chalkboard-teacher"></i> <span>Guru</span>
        </a>
        <a href="?page=jadwal-bimbel" class="menu-item">
            <i class="fas fa-calendar-alt"></i> <span>Jadwal Bimbel</span>
        </a>
       
        <a href="logout.php" class="menu-item" id="logout">
            <i class="fas fa-sign-out-alt"></i> <span>Log Out</span>
        </a>
    </div>
   
    <div class="content" id="content">
        <?php
        $page = isset($_GET['page']) ? $_GET['page'] : 'dashboard';
        $allowed_pages = ['dashboard', 'data-siswa-aktif', 'data-siswa-nonaktif', 'data-program', 'registrasi','data-guru', 'jadwal-bimbel'];
        if (in_array($page, $allowed_pages)) {
            include $page . '.php';
        } else {
            include 'dashboard.php';
        }
        ?>
    </div>

</body>

</html>
