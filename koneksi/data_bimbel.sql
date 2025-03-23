-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Mar 2025 pada 13.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_bimbel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'hidayat@gmail.com', '$2y$10$SsYk9sgeF6Vv8FarWSb2rexWJSPxSqM4Q.oLkQSV0Ca65ajEXGLfK', '2025-03-23 11:55:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `pendidikan_terakhir` varchar(100) DEFAULT NULL,
  `bidang_keahlian` varchar(100) DEFAULT NULL,
  `tanggal_mulai_kerja` date DEFAULT NULL,
  `status_aktif` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id_guru`, `nama_guru`, `alamat`, `no_telp`, `email`, `tanggal_lahir`, `jenis_kelamin`, `pendidikan_terakhir`, `bidang_keahlian`, `tanggal_mulai_kerja`, `status_aktif`) VALUES
(2, 'hidayat', 's', '23', 'hidayat@gmail.com', '2025-03-27', 'Laki-laki', 'S1', 'Programing', '2025-03-08', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_bimbel`
--

CREATE TABLE `jadwal_bimbel` (
  `id_bimbel` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL,
  `jam` time NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal_bimbel`
--

INSERT INTO `jadwal_bimbel` (`id_bimbel`, `id_siswa`, `id_guru`, `hari`, `jam`, `alamat`) VALUES
(1, 13, 2, 'Selasa', '22:41:08', 'aaa'),
(2, 18, 2, 'Rabu', '16:44:00', 'assadas'),
(4, 13, 2, 'Selasa', '22:16:00', 'a');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_bimbel`
--

CREATE TABLE `kelompok_bimbel` (
  `id_kelompok` int(11) NOT NULL,
  `nama_kelompok` varchar(100) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL,
  `jam` time NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelompok_bimbel`
--

INSERT INTO `kelompok_bimbel` (`id_kelompok`, `nama_kelompok`, `id_guru`, `hari`, `jam`, `alamat`) VALUES
(1, 'Sulaiman', 2, 'Selasa', '30:07:32', 'asd'),
(2, 'bilqis', 2, 'Kamis', '17:33:00', 'asdasd'),
(3, 'aaa', 2, 'Senin', '17:47:00', 'aaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_siswa`
--

CREATE TABLE `kelompok_siswa` (
  `id_kelompok_siswa` int(11) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelompok_siswa`
--

INSERT INTO `kelompok_siswa` (`id_kelompok_siswa`, `id_kelompok`, `id_siswa`) VALUES
(1, 1, 13),
(2, 2, 226),
(3, 1, 34);

-- --------------------------------------------------------

--
-- Struktur dari tabel `programpilihan`
--

CREATE TABLE `programpilihan` (
  `id_programpilihan` int(11) NOT NULL,
  `pilihanprogram` varchar(50) NOT NULL,
  `biayaprogram` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `programpilihan`
--

INSERT INTO `programpilihan` (`id_programpilihan`, `pilihanprogram`, `biayaprogram`) VALUES
(1, 'PRIVAT 2 SD', '100000'),
(2, 'PRIVAT BTA', '50000'),
(13, 'BTA DEWASA', '50000'),
(19, 'BASMALA KIDS', '50000'),
(20, 'PRIVAT 3 SD', '100000'),
(21, 'PRIVAT 4 SD', '100000'),
(22, 'PRIVAT 5 SD', '100000'),
(23, 'PRIVAT 6 SD', '100000'),
(24, 'PRIVAT 7 SMP', '100000'),
(25, 'PRIVAT 8 SMP', '100000'),
(26, 'PRIVAT 9 SMP', '100000'),
(27, 'PRIVAT 10 SMA', '100000'),
(28, 'PRIVAT 11 SMA', '100000'),
(29, 'PRIVAT 12 SMA', '100000'),
(30, 'REGULER SABTU ', '200000'),
(31, 'BTA GROUP 3-5 ORANG', '50000'),
(32, 'KELAS 1 SD ', '100000'),
(33, 'KELAS 2 SD', '100000'),
(34, 'KELAS 3 SD ', '100000'),
(35, 'KELAS 4 SD', '100000'),
(36, 'KELAS 5 SD', '100000'),
(37, 'KELAS 6 SD', '100000'),
(38, 'PRIVAT BTA', '50000'),
(39, 'KELAS BASMALA KIDS', '50000'),
(40, 'Canva For Kids ', '0'),
(41, 'Fun Quran ', '0'),
(42, 'Kelas Menggambar', '100000'),
(43, 'Privat Menggambar', '100000'),
(44, 'Basmala Fun Holiday', '100000'),
(45, 'PRIVAT 1 SD', '100000'),
(46, 'PRIVAT GROUP 3 SD', '100000'),
(47, 'PRIVAT GROUP 2 SD', '100000'),
(48, 'PRIVAT GROUP KIDS', '50000'),
(49, 'PRIVAT GROUP 5 SD', '100000'),
(50, 'Privat Group Menggambar', '100000'),
(51, 'Privat 8 SMP Group ', '100000'),
(52, 'Privat Group Basmala Kids', '50000'),
(53, 'Privat group bta', '50000'),
(54, 'Kelas SEMPOA', '150000'),
(55, 'PRIVAT GROUP 4 SD ', '320000'),
(56, 'PRIVAT GROUP 6 SD', '320000'),
(57, 'ENGLISH CONVERSATION ', '200000'),
(58, 'UMMI BESAR ', '200000'),
(60, 'PRIVAT GROUP 1 SD', '200000'),
(61, 'KELOMPOK BTA ', '200000'),
(62, 'Privat Group Sempoa', '530000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama` text NOT NULL,
  `tempatlahir` varchar(30) NOT NULL,
  `tanggallahir` date NOT NULL,
  `asalsekolah` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `jeniskelamin` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `nohp` varchar(50) NOT NULL,
  `tempat_les` varchar(255) NOT NULL,
  `pilihanprogram` varchar(200) NOT NULL,
  `tglpendaftaran` date DEFAULT NULL,
  `status_siswa` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama`, `tempatlahir`, `tanggallahir`, `asalsekolah`, `kelas`, `jeniskelamin`, `alamat`, `nohp`, `tempat_les`, `pilihanprogram`, `tglpendaftaran`, `status_siswa`, `keterangan`) VALUES
(13, 'Almahyra Aira Bilqish  (Aira Bilqis)', 'Karanganyar ', '2016-08-01', 'TK Aisyah Mutiara Hati', 'TK ', 'Perempuan', 'Perum GPI, Jalan Rinjani 01 B7/90, RT 06/ 07, Papahan, Tasikmadu, Karanganyar', '6285725206963', 'Bimbel', 'KELAS BASMALA KIDS', NULL, 'Aktif', '-'),
(15, 'Aisya Ayudya Inara (Ais)', 'Surakarta ', '2014-12-08', 'SDN 01 Karanganyar ', '3 SD ', 'Perempuan', 'Tegalasri RT 08/ 06, Bejen, Karanganyar, Karanganyar', '6282134144430', 'Bimbel', 'BTA ', NULL, 'Tidak Aktif', NULL),
(16, 'Aisya Adiba Alnaira (Aisya Adiba)', 'Karanganyar', '2017-03-31', 'TK Semata Hati', 'TK', 'Perempuan', 'Tegalasri RT 03/ 06, Bejen, Karanganyar, Karanganyar', '6288232552940', 'Rumah', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(18, 'Aisya Putri Nur Hestyanti (Aisya Putri)', 'Karanganyar', '2014-04-06', 'SD MIN 1 Karangmojo', '1 SD', 'Perempuan', 'Nglano RT 06/02, Pndeyan, Tasikmadu, Karanganyar', '6288216292097', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(19, 'Akane Vitria Leksono (Akane)', 'Karanganyar ', '2011-08-31', 'SDN 01 Karanganyar ', '4 SD ', 'Laki - Laki', 'Jetu RT. 02/ 02, Tegalgede, Karanganyar, Karanganyar ', '6287836872889', 'Bimbel', 'MAPEL 4 SD ', NULL, 'Aktif', NULL),
(23, 'Alkhanza Gaischa Alesh Zahida ', 'Sukoharjo', '2015-11-12', 'TK Aisyiyah Kayuapak ', 'TK ', 'Pilih Jenis Kel', 'Kayuapak, RT 02/03, Kayuapak, Polokarto, Sukoharjo ', '6287836722006', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(24, 'Alfaeyza Rizki Ardiyanto (Alfaeyza)', 'Madiun', '2013-08-06', 'MI Muhammadiyah Karanganyar ', '3 SD', 'Laki - Laki', 'Perum Jungke Permai Blok K 10 RT 03/ 13, Jungke, Karanganyar', '6281326809248', 'Rumah', 'BTA, MAPEL 3 SD ', NULL, 'Tidak Aktif', NULL),
(25, 'Alifa Ratifa Hibatillah (Alifa)', 'Surakarta', '2015-12-29', 'RA Al Hidayah', 'TK', 'Perempuan', 'Jungke RT 03/ 03, Jungke, Karanganyar', '6281249898515', 'Rumah', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(26, 'Alisha Yusfina (Alisha)', 'Kediri', '2011-05-11', 'SDIT Insan Kamil Karanganyar ', '4 SD', 'Perempuan', 'griya papahan sejahtera a3', '628980798625', 'Rumah', 'MAPEL 4 SD ', NULL, 'Aktif', NULL),
(27, 'Adhiba Athaleanaya MP (Aleya)', 'Karanganyar', '2014-09-09', 'SDN 2 Bejen', '1 SD ', 'Laki - Laki', 'Jetis RT 04/03, Cerbonan, Karanganyar, Karanganyar ', '6281390000025', 'Bimbel', 'MAPEL 1 SD ', NULL, 'Tidak Aktif', NULL),
(28, 'Alleya Aqila Calista Wijaya (Alleya Aqila)', 'Surakarta', '2012-11-10', 'SD Aisyiyah Surya Ceria', '3 SD', 'Perempuan', 'Perum Pokoh Jl. Bougenvile A9, RT10/06, Pokoh Baru, Ngijo, Tasikmadu, Karanganyar', '628112635928', 'Rumah', 'MAPEL 3 SD', NULL, 'Tidak Aktif', NULL),
(29, 'Almer Khairu Sutarko', 'surakarta', '2017-03-13', 'belum diisi ', 'TK', 'Pilih Jenis Kel', 'perum gks rt 9/01 ngijo ,tasikmadu', '6287877047257', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(30, 'Althafunissa Adi Ratifah  (Altha)', 'belum diisi ', '2016-08-12', 'TK Ar Rahman ', 'TK ', 'Perempuan', 'Ngemplak , Wonolopo, Tasikmadu, Karanganyar', '6282340878661', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(31, 'Alviz El Valerie (Alviz)', 'Karanganyar', '2013-07-08', 'MIN 1 Karanganyar ', '2 SD', 'Pilih Jenis Kel', 'Ngijo Kulon RT 06/ 01, Ngijo, Tasikmadu, Karanganyar', '628931536228', 'Bimbel', 'MAPEL 2 SD', NULL, 'Tidak Aktif', NULL),
(32, 'Alya Azzahra   Wicaksono (Alya Azzahra)', 'Karanganyar', '2013-03-06', 'MI Muhammadiyah Karanganyar ', '3 SD', 'Pilih Jenis Kel', 'Bibis RT 01,RW 10, Jungke, Karanganyar', '6281246067605', 'Pilih Tempat Les', 'BTA', NULL, 'Aktif', NULL),
(33, 'Alya Tsabita Arinata  (Alya Tsabita)', 'Surakarta ', '2015-10-09', 'Tkit Insan Kamil', 'TK ', 'Pilih Jenis Kel', 'Kranggan RT 02/01, Buran , Tasikmadu, Karanganyar ', '6282311763100', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(34, 'Iklasul Ammar Notonegoro (Amar)', 'Surakarta', '2016-08-12', 'Budi Mulia Solo', 'TK', 'Pilih Jenis Kel', 'Kranggan RT 01/ I, Buran, Tasikmadu, Karanganyar', '6281329701702', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(36, 'Angga Surya Saputra (Angga)', 'belum diisi ', '2014-07-01', ' SDN 01 Karanganyar', '2 SD', 'Pilih Jenis Kel', 'Badranasri rt 01/12', '6285293230104', 'Bimbel', 'MAPEL 2 SD', NULL, 'Tidak Aktif', NULL),
(37, 'Annisa Cantika Putri', 'Karanganyar', '2008-10-11', 'belum diisi', '7 SMP', 'Pilih Jenis Kel', 'Perumahan Argokiloso RT 02/06, Pokoh, Ngijo, Tasikmadu, Karanganyar', '6281363469277', 'Bimbel', 'MAPEL 7 SMP MATEMATIKA ', NULL, 'Aktif', NULL),
(38, 'Asyhava Aqeelanaya MP (Aqeela)', 'Karanganyar ', '2012-09-02', 'SDN 2 Bejen', '4 SD ', 'Pilih Jenis Kel', 'Jetis RT 04/03, Cerbonan, Karanganyar, Karanganyar ', '6281390000025', 'Rumah', 'MAPEL 4 SD ', NULL, 'Tidak Aktif', NULL),
(39, 'Almira Aqila Jasmine (Aqila Jasmine)', 'belum diisi ', '2016-12-04', 'Al Azhar Al Mustaqim', 'TK', 'Pilih Jenis Kel', 'Badranasri RT 01/ 12, Cangakan, Karanganyar, Karanganyar', '6288806453823', 'Rumah', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(44, 'Arjuna Wistara Kayana Ariyanto  (Arjuna Wistara)', 'belum diisi', '2014-09-12', 'SD Aisyiyah Surya Ceria ', '1 SD ', 'Pilih Jenis Kel', 'Cangakan  Barat Rt 03/04, Cangakan, Karanganyar, Karanganyar', '6281326279894', 'Bimbel', 'BASMALA KIDS ', NULL, ' Aktif', NULL),
(48, 'Nabastala Arundaya Wibowo (Asta)', 'Surakarta ', '2016-09-07', 'TK Surya Ceria Aisyiyah', 'TK ', 'Pilih Jenis Kel', 'Tegalasri RT 03/08, JBejen, Karanganyar, Karanganyar', '6285720019889', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(49, 'Athira Thafana Husniah  (Athira)', 'Surakarta ', '2016-09-30', 'Tkit Insan Kamil', 'TK ', 'Pilih Jenis Kel', 'Pokoh RT01/07, Pokoh, Ngijo , Tasikmadu , Karanganyar ', '628281228216992', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(51, 'Avatar Ridho Mustofa (Avatar)', 'Magelang', '2006-11-21', 'SMPN 1 Karanganyar', '9 SMP', 'Pilih Jenis Kel', 'Tegalarum RT 01/ 13, Cangakan, Karanganyar, Karanganyar', '628156700381', 'Pilih Tempat Les', 'BTA', NULL, 'Aktif', NULL),
(54, 'Ayumi Nadhira Almaghfira (Ayumi )', 'surakarta', '2014-09-02', 'SDN 01 Papahan ', '1 SD ', 'Pilih Jenis Kel', 'ngablak rt 01/09 papahan tasikmadu', '628112631821', 'Rumah', 'BTA', NULL, 'Tidak Aktif', NULL),
(56, 'Azka Zaki Abdillah (Azka Zaki)', 'Hangtuah ', '2012-06-25', 'belum diisi', '3 SD', 'Pilih Jenis Kel', 'pokoh baru rt 2 rw 6 ngijo tasikmadu', '6282146149090', 'Bimbel', 'MAPEL 3 SD', NULL, 'Aktif', NULL),
(57, 'Azalfa Farha Sakhi', 'Karanganyar', '2014-07-23', 'MI Muhammadiyah Karanganyar ', '6 SD', 'Pilih Jenis Kel', 'Tegalmulyo RT 03/10, Karanganyar', '6285728508225', 'Bimbel', 'BASMALA KIDS', NULL, 'Tidak Aktif', NULL),
(58, 'Muhammmad Azzam Musthofa (Azzam Musthofa)', 'Karanganyar ', '2015-11-07', 'TK Surya Ceria Aisyiyah', 'TK', 'Pilih Jenis Kel', 'Perum Pandan Wangi RT 13/ 06, Poko, Ngijo, Karanganyar', '6281246084393', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(60, 'Azka Raditya Gracio (Bagas)', 'Karanganyar ', '2013-03-09', 'SDIT Insan Kamil Karanganyar ', '2 SD', 'Pilih Jenis Kel', 'Kayangan RT 02/ 05, Bejen, Karanganyar, Karanganyar', '0', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(61, 'Baraka A P (Baraka)', 'Surakarta', '2010-04-03', 'SD N I POPONGAN', '6 SD', 'Pilih Jenis Kel', 'bejen rt 4/11 karanganyar', '6282138816284', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(62, 'Raja Bilqis F (Bilqis)', 'Karanganyar ', '2006-10-02', 'SMA 1 Karanganyar', '10 SMA ', 'Pilih Jenis Kel', 'Perumahan Pelita, Popongan, Karanganyar, Karanganyar ', '628236440345', 'Bimbel', 'MAPEL 10 SMA MATEMATIKA ', NULL, 'Tidak Aktif', NULL),
(63, 'Efrilia Raisabita As-Sidiq (Bita)', 'belum diisi', '1111-11-11', 'belum diisi', '4 SD', 'Perempuan', 'Badranasri Rt 01/Rw 12 ', '6281228558180', 'Rumah', 'MAPEL 4 SD ', NULL, 'Tidak Aktif', NULL),
(66, 'Diah Hayustiningsih  dkk ', 'Belum Diisi', '1111-11-11', 'belum diisi', 'DEWASA', 'Pilih Jenis Kel', 'Kayuapak 01/04, Polokarto, Sukoharjo ', '6285227992404', 'Rumah', 'BTA ', NULL, 'Aktif', NULL),
(67, 'Amelia Bunga Prasetya  (Bunga)', 'belum diisi ', '2015-01-12', 'TK As Sallam ', 'TK ', 'Perempuan', 'Cangakan Barat RT 01/04, Cangakan, Karanganyar, Karanganyar ', '6289504966432', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(68, 'Faeyza Kayana putri Briasnanto (Caca)', 'Karanganyar', '2013-04-10', 'SDN 01 Karanganyar ', '2 SD', 'Perempuan', 'Jalan Badak II, RT 02/ 07, Karanganyar, Karanganyar', '6281329332303', 'Rumah', 'BTA, MAPEL 2 SD', NULL, 'Tidak Aktif', NULL),
(69, 'Lathifah Cahya Nirmala (Cahya)', 'Rembang ', '2011-07-11', 'SDIT Insan Kamil Karanganyar ', '4 SD', 'Perempuan', 'Jati Jaten Karanganyar', '6285702050598', 'Bimbel', 'MAPEL 3 SD', NULL, 'Aktif', NULL),
(70, 'Elysia Alleira Sabrina Yanuar (Cia)', 'Surakarta ', '2016-08-09', 'SD Muhammadiyah PK Kotabarat Surakarta', '6 SD', 'Perempuan', 'Jl.Nangka 2 No.49 perumnas palur ngringo jaten Karanganyar', '628567347122', 'Rumah', 'MAPEL 2 SD ', NULL, 'Tidak Aktif', NULL),
(72, 'Clareta Gytha (Clara)', 'belum diisi', '1111-11-11', 'MI Muhammadiyah Palur', '1 SD', 'Pilih Jenis Kel', 'Jaten 02/05, Jaten, Karanganyar', '6285725555239', 'Bimbel', 'BTA, MAPEL 1 SD ', NULL, 'Tidak Aktif', NULL),
(73, 'Condro Sumaryani ', 'Karanganyar ', '1978-04-15', 'belum diisi', 'DEWASA', 'Perempuan', 'Kalongan RT 07/16, Papahan , Tasikmadu, Karanganyar ', '6281226121378', 'Bimbel', 'BTA ', NULL, 'Aktif', NULL),
(76, 'Nararya Arka Daniswara (Nararya Danis)', 'Karanganyar ', '2013-04-06', 'SD Aisyiyah Surya Ceria ', '1 SD', 'Pilih Jenis Kel', 'Perum Pelita B 42, RT 02/ 14, Harjosari, Popongan, Karanganyar', '6282136174435', 'Rumah', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(80, 'Nadhifa Ayu Ganita (Dhifa Ayu)', 'Karanganyar', '2014-11-09', 'MI Muhammadiyah Karanganyar ', '1 SD', 'Pilih Jenis Kel', 'bejen rt 4/11 karanganyar', '6281329855050', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(83, 'Duta Arshaka Rajendra  (Duta)', 'Surakarta ', '2016-02-08', 'TK Surya Ceria Aisyiyah', 'TK ', 'Pilih Jenis Kel', 'Perum PPH Gang Arjuna RT 04/06, Ngijo , Tasikmadu ', '6289635680356', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(85, 'Shaqueel Dzaky Yusuf (El)', 'Yogyakarta', '2014-03-27', 'SDN 01 Karanganyar ', '1 SD ', 'Laki - Laki', 'Getasan Rt 02 Rw 08 Kaling Tasikmadu Karanganyar', '6283865608694', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(87, 'Elmyra Azzalia P M', 'Sukoharjo', '2013-07-27', 'SDIT Insan Kamil Karanganyar ', '2 SD ', 'Pilih Jenis Kel', 'Klaruan Palur Rt 02/ 14, Mojolaban, Sukoharjo', '6281229828002', 'Bimbel', 'MAPEL 2 SD ', NULL, 'Aktif', NULL),
(89, 'Ezio Aldebaran Sakha Yanuar (Ezio)', 'surakarta ', '2013-08-02', 'SD Muhammadiyah PK Kotabarat Surakarta', '2 SD', 'Pilih Jenis Kel', 'Griya Palur Asri Ngringo Jaten', '628567347122', 'Rumah', 'MAPEL 2 SD', NULL, 'Tidak Aktif', NULL),
(90, 'Queenzy Jasmine Nur Andriadi (Ezzy)', 'belum diisi ', '2011-05-05', 'SD Aisiyah Ceria  Surya', '5 SD', 'Perempuan', 'Jetu RT.01/rw.02, Tegalgede,Karanganyar', '6285725610700', 'Rumah', 'MAPEL 5 SD ', NULL, 'Tidak Aktif', NULL),
(91, 'Fachryza Zuhair Nabil Arrazaq (Fachry)', 'Surakarta', '2010-08-05', 'SDIT Insan Kamil Karanganyar ', '6 SD', 'Pilih Jenis Kel', 'Tegalwinangun rt 02/ 13, Tegalgede, Karanganyar, Karanganyar', '628121527302', 'Bimbel', 'MAPEL 6 SD ', NULL, 'Tidak Aktif', NULL),
(92, 'Fadhil Rihandra Murwanto (Fadhil)', 'Karanganyar', '2019-06-05', 'MI Muhammadiyah Karanganyar ', '3 SD', 'Pilih Jenis Kel', 'Ngarjosari 01/01 Popongan Kra', '82324755739', 'Bimbel', 'MAPEL 3 SD  ', NULL, 'Aktif', NULL),
(94, 'Fahmi Achmad Abror (Fahmi)', 'Karanganyar', '2013-03-15', 'SD Surya Aisiyah Ceria', '3 SD', 'Pilih Jenis Kel', 'Manggung RT 01/ 09, Cangkakan, Karanganyar', '6281335313311', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(98, 'Fathan Uwais Al Ghifari (Fathan)', 'belum diisi ', '2015-09-09', 'TKIT Insan Kamil', 'TK ', 'Pilih Jenis Kel', 'Jenglong rt02/ 01, Bejen, Karanganyar,Karanganyar', '6281229765900', 'Bimbel', 'BASMALA KIDS', NULL, 'Tidak Aktif', NULL),
(99, 'Fathir Abqori Al Manafi  (Fathir)', 'Bandung', '2015-08-28', 'TK Al Munawwaroh', 'TK', 'Pilih Jenis Kel', 'Perum Kusuma Hadi  No. 5, Sapen, Karanganyar', '6282144478335', 'Pilih Tempat Les', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(101, 'Fauzy Rizqon Pradana (Fauzy)', 'Karanganyar', '2009-07-05', 'MI Muhammadiyah Karanganyar ', '6 SD', 'Pilih Jenis Kel', 'Mergo Mulyo, Ngadiluwih, Matesih, Karanganyar', '6285776474899', 'Bimbel', 'MAPEL 6 SD', NULL, 'Tidak Aktif', NULL),
(103, 'Feivsya Azzahra Ekamutia (Feivsya)', 'belum diisi ', '2009-09-24', 'SD Aisyiyah Surya Ceria ', '6 SD', 'Pilih Jenis Kel', 'Tegalwinangun, Karanganyar', '628122597350', 'Bimbel', 'MAPEL 6 SD ', NULL, 'Tidak Aktif', NULL),
(104, 'Fiona Almera Jasmine ', 'Karanganyar', '2015-02-12', 'belum diisi', '1 SD', 'Perempuan', 'Bejen RT 03/11, bejen, Karanganyar ', '6281226180434', 'Rumah', 'MAPEL 1 SD', NULL, 'Aktif', NULL),
(105, 'Feristo Adirajasa Warnatama Isharyanto (Fito)', 'belum diisi ', '2010-11-11', 'SDN 01 Karanganyar ', '5 SD', 'Laki - Laki', 'Triyagan RT 01/ VI, Mojolaban, Sukoharjo', '628122586675', 'Bimbel', 'BTA, MAPEL 5 SD ', NULL, 'Tidak Aktif', NULL),
(106, 'Arsehio Forlan Damara (Forlan)', 'Karanganyar', '2014-09-01', 'MI Muhammadiyah Karanganyar ', '2 SD', 'Pilih Jenis Kel', 'Cangakan Timur, Cangakan, Karanganyar, Karanganyar ', '6283865376872', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(108, 'Gavin Arkhana Aji Kurniawan', 'Karanganyar', '2013-10-19', 'MI Muhammadiyah Karanganyar ', '2 SD', 'Pilih Jenis Kel', 'Maduasri,ngijo tasikmadu kra', '6282225071289', 'Rumah', 'MAPEL 2 SD ', NULL, 'Tidak Aktif', NULL),
(110, 'Gretta Ellena Alexandra (Gretta)', 'Surakarta', '2013-05-03', 'SDN 01 Karanganyar ', '3 SD', 'Pilih Jenis Kel', 'Pandes RT 07/13, Papahan, Tasikmadu, Karanganyar', '6281818275998', 'Rumah', 'BTA', NULL, 'Tidak Aktif', NULL),
(111, 'Ummar Habibi Fathin  (Habibi )', 'Karanganyar ', '2014-12-06', 'SD Asyiyah Surya Ceria ', '4SD ', 'Laki - Laki', 'Pokoh Baru RT 06/09, Ngijo, Tasikmadu, Karanganyar ', '6285728894509', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(113, 'Hana Rizka Amalia', 'Karanganyar', '2014-05-08', 'TKIT Insan Kamil', '1 SD', 'Pilih Jenis Kel', 'Donomulyo RT 01/04, Tegalgede, Karanganyar, Karanganyar ', '628157645683', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(114, 'Hanif Muafa Wibowo (Hanif)', 'Karanganyar', '2011-02-04', 'SDIT Insan Kamil Karanganyar ', '5 SD', 'Pilih Jenis Kel', 'Kadipiro RT 03/ 09, Bejen, Karanganyar, Karanganyar', '6281329445113', 'Bimbel', 'MAPEL 5 SD ', NULL, 'Tidak Aktif', NULL),
(115, 'Hassya Maheswari Sugiarto (Hasya)', 'Karanganyar', '2015-02-04', 'TK Kartika Balikpapan', '1 SD', 'Pilih Jenis Kel', 'Kadipiro asri RT 01/09, Bejen, Karanganyar, Karanganyar', '6281329257949', 'Rumah', 'BTA', NULL, 'Aktif', NULL),
(117, 'Hilal Abiyu Fadhilah (Hilal)', 'belum diisi ', '2014-03-03', 'MI Muhammadiyah Karanganyar', '2 SD ', 'Pilih Jenis Kel', 'Perum Lalung Permai Blok A2 No 8', '6281228216992', 'Bimbel', 'MAPEL 2 SD MATEMATIKA ', NULL, 'Aktif', NULL),
(118, 'Hilda Ayu Kamila', 'Karanganyar ', '2013-01-27', 'SD Al Hadi', '3 SD', 'Pilih Jenis Kel', 'Ngijo wetan rt 05/03, Ngijo, Tasikmadu, Karanganyar', '6281225633183', 'Rumah', 'MAPEL 3 SD', NULL, 'Aktif', NULL),
(119, 'Hilma Putri Nadhifa', 'Karanganyar ', '2011-01-29', 'SD Al Hadi', '5 SD', 'Pilih Jenis Kel', 'Ngijo wetan rt 05/03, Ngijo, Tasikmadu, Karanganyar', '6281225633183', 'Rumah', 'MAPEL 5 SD', NULL, 'Aktif', NULL),
(120, 'Hilwa Laksmi Malika', 'belum diisi ', '2015-12-05', 'belum diisi', 'TK', 'Perempuan', 'Ngijo Wetan RT 05/ 03, Tasikmadu, Karanganyar', '6281225633183', 'Rumah', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(121, 'Hilya Laksami Malika', 'belum diisi ', '2015-12-05', 'belum diisi', 'TK', 'Perempuan', 'Ngijo Wetan RT 05/ 03, Tasikmadu, Karanganyar', '6281225633183', 'Rumah', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(122, 'Hoshizora Abdun Nafi (Hoshi)', 'Karanganyar', '2013-08-30', 'MI Muhammadiyah Karanganyar', '3 SD', 'Pilih Jenis Kel', 'Popongan RT 02 RW 08, Kecamatan Karanganyar, Kabupaten Karanganyar', '6285747586226', 'Bimbel', 'MAPEL  3 SD', NULL, 'Tidak Aktif', NULL),
(123, 'Ibrahim Arya Kurniawan (Ibra)', 'Surakarta', '2016-04-03', 'TK Al Fatah', 'TK ', 'Laki - Laki', 'Kalongan Kulon rt 08/ 16, Papahan, Tasikmadu, Karanganyar', '6285647527527', 'Pilih Tempat Les', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(124, 'Rahma Maritza Azni (Ica Azni)', 'Karanganyar ', '2014-06-09', 'MI Muhammadiyah Karanganyar ', '1 SD', 'Pilih Jenis Kel', 'Mulyorejo RT 07/4, Kalijirak, Tasikmadu, Karanganyar', '6285647189649', 'Pilih Tempat Les', 'BTA, MAPEL 1 SD MATEMATIKA, BAHASA INGGRIS ', NULL, 'Aktif', NULL),
(125, 'Aisha Paramesti Devianto Raharja  (Ica Paramesti)', 'belum diisi', '2007-01-22', 'SMP N 1 Karanganyar', '9 SMP ', 'Pilih Jenis Kel', 'Padangan RT 01/07, Jungke, Karanganyar ', '6281371877388', 'Rumah', 'MAPEL 9 SMP MATEMATIKA, IPA', NULL, 'Tidak Aktif', NULL),
(127, 'Cerelia Auryn Maurilla (Ila)', 'Karanganyar ', '2012-11-04', 'SDIT Insan Kamil Karanganyar ', '4 SD', 'Perempuan', 'Jalan Lawu No. 423 Tegalarum RT 02/13, Cangakan, Karanganyar, Karanganyar', '6281329049962', 'Bimbel', 'MAPEL 4 SD', NULL, 'Aktif', NULL),
(128, 'Braemco Palito Aqwino Napitu (Ino)', 'Karanganyar', '2016-12-08', 'TK Bayangkara', 'TK ', 'Laki - Laki', 'Perumahan Pokoh RT 05/04, Pokoh Baru, Ngijo, Tasikmadu, Karanganyar', '6281326812251', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(129, 'Intan Cahya Fahmida  (Intan)', 'belum diisi ', '2014-02-01', 'SD AL HADI', '2 SD', 'Pilih Jenis Kel', 'Pundung Rejo RT 04/01, Jati, Jaten, Karanganyar ', '6285728920029', 'Bimbel', 'MAPEL 2 SD BAHASA ARAB ', NULL, 'Tidak Aktif', NULL),
(131, 'Abrizam Fais Affandi  (Izam)', 'Karanganyar ', '2012-01-04', 'SD Aisyiyah Surya Ceria ', '4 SD', 'Pilih Jenis Kel', 'Perum Bumi Saraswati RT 04/08, Gaum, Tasikmadu, Karanganyar ', '6281329214792', 'Bimbel', 'BTA, MAPEL 4 SD', NULL, 'Tidak Aktif', NULL),
(132, 'Janeeta Ryuu Kenzo Ardina (Janeeta)', 'Karanganyar', '2013-02-01', 'SD N 1 karanganyar', '2 SD', 'Pilih Jenis Kel', 'cangakan timur rt 1 rw 2 cangakan kra', '6285293009234', 'Bimbel', 'MAPEL 2 SD ', NULL, 'Aktif', NULL),
(133, 'Janetha Answandewi (Janetha)', 'Jakarta', '2012-06-06', 'SDN 01 Karanganyar ', '3 SD ', 'Pilih Jenis Kel', 'Badranasri RT 02/11, Cangakan, Karanganyar, Karanganyar ', '6285691600834', 'Rumah', 'MAPEL 3 SD ', NULL, 'Aktif', NULL),
(136, 'Fredelana Hanida Fulcalista (Calista)', 'Karanganyar', '2008-09-15', 'SMP IT Insan Kamil', '7 SMP ', 'Pilih Jenis Kel', 'Badranasri rt 01 rw 10', '6282220087137', 'Pilih Tempat Les', 'MAPEL 7 SMP ', NULL, 'Aktif', NULL),
(138, 'Kanaya Aqila Sunny (Kanaya Aqila)', 'Sukoharjo ', '2013-09-02', 'SD N 01 TUGU', '2 SD', 'Pilih Jenis Kel', 'wonosari 1/13 polokarto,sukoharjo', '6283840431637', 'Pilih Tempat Les', 'MAPEL 2 SD', NULL, 'Aktif', NULL),
(140, 'Khayla Adzkia Fawwazah (Khayla Adzkia)', 'Surakarta', '2015-11-01', 'MI Muhammadiyah Karanganyar ', '1 SD', 'Pilih Jenis Kel', 'Semenharjo RT 01/05, Suruh Kalang, Jaten, Karanganyar ', '6281225015455', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(143, 'Keisha Nagita Rahma (Keisha Nagita Group) ', 'Karanganyar ', '2011-03-06', 'SDIT Insan Kamil Karanganyar ', '4 SD', 'Pilih Jenis Kel', 'Suruh Wangan RT 07/08, Pandeyan, Tasikmadu , Karanganayr ', '6285740196887', 'Rumah', 'MAPEL 4 SD', NULL, 'Tidak Aktif', NULL),
(144, 'Keysha Uzma Zakira (Keysha Uzma )', 'belum diisi', '2011-01-08', 'SD IT Insan Kamil', '5 SD', 'Pilih Jenis Kel', 'Jl. Flamboyan Tegal Arum cangakan Kra', '6285229901146', 'Rumah', 'MAPEL 5 SD MATEMATIKA, BAHASA INGGRIS ', NULL, 'Tidak Aktif', NULL),
(145, 'Ardish Kennara T. H (Kena)', 'Karanganyar', '2011-03-07', 'SDN 01 Jungke', '5 SD', 'Pilih Jenis Kel', 'Warung Idjo 2, Jalan Kapten Mulyadi', '6285658076583', 'Pilih Tempat Les', 'MAPEL 5 SD', NULL, 'Tidak Aktif', NULL),
(146, 'Muhammad Kenzie Alvaro (Kenzi Alvaro)', 'Karanganyar ', '2016-10-09', 'KB Pembina ', 'TK ', 'Pilih Jenis Kel', 'Ngijo Wetan RT 01/03, Tasikmadu, Karanganyar, Karanganyar', '6289635663305', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(148, 'Khansa Elvaretta Charis (Khansa)', 'Surakarta ', '2011-10-05', 'SDN 1 Karanganyar ', '5 SD', 'Pilih Jenis Kel', 'badran baru rt 8/8 tasikmadu', '6285647530006', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(149, 'Nasyita Adzkia Khairunnisa (Kia)', 'Rembang ', '2015-04-06', 'SDIT Insan Kamil', '3 SD ', 'Pilih Jenis Kel', 'Pundak 005/007 kelirahan jati kec.  jaten kab.  Karanganyar', '6285702050598', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(152, 'Shakila Azzahra Atmarini (Kila)', 'Tasikmalaya', '2016-02-03', 'Tkit Insan Kamil', 'TK', 'Perempuan', 'Jalan Nakula No 16, Perum Wahyu Utomo, Kadipiro Baru, Bejen, Karanganyar', '62811211791', 'Rumah', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(154, 'Kinanthi Nurlaili Rahmadhani r', 'Karanganyar', '2015-07-12', 'SDN 01 karanganyar', '1 SD', 'Perempuan', 'Badran Mulyo RT. 02/ 14, Lalung, Karanganyar ', '6287835232832', 'Bimbel', 'BASMALA KIDS', NULL, 'Tidak Aktif', NULL),
(155, 'Kiran Naura Izzati (Kiran Naura)', 'Karanganyar', '2012-04-03', 'SDN 01 Papahan ', '4 SD', 'Pilih Jenis Kel', 'Tegalarum RT. 01/13, Cangakan, Karanganyar', '628122738546', 'Rumah', 'BTA', NULL, 'Tidak Aktif', NULL),
(156, 'Deandra Kyra Triwijaya', 'Karanganyar', '2015-07-30', 'TKIT Insan Kamil', 'TK', 'Pilih Jenis Kel', 'Badranasri RT 03/10, Cangakan, Karanganyar, Karanganyar ', '6281226917764', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(158, 'Alifiandra Ahza Ganadi (Lilo)', 'Karanganyar ', '2015-09-29', 'TKIT Insan Kamil', 'TK ', 'Pilih Jenis Kel', 'Jalan Lawu No. 165 Jetu RT 01/01, Tegeldede, Karanganyar, Karanganyar ', '6282136428585', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(159, 'Serelia Aerylin Razilla ', 'Karanganyar ', '2017-01-15', ' Belum Sekolah ', 'BELUM SEKOLAH ', 'Perempuan', 'Jalan Lawu No. 423 Tegalarum RT 02/13, Cangakan, Karanganyar, Karanganyar', '6281329049962', 'Bimbel', 'BTA ', NULL, 'Tidak Aktif', NULL),
(161, 'Queensa Lovely Diva Bharanita (Lovely)', 'Karanganyar', '2013-03-04', 'SDN 01 Karanganyar ', '2 SD', 'Pilih Jenis Kel', 'Kalongan Kulon rt 05/ 15, Papahan, Tasikmadu, Karanganyar', '6281353678928', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(163, 'Lutfi Abdul Hafidz (Lutfi Abdul)', 'Karanganyar ', '2012-05-07', 'MI Muhammadiyah Karanganyar ', '3 SD', 'Pilih Jenis Kel', 'Badranasri RT 01/10 Cangakan, Karanganyar, Karanganyar ', '6281802530251', 'Rumah', 'MAPEL 3 SD ', NULL, 'Tidak Aktif', NULL),
(164, 'Luvena Erasma Pritada', 'Sukoharjo', '2015-08-19', 'TK Aisyiyah Karanganyar', 'TK', 'Pilih Jenis Kel', 'Palur Wetan RT 01/ 04, Palur, Mojolaban, Sukoharjo', '6285647016407', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(167, 'Maika Naura Kurniawan', 'Jakarta', '2011-09-18', 'SD 03 Jaten', '4 SD', 'Pilih Jenis Kel', 'Jalan Sebatik No 33 RT 09/08, Jaten, Karanganyar', '6281210800272', 'Bimbel', 'BASMALA KIDS', NULL, 'Tidak Aktif', NULL),
(172, 'Eko Siti Sulastri  (Siti)', 'Karanganyar ', '1995-06-15', 'belum diisi', 'DEWASA', 'Pilih Jenis Kel', 'Gowong RT 04/10, Tepus , Sewurejo, Mojogedang, Karanganyar ', '6282138839261', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(173, 'PUJANGGA MEWA PANGESTI (MEWA)', 'Karanganyar', '2007-01-04', 'SMP O3 TASIKMADU', '9 SMP', 'Pilih Jenis Kel', 'Cabeyan 04/07.Kaling.Tasikmadu.Kra.', '6281903774507', 'Bimbel', 'MAPEL 9 SMP ', NULL, 'Tidak Aktif', NULL),
(174, 'Almira Nugraheny D ', 'belum diisi ', '2016-05-13', 'TK Al Hadi Mojolaban Sukoharjo', 'TK ', 'Perempuan', 'Tempurejo, Jumapolo, Karanganyar ', '6281377335967', 'Rumah', 'BTA', NULL, 'Tidak Aktif', NULL),
(177, 'Nabila Kayla Hardiani (Nabila Khayla)', 'Surakarta', '2007-09-11', 'SMPIT Insan Kamil Kra', '8 SMP', 'Perempuan', 'Tegalwinangun RT 02/13 Tegalgede, Karanganyar', '6281297220558', 'Rumah', 'MAPEL 8 SMP  ', NULL, 'Aktif', NULL),
(178, 'Nisrina Nada (Nada)', 'Karanganyar', '2004-04-01', 'MAN Karanganyar ', '12 SMA', 'Pilih Jenis Kel', 'Nglano RT 02/02, Pandeyan, Tasikmadu, Karanganyar ', '6285867556363', 'Bimbel', 'MAPEL 12 SMA', NULL, 'Tidak Aktif', NULL),
(179, 'Nadhira Fatima Almaira (Nadhira)', 'Surakarta', '2014-10-09', 'SDIT Insan Kamil Karanganyar ', '1 SD', 'Pilih Jenis Kel', 'Triyagan rt 02 rw 06 mojolaban sukoharjo', '6285656254313', 'Pilih Tempat Les', 'BTA, MAPEL 1 SD ', NULL, 'Tidak Aktif', NULL),
(180, 'Ervina Kirana Nadine (Nadine)', ' Surakarta', '2015-05-28', 'MI Muhammadiyah Karanganyar ', '1 SD', 'Pilih Jenis Kel', 'Perum ringin asri RT 06/12 bejen karanganyar', '6285647103143', 'Bimbel', 'BTA', NULL, 'Aktif', NULL),
(184, 'Nameira Tastbita  (Nameira)', 'Surakarta ', '2008-12-05', 'SMP IT Insan Kamil ', '8 SMP', 'Pilih Jenis Kel', 'Jl Matoa, Pendukuhan RT 03/06, Sapen, Mojolaban, Sukoharjo ', '6281393145739', 'Bimbel', 'MAPEL 8 SMP  ', NULL, 'Tidak Aktif', NULL),
(186, 'Naufal Faizy Al fatih', 'Karanganyar', '2011-10-12', 'SD Karanganyar 2', '4 SD', 'Pilih Jenis Kel', 'Padangan RT 02 RW 07 Kel jungke Karanganyar', '6285647048048', 'Bimbel', 'MAPEL 4 SD ', NULL, 'Tidak Aktif', NULL),
(190, 'Naufal Yusril Bagus Darmono', 'Karanganyar ', '2013-01-13', 'SDN 03 Karanganyar ', '3 SD ', 'Laki - Laki', 'Padangan RT 03/ 07 Jungke, Karanganyar, Karanganyar ', '6283122978422', 'Rumah', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(192, 'Nayla Ratnamaya Nur Islami (Nayla R)', 'Karanganyar', '2015-04-08', 'TK Surya Ceria Aisyiyah', 'TK', 'Pilih Jenis Kel', 'Pandes RT 05/ 13, Papahan, Tasikmadu, Karanganyar, Karanganyar', '6282134034708', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(197, 'Nirmasita Nada (Nirma)', 'Karanganyar', '2011-10-01', 'SDIT Insan Kamil Karanganyar ', '5 SD', 'Pilih Jenis Kel', 'Nglano 2/2 Pandeyan, Tasikmadu', '6285867556363', 'Rumah', 'MAPEL 5 SD ', NULL, 'Tidak Aktif', NULL),
(198, 'Anisa Ahzahra (Nisa)', 'Karanganyar ', '2014-01-02', 'SD Kaliboto ', '1 SD', 'Pilih Jenis Kel', 'Jatisari, Kalijirak, Tasikmadu, Karanganyar ', '628366631919', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(200, 'Alysia Octaviana Hariyanto (Octa)', 'Sukoharjo ', '2014-10-04', 'SDN 02 Papahan ', '3 SD', 'Pilih Jenis Kel', 'Papahan Rt 03/03, Papahan, Tasikmadu, Kra', '6287843139413', 'Bimbel', 'MAPEL 1 SD', NULL, 'Aktif', NULL),
(203, 'Putra Rehan Ramadhan  (Putra Rehan)', 'Karanganyar', '2013-07-24', 'SDIT Insan Kamil Karanganyar ', '2 SD', 'Laki - Laki', 'Padangan RT02 RW 07 Jungke, Karanganyar', '6282133696632', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(207, 'Quenna Bee Hasya Nugroho (Quenna)', 'Ngawi', '2016-06-23', 'TK Surya Ceria Aisyiyah', 'TK', 'Pilih Jenis Kel', 'Perumahan Safari 2 No. C 5 Pokoh, Tasikmadu, Karanganyar ', '6282153831721', 'Rumah', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(208, 'Raditya  Khresna Wibawa (Radit)', 'belum diisi ', '1111-11-11', 'SMPN 1 Karanganyar', '8 SMP', 'Pilih Jenis Kel', 'Puri Taman Sari RT 02/C, 14, Jati, Jaten, Karanganyar', '628122611324', 'Rumah', 'MAPEL 8 SMP', NULL, 'Tidak Aktif', NULL),
(211, 'Rafael Yoslan Ryu  (Rafael)', 'Sukoharjo ', '2016-06-05', 'Kingdom Akademi Kendari ', 'TK ', 'Pilih Jenis Kel', 'Karanganyar RT 03/04 Karanganyar, Karanganyar, Karanganyar ', '6285642080859', 'Bimbel', 'Basmala Kids ', NULL, 'Aktif', NULL),
(213, 'Raissa Bilqis Fadilla (Raissa Bilqis)', 'belum diisi ', '2015-06-08', 'TK Surya Ceria Aisyiyah', '1 SD', 'Pilih Jenis Kel', 'Badranasri Rt 2/12, Cangakan, Karanganyar', '6282226318865', 'Pilih Tempat Les', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(214, 'Rayzan Septian Ramadhan (Rama)', 'Karanganyar', '2010-08-28', 'MIN 1 Karanganyar ', '6 SD ', 'Laki - Laki', 'Botokan RT 02/01 Wonolopo, Tasikmadu, Karanganyar ', '6285728547343', 'Bimbel', 'BTA , MAPEL 6 SD ', NULL, 'Tidak Aktif', NULL),
(215, 'Arvis Muhammad Ramadhan (Rama Arvis)', 'Karanganyar ', '2013-03-08', 'SDN 03 Karanganyar ', '2 SD', 'Laki - Laki', 'Cangakan Timur rt 02/ 02, Cangakan, Karanganyar, Karanganyar', '6281227444113', 'Bimbel', 'MAPEL 2 SD', NULL, 'Tidak Aktif', NULL),
(220, 'Rayhan Hakam Asrofy (Rayhan Hakam)', 'Karanganyar ', '2015-05-07', 'TKIT Insan Kamil', 'TK ', 'Pilih Jenis Kel', 'Tegalarum RT 02/ 13, Cangakan, Karanganyar, Karanganyar', '6281226246190', 'Rumah', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(221, 'Razin Ramadhan Alvarendra  (Razin)', 'Solo', '2015-02-07', 'MI Muhammadiyah Karanganyar', '1 SD ', 'Pilih Jenis Kel', 'Tegalasri RT 02/08, Bejen, Karanganyar, Karanganyar ', '628562842900', 'Pilih Tempat Les', 'Basmala Kids ', NULL, 'Aktif', NULL),
(222, 'Reisa Ayunindya (Reisa)', 'Surakarta', '2016-02-02', 'TKIT Insan Kamil', 'TK', 'Pilih Jenis Kel', 'Perum Puri Taman sari 2 B 21, Jati, Jaten, Karanganyar', '6281329177186', 'Pilih Tempat Les', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(226, 'Ribi Yuna Maritza (Ribi)', 'Surakarta ', '2011-07-06', 'SD Muhammadiyah Palur', '5 SD', 'Pilih Jenis Kel', 'Jalan Matoa Pedukuhan RT 03/06, Sapen, Mojolaban Sukoharjo', '6281393145739', 'Pilih Tempat Les', 'MAPEL 5 SD', NULL, 'Tidak Aktif', NULL),
(228, 'Rieke Nakata (Rieke)', 'Sukoharjo', '2014-01-01', 'SDN Jati 03', '2 SD', 'Pilih Jenis Kel', 'Triyagan rt 02/ 06, Triyagan, Mojolaban, Sukoharjo', '6287829716161', 'Pilih Tempat Les', 'BTA', NULL, 'Tidak Aktif', NULL),
(230, 'Safa Haura Setyana (Safa Haura)', 'Karanganyar ', '2013-10-12', 'SDN 01 Ngijo', '2 SD ', 'Pilih Jenis Kel', 'Ngijo tengah 07/02 Tasikmadu Kra', '6285803185700', 'Bimbel', 'MAPEL 2 SD ', NULL, 'Tidak Aktif', NULL),
(231, 'safira putri hartono', 'karanganyar', '2006-08-30', 'SMP N 4 Karanganyar', '8 SMP', 'Perempuan', 'talang rt 07/02 kalijirak tasikmadu', '6285775037915', 'Bimbel', 'MAPEL 8 SMP  ', NULL, 'Tidak Aktif', NULL),
(232, 'Arjuna Vino Rafi Sakha  (Sakha )', 'Boyolali ', '2013-11-05', 'SDIT Insan Kamil Karanganyar ', '2 SD', 'Pilih Jenis Kel', 'Talang RT 07/02 Kalijirak, Tasikmadu, Karanganyar ', '6287730722936', 'Rumah', 'MAPEL 2 SD', NULL, 'Tidak Aktif', NULL),
(234, 'Naufal Aqil Saktiawan (Sakti)', 'Karanganyar', '2014-01-31', 'SD Islam Alam Anak Pintar', '2 SD ', 'Pilih Jenis Kel', 'titang rt 4 rw 7 tegalgede kra', '8562515037', 'Pilih Tempat Les', 'MAPEL 2 SD', NULL, 'Aktif', NULL),
(235, 'Salsabila Putri Anindita  (Salsa)', 'Surakarta ', '2013-05-20', 'SD Al Firdaus Surakarta ', '2 SD', 'Pilih Jenis Kel', 'Badranasri RT 02/12, Cangakan, Karanganyar, Karanganyar ', '6285226459744', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(237, 'Satria Anagha Bhagawanta (Satria)', 'Karanganyar', '2014-12-02', 'SD Kristen', '1 SD', 'Pilih Jenis Kel', 'Badranasri Rt 02/ 10, Cangakan, Karanganyar', '6285856086648', 'Bimbel', 'MAPEL 1 SD', NULL, 'Aktif', NULL),
(238, 'Aliqa Saufa Thufaila Andiska (Saufa)', 'Karanganyar ', '2014-03-05', 'SDIT INSAN KAMIL ', '4SD', 'Perempuan', 'Ngrapah RT 01/ 05, Sambirejo, Jumantono, Karanganyar', '6285728837593', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(239, 'Kirana Sava Azaura ', 'Karanganyar ', '2013-04-24', 'SDN 03 Papahan ', '3 SD', 'Pilih Jenis Kel', 'Jetak Pandes RT 01/12', '6282329470563', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(240, 'Radya Selena Layla Ramadhani', 'Surakarta', '2014-07-18', 'MI Muhammadiyah Karanganyar ', '2 SD', 'Pilih Jenis Kel', 'Pokoh RT 13/06, Pokoh, Ngijo , Tasikmadu , Karanganyar ', '6287835470002', 'Bimbel', 'MAPEL 2 SD', NULL, 'Tidak Aktif', NULL),
(243, 'Winandra Shaqilla Ariyono (Shaqilla)', 'Surakarta', '2014-07-23', 'SDN 01 Papahan ', '1 SD', 'Pilih Jenis Kel', ' Jaten rt 3/rw 13 Karanganyar', '628121501504', 'Rumah', 'BTA', NULL, 'Tidak Aktif', NULL),
(244, 'Qalisha Shaziannisa Zahrana (Sasha)', 'Surakarta', '2013-02-12', 'SDIT Insan Kamil Karanganyar ', ' 2 SD', 'Pilih Jenis Kel', 'Griya Sekar Arum C 1, Pandeyan, Tasikmadu, Karanganyar', '6285728885606', 'Bimbel', 'MAPEL 2 SD', NULL, 'Tidak Aktif', NULL),
(245, 'Arisna Shelia U', 'Karanganyar', '2015-08-02', 'TK Pertiwi Suruh', 'TK', 'Perempuan', 'Suruh Jetis RT 05/ 03, Tasikmadu, Karanganyar, Karanganyar', '6281227167821', 'Rumah', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(246, 'Sheryl Aurelia Putri Nugroho', 'Karanganyar ', '2017-06-21', 'TK Surya Ceria Aisyiyah', 'PAUD', 'Perempuan', 'Kranggan RT 06/ 01, Buran, Tasikmadu, Karanganyar', '628562775115', 'Bimbel', 'BTA', NULL, 'Tidak Aktif', NULL),
(247, 'Nafisha Sitta Azzahra (Sitta)', 'Karanganyar', '2012-06-06', 'belum diisi', '5SD', 'Pilih Jenis Kel', 'Badran Asri 02/X Cangakan', '62885725298415', 'Bimbel', 'MAPEL 3 SD', NULL, 'Tidak Aktif', NULL),
(249, 'Fayolla Azalea Syeehan', 'Surakarta', '2014-09-19', 'MI Muhammadiyah Karanganyar ', '1 SD', 'Pilih Jenis Kel', 'Tegalwinangun rt 02/ 13, Tegalgede, Karanganyar, Karanganyar', '6281393940140', 'Rumah', 'BTA', NULL, 'Tidak Aktif', NULL),
(252, 'Tamam Husein Doewy (Tamam)', 'Surakarta', '2015-02-12', 'belum diisi', '1 SD', 'Pilih Jenis Kel', 'Jalan Tegalasri RT 08/ 06, Bejen, Karanganyar', '6289698612791', 'Rumah', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(255, 'Talitha Azka Ilona (Talitha)', 'Karanganyar', '2015-12-01', 'Mi muhammadiyah karanganyar', '1 SD', 'Pilih Jenis Kel', 'Tolok RT 03/10, Tegalgede Karanganyar', '628328372529', 'Pilih Tempat Les', 'BTA, MAPEL 1 SD MATEMATIKA, BAHASA INGGRIS ', NULL, 'Tidak Aktif', NULL),
(256, 'vania azka zahrani (Vania)', 'Sukoharjo', '2011-04-06', 'SDN 2 Lalung ', '5 SD', 'Pilih Jenis Kel', 'kayuapak rt 1 rw 6 polokarto', '6281327063278', 'Pilih Tempat Les', 'MAPEL 5 SD ', NULL, 'Tidak Aktif', NULL),
(258, 'Fivia Berliana Raharja (Via)', 'Karanganyar', '2014-07-10', 'SDN 02 Papahan ', '1 SD', 'Perempuan', 'belum diisi', '6282242268032', 'Rumah', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(260, 'Octavia Yana Yasmin Chandra ( Yasmin Chandra)', 'Surakarta ', '2005-04-10', 'SMAN 2 Karanganyar', '10 SMA ', 'Laki - Laki', 'Perum Pelita RT 02/ 14, Harjosari, Popongan, Karanganyar', '6285293633809', 'Rumah', 'BTA ', NULL, 'Tidak Aktif', NULL),
(262, 'Yasmine Noor Lathifah (Yasmine Noor)', 'Karanganyar', '2008-08-04', 'SMPIT MTA Karanganyar', '8 SMP', 'Pilih Jenis Kel', 'Jalan Slamet Riyadi, No 30, Karanganyar', '628122594985', 'Bimbel', 'MAPEL 8 SMP  ', NULL, 'Tidak Aktif', NULL),
(265, 'Yudhistira Listyo Nugraha', 'Karanganyar', '2014-04-27', 'TK Islam Bakti II Jengglong', 'TK', 'Pilih Jenis Kel', 'Beton, RT 04/ IV, Lalung, Karanganyar', '6281384954100', 'Rumah', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(267, 'Althea Yuki Fedora Nindisa', 'Sukoharjo', '2014-12-22', 'SDN 03 Jati', '1 SD', 'Pilih Jenis Kel', 'Silamat, Ngringo, Jaten', '6285877315023', 'Bimbel', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(268, 'Azizah Aulia Az Zahra (Zahra)', 'Karanganyar', '2021-12-09', 'SDN 01 Papahan ', '3 SD', 'Pilih Jenis Kel', 'Badranasri RT 01/ 12, Cangakan, Karanganyar, Karanganyar', '6281353600030', 'Bimbel', 'MAPEL 3 SD', NULL, 'Aktif', NULL),
(270, 'Zaidan Fashiul Lisan', 'Malang', '2009-08-02', 'Sekolah Alam Bengawan Solo', '6 SD', 'Pilih Jenis Kel', 'Jalan Nusa Baru NO 02, Ngirongo, Jaten, Karanganyar', '6281392007475', 'Bimbel', 'MAPEL 6 SD', NULL, 'Tidak Aktif', NULL),
(272, 'Zalfa Nabila Faiha (Zalfa)', 'Surakarta', '2010-03-06', 'MI Muhammadiyah Karanganyar', '6 SD ', 'Pilih Jenis Kel', 'Perum ringin asri RT 06/12 bejen karanganyar', '6285647103143', 'Rumah', 'BTA ', NULL, 'Aktif', NULL),
(273, 'Zeline Shaqeena Ameera Rana (Zeline)', 'Surakarta', '2016-05-03', 'TKIT Insan Kamil', 'TK', 'Pilih Jenis Kel', 'Jalan Flamboyan, Tegalarum RT 02/ 13, Cangakan, Karanganyar, Karanganyar', '6285800006001', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(274, 'Anfar Zhafran Arrafif ', 'belum diisi ', '2020-12-17', 'TK Al Fatah', 'TK ', 'Pilih Jenis Kel', 'Gang Perkutut Pokoh RT 1/7, Pokoh, Ngijo , Tasikmadu , Karanganyar ', '6281314612045', 'Pilih Tempat Les', 'BASMALA KIDS ', NULL, 'Aktif', NULL),
(276, 'Faiza Zidnatul Husna', 'Semarang ', '2013-10-29', 'Sekolah Alam Bengawan Solo', '2 SD', 'Pilih Jenis Kel', 'Jalan Nusa Indah Baru No 07, Jaten, Karanganyar', '6281392007475', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(277, 'Aisya Zilfa Azliya ', 'Malang', '2021-04-10', 'belum sekolah ', 'BELUM SEKOLAH ', 'Pilih Jenis Kel', 'Jalan Nusa Indah Baru No 07, Jaten, Karanganyar', '6281392002475', 'Bimbel', 'BTA', NULL, 'Aktif', NULL),
(283, 'Alano Keenand Albinsaid  (Keenand)', 'Surakarta ', '2016-08-05', 'TK Aisyiyah X Jaten', 'TK ', 'Laki - Laki', 'Getas RT 01/09, Jaten, Karanganyar ', '6285725546400', 'Pilih Tempat Les', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(284, 'Muhammad Affan Al Azis  (Affan Al Azis)', 'belum diisi ', '2004-04-05', 'SMA Muhammadiyah Karanganyar', '12 SMA ', 'Pilih Jenis Kel', 'Tegalasri RT 01/08, Bejen, Karanganyar, Karanganyar ', '6281393221832', 'Pilih Tempat Les', 'MAPEL 12 SMA ', NULL, 'Aktif', NULL),
(286, 'Taufik Aqila Pranaja  (Taufik)', 'belum diisi ', '2013-08-02', 'SDN 01 Papahan ', '3 SD ', 'Pilih Jenis Kel', 'Nglano RT 01/02, Pandeyan, Tasikmadu,Karanganyar ', '628574136729', 'Pilih Tempat Les', 'MAPEL 3 SD ', NULL, 'Aktif', NULL),
(287, 'Lintang Pharamudita  (Lintang)', 'Karanganyar ', '2010-07-07', 'MI Muhammadiyah Karanganyar', '6 SD ', 'Pilih Jenis Kel', 'Botohan, Wonolopo, Tasikmadu, Karanganayr ', '6282133683336', 'Pilih Tempat Les', 'MAPEL 6 SD ', NULL, 'Aktif', NULL),
(290, 'HANDRIAN NUR ROHMAN (Rian)', 'Karanganyar', '2013-07-30', 'SDN 02 Papahan ', '2 SD', 'Laki - Laki', 'Ngablak rt 06/11 papahan tasikmadu', '6288220112117', 'Bimbel', 'BASMALA KIDS', NULL, 'Aktif', NULL),
(292, 'Kayana Zaneta (Kayana)', 'Surakarta ', '2021-11-04', 'SD Muhammadiyah 1 Surakarta ', '6 SD', 'Pilih Jenis Kel', 'Perumahan Tirtasani Blok C2 (sebelah barat pom bensin Papahan) ', '6282226334510', 'Rumah', 'MAPEL 6 SD ', NULL, 'Aktif', NULL),
(295, 'Arsyila Qiana Mecca  (Syila)', 'Karanganyar ', '2017-12-09', 'belum sekolah', 'BELUM SEKOLAH ', 'Pilih Jenis Kel', 'Pokoh Baru RT 12 Karanganyar (Gang Kathil) ', '6281326830773', 'Rumah', 'BTA ', NULL, 'Aktif', NULL),
(297, 'Bintang Kusuma Halim (Bintang)', 'Karanganyar', '2011-04-11', 'SD IT Insan Kamil Karanganyar', '4 SD ', 'Pilih Jenis Kel', 'Graha Pesona 2,Jati,Jaten, Karanganyar', '6285728983505', 'Bimbel', 'MAPEL 4 SD B INGGRIS ', NULL, 'Tidak Aktif', NULL),
(298, 'Zahira Brilliant R. M (Zahira)', 'Karanganyar', '2006-01-10', 'SMA N 1 Karanganyar ', '10 SMA ', 'Pilih Jenis Kel', 'Banaran Jantiharjo Karanganyar ', '6282246678349', 'Bimbel', 'MAPEL 10 SMA MATEMATIKA ', NULL, 'Tidak Aktif', NULL),
(299, 'Titania Gefifie Navisha (Tita)', 'karanganyar ', '2018-10-09', 'TK Negeri Pembina Karanganyar ', 'PAUD ', 'Pilih Jenis Kel', 'Bibis RT  -,RW  -, Jungke, Karanganyar', '6289635663305', 'Bimbel', 'BTA ', NULL, 'Tidak Aktif', NULL),
(302, 'Malyafayza  (Malya)', 'Karanganyar ', '2004-04-24', 'MAN 01 Karanganyar ', '12 SMA ', 'Pilih Jenis Kel', 'Perum GKS B3 RT 009/001, Ngijo Kulon, Ngijo, Tasikmadu, Karanganyar ', '6287875260420', 'Pilih Tempat Les', 'MAPEL 12 SMA MATEMATIKA, BAHASA INGGRIS', NULL, 'Tidak Aktif', NULL),
(303, 'Nadhif Zahir Listanto  (Nadhif)', 'Karanganyar ', '2011-05-17', 'SD ASC Karanganyar ', '4 SD ', 'Pilih Jenis Kel', 'Ngijo tengah 07/02 Tasikmadu Karanganyar ', '6281287744916', 'Pilih Tempat Les', 'MAPEL 4 SD ', NULL, 'Tidak Aktif', NULL),
(304, 'Hafiza Kaira L (Ica Khaira)', 'Karanganyar ', '2013-05-06', 'SD ASC Karanganyar ', '3 SD ', 'Pilih Jenis Kel', 'Ngijo tengah 07/02 Tasikmadu Karanganyar ', '6281287744916', 'Bimbel', 'MAPEL 3 SD ', NULL, 'Tidak Aktif', NULL),
(305, 'Aerilyn Bellvania Cintakirana  (Cinta)', 'Surakarta', '2015-10-08', 'TK Al Hidayah ', 'TK', 'Pilih Jenis Kel', 'Asrama Polres Karanganyar ', '6282241007988', 'Bimbel', 'BASMALA KIDS ', NULL, 'Tidak Aktif', NULL),
(306, 'Winona Ayshaa Mutiaradisti (Enna)', 'Karanganyar ', '2017-11-06', 'TK Al Fattah ', 'TK ', 'Pilih Jenis Kel', 'Perum Argokiloso Blok C 22, RT 008/006,', '6285740104549', 'Pilih Tempat Les', 'BTA ', NULL, 'Aktif', NULL),
(316, 'Aditya Faiz Mumtaz Ramadhani  (Faiz Group)', 'Sukoharjo ', '2008-11-09', 'SMP Muhammaddiyah Darul Arqom ', '8 SMP', 'Pilih Jenis Kel', 'Dukuh RT 01/RW 04, Lalung, Karanganyar ', '6283136882663', 'Rumah', 'MAPEL 8 SMP', NULL, 'Tidak Aktif', NULL),
(318, 'Pradana Putra Adhitya (Pradana)', 'Karangturi', '2014-10-07', 'RA Al Hidayah', 'TK ', 'Laki - Laki', 'Jalan Lawu, Ngablak RT 06/ 11, Papahan, Tasikmadu, Karanganyar', '6281548518170', 'Bimbel', 'BTA', '2022-01-26', 'Tidak Aktif', 'Belum Diisi'),
(320, 'Siswa Baru', 'Karanganyar', '2016-01-08', 'TK aisyiyah', 'Tk', 'Laki - Laki', 'Badranasri', '986666668', 'Rumah', 'BASMALA KIDS', '2022-01-27', 'Aktif', 'Senin 13.00, rabu 14.00, kamis 13.00'),
(323, 'Maika Naura Kurniawan', 'Jakarta', '2011-09-18', 'SDN 03 Jaten', '4 SD ', 'Perempuan', 'Jalan Sebatik No 33 RT 09/08, Jaten, Karanganyar', '6281210800272', 'Rumah', 'MAPEL 4 SD ', '2022-01-28', 'Tidak Aktif', ''),
(324, 'Nabila Assyifa Aulia (Nabila)', 'Kediri', '2017-07-01', 'Belum Sekolah ', 'Belum Sekolah ', 'Perempuan', 'Nayan RT 02/07 Nangsri, Kebakkramat, Karanganyar', '082226145487', 'Bimbel', 'BASMALA KIDS', '2022-01-31', 'Aktif', 'Belum Konfirmasi '),
(329, 'Kanahaya Hayu Hafidzah (Nahya)', 'Belum Diisi', '2009-03-26', 'SMPN 01 Karanganyar ', '7 SMP', 'Perempuan', 'Jl.Walet 1 Tegalasri Rt 04/08 Bejen Karanganyar Surakarta ( 57716)', '6288802747806', 'Rumah', 'BTA DEWASA', '2022-02-03', 'Tidak Aktif', 'Belum Disi'),
(330, ' kayla zahra divani (Kayla Zahra)', 'Karanganyar ', '2008-01-03', 'SMP N1 Tasikmadu', '8 SMP ', 'Perempuan', ' Jongkang rt 03 rw 5, Desa Buran,kec Tasikmadu,kab karanganyar', '628122975091', 'Bimbel', 'MAPEL 8 SMP ', '2022-02-05', 'Tidak Aktif', 'Belum Diisi'),
(332, 'Muhammad Exza Abraham Alexi (Exza)', ' karanganyar', '2016-07-11', 'tk pembina karanganyar', 'TK ', 'Laki - Laki', 'beningrejo 06/05 gaum tasikmadu', '6289623898612', 'Bimbel', 'BASMALA KIDS', '2022-02-08', 'Aktif', ''),
(333, 'Hafidz Nugraha Amin (Hafidz)', 'Karanganyar', '2012-06-10', 'SDIT Al Hadi ', '4 SD', 'Laki - Laki', 'Ngablak RT 05/11, Papahan, Tasikmadu ', '628122597610', 'Bimbel', 'BTA', '2022-02-08', 'Tidak Aktif', ''),
(334, 'Ibnu Syihab Azzuhri  (Syihab)', 'Karanganyar ', '2013-10-03', 'MI Muhammadiyah Karanganyar', '3 SD', 'Laki - Laki', 'Perum Manggeh Anyar RT 003/13, Lalung, Karangany', '6285642335384', 'Bimbel', 'MAPEL 3 SD', '2022-02-08', 'Aktif', ''),
(336, 'Noureendya Juliastika  (Tika)', 'Karanganyar ', '2018-12-07', 'KB Nurul Huda ', 'KB', 'Perempuan', 'Klatak RT 001/001, Karangpandan, Karangpandan ', '6285700067240', 'Bimbel', 'BTA', '2022-02-08', 'Aktif', ''),
(337, 'Dzulfahmi Janu Pratama  ( Fahmi Janu )', 'Karanganyar ', '2017-10-01', 'TK Binaul Ummah ', 'TK ', 'Laki - Laki', 'Klatak RT 001/001, Karangpandan, Karangpandan ', '6285700067240', 'Bimbel', 'BASMALA KIDS', '2022-02-08', 'Aktif', ''),
(339, 'Raline Aizka Shaquen  (Aizka)', 'Surakarta ', '2016-09-08', 'TK Al Firdaus ', 'TK ', 'Perempuan', 'Kaliwuluh Lor RT 03/13, Kaliwuluh, Kebakkramat, Karanganyar ', '6285728758594', 'Bimbel', 'BASMALA KIDS', '2022-02-08', 'Aktif', ''),
(341, 'Yahya Akmal Herdiprasa  (Ahya)', 'Brebes ', '2012-01-17', 'SDIT Insan Kamil Karanganyar ', '6 SD ', 'Laki - Laki', 'Jl Raharja Indah I C23 Josroyo RT 04/15, Jaten, Karanganyar ', '6287736179333', 'Bimbel', 'MAPEL 6 SD', '2022-02-08', 'Tidak Aktif', ''),
(342, 'Stefani Jovita Christiana  (Christin )', 'Karanganyar ', '2014-02-05', 'SDN 01 karanganyar ', '2 SD', 'Perempuan', 'Papahan Rt 08/05, Papahan, Tasikmadu, Kra', '6285101680027', 'Bimbel', 'MAPEL 2 SD', '2022-02-08', 'Tidak Aktif', ''),
(345, 'Dzul Atha Khairan Hibrizi (Dzul Atha )', 'Karanganyar', '2012-12-16', 'SDIT Al Hadi ', '5 SD', 'Laki - Laki', ' pandes rt 01 rw 12 papahan tasikmadu kra', '6281228398145', 'Bimbel', 'BASMALA KIDS', '2022-02-10', 'Aktif', ''),
(346, 'Kumala Artanti Wijaksana (Kumala)', 'Karanganyar', '2014-12-20', 'SD Bejen 2 ', '1 SD', 'Perempuan', 'Bendungan RT 01/10, Kaliboto, Karanganyar ', '6285938502100', 'Bimbel', 'BASMALA KIDS', '2022-02-11', 'Tidak Aktif', ''),
(347, 'ARSHAKA SHAKIEL ARZAQUNA SORAYA (ARSHAKA)', 'Karanganyar', '2015-10-19', 'TKIT AL IZZAH SORONG PAPUA BARAT', 'TK ', 'Laki - Laki', 'Perum karanganyar indah no 17 ,jln gatotkaca rt 2 rw 14 badranmulyo lalung karanganyar', '6281327667238', 'Rumah', 'BTA, BASMALA KIDS', '2022-02-19', 'Tidak Aktif', ''),
(349, 'Yoansa Mufia Shazfa Alfhatunissa (Yoansa)', 'Karanganyar ', '2017-03-03', 'TKIT insan kamil karanganyar', 'TK ', 'Perempuan', 'Tegal Winangun RT .01/13, Tegalgede, Karanganyar ', '6282242273084', 'Bimbel', 'BASMALA KIDS', '2022-02-22', 'Tidak Aktif', ''),
(354, ' Naladhipa Arsyila Arka Nugroho (Nala)', 'Surakarta', '2016-11-05', 'TK IT Insan Kamil', 'TK ', 'Perempuan', 'Perum Puri Kahuripan Jaten', '6281226846611', 'Rumah', 'BASMALA KIDS', '2022-02-26', 'Tidak Aktif', ''),
(360, 'Aufar Dimas Said (Aufar Dimas)', 'Karanganyar', '2012-10-02', 'SDIT Insan Kamil Karanganyar ', '4 SD ', 'Laki - Laki', 'Sepat RT 07/05, Kalijirak, Tasikmadu', '6283834754530', 'Bimbel', 'MAPEL 4 SD ', '2022-03-16', 'Tidak Aktif', ''),
(361, 'Alnaira Indy Putri Sasongko (Indy)', 'Sukoharjo ', '2016-09-22', 'TK Pertiwi Pemda', 'TK ', 'Perempuan', 'Tegal Winangun RT .01/13, Tegalgede, Karanganyar ', '6289517133609', 'Bimbel', 'BASMALA KIDS', '2022-03-16', 'Tidak Aktif', ''),
(363, 'Marvel arrafi susanto (Marvel)', 'Karanganyar', '2008-03-11', 'Darul Arqom', '7', 'Laki - Laki', 'Tegalwinangun rt 1 rw 13 tegalgede karanganyar', '081393004096', 'Rumah', '', '2022-03-26', 'Tidak Aktif', 'Satu minggu sekali'),
(366, 'Fathiya Aulia Nisa (Fathiya)', 'Karanganyar ', '2014-02-10', 'SDIT Insan Kamil Karanganyar ', '1 SD', 'Perempuan', 'Ngemplak RT 03/ 05, Wonolopo, Tasikmadu, Karanganyar, Karanganyar', '628157906408', 'Bimbel', 'KELAS 1 SD ', '2022-03-26', 'Tidak Aktif', ''),
(372, 'Sunan gibran doewes (Sunan)', 'Solo', '2014-03-10', 'Sd muh 1 solo', '1', 'Laki - Laki', 'Jln patimura rt 3/8 tegalasri bejen', '082138193420', 'Rumah', '', '2022-04-04', 'Tidak Aktif', 'Senin dan jumat slm bln romadhon'),
(373, 'Canva For Kids 01', '0', '0001-01-01', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'Canva For Kids ', '2022-04-05', 'Tidak Aktif', ''),
(374, 'Canva For Kids 02', '0', '0001-01-01', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'Canva For Kids ', '2022-04-05', 'Tidak Aktif', ''),
(376, 'Malihah', '00', '0001-01-01', '000', '1 SD', 'Perempuan', '00', '000', 'Bimbel', 'Canva For Kids ', '2022-04-07', 'Tidak Aktif', ''),
(377, 'Aidan Ismail El Rafif (Afif)', 'Karanganyar', '0001-12-01', 'MI Muhammadiyah Karanganyar', '2 SD', 'Laki - Laki', 'Gerdu RT 001/11 Tegalgede, Karanganyar ', '0', 'Bimbel', 'BASMALA KIDS', '2022-04-08', 'Tidak Aktif', ''),
(378, 'Nada Nisrina H.N (Nada)', '0', '0001-01-01', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'Canva For Kids ', '2022-04-08', 'Tidak Aktif', ''),
(381, 'Khairani Rahmania Hermawan (Rahmania)', 'Sleman ', '2016-01-25', 'TK Al Fattah', 'TK', 'Perempuan', 'Ngablak RT 05/11, Papahan, Tasikmadu', '628701000020', 'Bimbel', 'BASMALA KIDS', '2022-04-11', 'Aktif', ''),
(382, 'Alifha Odilla Almahyra (Dila)', 'Karanganyar ', '2014-07-02', 'SDN  01 PAPAHAN', '2 SD', 'Perempuan', 'Perum Papahan Indah RT 09/16, Papahan, Tasikmadu, Karanganyar', '6285200788633', 'Bimbel', 'BTA', '2022-04-11', 'Aktif', ''),
(384, 'Gendhis', '0', '0001-01-01', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'Fun Quran ', '2022-04-14', 'Aktif', '0'),
(385, 'Berlin', '0', '0001-01-01', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'Fun Quran ', '2022-04-14', 'Aktif', ''),
(388, 'farieza raisha (Icha)', 'Karanganyar', '1111-11-11', '000', '0', 'Perempuan', '0', '0', 'Bimbel', 'Canva For Kids ', '2022-05-10', 'Tidak Aktif', ''),
(391, 'Muhammad hudzaifah (Hudza)', 'Karanganyar', '2022-12-07', 'Smp muh darul arkom karanganyar', '8', 'Laki - Laki', 'Perum marwa residance blok A3 jl lingkar selatan jungke karanganyar', '085701280292', 'Bimbel', '', '2022-05-14', 'Tidak Aktif', 'Sepulang sekolah sekitar jm 1 an atau 1.30 bisa'),
(392, 'Binar Lintang Kinasih (Binar)', 'Karanganyar', '2011-08-01', 'SD N 1 Papahan', '5', 'Perempuan', 'Perum. UNS Jl. Medicinae 174 Jati Jaten Karanganyar', '085854942538', 'Bimbel', '', '2022-05-17', 'Tidak Aktif', 'Selasa Kamis'),
(393, 'WAJENDRA FADEY TAQI (Fadey)', 'KARANGANYAR', '2007-02-07', 'SMP IT INSAN KAMIL', '8', 'Laki - Laki', 'CERBONAN RT.01 RW.01 KARANGANYAR', '081553358448', 'Bimbel', '', '2022-05-17', 'Tidak Aktif', 'Mapel fisika dan matematika, sepekan 4x'),
(396, 'Mohammad Gasta Satria Utama (Gasta)', 'Sukoharjo', '2013-09-02', 'Sd Kragilan 3', '3', 'Laki - Laki', 'Sumuran Wetan rt 03 rw 06 kragilan Mojolaban Sukoharjo', '089505314121', 'Rumah', '', '2022-05-18', 'Aktif', 'selasa sm kamis'),
(397, 'Kelas Menggambar 1', 'Karanganyar', '2022-05-12', 'Bimbel Basmala ', '0', 'Perempuan', '0', '0', 'Bimbel', 'Kelas Menggambar', '2022-05-19', 'Tidak Aktif', ''),
(400, 'Salma Zahwa Choiri (Salma)', 'Karanganyar', '2011-12-11', 'Kutab Ibnu Umar Beji', '5 SD', 'Perempuan', 'Jetis RT 02/03, Karanganyar', '6281329073990', 'Bimbel', 'MAPEL 5 SD ', '2022-05-19', 'Aktif', '2 x stelah ashar'),
(405, 'Davita Zahra Qinthara (Tara)', 'Sukoharjo', '2008-08-06', 'SMPIT MTA Karanganyar ', '8 SMP ', 'Perempuan', 'Banaran RT 02/8, Gemantar, Jumantono', '085100066921', 'Bimbel', 'MAPEL 8 SMP ', '2022-05-21', 'Tidak Aktif', ''),
(407, 'Nasywa Ezra amanda (Naswa) ', 'Karanganyar', '2012-03-03', 'SDIT ALHADI', '4', 'Perempuan', 'Brayutan RT,03,08 Alastuwo,Kebakkramat,kra', '081325056738', 'Rumah', '', '2022-05-24', 'Tidak Aktif', 'Senin sampai jumat'),
(409, 'Muhammad Agam Al Fatih (Agam)', 'Bekasi', '2017-04-03', 'TKTQ Ahmad Islamic School', 'TK A', 'Laki - Laki', 'Padangan RT3/7, Jungke , Karanganyar', '081380239035', 'Bimbel', '', '2022-05-31', 'Tidak Aktif', ''),
(410, 'Rahmatul Izzah Setiyawan (Rahma)', 'Karanganyar', '2009-07-09', 'SMPN 2 KARANGANYAR', '7 SMP', 'Perempuan', 'Perum Pokoh Baru RT 10/6 Ngijo, Tasikmadu, Karanganyar ', '0821385444', 'Bimbel', 'MAPEL 7 SMP', '2022-06-02', 'Tidak Aktif', ''),
(411, 'ADHYASTHA ABID MAHENDRA  (Abid)', 'SUKOHARJO', '2015-08-03', 'PAUD ALAM ANAK PINTAR', 'TK B', 'Laki - Laki', 'RINGIN ASRI BLOK C3 NO.7 RT 06 RW 12 KEL. BEJEN KEC/KAB KARANGANYAR', '082135802414', 'Bimbel', '', '2022-06-04', 'Aktif', 'Senin Dan Kamis');
INSERT INTO `siswa` (`id_siswa`, `nama`, `tempatlahir`, `tanggallahir`, `asalsekolah`, `kelas`, `jeniskelamin`, `alamat`, `nohp`, `tempat_les`, `pilihanprogram`, `tglpendaftaran`, `status_siswa`, `keterangan`) VALUES
(412, 'ARSENIO GILANG NARENDRA (Nio)', 'KARANGANYAR', '2016-07-10', 'RA HIDAYATUL INSAN', 'TK A', 'Laki - Laki', 'RINGIN ASRI BLOK C3 NO.7 RT 06 RW 12 KEL BEJEN KEC/KAB KARANGANYAR', '082135802414', 'Bimbel', '', '2022-06-04', 'Aktif', 'Senin dan kamis'),
(414, 'Hizkia Esterfani Septi Anggraini (Ester)', 'Gunungkidul', '2012-02-04', 'SD Kristen Karanganyar ', '4 SD ', 'Perempuan', 'Cangakan Timur RT 01 RW 04, Cangakan, Karanganyar ', '083848189833', 'Bimbel', 'MAPEL 4 SD ', '2022-06-07', 'Aktif', ''),
(415, 'Alkhalifi Naufal Sakhi (Naufal Sakhi)', 'Sukoharjo', '1111-11-11', 'MI Muhammadiyah Karanganyar', '4 SD ', 'Laki - Laki', 'Plampang, Rejosari, Polokarto, Sukoharjo', '082226321566', 'Bimbel', 'MAPEL 4 SD ', '2022-06-07', 'Aktif', ''),
(416, 'Tito Ismail EL Rafif (Tito Ismail)', 'Karanganyar', '2015-12-11', 'TK Aisyiyah Mutiara Hati', 'TK B', 'Laki - Laki', 'Pokoh Baru RT 5 RW.6  Ngijo Tasikmadu Karanganyar', '085233580816', 'Bimbel', '', '2022-06-10', 'Aktif', 'Selasa Rabu Jum\'at Sore(ba\'da Ashar)'),
(419, 'Muhammad Abqori Agam Putra (Agam Putra) ', 'Karanganyar', '2015-11-06', 'MIM KARANGANYAR ', '2 SD', 'Laki - Laki', 'Badranasri RT 01/10, Cangakan, Karanganyar', '6281804546880', 'Bimbel', 'BASMALA KIDS', '2022-06-15', 'Aktif', ''),
(423, 'Basmala Fun Holiday Bintang Kecil ', '0', '0001-01-01', 'Bimbel Basmala ', 'TK', 'Perempuan', 'Bimbel Basmala ', '0000000000', 'Bimbel', 'Basmala Fun Holiday', '2022-06-18', 'Aktif', ''),
(424, 'Basmala Fun Holiday Bintang Besar ', '0', '0001-01-01', 'Bimbel Basmala ', '3 SD', 'Perempuan', 'Bimbel Basmala ', '0000000', 'Bimbel', 'Basmala Fun Holiday', '2022-06-18', 'Aktif', ''),
(428, 'Daffvian Xaviero Nugroho (Daffa)', 'Kediri', '2011-06-09', 'SDN 1 Jungke', '6SD', 'Laki - Laki', 'Asrama Polres Karanganyar', '6282176676249', 'Bimbel', 'MAPEL 4 SD ', '2022-06-21', 'Aktif', ''),
(429, 'Aisyah Putri ', '00000000', '1111-11-11', '00', '00', 'Perempuan', '00', '0000000', 'Bimbel', 'Basmala Fun Holiday', '2022-06-21', 'Aktif', ''),
(430, 'Viora ZAENURUL aisyah', 'Karanganyar', '2014-02-27', 'SD Pandeyan 01', '2', 'Perempuan', 'Pandeyan rt 03/06 Pandeyan tasikmadu', '081326068002', 'Rumah', '', '2022-06-21', 'Tidak Aktif', 'Pagi ...dan sore'),
(431, 'Assyifa Cantika Pramadhani (Cantika)', 'Karanganyar', '2012-12-07', 'SDB 01 Cangakan', '4 SD ', 'Perempuan', 'Pokoh Baru RT 12/6, Ngijo, Tasikmadu', '6281226564986', 'Bimbel', 'MAPEL 4 SD ', '2022-06-22', 'Tidak Aktif', ''),
(433, 'Alwan Hazard Zaini (Alwan)', 'Jakarta', '2013-12-06', 'SD ARROHMAN ', '5SD ', 'Laki - Laki', 'Ngijo Tengah RT 01/02, Ngijo, Tasikmadu , Karanganyar', '6288216024890', 'Bimbel', 'KELAS 4 SD', '2022-06-23', 'Tidak Aktif', ''),
(434, 'Fariz Atha Ramadhan (Atha)', 'Karanganyar', '2016-12-06', 'TK NURUL IMAN ', 'TK B ', 'Laki - Laki', 'Badran Mulyo Lalung', '6281904526194', 'Bimbel', 'BASMALA KIDS', '2022-06-23', 'Tidak Aktif', ''),
(435, 'Abelyna AWR (Abel)', 'KARANGANYAR ', '2011-05-14', 'SDN 01 Ngijo ', '6 SD', 'Perempuan', 'Perum GKS NGijo Kulon RT 09/1 Ngijo, Tasikmadu, Karanganyar', '6281327023299', 'Bimbel', 'KELAS 6 SD', '2022-06-23', 'Aktif', ''),
(436, 'Farida Hasna (Aida)', '0', '1111-11-11', '0000000', '0', 'Perempuan', 'Bi0mbel Basmala', '0000000', 'Bimbel', 'Basmala Fun Holiday', '2022-06-23', 'Tidak Aktif', ''),
(440, 'akhdan fairel athaya (akhdan)', 'Karanganyar', '2013-07-12', 'SDN cangakan 2', '4', 'Laki - Laki', 'manggung rt 1 rw 9 ', '081321684249', 'Bimbel', 'BASMALA KIDS', '2022-06-25', 'Tidak Aktif', '2x'),
(441, 'nadhira khoirus shahira (shahi)', 'Karanganyar', '2016-06-12', 'tk papahan 02', 'TK b', 'Perempuan', 'kalongan wetan rt 2 rw 17 papahan, tasikmadu', '082139516201', 'Bimbel', 'BASMALA KIDS', '2022-06-25', 'Tidak Aktif', '5x jam  15.00/16.00'),
(442, 'satria rafa bagaskara (rafa)', 'Karanganyar', '2009-11-18', 'SDN 02 jaten', '6 SD ', 'Laki - Laki', 'pokoh baru gang tulip rt 12 rw 6', '0895401936621', 'Bimbel', 'BASMALA KIDS', '2022-06-25', 'Aktif', '3x sore  habis ashar'),
(448, 'kunthi sundari listiyowati  (kunthi)', 'Karanganyar', '2016-05-09', 'sdn 2 bejen ', '1 SD', 'Perempuan', 'jatiarum rt 6 rw 11 banjarharjo kebakkramat', '082136335578', 'Bimbel', 'BASMALA KIDS', '2022-07-06', 'Tidak Aktif', ''),
(450, 'Fadhlan Mashur Nur Fahmi (Fadhlan)', 'Karanganyar', '2011-01-01', 'SDIT Insan Kamil Karanganyar ', '6 SD ', 'Laki - Laki', 'Maduasri RT 011/05, Tasikmadu, Karanganyar ', '6285708642007', 'Bimbel', 'PRIVAT 6 SD', '2022-07-11', 'Tidak Aktif', ''),
(451, 'fawwas abidzar bagaskoro (fawwas)', 'solo', '2017-03-07', 'SCA', 'TK A', 'Laki - Laki', 'kepuh rt 1 rw 3 lalung, karanganyar', '082147071000', 'Bimbel', 'BASMALA KIDS', '2022-07-12', 'Tidak Aktif', ''),
(452, 'Axel Naufal Alghani (axel)', 'Karanganyar ', '2017-01-08', 'SCA', 'TK A', 'Laki - Laki', 'jetis, rt 5 rw 3 suruh,  tasikmadu', '082243766146', 'Bimbel', 'BASMALA KIDS', '2022-07-12', 'Tidak Aktif', ''),
(454, 'Adreena Pumila Sheza (sesa)', 'Karanganyar', '2017-08-17', 'SCA', 'TK  A', 'Perempuan', 'Perum jetu town house A2 rt 1 rw 2 teglagede ', '08112635354', 'Rumah', 'BASMALA KIDS', '2022-07-12', 'Aktif', ''),
(464, 'Program Kelas 4 SD', '0', '1111-11-11', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'KELAS 4 SD', '2022-07-13', 'Tidak Aktif', ''),
(465, 'Program Kelas 3 A', '0', '1111-11-11', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'KELAS 3 SD ', '2022-07-13', 'Tidak Aktif', ''),
(469, 'Thifanka Answandewi (Thifanka)', 'Karanganyar', '2017-02-10', 'SCA KARANGANYAR', 'TK B', 'Perempuan', 'Badranasri RT 2 / rw 11, Cangakan ', '6285691600834', 'Bimbel', 'KELAS BASMALA KIDS', '2022-07-14', 'Aktif', ''),
(471, 'Abhivandya', 'Karanganyar', '2016-02-09', 'SDI ArRahman', '1', 'Laki - Laki', 'Karangmojo, tasikmasu karanganyar', '08112647255', 'Bimbel', 'KELAS 1 SD ', '2022-07-15', 'Aktif', ''),
(472, 'Eza Anggoro sanjaya (Angga Eza) ', 'Karanganyar ', '1111-11-11', 'SDN 02 Karanganyar', '4 SD ', 'Laki - Laki', 'Bibis Jungke Karanganyar', '6281229340620', 'Bimbel', 'KELAS 4 SD', '2022-07-15', 'Tidak Aktif', ''),
(474, 'Alisya Ailvia Shila (Shila)', 'Karanganyar', '1111-06-06', 'SDN 01 Cangakan ', '1 SD', 'Perempuan', 'Cangakan Timur RT 03/02. Cangakan, Karanganyar ', '0895328344477', 'Bimbel', 'KELAS BASMALA KIDS', '2022-07-16', 'Tidak Aktif', ''),
(475, 'Program Kelas 2 SD', '0', '1111-11-11', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'KELAS 2 SD', '2022-07-18', 'Aktif', ''),
(476, 'Kinanthi nurlaili rahmadhani riyadi (Kinan) kelas', 'Karanganyar', '2015-12-07', 'SD negeri 01 karanganyar', '2', 'Perempuan', 'Badran mulyo rt 02/14 lalung , karanganyar', '087835232832', 'Bimbel', 'KELAS 2 SD', '2022-07-18', 'Tidak Aktif', '-'),
(477, 'Kelompok 6 SD', '0', '1111-11-11', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'PRIVAT 6 SD', '2022-07-18', 'Aktif', ''),
(480, 'Kelas kids 2', 'Karanganyar', '1111-01-01', '0', 'SD', 'Laki - Laki', '0', '0', 'Bimbel', 'KELAS BASMALA KIDS', '2022-07-20', 'Tidak Aktif', ''),
(481, 'Azalea Pradnyadiva Syaza (Aza)', 'Batam', '2011-06-06', 'SDIT Insan Kamil Karanganyar ', '5 SD', 'Perempuan', 'Jl RM Said RT 004 RW 11, Gerdu rejo, Tegalgede, Karanganyar ', '6281227834919', 'Bimbel', 'PRIVAT 5 SD', '2022-07-21', 'Aktif', ''),
(484, 'adelio arfa jarvis putra ( IO)', 'karanganyar ', '2015-09-09', 'Sdn 1 karanganyat', '1 sd', 'Laki - Laki', 'perum graha permata blok a01 jungke', '087815399923', 'Bimbel', 'KELAS BASMALA KIDS', '2022-07-22', 'Tidak Aktif', ''),
(485, 'naufal bagus putra setyawan (naufal bagus)', 'sukoharjo', '2015-02-05', 'SDN 1 papahan', '1 SD', 'Laki - Laki', 'Pundak rt 04 rw 7 jati jaten kra', '0895321400907', 'Bimbel', 'KELAS BASMALA KIDS', '2022-07-22', 'Aktif', ''),
(487, 'ammar  kahfi putra wibowo (ammar kahfi)', 'karanganyar', '2016-02-08', 'RA wijaya kusuma', 'TK B', 'Laki - Laki', 'gria papahan indah rt 6 rw 7  papahan tasikmadu', '087734611116', 'Bimbel', 'BASMALA KIDS', '2022-07-23', 'Tidak Aktif', ''),
(488, 'Aqila Afra Ghaniyah  (Aqilla Afra)', 'karanganyar', '2015-11-04', 'SDN 01 PAPAHAN', '2', 'Perempuan', 'tegal biru rt 04 rw 03 gaum tasikmadu karanganyar', '628995076884', 'Bimbel', 'KELAS 2 SD', '2022-07-25', 'Tidak Aktif', 'hari rabu dan jumat jam 15.00'),
(489, 'HANIF AMINUDIN JAZZALI MUSYAFAR (Hanif)', 'Karanganyar', '2014-09-06', 'SDN 01 PAPAHAN TASIKMADU', '2', 'Laki - Laki', 'CARAT RT 2 RW 4 KEL. BRUJUL KEC. JATEN KAB. KARANGANYAR', '082134370439', 'Bimbel', 'KELAS 2 SD', '2022-07-25', 'Aktif', 'Senin dan kamis'),
(493, 'Fergie Yafie Hananta (Fergie)', 'Surakarta', '2012-06-06', 'SDN Bejen 2 Karanganyar', '6 SD', 'Laki - Laki', 'Jengglong Rt 02, 01, Bejen Karanganyar ', '62815352110044', 'Bimbel', 'KELAS 5 SD', '2022-07-27', 'Aktif', ''),
(499, 'Maylafaisha gebrina rizka (Gaby)', 'Karanganyar', '2017-07-01', 'Tk al fatah', 'Tk', 'Perempuan', 'Jl. Walet IX, Tegal Asri, RT.06, RW.08, Bejen, Karanganyar', '08122631270', 'Rumah', 'Privat Menggambar', '2022-08-01', 'Aktif', 'Selasa kamis jam 15-16'),
(501, 'Khaila Nur fadhilla  (Khaila Nur)', 'Karanganyar', '2008-09-01', 'Smpit insan kamil karanganyar', '9 smp', 'Perempuan', 'Gempol, suruhkalsng, jaten, karanganyar. ', '081227079363', 'Rumah', 'PRIVAT 9 SMP', '2022-08-01', 'Tidak Aktif', 'Senin dan rabu setelah maghrib'),
(504, 'HerdianZiggy Maheswara (Herdian)', 'Karanganyar', '2017-01-07', 'TK Al Azhar Al Mustaqim ', 'TK B', 'Laki - Laki', 'Pandes Rt 01/13', '6281228542373', 'Bimbel', 'PRIVAT 1 SD', '2022-08-02', 'Tidak Aktif', ''),
(505, 'Kelompok 5 SD A', 'Karanaganyar', '1111-11-11', '1', '1', 'Perempuan', '1', '1', 'Bimbel', 'KELAS 5 SD', '2022-08-02', 'Aktif', ''),
(509, 'Asyam syafiq  (syafiq)', 'Surakarta', '2015-07-15', 'isykarima', '1 sd', 'Laki - Laki', 'Jl. lawu rt 3 rw 3 tegalrejo, tegalgede', '085647656900', 'Bimbel', 'PRIVAT BTA', '2022-08-06', 'Tidak Aktif', ''),
(511, 'Hevyna yumna aira (vyna)', 'Karanganyar', '2016-01-12', 'min karangmojo ', '1 sd ', 'Perempuan', 'suruh jetis rt 6 rw 3 tasikmadu karanganyar', '081215803071', 'Bimbel', 'BASMALA KIDS', '2022-08-06', 'Aktif', ''),
(512, 'Al habbi putra  ramadhani (rama)', 'Karanganyar', '2016-06-06', 'KB Alhidayah', 'TK B', 'Laki - Laki', 'maguan rt 6 rw 6 gaum tasikmadu kra', '085743363441', 'Bimbel', 'BASMALA KIDS', '2022-08-06', 'Tidak Aktif', ''),
(513, 'Arsennio omar hanif (arsen)', 'belum diisi ', '2016-06-08', 'RA Al Hidayah', 'TK ', 'Laki - Laki', 'SEMBUNG RT 3 RW 2 GAYAMDOMPO KRA', '0895363466388', 'Bimbel', 'BASMALA KIDS', '2022-08-06', 'Tidak Aktif', ''),
(516, 'Program Kalas 3 A', '0', '0001-01-01', '00', '0', 'Perempuan', '00', '0', 'Rumah', 'PRIVAT 3 SD', '2022-08-10', 'Tidak Aktif', ''),
(517, 'Program Kelas 3 B ', '0', '0001-01-01', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'PRIVAT 3 SD', '2022-08-10', 'Aktif', ''),
(519, 'Bisma Alzaki Putra Mahendra (Bisma)', 'Karanganyar', '2014-12-10', 'MIM Karanganyar', '2 SD', 'Laki - Laki', 'pOKOH bARU gANG aSTER rt 09/06, nGIJO , tASIKMADU', '6281327778186', 'Bimbel', 'PRIVAT BTA', '2022-08-12', 'Aktif', ''),
(520, 'Diana Aulia Putri (diana)', 'Karanganyar', '1111-01-01', 'SD Sapen 2 ', '2 SD', 'Perempuan', 'Dukuh RT 02/02, ', '6285728884707', 'Bimbel', 'PRIVAT 2 SD', '2022-08-15', 'Aktif', ''),
(521, 'Alfajri maulidan setiyanto (Alfajri)', 'Karanganyar', '2009-04-03', 'SMPIT Insan Kamil Karanganyar', '8A', 'Laki - Laki', 'Badranasri rt.03 rw.10 cangakan, karanganyar, Jateng', '081327093655', 'Rumah', 'PRIVAT 8 SMP', '2022-08-16', 'Aktif', 'Mhn Jadwal boleh hari senin-jumat, kecuali sabtu&minggu, terimakasih'),
(523, 'Kennard Abrizam Nayottama (Kend)', 'Karanganyar', '2013-04-11', 'MI Muhammadiyah Karanganyar', '3 SD', 'Laki - Laki', 'Bejen  RT 04/11, Bejen Karanganyar', '6281294478330', 'Bimbel', 'PRIVAT 3 SD', '2022-08-18', 'Tidak Aktif', ''),
(530, 'Felda Ramadhan Al Hafiz (Felda)', 'Tulungagung ', '2005-12-10', 'SMAN 2 Karanganyar ', '11', 'Laki - Laki', 'Jl.Rm.Said rt.04 rw.11, Gerdurejo - Tegalgede, Karanganyar ', '089521006939', 'Rumah', 'PRIVAT 11 SMA', '2022-08-24', 'Tidak Aktif', 'Selasa malam dan Rabu malam'),
(532, 'danish arkan kristianto (danish)', 'belum diisi ', '2011-08-06', 'SDN gebyog 2', '6 SD ', 'Laki - Laki', 'gobagan rt 2 rw 6 kaliboto mojogedang kra', '081226319323', 'Rumah', 'PRIVAT BTA', '2022-08-27', 'Aktif', ''),
(533, 'Fabian Arsenio Saputro (Fabian)', 'Karanganyar', '2015-06-07', 'MI Muhammadiyah Karanganyar', '2 SD', 'Perempuan', 'Cerbonan RT 02/02', '628226846071', 'Bimbel', 'PRIVAT 2 SD', '2022-08-27', 'Aktif', ''),
(534, 'Clhicivia Arsyavin Narta (Lizzy)', 'Karanganyar', '2011-05-05', 'SD Papahan 01', '6 SD ', 'Perempuan', 'Perum Papan Kahuripan ', '6281225458954', 'Bimbel', 'KELAS 6 SD', '2022-08-27', 'Tidak Aktif', ''),
(535, 'Excell Yoga Pratama ', 'Ratu Elok ', '2012-02-12', 'SD HMDC KALBAR ', '4', 'Laki - Laki', 'Dukuh Sawahan desa Banjarharjo ', '085218507174', 'Rumah', 'PRIVAT 4 SD', '2022-08-30', 'Aktif', 'Mohon maaf karena kami hanya mudik di Jawa , jadi kami coba ambil paket yang 1 Minggu.. terimakasih '),
(536, 'Excell Yoga Pratama ', 'Ratu Elok ', '2012-02-12', 'SD HMDC KALBAR ', '4', 'Laki - Laki', 'Dukuh Sawahan desa Banjarharjo kecamatan kebakramat kabupaten Karanganyar ', '085218507174', 'Rumah', 'PRIVAT 4 SD', '2022-08-30', 'Tidak Aktif', 'Rabu, Kamis, jumat'),
(537, 'Dhafitha nizza nur azizah (Dhafitha)', 'Karanganyar', '2015-11-11', 'Al karimah', '1', 'Perempuan', 'Manggis rt 3 rw 12 lalung karanganyar', '081913787258', 'Bimbel', 'PRIVAT 1 SD', '2022-08-30', 'Aktif', 'Jumat sore\r\nSabtu pagi'),
(538, 'Hildano Adhyasta Akbar (Hildano)', 'Karanganyar ', '2012-11-12', 'MI Muhammadiyah Karanganyar ', '4H', 'Laki - Laki', 'Karanganyar RT 04 RW 06 Karanganyar ', '082227122597', 'Bimbel', 'PRIVAT 4 SD', '2022-08-30', 'Tidak Aktif', 'Rabu, Kamis'),
(539, 'kelas kids kel 1', 'belum diisi ', '2010-12-03', '0', 'TK ', 'Perempuan', 'belum di isi', '0000000', 'Bimbel', 'KELAS BASMALA KIDS', '2022-09-01', 'Aktif', ''),
(540, 'kelas kids kel 2', 'belum diisi ', '2011-12-01', '0', 'TK', 'Perempuan', '0', '0', 'Bimbel', 'KELAS BASMALA KIDS', '2022-09-01', 'Tidak Aktif', ''),
(542, 'kelas kids 4', 'belum diisi ', '1111-11-04', '0', '0', 'Laki - Laki', '0', '0', 'Bimbel', 'KELAS BASMALA KIDS', '2022-09-01', 'Tidak Aktif', ''),
(543, 'Progrram Kelas 1 SD', '0', '0001-01-01', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'KELAS 1 SD ', '2022-09-01', 'Aktif', ''),
(544, 'Alisya Hayatunufus (Alis)', 'Karanganyar', '2014-11-05', 'SD 01 Papahan ', '1 SD', 'Perempuan', 'Nglano Kulon RT 04/01, pANDEYAN , Tasikmadu', '6282133499800', 'Bimbel', 'KELAS 1 SD ', '2022-09-01', 'Tidak Aktif', ''),
(545, 'Program Kelas 6 A', '0', '0001-01-01', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'KELAS 6 SD', '2022-09-01', 'Tidak Aktif', ''),
(547, 'Aisyah Ayla Varisha (Aisyah)', 'Karanganayar', '2015-08-09', 'SD PAPAHAN 02', '2 SD', 'Perempuan', 'Badranbaru RT 8/8, Papahan, Tasikmadu, Kra', '6288216474091', 'Bimbel', 'PRIVAT 2 SD', '2022-09-02', 'Tidak Aktif', ''),
(549, 'kelas kids 4', 'belum diisi ', '1111-11-11', '0', '1 SD', 'Laki - Laki', '0', '0', 'Bimbel', 'KELAS BASMALA KIDS', '2022-09-02', 'Tidak Aktif', ''),
(551, 'KELAS KIDS 1', '0', '1111-12-04', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'KELAS BASMALA KIDS', '2022-09-06', 'Aktif', ''),
(552, 'Alfian Bagas Kurniawan (Bagas)', 'Karanganyar', '2022-04-11', 'SDN 03 LALUNG', '5 SD', 'Laki - Laki', 'Geneng REjo RT 01/09, Lalung, Kra', '6289505861199', 'Bimbel', 'KELAS 5 SD', '2022-09-07', 'Aktif', ''),
(559, 'Kinandita putri bogi lashira (kinan)', 'Karanganyar', '2017-07-28', 'TK aisyah mutiara hati', 'TK B', 'Perempuan', 'jetak rt 3 rw 2 suruhkalang jaten kra ', '087836995522', 'Rumah', 'PRIVAT BTA', '2022-09-07', 'Aktif', ''),
(560, 'Jennahara Nasyitha Santoso', 'Surakarta', '2017-10-20', 'al azhar syifa budi solo', 'Tk b', 'Perempuan', 'Geneng rt 1 rw 6, tegal gede, karanganyar', '081225877007', 'Rumah', 'PRIVAT BTA, BASMALA KIDS', '2022-09-08', 'Tidak Aktif', 'Selasa, rabu, kamis jam 5 sore'),
(564, 'Baqir Lathif Amanto (Zizi)', 'Surakarta', '2010-11-07', 'SMPIT Karanganyar', '7 SMP ', 'Laki - Laki', 'Joso RT 01.01 Triyagan Mojolaban Sukoharjo', '6285229458760', 'Rumah', 'PRIVAT 7 SMP', '2022-09-19', 'Tidak Aktif', ''),
(565, 'Naufa Latif (Naufa)', 'Surakarta', '1111-11-11', 'SDIT INSAN KAMIL', '6 SD', 'Perempuan', 'Buran, Tasikmadu, Karanganyar', '6281393030277', 'Bimbel', 'PRIVAT 6 SD', '2022-09-19', 'Tidak Aktif', ''),
(567, 'mikhayla almahya azkadina (mikha)', 'Surakarta', '2017-12-09', 'SCA', 'TK A', 'Perempuan', 'tolok rt 3 rw 10 tegalgede kra', '082136610019', 'Bimbel', 'BASMALA KIDS', '2022-09-22', 'Tidak Aktif', ''),
(571, 'Mufia Fhathiyyaturahma Azzahra (Mufia)', 'Karanganyar', '2016-06-02', 'pONPES aLKARIMAH kARANGANYAR', '1 SD', 'Perempuan', 'nGEMPLAK kARANGPANDAN', '0852299055319', 'Bimbel', 'PRIVAT 1 SD', '2022-09-30', 'Tidak Aktif', ''),
(572, 'Rasya alkhalifi zikri ( rasya)', 'Surakarta', '2016-01-05', 'Ra hidayatul insan', 'TK B', 'Laki - Laki', 'mojorejo rt 5 rw 6 suruh kalang jaten kra', '08121505472', 'Bimbel', 'BASMALA KIDS', '2022-10-01', 'Aktif', ''),
(575, 'nafisah satavia putri (nafisah)', 'karanganyar', '2017-10-04', 'TK AISYIYAH KARANGANYAR', 'TK B', 'Perempuan', 'PERUM CITRA ALAM RANIA 3 JATI JATEN KARANGANYAR', '082138839880', 'Bimbel', 'KELAS BASMALA KIDS', '2022-10-04', 'Tidak Aktif', ''),
(583, 'hanandzikri nayottama (tama)', 'karanganyar', '2010-02-08', 'sdit insan kamil', '6 SD ', 'Laki - Laki', 'pokoh baru gang melati no 21', '082243111155', 'Rumah', 'PRIVAT 6 SD', '2022-10-24', 'Aktif', ''),
(584, 'Fatimah shakila khairina (fatimah shakila)', 'Karanganyar', '1111-01-11', 'mi hidayatul insan', '1 SD', 'Perempuan', 'pokoh baru gang tulip rt 12 rw 6', '0895401936621', 'Bimbel', 'BASMALA KIDS', '2022-10-26', 'Tidak Aktif', ''),
(585, 'kelas kids 5', '0', '2222-11-11', '0', 'TK ', 'Perempuan', 'belum di isi', '089161616166', 'Bimbel', 'KELAS BASMALA KIDS', '2022-10-31', 'Tidak Aktif', ''),
(588, 'Isard Rayyaka Pranbudi (Isard)', 'Sukoharjo', '2014-08-03', 'SDN 04 BEJEN', '4SD', 'Laki - Laki', 'Perumahan Ringin Asri 1 rt 04 rw 12 no rumah B 107', '081230979781', 'Rumah', 'PRIVAT 3 SD', '2022-11-03', 'Aktif', 'Senin dan Kamis tidak lebih dari jam 17.00'),
(589, 'RASHYA ABQORY ALFARIZKI', 'SURAKARTA', '2016-09-14', 'PAUD SCA KARANGANYAR', 'TK', 'Laki - Laki', 'PERUM PESONA PURNAMA REGENCY BLOK 4 NGIJO TASIKMADU ', '085884367890', 'Rumah', 'BASMALA KIDS', '2022-11-04', 'Aktif', ''),
(590, 'lintang biru dyah surtikanthi ', 'karanganyar', '2009-07-01', 'smpit nur hidayah', '8 smp', 'Perempuan', 'perumahan griya edelwis blop b 18 joho mojolaban sukoharjo ', '081225912350', 'Rumah', 'PRIVAT 8 SMP', '2022-11-07', 'Aktif', ''),
(595, 'zahra zaqia(zahra)', 'sukoharjo', '2022-02-07', 'mi muhammadiyah karanganyar ', '5SD', 'Perempuan', 'jl derdoyudo desa pojok rt 1 rw 1 delingan karanganyar ', '085290864114', 'Bimbel', 'PRIVAT 5 SD', '2022-11-19', 'Tidak Aktif', ''),
(596, 'JENAR NAIRA PRATAMA', 'SLEMAN', '2018-11-02', 'TK AL FATTAH ', 'TK B ', 'Perempuan', 'JL KERTOBUMI RT 2 RW 12 BADRANARI ', '081228835495', 'Bimbel', 'PRIVAT BTA', '2022-12-12', 'Tidak Aktif', ''),
(598, 'ADLAN HABIBIE S ', 'TEGAL ', '2013-08-29', 'SD ASC KARANGANYAR', '3', 'Laki - Laki', 'JENGGLONG RT 3 RW 2 BEJEN KARANGANYAR ', '085842293017', 'Bimbel', 'PRIVAT BTA', '2022-12-17', 'Aktif', ''),
(599, 'ELMIRA HASNA S (ARA )', 'TEGLA ', '2016-08-23', 'TK PEMDA KARANGANYAR ', 'TK B ', 'Perempuan', 'JENGGLONG RT 3 RW 2 BEJEN KARANGANYAR ', '085842293017', 'Bimbel', 'BASMALA KIDS', '2022-12-17', 'Aktif', ''),
(600, 'Rafif daniswara nugroho', 'karanganyar', '2017-09-27', 'TK AL FATTAH ', 'tk a ', 'Laki - Laki', 'pandeyan rt 2 ', '081804449071', 'Bimbel', 'Basmala Fun Holiday', '2022-12-19', 'Aktif', ''),
(601, 'muhammad anggara r m ( angga )', 'karanganyar ', '2015-05-30', 'sdn 3 gedong ', '1', 'Laki - Laki', 'pelet rt 3 rw 6 gedong karanganyar ', '081226432263', 'Bimbel', 'PRIVAT 1 SD', '2022-12-20', 'Aktif', ''),
(602, 'hilya almashyra mafaza (hilya )', 'karanganyar ', '2018-02-08', 'jakarta ', 'TK', 'Laki - Laki', 'kayangan bejen karanganyar ', '081213730735', 'Bimbel', 'BASMALA KIDS', '2022-12-21', 'Tidak Aktif', ''),
(604, 'david', 'gg', '2022-06-12', 'd', 'd', 'Laki - Laki', 'd', '333', 'Bimbel', 'Basmala Fun Holiday', '2022-12-23', 'Tidak Aktif', ''),
(605, 'SHAKILLA ZEA VANIA  ( ZEA ) ', 'SURAKARTA ', '2017-05-09', 'SDII Al Abidin Karanganyar ', '1 SD ', 'Perempuan', 'PERUM TIRTASANI RESIDENCE BLOK D 12 A ', '082135319909', 'Bimbel', 'KELAS BASMALA KIDS', '2022-12-28', 'Aktif', ''),
(607, 'ATAYA FATHAN NANDANA ( FATHAN )', 'SURAKARTA ', '2016-04-12', 'SCA ', 'TK B ', 'Laki - Laki', 'NGIJO TENGAH RT 2 RW 2 KARANGANYAR ', '085747398188', 'Bimbel', 'BASMALA KIDS', '2022-12-29', 'Tidak Aktif', ''),
(608, 'rivania kirana putri ( kirana )', 'serui ', '2012-09-06', 'SDN 3 PAPAHAN ', '5SD', 'Perempuan', 'perum griya mutiara papahan e 3 ', '081216712600', 'Bimbel', 'KELAS 5 SD', '2022-12-30', 'Tidak Aktif', ''),
(609, 'AJISAKA ATTALLA BAKHTI ( SAKA ) ', 'SURAKARTA ', '2018-07-04', 'SCA ', 'KB', 'Laki - Laki', 'KAYANGAN RT 1 RW 4 BEJEN KARANGANYAR ', '082225705121', 'Bimbel', 'BASMALA KIDS', '2022-12-30', 'Aktif', ''),
(611, 'JOEVANKA EL RAHADIAN ', 'MALANG ', '2011-06-06', 'SDN 1 CANGAKAN ', '6', 'Laki - Laki', 'BADRAN ASRI RT 3 RW 12 KARANGANYAR ', '081239634838', 'Bimbel', 'KELAS 6 SD', '2022-12-31', 'Aktif', ''),
(612, 'najwa anindita wibowo ( najwa ) ', 'karanganyar ', '2015-01-07', 'sdn 3 karanganyar ', '1', 'Perempuan', 'gang raflesia permata pokoh baru 14/06 ngijo tasikmadu ', '085713029964', 'Bimbel', 'KELAS 1 SD ', '2023-01-02', 'Tidak Aktif', ''),
(613, 'kslant aliyyun evareta  ( evareta )', 'karanganyar ', '2016-05-04', 'sdn 3 karanganyar ', '3 SD ', 'Perempuan', 'tegal winangun rt 2 rw 13  tegal gede  karanganyar ', '085890395879', 'Bimbel', 'KELAS 1 SD ', '2023-01-04', 'Aktif', ''),
(622, 'Nuryanti', 'Karanganyar', '1995-12-03', 'TKIT Cahaya Insani', '0', 'Perempuan', 'Gondang Legi Kwangsan Jumapolo', '081542693672', 'Bimbel', 'BTA DEWASA', '2023-01-13', 'Tidak Aktif', 'Senin dan Kamis'),
(623, 'Umrotul Hasnah Yuliastuti', 'Karanganyar', '1995-11-07', 'TKIT Cahaya Insani', 'Tahsin Dewasa', 'Perempuan', 'Ngawen Rt.01/04 Karangbangun Jumapolo', '085215636282', 'Bimbel', 'BTA DEWASA', '2023-01-14', 'Tidak Aktif', 'Senin dan Kamis'),
(624, 'Eka Lestari', 'Karanganyar', '1994-09-02', 'Cahaya insani', 'Dewasa', 'Perempuan', 'Bekelan Lalung', '083865883090', 'Rumah', '', '2023-01-14', 'Tidak Aktif', 'Senin Dan kamis'),
(625, 'Eka Lestari', 'Karanganyar', '1994-09-02', 'Cahaya insani', 'Dewasa', 'Perempuan', 'Bekelan lalung', '083865883090', 'Rumah', '', '2023-01-16', 'Aktif', 'Senin Dan kamis'),
(626, 'Eka Lestari', 'Karanganyar', '1994-09-02', 'Cahaya insani', 'Dewasa', 'Perempuan', 'Bekelan lalung', '083865883090', 'Rumah', '', '2023-01-16', 'Aktif', 'Senin Dan kamis'),
(627, 'Lestari', 'Karanganyar ', '1981-07-12', 'SMK WIKARYA', '-', 'Perempuan', 'Geneng RT. 01 RW. 07 Kwangsan Jumapolo ', '081314893781', 'Bimbel', 'BTA DEWASA', '2023-01-16', 'Aktif', 'Senin dan kamis'),
(628, 'Azka Avicenna', 'Karanganyar', '2016-06-12', 'TK IT Insan Kamil', 'B', 'Laki - Laki', 'Ngalasan RT 01 RW 01,Brujul, Jaten, Karanganyar', '081352547699', 'Bimbel', 'PRIVAT BTA', '2023-01-17', 'Aktif', 'Jam 13.30 - 14.30'),
(630, 'kyra luiens clay ( kyra )', 'karanganyar ', '2013-10-06', 'sdn pandeyan 1 ', '3', 'Perempuan', 'griya pandeyan asri ', '087835299909', 'Bimbel', 'PRIVAT 3 SD', '2023-01-18', 'Tidak Aktif', ''),
(633, 'Autsaqun Niswah ( niswah ) ', 'Karanganyar', '2012-11-10', 'MI Mulazamah Isy Karima Karangpandan', '4', 'Perempuan', 'Karang Rt 001/Rw 014 Lalung Karanganyar', '085640946566', 'Rumah', 'PRIVAT 4 SD', '2023-01-25', 'Aktif', 'Selasa, Kamis \r\n'),
(634, 'alphiano ( phiano ) ', 'karanganyar ', '2011-05-12', 'sdn 1 genengsari ', '4sd', 'Laki - Laki', 'klebungan genengsari rt 1 polokarto sukoharjo ', '0882003349881', 'Bimbel', 'KELAS 4 SD', '2023-01-30', 'Aktif', ''),
(636, 'aditya putera ', 'karanganyar ', '2017-05-03', 'tk aisyah permata hati ', 'TK B ', 'Laki - Laki', 'dagen rt 4/7 suruh tasikmadu karanganyar ', '082142435177', 'Bimbel', 'BASMALA KIDS', '2023-02-03', 'Aktif', ''),
(637, 'tsabita aisya mezzaluna ( tsabita )', 'sukoharjo ', '2014-10-10', 'sdit insan kamil karanganyar ', '2', 'Perempuan', 'sawahan rt 5 rw 6 jaten ', '081901219172', 'Bimbel', 'PRIVAT 2 SD', '2023-02-03', 'Aktif', ''),
(638, 'hasna kusuma adhi ( hasna ) ', 'sukoharjo ', '2019-09-01', '-', '-', 'Perempuan', 'ngijo tengah rt 3 rw 2 ngijo tengah tasikmadu karanganyar ', '082137536321', 'Bimbel', 'KELAS BASMALA KIDS', '2023-02-04', 'Aktif', ''),
(641, 'Umaira all karimah', ' karanganyar', '2019-12-11', 'Blm sekolah', 'Blm sekolah', 'Perempuan', 'Ds gotannon rt 04 rw 03 jati jaten karanganyar ', '08995323764', 'Rumah', 'PRIVAT BTA', '2023-02-21', 'Aktif', 'Selasa dan kamis sudah terjadwal'),
(643, 'nugroho adi saputro  ( nugroho )', 'karanganyar ', '2016-03-01', 'kb ra al amin ', 'TK B ', 'Laki - Laki', 'grasak banjarharjo ', '085781619921', 'Bimbel', 'BASMALA KIDS', '2023-02-24', 'Tidak Aktif', ''),
(646, 'Kiran Naura Izzati', 'Karanganyar', '2012-03-04', 'SDN 1 Papahan', 'IV', 'Perempuan', 'Tegal Arum rt 01 re 13 Gang akan, Karangangar', '08122738546', 'Bimbel', 'PRIVAT BTA', '2023-02-28', 'Tidak Aktif', 'Rabu jam 13.30\r\nSabtu jam 11.00\r\n'),
(647, 'Farzana Putri Vriarta', 'Karanganyar', '2016-02-02', 'SDIT', '1', 'Perempuan', 'Tasikmadu', '085647054905', 'Bimbel', 'Kelas SEMPOA', '2023-03-01', 'Tidak Aktif', 'Selasa'),
(651, 'Aghnia Jihan', 'Surakarta', '2019-03-05', '-', '-', 'Perempuan', 'Jl.Slamet Riyadi No 23 Karanganyar 57711', '082226166272', 'Bimbel', 'PRIVAT BTA', '2023-03-04', 'Aktif', ''),
(653, 'zulaikha ainun saputri ( zula )', 'karanganyar ', '2016-09-04', 'sdn 1 jungke ', '1', 'Perempuan', 'jungke rt 3 rw 1 jungke karanganyar ', '0882397479202', 'Bimbel', 'KELAS 1 SD ', '2023-03-07', 'Tidak Aktif', ''),
(658, 'outbond', 'karanganyar', '0001-01-01', 'o', 'o', 'Perempuan', 'o', '000000000', 'Rumah', 'Basmala Fun Holiday', '2023-03-13', 'Tidak Aktif', ''),
(660, 'TPQ ISTIQOMAH SROYO 1 ', 'KRA', '0023-03-03', 'TPQ', '1', 'Laki - Laki', '1', '3', 'Rumah', 'Fun Quran ', '2023-03-29', 'Tidak Aktif', ''),
(661, 'TPQ ISTIQOMAH SROYO 2', 'KRA', '0002-02-02', 'sdn 1 papahan ', '2', 'Laki - Laki', '1', '2', 'Rumah', 'BTA DEWASA', '2023-03-29', 'Aktif', ''),
(664, 'Aidan Ismail El Rafif', 'Karanganyar ', '2013-12-10', 'MIM', '3', 'Laki - Laki', 'Gerdu rt 01 rw 11 tegalgede karanganyar', '085229522326', 'Bimbel', 'PRIVAT BTA, PRIVAT 3 SD', '2023-04-03', 'Aktif', ''),
(665, 'KELOMPOK BINTANG RAMADHAN ', 'D', '0003-03-03', '-', '4sd', 'Laki - Laki', 'F', '4', 'Bimbel', 'Fun Quran ', '2023-04-03', 'Aktif', ''),
(667, 'athaalla fawaz arkana ', 'karanganyar ', '2012-06-09', 'sdit insan kamil', '4sd', 'Laki - Laki', 'puri kahuripan 1 blok j 15 jati jaten karanganyar ', '081321575124', 'Bimbel', 'KELAS 4 SD', '2023-05-04', 'Tidak Aktif', ''),
(668, 'FANIE INDRIAN MUSTOFA', 'Purwodadi', '1978-03-04', 'Umum', 'Umum', 'Perempuan', 'Tegalasri rt 5 rw 7 no 8 karanganyar', '08122782506', 'Rumah', 'BTA DEWASA', '2023-05-05', 'Aktif', 'Jumat sabtu malam'),
(671, 'HERJUNA ASKARA KANIGARA RAMADHAN ((JUNA )', 'KARANGANYAR ', '2023-06-08', 'TK ISLAM AL AZHAR ', 'TKA ', 'Laki - Laki', 'NGABLAK RT 06 RW 11', '081393997769', 'Bimbel', 'BASMALA KIDS', '2023-05-09', 'Tidak Aktif', ''),
(673, 'TPQ As Salam Nangsri', '2', '2023-03-05', 'TPQ', '1', 'Perempuan', 'F', '1', 'Rumah', 'Fun Quran ', '2023-05-12', 'Tidak Aktif', ''),
(675, 'ainun sheza setiyawan ( ainun )', 'karanganyarv', '2019-07-06', '-', 'paud', 'Laki - Laki', 'pokoh baru ', '082138565444', 'Bimbel', 'KELAS BASMALA KIDS', '2023-05-12', 'Aktif', ''),
(676, 'muhammad azriel rakhshan ( azriel )', 'Karanganyar', '2018-11-19', 'TKIT Insan Kamil', 'tk ', 'Perempuan', 'bibis 4/ 12 jungke karanganyar ', '081329555133', 'Bimbel', 'KELAS BASMALA KIDS', '2023-05-15', 'Aktif', ''),
(679, 'kirana pradipta susanto ( dipta )', 'Karanganyar', '2016-12-09', 'sdn 1 papahan ', '2 sd ', 'Perempuan', 'tegalan lalung karanganyar ', '085210312653', 'Bimbel', 'KELAS BASMALA KIDS', '2023-05-19', 'Aktif', ''),
(682, 'AQUINA  FARZANA  SACHIKIRANA', 'Karanganyar', '2014-01-06', 'MI  Muhammadiyah karanganyar', '3', 'Perempuan', 'Ngemplak rt 02 rw 05 wonolopo tasikmadu karanganyar', '6285878538492', 'Rumah', 'PRIVAT 3 SD', '2023-05-26', 'Tidak Aktif', 'Selasa  kamis'),
(685, 'Alfaeyza dzakyandra revino setiawan ( eyza ) ', 'Karanganyar ', '2018-03-07', 'SCA karanganyar', 'TK A', 'Laki - Laki', 'Sido mulyo rt.03/04 tegalgede karanganyar', '085728660191', 'Bimbel', 'BASMALA KIDS', '2023-06-14', 'Tidak Aktif', ''),
(687, 'orchidd  diandra ', 'Karanganyar', '2014-12-04', 'sd asc ', '3', 'Perempuan', 'kandangsapi rt 1 rw 32 jebres surakarta ', '081326505455', 'Bimbel', 'Basmala Fun Holiday', '2023-06-16', 'Aktif', ''),
(691, 'abisali firzan shankara ( firzan ) ', 'Karanganyar', '2013-02-01', 'mi t isykarima ', '3', 'Laki - Laki', 'perum griya pandeyan asri blok b 11 tasikmadu ', '0816965041', 'Bimbel', 'Basmala Fun Holiday', '2023-06-19', 'Tidak Aktif', ''),
(693, 'KHELVIN ALESSIO NASUTION ( KHELVIN ) ', 'Karanganyar', '2018-04-10', 'SURYA CERIA ', 'TK ', 'Laki - Laki', 'MANGGUNG RT 1 RW 8 CANGAKAN KARANGNAYAR ', '082339709455', 'Bimbel', 'BASMALA KIDS', '2023-06-20', 'Tidak Aktif', ''),
(694, 'AZALEA KALYANI SETYOWATI (AZALEA) ', 'Karanganyar', '2013-01-10', 'SDIT INSAN KAMIL ', '6', 'Perempuan', 'TEGAL ASRI RT 5 RW 7 BEJEN KARANGANYAR ', '08156706679', 'Bimbel', 'Fun Quran ', '2023-06-23', 'Aktif', ''),
(696, 'muhammad zidan arifin wibowo ', 'medan', '2017-03-02', 'al hidayah ', 'tk b ', 'Laki - Laki', 'jl musi rt 2 rw 13 ', '082166954272', 'Bimbel', 'Basmala Fun Holiday', '2023-06-26', 'Tidak Aktif', ''),
(699, 'MILLATINA RESILA AJJALA ( MILLA ) ', 'SRAGEN ', '2012-04-10', 'SDN 1 CANGAKAN ', '6 SD ', 'Perempuan', 'CANGAKAN BARAT RT 1 RW 6 ', '083124089880', 'Bimbel', 'PRIVAT 6 SD', '2023-07-03', 'Tidak Aktif', ''),
(701, 'ABDULLAH IBRAHIM ( IBRAHIM ) ', 'karanganyar ', '2017-04-06', 'TK SURYA CERIA AISYIAH', ' TK B', 'Laki - Laki', 'PERUM GRIYA KANAYA 3 BLOK B3 ,DESA PUNDAK , JATI, JATEN,KARANGANYAR', '082134420790', 'Bimbel', 'BASMALA KIDS', '2023-07-10', 'Tidak Aktif', ''),
(703, 'MUHAMMAD HAUFANHAZZA ', 'karanganyar ', '2017-09-04', 'MIT Isy karima', '1 SD ', 'Laki - Laki', 'Dusun Telap RT 002/RW 010Desa/Kelurahan Karang, Kecamatan KarangpandanKabupaten Karanganyar(Toko Jembangan Jaya)Kode pos 57791', '081390000913', 'Rumah', 'BASMALA KIDS', '2023-07-12', 'Aktif', ''),
(705, 'NEELINDRA SYAFIQ R ( NEELINDRA ) ', 'KARANGANYAR ', '2018-06-10', 'TK BHAYANGKARI ', 'TKB ', 'Laki - Laki', 'POJOK MOJOGEDANG ', '085214927565', 'Bimbel', 'BASMALA KIDS', '2023-07-14', 'Aktif', ''),
(707, 'BOOGIE AYUNA PUTRA PRATAMA ( YUNA ) ', 'PADANGAN', '2018-07-08', 'TK AISYAH BIBIS ', 'TKA ', 'Laki - Laki', 'PADANGAN RT 1 RW 7 JUNGKE KRA ', '081226937087', 'Bimbel', 'BASMALA KIDS', '2023-07-21', 'Tidak Aktif', ''),
(711, 'ZAMRONI FAHRI AMBARWIJAYA ( ZAMRONI ) ', 'KARANGANYAR ', '2012-02-02', 'SDN 3 KARANGANYAR ', '6', 'Laki - Laki', 'KARANGANYAR RT 1 RW 7 KARANGNYAR ', '081225869758', 'Bimbel', 'KELAS 6 SD', '2023-07-21', 'Aktif', ''),
(712, 'MARITZA NURIY NAZIHAH ( SASA ) ', 'KARANGANYAR ', '2016-12-03', 'MIM KARANGANYAR ', '2 SD', 'Perempuan', 'CANGAKAN TIMUR RT 4 RW 2 KARANGANYAR ', '08156753275', 'Bimbel', 'PRIVAT 2 SD', '2023-07-21', 'Aktif', ''),
(714, 'PRIVAT GROUP ( ALMEERA DAN ALESHA )', 'Karanganyar', '0002-02-02', 'MIM KARANGANYAR ', '3', 'Perempuan', 'W', '6', 'Bimbel', 'Privat group bta', '2023-07-22', 'Tidak Aktif', ''),
(718, 'FAJRIA NOOR AINI ( FAJRIA ) ', 'KARA', '2017-10-02', 'SCA ', 'TK B', 'Perempuan', 'DIMORO RT 1 RW 10 KARANGANYAR ', '08122594985', 'Bimbel', 'PRIVAT BTA', '2023-07-24', 'Tidak Aktif', ''),
(721, 'ASHA AVITA SETYAWAN ( ASHA ) ', 'Karanganyar', '2012-03-07', 'SDN 3 BURAN ', '6 SD ', 'Laki - Laki', 'PERUM BURAN PERMAI NO 33 TASIKMADU - KARANGANYAR ', '082127755524', 'Bimbel', 'PRIVAT 6 SD', '2023-07-27', 'Aktif', ''),
(722, 'PRIVAT GROUP KIDS ( NESYA DAN AINUN ) ', 'Karanganyar', '2023-06-07', 'MIM KARANGANYAR ', 'TK ', 'Laki - Laki', 'W', '2', 'Bimbel', 'Privat Group Basmala Kids', '2023-07-29', 'Tidak Aktif', ''),
(723, 'YASMIN ALMAHIRA KURNIAWAN ( ALMAHIRA )', 'Karanganyar', '2018-03-01', 'TK AL FATAH ', 'TK B ', 'Perempuan', 'KALONGAN KULON RT 8 RW 16 PAPAHAN TASIKMADU KARANGANYAR ', '085647527527', 'Bimbel', 'BASMALA KIDS', '2023-07-31', 'Tidak Aktif', ''),
(724, 'GENDHIS ADELLA MAHESWARI ( GENDHIS ) ', 'SURAKARTA', '2018-03-04', 'SURYA CERIA AISYIAH ', 'TK B ', 'Perempuan', 'KADIPIRO RT 2 RW 4 GUMENG JENAWI KARANGANYAR ', '081393100060', 'Bimbel', 'BASMALA KIDS', '2023-08-02', 'Aktif', ''),
(725, 'ARKHAN GHIFARI DZAKIANDRA ( ARKHAN ) ', 'SURAKARTA', '2017-06-07', 'RSHI', 'TK B ', 'Laki - Laki', 'TEGAL BIRU RT 4 RW 3 GAUM TASIKMADU KARANGANYAR ', '082299435090', 'Bimbel', 'KELAS BASMALA KIDS', '2023-08-02', 'Tidak Aktif', ''),
(726, 'Arindra Fahrezi H', 'Karanganyar', '0003-03-03', 'Surya Ceria Aisyiah Kra', 'TK B', 'Perempuan', ': Tegalasri, Bejen , Kra', '081233208101', 'Rumah', 'BASMALA KIDS', '2023-08-03', 'Aktif', ''),
(727, 'Aleesya&Keisha Farras', 'Karanganyar', '2023-03-08', 'SDN Karanganyar', '6 SD', 'Perempuan', 'Kab. Karanganyar', '628179461451', 'Bimbel', 'PRIVAT GROUP 6 SD', '2023-08-03', 'Tidak Aktif', ''),
(730, 'Nadia Ammara (ammara )', 'Karanganyar', '2011-08-09', 'MIM KARANGANYAR ', '6 SD ', 'Perempuan', ' Badranasri    Rt 02 Rw 11', '088239811973', 'Bimbel', 'PRIVAT 6 SD', '2023-08-05', 'Tidak Aktif', ''),
(732, ' fathan zanneti al qurtub (fathan )', 'Karanganyar', '2017-08-11', 'Surya Ceria Aisyiyah', 'tk b ', 'Laki - Laki', ' pawisman gedangan rt.02 / 02 kemiri kebakkramat', '085701444321', 'Bimbel', 'BASMALA KIDS', '2023-08-07', 'Tidak Aktif', ''),
(738, 'MUHAMMAD UBAY AL HANANI ( UBAY ) ', 'Karanganyar', '2018-06-06', 'TK KEMALA BHAYANGKARI ', 'TK B ', 'Laki - Laki', 'TRANI RT 1 ', '08213469770', 'Bimbel', 'KELAS BASMALA KIDS', '2023-08-14', 'Aktif', '3'),
(739, 'PRIVAT GROUP 5 SD ( FAATIHAN AINUN - RIZKI ) ', 'D', '4555-03-05', '0', 'F', 'Perempuan', 'F', '4', 'Bimbel', 'PRIVAT GROUP 5 SD', '2023-08-15', 'Tidak Aktif', ''),
(741, ' Chika Aurelia Putri  ( CHIKA ) ', ' Karanganyar', '2011-11-05', 'MIM MIRI POLOKARTO ', '6 SD ', 'Perempuan', 'Doplang RT 01/05 Sukosari, Jumantono', '085229099228', 'Bimbel', 'PRIVAT BTA', '2023-08-18', 'Tidak Aktif', ''),
(747, 'SHAKILA SHERYL AZ ZAIDA ( SHAKILA ) ', 'Karanganyar', '2017-04-04', 'SD MUHAMMADIYAH PALUR ', '1SD', 'Perempuan', 'SAWAHAN RT 2 RW 5 JATEN KARANGANYAR ', '085725555239', 'Bimbel', 'PRIVAT 1 SD', '2023-08-30', 'Aktif', ''),
(748, 'ALLEVIA ATTAR WIDODO ( ATTAR ) ', 'Karanganyar', '2017-08-08', 'TK PEMBDA KARANGANYAR ', 'TK B ', 'Perempuan', 'UGARJOSARI RT 2 RW 2 PANDEYAN KARANGANYAR ', '081226418906', 'Bimbel', 'BASMALA KIDS', '2023-08-31', 'Tidak Aktif', ''),
(749, 'GIBRAN AHMAD RAMADHAN ( GIBRAN ) ', 'SUKOHARJO ', '2018-05-25', 'TK AL FATTAH ', 'TK B ', 'Laki - Laki', 'PANDES RT 5 RW 13 PAPAHAN TASIKMADU KARANGANYAR ', '081325371648', 'Rumah', 'BASMALA KIDS', '2023-09-04', 'Aktif', ''),
(750, 'FAIZAL NURROHMAN ( FAIZAL ) ', 'SUKOHARJO', '2023-07-01', 'SDIT insan kamil', '6 SD ', 'Laki - Laki', 'KEMPLONG RT 2 RW 6 CANGKOL MOJOLABAN ', '089616076128', 'Bimbel', 'PRIVAT 6 SD', '2023-09-04', 'Tidak Aktif', ''),
(751, 'MUHAMMAD AZKA PUTRA KAMIKO ( MUH AZKA ) ', 'Surakarta', '2018-09-10', 'AL FATTAH ', 'TKA ', 'Laki - Laki', 'POKOH BARU GANG WIJAYA KUSUMA ', '082298472467', 'Bimbel', 'BASMALA KIDS', '2023-09-06', 'Aktif', ''),
(752, 'KENZO RAFIF ALTEZA ( KENZO )', 'Karanganyar', '2023-11-12', 'TK ISLAM NURUL IMAN ', 'TK B ', 'Laki - Laki', 'KARANGANOM RT 2 RW 4 POPONGAN KRA ', '081226381803', 'Bimbel', 'BASMALA KIDS', '2023-09-12', 'Tidak Aktif', ''),
(753, 'ARSYILA ALFATHUNNISA FAEZYA ( ARSY ) ', 'Karanganyar', '2018-06-04', 'SDITINSAN KAMIL ', '1 SD ', 'Perempuan', 'PERUM GRAHA JATI INDAH JATI JATEN KRA ', '082136488575', 'Bimbel', 'BASMALA KIDS', '2023-09-13', 'Aktif', ''),
(755, 'BINTANG JATI ( BINTANG ) ', 'Karanganyar', '2013-07-10', 'SDN 3 KARANGLO ', '4 SD', 'Laki - Laki', 'SEKUWUNG RT 1 RW 3 KARANGLO TAWANGMANGU ', '085293293237', 'Bimbel', 'PRIVAT BTA', '2023-09-15', 'Tidak Aktif', ''),
(756, 'ELORA RESTU NAYA ( ELORA ) ', 'Karanganyar', '2013-01-01', 'SDN 1 PAPAHAN ', '5 SD', 'Perempuan', 'GETASAN RT 2 RW 8 KALING TASIKMADU ', '085801677454', 'Bimbel', 'KELAS 5 SD', '2023-09-20', 'Aktif', ''),
(757, 'FAUZAN NUR HASAN ( FAUZAN ) ', 'Karanganyar', '2013-11-06', 'SDN 1 PAPAHAN ', '5 SD', 'Laki - Laki', 'PRI KAHURIPAN JL BIMA F 1', '081334842200', 'Bimbel', 'KELAS 4 SD', '2023-09-22', 'Tidak Aktif', ''),
(759, 'MUHAMMAD NADHIF PUTRA NUGRAHA ( NADHIF ) ', 'Karanganyar', '2018-05-08', 'TK AL FATTAH ', 'TK A ', 'Laki - Laki', 'MADYANTORO RT 2 RW 7 PULOSARI KEBAKKRAMAT ', '081329585523', 'Bimbel', 'BASMALA KIDS', '2023-10-02', 'Tidak Aktif', ''),
(761, 'KELOMPOK KECIL UMMI 1 ', 'F', '2023-10-02', 'F', 'F', 'Laki - Laki', 'F', '3', 'Rumah', 'PRIVAT BTA', '2023-10-04', 'Aktif', ''),
(762, 'KELOMPOK KECIL UMMI 2', 'G', '2023-10-03', 'G', 'G', 'Perempuan', 'G', '5', 'Rumah', 'PRIVAT BTA', '2023-10-04', 'Aktif', ''),
(763, 'IBELLEZA WALPRI WIBOWO ( IBEL )', 'sukoharjo', '2018-03-29', 'SCA', 'TK B ', 'Perempuan', 'JL JENDRAL BASUKI RAHMAT PUNDAK RT 5 RW 7 JATI JATEN KRA ', '085740838383', 'Bimbel', 'BASMALA KIDS', '2023-10-04', 'Aktif', ''),
(765, 'MAHESA GIANDRA ANAGHA ( MAHES )', 'Karanganyar', '2018-10-11', 'TK EMANUEL ', 'KIDS', 'Laki - Laki', 'BADRAN ASRI RT 2 / X CANGAKAN ', '085856086648', 'Bimbel', 'BASMALA KIDS', '2023-10-06', 'Aktif', ''),
(766, 'Privat Group Bana &Dzikri BTA', 'Karanganyar', '2013-03-04', 'ADIT INSAN KAMIL', '6 SD & 4 SD', 'Laki - Laki', 'Pokoh Baru Tasikmadu', '089651009069', 'Bimbel', 'Privat group bta', '2023-10-12', 'Aktif', ''),
(768, 'LARASATI SINTA HAFIZHAH ( LARAS ) ', 'Karanganyar', '2017-04-12', 'TK SCA ', 'TK B', 'Perempuan', 'KALONGAN KULON RT 3 RW 15 PAPAHAN  TASIKMADU ', '085647020459', 'Rumah', 'PRIVAT BTA', '2023-10-16', 'Tidak Aktif', ''),
(769, 'ARR RAYYAN SYAUGI ( RAY ) ', 'BEKASI', '2018-09-06', 'TK SCA ', 'TK A', 'Laki - Laki', 'TEGAL GEDE  KARANGANYAR ', '082284125804', 'Bimbel', 'BASMALA KIDS', '2023-10-17', 'Aktif', ''),
(771, 'SYARIFAH NUR LAILA ( NUR ) ', 'KARAWANG ', '1965-09-12', '-', '-', 'Perempuan', 'KALONGAN KULON ', '81911650008', 'Bimbel', 'BTA DEWASA', '2023-10-25', 'Tidak Aktif', ''),
(772, 'RENNY PARASTICHA ( RENNY)', 'BOGOR', '1991-08-01', '-', '-', 'Perempuan', 'KALONGAN KULON RT 3 RW 15', '82138175009', 'Bimbel', 'BTA DEWASA', '2023-10-25', 'Aktif', ''),
(775, 'ULIN NUHA ( NUHA ) ', 'Karanganyar', '2018-12-06', 'TK SCA ', 'TKA A ', 'Perempuan', 'JL SUTOYO PANDES PAPAHAN TASIKMADU KARANGANYAR ', '085877770289', 'Bimbel', 'BASMALA KIDS', '2023-10-31', 'Tidak Aktif', ''),
(776, 'KELOMPOK 4 SD A ', '-', '0009-01-09', '0', '0', 'Perempuan', '0', '0', 'Bimbel', 'KELAS 4 SD', '2023-10-31', 'Aktif', ''),
(777, 'SULISTIARINI ', 'GROBOGAN', '1990-03-10', '-', '-', 'Perempuan', 'CERBONAN RT 2 RW 2 ', '082266846071', 'Bimbel', 'BTA DEWASA', '2023-11-01', 'Tidak Aktif', ''),
(778, 'ATHALLAH ZAYYAN RAFISQY ( ZAYYAN ) ', 'Karanganyar', '2017-09-11', 'HIDAYATUL INSAN ', 'TK B ', 'Laki - Laki', 'MANDUNGAN RT 3 RW 5 JUNGKE KARANGANYAR ', '085743797426', 'Bimbel', 'BASMALA KIDS', '2023-11-02', 'Aktif', ''),
(782, 'MARCHA ABELLONA AKBAR ( ACA ) ', 'Karanganyar', '2014-06-03', 'MIM KARANGANYAR ', '4 SD', 'Perempuan', 'KARANGANYAR  RT 4 RW 6 KARANGANYAR ', '082227122597', 'Bimbel', 'PRIVAT 4 SD', '2023-11-07', 'Tidak Aktif', ''),
(784, 'NAKULA PRAMUDYA KUSUMA ( NAKULA ) ', 'Surakarta', '2017-08-09', 'SD AL ABIDIN ', '1 SD ', 'Laki - Laki', 'PERUM GRAHA SEJAHETRA NO A 4 JL BRIGJEN KATAMSO RT 8 RW 8 TASIKMADU  ', '082243765859', 'Bimbel', 'BASMALA KIDS', '2023-11-18', 'Aktif', ''),
(785, 'SADEWA PRANADIPA KUSUMA ( SADEWA ) ', 'Surakarta', '2017-08-09', 'SDI AL ABIDIN ', '1 SD ', 'Laki - Laki', 'PERUM GRAHA SEJAHTERA NO a4 jl brigjen katamso rt 8 rw 8 papahan tasikmadu ', '082243765859', 'Bimbel', 'BASMALA KIDS', '2023-11-18', 'Aktif', ''),
(786, 'GHANIA ALMAHYRA SIFABELLA( GHANIA ) ', 'Karanganyar', '2023-07-04', 'SURYA CERIA AISYAH ', 'TK A', 'Perempuan', 'PERUM POKOH BARU RT 3 RW 7  NGIJO TASIKMADU ', '081234582877', 'Bimbel', 'BASMALA KIDS', '2023-11-28', 'Tidak Aktif', ''),
(788, 'PRIVAT GROUP NAKULA DAN SADEWA ', 'Karanganyar', '2023-11-07', '4', 'TK B ', 'Perempuan', '4', '4', 'Bimbel', 'PRIVAT GROUP KIDS', '2023-11-30', 'Aktif', ''),
(789, 'KHALISTA ARIZKI FIRMANSYAH ( TATA ) ', 'Karanganyar', '2019-08-04', 'TK BHAYANGKARI ', 'TKA ', 'Perempuan', 'JL SUHARSO RUMAH DINAS PENGADILAN NEGERI ', '082167062700', 'Bimbel', 'BASMALA KIDS', '2023-12-08', 'Aktif', ''),
(792, 'RAIHANA LUMAH RASIKHAH ( RAIHANA )', 'SRAGEN ', '2019-07-01', '-', 'TK B', 'Perempuan', '-', '082226264551', 'Bimbel', 'Basmala Fun Holiday', '2023-12-11', 'Tidak Aktif', ''),
(793, 'MUHAMMAD SYAMIL FAUZIL AZZIKRI ( ZIKRI ) ', 'Karanganyar', '2016-04-03', 'SDIT INSAN KAMIL ', '4 SD', 'Laki - Laki', 'KEBAKRAMAT ', '089651009069', 'Bimbel', 'UMMI BESAR ', '2023-12-12', 'Tidak Aktif', ''),
(795, 'RAKAYNAN AL DZAKY RADITYA ( KAI ) ', 'SURAKARTA ', '2018-08-05', 'TK SCA ', 'TKA B ', 'Laki - Laki', 'PERUM CITRA ALAM RANIA RT 1 RW 5 KEL JATI KEC JATEN KARANGANYAR ', '082220140805', 'Bimbel', 'BASMALA KIDS', '2023-12-14', 'Tidak Aktif', ''),
(797, 'AISYAH WIDI PRASETYO ( AIS ) ', 'Surakarta', '2018-05-04', 'SCA ', 'TK B', 'Perempuan', 'badranasri rt 3 / xi cangakan kra ', '08193048538', 'Bimbel', 'BASMALA KIDS', '2023-12-15', 'Tidak Aktif', ''),
(805, 'ALWI NATHA NIRWASITA ( ALWI ) ', 'Karanganyar', '2015-05-30', 'SDN 1 KARANGANYAR ', '2 SD', 'Laki - Laki', 'JANGGANAN RT 2 RW 3 BANGSRI KARANGPANDAN ', '085642277101', 'Bimbel', 'PRIVAT 2 SD', '2024-01-03', 'Aktif', ''),
(808, 'RAFFA AL GHAZALI PUTRA A ( RAFFA) ', 'Karanganyar', '2013-10-28', 'SDN 2 BANJARHARJO ', '4', 'Laki - Laki', 'MANGGAL BANJARHARJO KEBAKKRAMAT ', '08121583528', 'Bimbel', 'KELAS 4 SD', '2024-01-06', 'Aktif', ''),
(809, 'MUHAMMAD FATTAN YUDHISTIRA CIPTA ( FATTAN ) ', 'Karanganyar', '2018-11-19', 'KB AL HIDAYAH ', 'TKA ', 'Laki - Laki', 'TRANI RT 2 RW 2 GENENGSARI KEC POLOKARTO KAB SUKOHARJO ', '085600706292', 'Bimbel', 'BASMALA KIDS', '2024-01-09', 'Aktif', ''),
(810, 'DHASYIFA AZKADINA SUSANTO ( AZKA ) ', 'Karanganyar', '2018-02-08', 'SCA ', 'mim karanganyar ', 'Perempuan', 'DERSONO MOJOGEDANG  KARANGANYAR ', '08126151772', 'Bimbel', 'BASMALA KIDS', '2024-01-09', 'Tidak Aktif', ''),
(815, 'ALTAF KING ATHALLA (ALTAF ) ', 'Karanganyar', '2018-11-07', 'SCA ', 'TKA', 'Laki - Laki', 'KALONGAN WETAN PAPAHAN TASIKMADU ', '087836336128', 'Bimbel', 'BASMALA KIDS', '2024-01-23', 'Aktif', ''),
(822, 'ALIFA RATIFA HIBATILLAH ( ALIFA ) ', 'Karanganyar', '2015-12-29', 'SDN 1 KRA ', '2 SD', 'Perempuan', 'JUNGKE RT 3 RW 3 JUNGKE KARANGANYAR ', '081249898515', 'Rumah', 'PRIVAT 2 SD', '2024-02-12', 'Aktif', ''),
(823, 'AMARA NAVISHA KIRAIYA ( AMA ) ', 'MADIUN ', '2017-12-08', 'TK KEMALA ', 'TK B ', 'Perempuan', 'perum BALE MAGANDA KAHURIPAN BLOK C4 PANDEYAN ', '082231319691', 'Bimbel', 'UMMI BESAR ', '2024-02-28', 'Aktif', ''),
(824, 'REYVANZKA AGFAD D P ( REY ) ', 'SURAKARTA', '2019-04-29', 'TK IT INSAN KAMIL ', 'TK A', 'Laki - Laki', 'BIBIS RT 5/12 JUNGKE KRA ', '081254967076', 'Bimbel', 'BASMALA KIDS', '2024-02-28', 'Aktif', ''),
(825, 'shafa mecca pramudya ( mecca) ', 'Karanganyar', '2019-01-01', 'sca', 'TK ', 'Perempuan', 'prum korpri 2/13 popongan kra', '082136720850', 'Bimbel', 'BASMALA KIDS', '2024-03-04', 'Tidak Aktif', ''),
(826, 'AULIA ZAHRA KUSUMADEWI ( AULIA ) ', 'TEGAL', '2011-11-17', 'SDIT INSAN KAMIL  KARANGANYAR ', '6', 'Perempuan', 'JL FLAMBOYAN RT 2 RW 13 TEGALARUM CANGAKAN KARANGANYAR ', '085228983900', 'Bimbel', 'PRIVAT 6 SD', '2024-03-04', 'Aktif', ''),
(827, 'Savreenadea (dea ) ', 'KARANGANYAR', '2019-02-11', 'SCA', 'TK A', 'Perempuan', 'Jl. Markisa, Badranasri, RT.01/10, Cangakan, Karanganyar', '081392151699', 'Rumah', 'BASMALA KIDS', '2024-03-06', 'Aktif', ''),
(828, 'ALUNA AURORA DANEEN M ( LUNA ) ', 'KARANGANYAR', '2017-10-10', 'TK PEMBINA ', 'TK B ', 'Perempuan', 'NGALIYAN RT 5 / 1 LALUNG ', '085899426466', 'Rumah', 'BASMALA KIDS', '2024-03-12', 'Tidak Aktif', ''),
(829, 'Kinanti Jennaira(kinan)', 'KARANGANYAR', '2021-04-05', '-', 'TK A', 'Perempuan', 'dawan rt 01/01 gaum tasikmadu kra', '085741930051', 'Bimbel', 'PRIVAT BTA', '2024-03-23', 'Tidak Aktif', ''),
(830, 'Putra ghalib ( putra ) ', 'KARANGANYAR', '2013-05-16', 'SDIT INSAN KAMIL ', '4', 'Laki - Laki', ': Pendem wetan , RT01 RW 5 , Suruh, Tasikmadu', '085879147828', 'Bimbel', 'Basmala Fun Holiday', '2024-03-26', 'Aktif', ''),
(831, 'GRACIA EVELYN EKA PUTRI ( EVELYN ) ', 'KARANGANYAR', '2014-09-10', 'SDN 3 JATEN ', '3', 'Perempuan', 'CANGAKAN BARAT RT 2 RW 6 KARANGANYAR ', '085710836841', 'Rumah', 'PRIVAT 3 SD', '2024-03-26', 'Tidak Aktif', ''),
(832, 'KHALID JAISY TAUHID ( JAIS ) ', 'KARANGANYAR', '2019-12-07', 'TK AL  KHARIMA ', 'TK A', 'Laki - Laki', 'PERUMAHAN MANUNGGAL RESIDENCE 2 ', '085601019065', 'Bimbel', 'Basmala Fun Holiday', '2024-03-30', 'Tidak Aktif', ''),
(833, 'Althafunissa Adi Ratifah (ALTHA )', 'KARANGANYAR', '2016-08-12', 'SDN 1 PAPAHAN ', '1 SD ', 'Perempuan', 'NGEMPLAK WONOLOPO RT 4 / 5 ', '081399098547', 'Bimbel', 'Basmala Fun Holiday', '2024-03-30', 'Aktif', ''),
(834, 'Kenzi Azka Alfarizqy (ken)', 'KARANGANYAR', '2016-06-04', 'SD IT Insan Kamil', '1sd', 'Perempuan', 'jl Flamboyan Tegalarum gang akan KRA', '085229901146', 'Bimbel', 'PRIVAT 1 SD', '2024-04-02', 'Aktif', ''),
(835, ' Javas Mavendra Shakti ( vendra )', 'KARANGANYAR', '2016-03-07', 'sdn 2 bejen ', '1 SD ', 'Perempuan', ' Tegalasri RT 6 RW 8 Bejen Kra (Barat Kantor Notaris Ahadi Zulfikar)', '081578355046', 'Rumah', 'PRIVAT 1 SD', '2024-04-02', 'Tidak Aktif', ''),
(837, 'AILEEN NAFISHA ALMAHYRA ( AILEEN) ', 'KARANGANYAR', '2019-02-28', 'TK BHAYANGKARI ', 'TKA ', 'Perempuan', 'CANGAKAN BARAT RT 3/4 KARANGANYAR ', '0881024107620', 'Bimbel', 'BASMALA KIDS', '2024-04-17', 'Aktif', ''),
(838, 'ADELIO ARDIAZ ZAIDAN ( ADELIO ) ', 'KARANGANYAR', '2008-09-02', '-', '-', 'Laki - Laki', 'GARUT RT 1 RW 11 GEDONG KARANGANYAR ', '085647132852', 'Bimbel', 'BASMALA KIDS', '2024-04-17', 'Tidak Aktif', ''),
(840, 'NAYLA BELLA RANYA NISMARA P ( NISMARA ) ', 'KARANGANYAR', '2021-07-07', 'AL ABIDIN ', 'PAUD', 'Perempuan', 'CANGAKAN RT 3 RT 6 KARANGANYAR ', '082236803004', 'Bimbel', 'BASMALA KIDS', '2024-04-22', 'Aktif', ''),
(841, 'RAFA PUTRA VALENTARA ( RAFA ) ', 'KARANGANYAR', '2011-06-24', 'SDN 1 KARANGANYAR ', '6', 'Laki - Laki', ' tegalasri rt 06 rw 08 kra', '85229036999', 'Bimbel', 'PRIVAT 6 SD', '2024-04-23', 'Aktif', ''),
(842, 'BAIHAQI KUSUMA RAMADHAN ( HAQI)', 'KARANGANYAR', '2018-11-06', 'TK AL FALAH KRA ', 'TK B ', 'Laki - Laki', 'KALONGAN KULON RT 5 RW 15 PAPAHAN TASIKMADU ARANGANYAR ', '081329942033', 'Rumah', 'BASMALA KIDS', '2024-04-26', 'Tidak Aktif', ''),
(846, 'NAIRA JAUZA SYAFA (NAIRA) ', 'KARANGANYAR', '2017-11-09', 'NURUL IMAN ', 'TK B ', 'Perempuan', 'POKOH BARU RT 2 RW 7 NGIJO TASIKMADU KARANGANYAR ', '081329794747', 'Bimbel', 'BASMALA KIDS', '2024-05-10', 'Tidak Aktif', ''),
(847, 'Sekar Anyar (ANYAR )', 'KARANGANYAR', '2012-09-09', 'SDN 03 Jaten', '5 SD ', 'Perempuan', 'Jl. Semeru 4 no 122 Griya Papahan Indah', '081296647666', 'Bimbel', 'PRIVAT 5 SD', '2024-05-27', 'Tidak Aktif', ''),
(848, 'Sekar Cintya (CICIN)', 'KARANGANYAR ', '2012-09-09', ' SDN 03 Jaten', '3 SD', 'Perempuan', 'Jl. Semeru 4 no 122 Griya Papahan Indah', '081296647666', 'Bimbel', 'PRIVAT 3 SD', '2024-05-27', 'Tidak Aktif', ''),
(849, 'dhifa dan haidar ( privat group sempoa ) ', 'KARANGANYAR', '0002-02-02', '-', '-', 'Laki - Laki', '-', '085340375511', 'Bimbel', 'Kelas SEMPOA', '2024-06-03', 'Aktif', ''),
(851, 'Rifqi Mukhtarullah Putra Medika', 'KARANGANYAR', '2018-08-13', 'TK SCA karanganyar', 'tka ', 'Laki - Laki', 'Karang 01/14, lalung, karanganyar', '085869700083', 'Bimbel', 'Basmala Fun Holiday', '2024-06-13', 'Aktif', ''),
(852, 'GHANIA ZEA AZUCENA ( ZEA)', 'KARANGANYAR', '2019-02-05', 'TK AL ABIDIN ', 'TKA ', 'Perempuan', 'PERUM TAMAN SAR 1 BLOK E NO 22 JATI JATEN ', '081282857464', 'Bimbel', 'KELAS BASMALA KIDS', '2024-06-15', 'Aktif', ''),
(854, 'RAJWA GHADIZA P (RAJWA)', 'KARANGANYAR', '2016-06-09', 'SD AL KARIMAH ', '2', 'Perempuan', 'PERUM LALUNG PERMAI ', '083866099917', 'Bimbel', 'PRIVAT 2 SD', '2024-06-21', 'Tidak Aktif', ''),
(855, 'JANGKEP HAYUNING PUSPITA G (TITA )', 'KARANGANYAR', '2018-01-25', 'AL ABIDN ', '1 SD ', 'Perempuan', 'JUNGKE RT 1 RW 2 KRA ', '082144839560', 'Bimbel', 'BASMALA KIDS', '2024-06-21', 'Aktif', ''),
(857, 'AZKA HARI PRATANA ( AZKA  HARI ) ', 'KARANGANYAR', '2023-04-23', 'ASC ', '5', 'Laki - Laki', 'PERUM TEGAL ASRI RT 6 RW 8 ', '082158636456', 'Bimbel', 'PRIVAT 5 SD', '2024-06-21', 'Aktif', ''),
(858, 'NARENDRA HARI PRAMANA ( NARENDRA )', 'KARANGANYAR', '2016-07-18', 'ASC ', '2 SD ', 'Laki - Laki', 'perum tegal asri rt 6/8', '082158636456', 'Bimbel', 'PRIVAT 2 SD', '2024-06-21', 'Aktif', ''),
(860, 'Asyam Syafiq Muhammad Zaahir ( syafiq)', 'Karanganyar', '2015-07-15', ' isykarima', '3', 'Perempuan', '9.  jl. Lawu RT 03 rw 03', '085647656900', 'Bimbel', 'Basmala Fun Holiday', '2024-06-22', 'Aktif', ''),
(861, 'freya aarunnya nurazzahrah ( freya )', 'KARANGANYAR ', '2019-06-03', 'tk al abidin ', 'TK B ', 'Perempuan', 'Jl.Mayor Kusmanto rt.1/4 kayangan,karanganyar', '085647458679', 'Bimbel', 'Basmala Fun Holiday', '2024-06-22', 'Aktif', ''),
(863, ' Malika Aisyah Putri Wahyudi ( malika ) ', 'karanganyar ', '2016-07-08', ' SDN 03 Kra', '2 sd', 'Perempuan', '9.  Bumi Saraswati Baru 2. Blok H no 6. Gaum. Tasikmadu. Kra', '08563404666', 'Bimbel', 'Basmala Fun Holiday', '2024-06-22', 'Aktif', ''),
(864, 'Faradya malika Rafani ( fara)', 'Karanganyar', '2012-05-12', ' MI Hidayatul Insan', '6', 'Perempuan', 'Pokoh Baru RT 3 Rw 7 ngijo tasikmadu Karanganyar', '081290511455', 'Bimbel', 'Basmala Fun Holiday', '2024-06-24', 'Tidak Aktif', ''),
(866, 'RASYA MUHAMMAD ATTAYA ( RASYA MUH )', 'Karanganyar', '2018-12-05', 'SCA ', 'TKB ', 'Laki - Laki', 'TRANI RT 4 / 2 GENENGSARI POLOKARTO SUKOHARJO ', '085329974040', 'Bimbel', 'BASMALA KIDS', '2024-06-26', 'Aktif', '');
INSERT INTO `siswa` (`id_siswa`, `nama`, `tempatlahir`, `tanggallahir`, `asalsekolah`, `kelas`, `jeniskelamin`, `alamat`, `nohp`, `tempat_les`, `pilihanprogram`, `tglpendaftaran`, `status_siswa`, `keterangan`) VALUES
(867, 'REVALINA ALESHA SAPUTRO ( ALESHA ) ', 'Karanganyar', '2018-07-28', 'TK AISYAH MUTIARA HATI ', 'TK B ', 'Perempuan', 'PERUM PPH RT 6 RW 6 NGIJO TASIKAMDU ', '085799112172', 'Bimbel', 'BASMALA KIDS', '2024-06-26', 'Aktif', ''),
(869, 'KAHIYANG DAN KENES ( PRIVAT GROUP CONVERSATION)', 'KARANGANYAR ', '0005-05-05', '-', '-', 'Perempuan', '9', '0', 'Bimbel', 'Kelas SEMPOA', '2024-07-01', 'Tidak Aktif', '-'),
(870, 'KELOMPOK 2 SD JULI 2024', '-', '0009-05-01', 'E', '2', 'Perempuan', 'F', '4', 'Bimbel', 'PRIVAT 2 SD', '2024-07-01', 'Aktif', ''),
(871, 'Rasyidatushshafa Nazihah Nugroho ( shafa) ', 'KARANGANYAR ', '2013-02-10', ' MI Mulazamah Isy Karima', '5 sd', 'Perempuan', 'Tegal Arum RT 03 RW 13 Cangakan, Karanganyar', '08112631329', 'Bimbel', 'KELAS 5 SD', '2024-07-01', 'Tidak Aktif', ''),
(872, 'Rasyidatushshafa Nazihah Nugroho ( shafa) ', 'KARANGANYAR ', '2013-10-02', ' MI Mulazamah Isy Karima', '5 sd', 'Perempuan', 'Tegal Arum RT 03 RW 13 Cangakan, Karanganyar', '08112631329', 'Bimbel', 'KELAS 5 SD', '2024-07-01', 'Aktif', ''),
(873, 'KELOMPOK 4 SD JULI 2024', 'KARANGANYAR ', '0003-03-03', 'D', '4', 'Perempuan', 'G', '5', 'Bimbel', 'KELAS 4 SD', '2024-07-01', 'Aktif', ''),
(874, 'ALKHALIFI RUSJAYA HAMIZAN ( ALKHA) ', 'SUKOHARJO ', '2016-08-10', 'SDN 1 KARANGANYAR ', '2 SD', 'Laki - Laki', 'BADRANASRI RT 2 RW 10 CANGAKAN KARANGANYAR ', '085747709006', 'Bimbel', 'PRIVAT 2 SD', '2024-07-02', 'Aktif', ''),
(875, 'NAUFAL ZAIM ARKANANTA ( UFAL )', 'KARANGANYAR ', '2019-03-26', 'RA AL HIDAYAH ', 'KIDS ', 'Laki - Laki', 'KAPLINGAN POMAHAN LALUNG ', '085647364623', 'Bimbel', 'BASMALA KIDS', '2024-07-02', 'Aktif', ''),
(876, 'HESA MUADZ ANGGORO (HESA )', 'KARANGANYAR ', '0005-05-05', 'SDN 1 KARANGANYAR ', '6', 'Laki - Laki', 'U', '7', 'Bimbel', 'Basmala Fun Holiday', '2024-07-03', 'Tidak Aktif', ''),
(877, 'KELOMPOK BTA JULI 2024', 'KARANGANYAR ', '0003-03-03', 'D', '4', 'Perempuan', 'T', '5', 'Bimbel', 'PRIVAT BTA', '2024-07-03', 'Aktif', ''),
(878, 'KELOMPOK UMMI 3  JULI 2024', 'KARANGANYAR ', '0004-04-04', 'D', '4', 'Perempuan', '4', '4', 'Bimbel', 'UMMI BESAR ', '2024-07-04', 'Aktif', ''),
(879, 'KELOMPOK 3 SD JULI 2024 ', 'KARANGANYAR ', '0003-03-03', 'D', 'D', 'Perempuan', 'D', '3', 'Bimbel', 'KELAS 3 SD ', '2024-07-04', 'Aktif', ''),
(881, 'TANDA WINAHYU LANGIT DIRGANTARA (LANGIT)', 'KARANGANYAR ', '2020-07-03', 'TK PERTIWI PEMDA KARANGANYAR ', 'TKA', 'Laki - Laki', 'TEGALWINANGUN RT 3/13 TEGALGEDE JL MAJAPAHIT NO 2 KARANGANYAR ', '089522942737', 'Bimbel', 'KELAS BASMALA KIDS', '2024-07-09', 'Aktif', ''),
(882, 'ANDROMEDA LEGACY ORBARINTO ( ANDRO)', 'KARANGANYAR ', '2018-02-05', 'SDN 1 PAPAHAN ', '1', 'Perempuan', 'PANDES RT 7 RW 13 PAPAHAN KARANGANYAR ', '085647050002', 'Bimbel', 'BASMALA KIDS', '2024-07-09', 'Aktif', ''),
(884, 'Kelompok 5 SD B ', 'KARANGANYAR ', '0001-01-01', 'D', 'D', 'Laki - Laki', 'D', '3', 'Bimbel', 'KELAS 5 SD', '2024-07-16', 'Aktif', ''),
(885, 'Najiha Aisyakila ( najiha ) ', 'KARANGANYAR ', '2017-11-27', 'MIM KARANGANYAR ', '1', 'Perempuan', 'Krajan RT 2/ RW 2, Lalung,kra', '085647038380', 'Bimbel', 'KELAS BASMALA KIDS', '2024-07-18', 'Aktif', ''),
(886, 'Jesslyne Pali ( jesslyne ) ', 'KARANGANYAR ', '2016-12-19', 'sdn 1 kra ', '2', 'Perempuan', 'Kalongan RT 006/016 Papahan Tasikmadu Kra', '081225502222', 'Bimbel', 'PRIVAT BTA', '2024-07-18', 'Aktif', ''),
(887, ' humaira husna ibtafunisa ( maira) ', 'KARANGANYAR ', '2014-05-30', 'SD al karimah', '4', 'Perempuan', 'banaran 5/1 jati jaten karanganyar', '085800634255', 'Bimbel', 'PRIVAT 4 SD', '2024-07-18', 'Aktif', ''),
(888, 'ADHYASTA SAKHA MUTTAQI ( SAKHA ) ', 'KARANGANYAR ', '2019-07-29', 'TKIT INSAN KAMIL ', 'TKA', 'Laki - Laki', 'NGRAPAH SAMBIREJO JUMANTONO ', '085728837593', 'Bimbel', 'KELAS BASMALA KIDS', '2024-07-20', 'Aktif', ''),
(891, 'KEYRA MAHESWARI RADITYA (KEYRA ) ', 'KARANGANYAR ', '2020-06-19', 'SCA ', 'PAUD', 'Perempuan', 'JL TAWES RT 6 RW 6 KEL BEJEN KEC KARANGANYAR ', '08158084290', 'Bimbel', 'KELAS BASMALA KIDS', '2024-07-24', 'Aktif', ''),
(892, 'HAFSHAH MENGDA CHANDRIKA ( HAFSHAH ) ', 'KARANGANYAR ', '2012-09-05', 'KARANGANYAR ', '6', 'Perempuan', 'JENGLONG RT 2 RW 2 KELURAHAN BEJEN KRA ', '082243646716', 'Bimbel', 'KELAS 6 SD', '2024-07-25', 'Tidak Aktif', ''),
(893, 'Dinaya Nur Almahyra Putri ( naya ) ', 'KARANGANYAR ', '2019-02-05', 'TK AISYAH KAYUAPAK ', 'TK B ', 'Perempuan', 'Kayuapak RT 01 RW 06 Polokarto Sukoharjo (Selatan Pasar Kayuapak)', '085719795592', 'Bimbel', 'BASMALA KIDS', '2024-07-27', 'Aktif', ''),
(895, 'GAZELLE ILKARHA AHANKARA GENA ( GAZELLE)', 'KARANGANYAR ', '2020-09-30', 'AL ABIDIN ', 'PAUD', 'Laki - Laki', 'CERBONAN RT 1 RW 1 KARANGANYAR ', '085642155300', 'Bimbel', 'PRIVAT BTA', '2024-07-27', 'Aktif', ''),
(896, 'AROFAH NUR AZIZAH  ( AROFAH )', 'KARANGANYAR ', '2012-10-25', 'SDIT INSAN KAMIL ', '6', 'Perempuan', 'PADANGAN RT 1 RW 8 JUNGKE KRA ', '085336517562', 'Bimbel', 'KELAS 6 SD', '2024-07-30', 'Aktif', '-'),
(897, 'Rafka Nawazabil Defangga ( rafka )', 'KARANGANYAR ', '2012-10-07', ' MIM Karanganyar', '6', 'Laki - Laki', ' jl. Ronggowarsito no 2 Bejen, Karanganyar', '', 'Rumah', 'PRIVAT 6 SD', '2024-07-30', 'Aktif', ''),
(899, 'Ghania yocelline ghea sanjaya ( celline)', 'KARANGANYAR ', '2018-11-18', 'TK Islam Al Hadi triyagan', 'tk ', 'Perempuan', ' Pundak RT05/7 jati. Jaten karanganyar', '0819836562', 'Rumah', 'BASMALA KIDS', '2024-07-31', 'Aktif', ''),
(900, 'KELOMPOK CONVERSATION  2024', 'KARANGANYAR ', '0004-04-04', 'D', '1', 'Laki - Laki', 'E', '3', 'Bimbel', 'ENGLISH CONVERSATION ', '2024-08-01', 'Aktif', ''),
(901, 'BILQIS GHASIYA BRILLIAN SALSABILA (BILQIS) ', 'KARANGANYAR ', '2014-07-10', 'SDN 1 KARANGANYAR ', '4', 'Perempuan', 'PERUM KADIPIRO BARU JL BIMA SENO NO 21 RT 8 BEJEN KARANGANYAR ', '082226795414', 'Bimbel', 'KELAS 4 SD', '2024-08-01', 'Aktif', ''),
(902, 'KISSA LATIFA NABHILA (KISSA) ', 'KARANGANYAR ', '2017-03-21', 'SDN 1 PAPAHAN ', '1', 'Perempuan', 'NGIJO WETAN RT 6 RW 3 NGIJO TASIKMADU ', '085290422330', 'Bimbel', 'BASMALA KIDS', '2024-08-02', 'Aktif', ''),
(903, 'Arfian Igneel Wibowo ( IGNEEL ) ', 'KARANGANYAR ', '2021-01-08', 'SCA', 'PAUD', 'Laki - Laki', 'jl.jendral Basuki Rahmat, pundak RT 005 RW 007, jati, jaten, Karanganyar', '085740838383', 'Bimbel', 'BASMALA KIDS', '2024-08-03', 'Aktif', ''),
(904, 'keysha ayunindya safira (KEYSHA )', 'KARANGANYAR ', '2020-05-28', '-', '-', 'Perempuan', 'pokoh rt 04 rw04 desa ngijo', '089622144829', 'Bimbel', 'BASMALA KIDS', '2024-08-03', 'Aktif', ''),
(906, 'CALLYSTA ELYSIA HALONA FAWZI ( CALLYSTA ) ', 'KARANGANYAR ', '2019-12-16', 'YA BUNAYYA SURAKARTA ', 'TKA ', 'Perempuan', 'NANGSRI KIDUL RT 1 RW 2 KEBAKKRAMAT KARANGANYAR ', '085725666895', 'Bimbel', 'UMMI BESAR ', '2024-08-06', 'Aktif', ''),
(908, 'CALLUELLA QUINZIA SUJATMOGO ( ZIA ) ', 'KARANGANYAR ', '2018-02-22', 'SDN 1 PAPAHAN ', '1', 'Perempuan', 'GRIYA MUTIARA HIJAU A10 PAPAHAN ', '081226449429', 'Bimbel', 'BASMALA KIDS', '2024-08-12', 'Aktif', ''),
(909, 'arrasya ekan alfarizi ( arrasya )', 'KARANGANYAR ', '2019-06-10', 'AL ABIDIN ', 'TKA ', 'Perempuan', 'perumahan pokoh baru gang kelengkeng rt 2 rw 7 ngijo tasikmadu ', '082221156530', 'Bimbel', 'BASMALA KIDS', '2024-08-16', 'Aktif', ''),
(910, 'Athadzka ainayya hafidzah (nayya)', 'KARANGANYAR ', '2013-02-18', 'SDIT insan kamil', '6', 'Perempuan', ' Daleman rt 2/9 cangakan kra', '085287732844', 'Bimbel', 'KELAS 6 SD', '2024-08-22', 'Aktif', ''),
(911, 'LUTHFI FATIH AL QODR (FATIH) ', 'KARANGANYAR ', '2019-07-11', 'RA HIDAYATUL INSAN ', 'TK B ', 'Laki - Laki', 'BADRAN ASRI RT V3 RW 10 CANGAKAN KARANGANYAR ', '081548665951', 'Bimbel', 'BASMALA KIDS', '2024-08-23', 'Aktif', ''),
(912, 'ARRUMAISHA AGHNA UMAIRAH ( AGHNA ) ', 'TK B', '2018-11-04', 'SEMATA HATI ', 'TK B ', 'Perempuan', 'NGEBONG 7/5 BENING REJO GAUM TASIKMADU ', '085643984454', 'Bimbel', 'KELAS BASMALA KIDS', '2024-08-29', 'Aktif', ''),
(913, 'REGULER KIDS SABTU ', 'KARANGANYAR ', '2024-07-29', 'G', 'G', 'Perempuan', 'G', '5', 'Bimbel', 'BASMALA KIDS', '2024-08-30', 'Aktif', ''),
(916, 'FARADIBA SEKAR L (DIBA ) ', 'KARANGANYAR ', '2018-12-04', 'TK SCA ', 'TK B ', 'Perempuan', 'MANGGUNG RT 4 RW 9 CANGAKAN KARANGANYAR ', '085647011998', 'Bimbel', 'KELAS BASMALA KIDS', '2024-09-04', 'Aktif', ''),
(917, 'TPQ JATEN ', 'KARANGANYAR ', '2024-04-09', '-', '4', 'Perempuan', '-', '0', 'Rumah', 'BTA DEWASA', '2024-09-05', 'Tidak Aktif', ''),
(918, 'Begawan Satriyo Gunawan ( Tiyo )', 'KARANGANYAR ', '2012-04-12', 'SDN 1 PAPAHAN ', '6', 'Laki - Laki', 'jungke ', '082144839560', 'Bimbel', 'PRIVAT 6 SD', '2024-09-13', 'Aktif', ''),
(919, 'SALMA ANINDITA ( SALMA )', 'Karanganyar', '2019-04-01', 'tkit insn kamil ', 'tkb', 'Perempuan', 'PURI TAMAN SARI 2 B 21 JATI  JATEN ', '081329177186', 'Bimbel', 'BASMALA KIDS', '2024-09-14', 'Aktif', ''),
(920, 'Keana Allegra ( keana ) ', 'KARANGANYAR ', '2020-03-18', 'tk bhayangkari ', 'tka a ', 'Perempuan', 'tegalaasri bejen karanganyar ', '085658076583', 'Bimbel', 'BASMALA KIDS', '2024-09-17', 'Aktif', ''),
(921, 'kelompok kids 3 juli 2024 ', 'KARANGANYAR ', '0004-04-04', 'D', 'b', 'Perempuan', 'b', '5', 'Bimbel', 'KELAS BASMALA KIDS', '2024-09-19', 'Aktif', ''),
(926, 'EVANO ZHIAN AYRES ( VANO ) ', 'KARANGANYAR ', '2019-06-20', 'TKII AL ABIDIN ', 'TK B ', 'Laki - Laki', 'PERUM TIRTASANI RESIDENCE ', '082135319909', 'Bimbel', 'KELAS BASMALA KIDS', '2024-09-20', 'Aktif', ''),
(927, 'fatiha althafunnisa r( nisa ) ', 'KARANGANYAR ', '2014-05-20', 'SDIT INSAN KAMIL ', '4SD', 'Perempuan', 'daleman rt 4 rw 9 no 33 manggung cangakan karanganyar ', '081329768815', 'Rumah', 'PRIVAT 4 SD', '2024-09-30', 'Aktif', ''),
(929, ' Kenes Destya Arum', 'KARANGANYAR ', '2012-02-12', 'sdn 2 jaten ', '2 smp ', 'Perempuan', '9. Perumahan Citra Alam Rania 2 no. 19 Jati Jaten Karanganyar', '082133775611', 'Bimbel', 'ENGLISH CONVERSATION ', '2024-10-01', 'Tidak Aktif', ''),
(930, 'ibrahim ghazi alghifari ', 'KARANGANYAR ', '2017-04-04', 'SDN 1 KARANGANYAR ', '1', 'Laki - Laki', 'perum pph gang bambang 07/06 ngijo tasikmadu ', '081227527561', 'Bimbel', 'Privat group bta', '2024-10-01', 'Aktif', ''),
(931, 'safiya azzalea mecca ( mecca ) ', 'KARANGANYAR ', '2015-06-20', 'SDN 1 KARANGANYAR ', '3 SD ', 'Perempuan', 'perum pph gang bambang rt 7/6 pokoh ngijo tasikmadu ', '081227527561', 'Bimbel', 'Privat group bta', '2024-10-01', 'Aktif', ''),
(932, 'mecca dan ibrahim privat group ', 'KARANGANYAR ', '0002-02-02', 'D', '2', 'Perempuan', '2', '2', 'Bimbel', 'Privat group bta', '2024-10-01', 'Aktif', ''),
(933, 'AMIRA NAIRA DEVIANI ( NAIRA DEVIANI )', 'KARANGANYAR ', '2013-02-25', 'SDN 2 BEJEN ', '6 SD ', 'Perempuan', 'PURI PERSADA HIJAU JALAN ABIMANYU NO 5 RT 11 RW 6 NGIJO TASIKMADU KRA', '082132501169', 'Bimbel', 'KELAS 6 SD', '2024-10-04', 'Aktif', ''),
(934, 'sabrina zhafira putri ( sabrina ) ', 'KARANGANYAR ', '2017-07-21', 'SDN 1 KARANGANYAR ', '1 sd ', 'Perempuan', 'puri persada hijau jalan abimanyu no 5 rt 11/6 ngijo tasikmadu ', '081225843431', 'Bimbel', 'KELAS BASMALA KIDS', '2024-10-07', 'Aktif', ''),
(935, 'mikhaila gita indah ( mikhaila gita ) ', 'KARANGANYAR ', '2018-03-20', 'SDI AL ABIDIN ', '1', 'Perempuan', 'ngaliyan rt 2 rw 1 lalung karanganyar ', '085728641666', 'Bimbel', 'BASMALA KIDS', '2024-10-08', 'Aktif', ''),
(936, 'adhicandra arya w ( arya)', 'KARANGANYAR ', '2000-03-25', 'AL ABIDIN ', 'TKA', 'Laki - Laki', 'ngaliyan rt 2 / 1 lalung karanganyar ', '085728641666', 'Bimbel', 'BASMALA KIDS', '2024-10-08', 'Aktif', ''),
(937, 'Mikhayla teguh maharani (mikhaylya teguh ) ', 'KARANGANYAR ', '2016-05-18', 'min karangmojo ', '3 SD ', 'Perempuan', 'pokoh rt02/07 ngijo tasikmadu', '081215683049', 'Bimbel', 'KELAS 3 SD ', '2024-10-10', 'Aktif', ''),
(939, 'Privat Group 4 SD ( Roqi - Rasya )', 'KARANGANYAR ', '2024-10-02', 'f', 'f', 'Laki - Laki', 'f', '1', 'Rumah', 'PRIVAT GROUP 4 SD ', '2024-10-21', 'Aktif', ''),
(942, 'daffa Alfarizy Defangga ( daffa )', 'KARANGANYAR ', '2019-04-04', 'al hidayah ', 'TK B ', 'Laki - Laki', 'jl Ronggowarsito no 2 Bejen', '085725557999', 'Rumah', 'BASMALA KIDS', '2024-10-28', 'Aktif', ''),
(945, ' erlang inggil panjawi ( erlang ) ', 'KARANGANYAR ', '2019-07-12', ' tk nurul iman', 'TK B ', 'Perempuan', ' ngarjosari rt3 rw2 popongan Karanganyar', '082223723338', 'Bimbel', 'BASMALA KIDS', '2024-11-01', 'Aktif', ''),
(946, 'Nayyara NurAisha Minha (nayyara) ', 'KARANGANYAR ', '2019-03-04', 'TK PAUD ANAK ALAM PINTAR', 'tk b ', 'Perempuan', '9. Jl. Onta 1 Karangrejo Rt 01/05 Karanganyar', '085851070999', 'Rumah', 'BASMALA KIDS', '2024-11-02', 'Aktif', ''),
(947, 'INOV ABIMANYU ( INOV ) ', 'KARANGANYAR ', '2017-11-02', 'SDN 3 KARANGANYAR ', 'TK B ', 'Laki - Laki', 'TEGALWINANGUN RT 2 RW 13 TEGAL GEDE KARANGANYAR ', '085743060040', 'Bimbel', 'BASMALA KIDS', '2024-11-09', 'Aktif', ''),
(948, 'kelompok 2 bu diah ', 'KARANGANYAR ', '0003-03-03', '3', '3 SD ', 'Laki - Laki', '3', '3', 'Bimbel', 'KELOMPOK BTA ', '2024-11-13', 'Aktif', ''),
(949, 'kelompok 3 bu diah ', 'KARANGANYAR ', '0004-04-04', 'D', '4', 'Perempuan', '4', '4', 'Rumah', 'KELOMPOK BTA ', '2024-11-13', 'Aktif', ''),
(950, 'daniela naufalyn mahestri putri ( alin ) ', 'KARANGANYAR ', '2014-04-03', 'sd 1 karanganyar ', '5 sd ', 'Perempuan', 'cerbonan rt 2 rw 2 karnagnyar ', '082220920937', 'Bimbel', 'PRIVAT 5 SD', '2024-11-15', 'Aktif', ''),
(951, 'ibrahim kiano dewa nindra ( kiano )', 'KARANGANYAR ', '2019-07-05', 'tk al abidin ', 'TK B ', 'Laki - Laki', 'griya papahan sejahtera blok b no 12 tasikmadu karanganyar ', '085727433636', 'Bimbel', 'BASMALA KIDS', '2024-11-18', 'Aktif', ''),
(952, 'Jennaira Assava ( jenna ) ', 'KARANGANYAR ', '2021-09-18', 'al abidin ', 'paud ', 'Perempuan', 'nglano rt 2 / 1 pandeyan tasikmadu ', '081229975266', 'Bimbel', 'BASMALA KIDS', '2024-11-19', 'Aktif', ''),
(953, 'Allya Cearo Zahra ( allya)', 'KARANGANYAR ', '2011-02-08', 'smp darul arqom ', '8', 'Perempuan', 'Genengrejo Rt 01 Rw 09 Lalung Karanganya', '083866835138', 'Bimbel', 'Fun Quran ', '2024-12-10', 'Aktif', ''),
(954, 'Julio razia Kristanto ( JULIO )', 'KARANGANYAR ', '2020-07-20', '-', '1', 'Perempuan', 'gedangan, rt 01/10, gebyok, mojogedang, karanganyar', '081226319323', 'Bimbel', 'Basmala Fun Holiday', '2024-12-13', 'Aktif', ''),
(955, 'Bu Diah Kelompok 1 ', 'KARANGANYAR ', '0007-07-01', 'SDN 1 KARANGANYAR ', 'bta', 'Perempuan', 'u', '7', 'Bimbel', 'KELOMPOK BTA ', '2024-12-14', 'Aktif', ''),
(956, 'Mahendra Ersya Putra (mahen)', 'KARANGANYAR ', '2020-05-13', ' KB Al-Hidayah Islamic Center Karanganyar', 'kb', 'Laki - Laki', ' Kepuh RT 04/ RW 03, Lalung, Karanganyar', '085869997795', 'Bimbel', 'BASMALA KIDS', '2024-12-14', 'Aktif', ''),
(957, 'Kelompok KIDS 4 ', 'KARANGANYAR ', '0006-06-06', 'g', '6', 'Perempuan', 'g', '6', 'Bimbel', 'KELAS BASMALA KIDS', '2024-12-14', 'Aktif', ''),
(958, 'faro muhammad putra surya ( faro )', 'KARANGANYAR ', '2019-11-26', 'ra al hidayah ick ', 'tk a', 'Perempuan', 'genengrejo rt 2 rw 09 lalung karanganyar ', '085727236869', 'Bimbel', 'Basmala Fun Holiday', '2024-12-16', 'Aktif', ''),
(959, 'AL FINO CAHYO RAHMAD BUDI ( FINO ) ', 'KARANGANYAR ', '2015-08-10', 'SDN 1 JANTIHARJO ', '3 SD ', 'Laki - Laki', 'KERTEN RT 4/ 8 JANTIHARJO ', '088983645419', 'Bimbel', 'PRIVAT 3 SD', '2024-12-17', 'Aktif', ''),
(960, 'AGASTYA PRAMUDYA WASTU (AGA) ', 'KARANGANYAR ', '2018-03-11', 'TK PERTIWI PEMDA KARANGANYAR ', 'TK B ', 'Laki - Laki', 'DAREN WETAN RT 3 RW 14 BLORONG JUMANTONO ', '085868229335', 'Bimbel', 'BASMALA KIDS', '2024-12-17', 'Aktif', ''),
(961, 'rayyi wening penggalih  ( rayyi ) ', 'KARANGANYAR ', '2002-08-01', 'SMPN 3 KARANGANYAR ', '7 SMP ', 'Perempuan', 'PERUM PURI KAHURIPAN JATI JATEN KARANGANYAR ', '082243958845', 'Bimbel', 'Basmala Fun Holiday', '2024-12-17', 'Aktif', ''),
(962, 'Farel Akmal Maulana (farel)', 'KARANGANYAR ', '2019-07-12', ' TK ALFATAH', 'TKA', 'Perempuan', ' Lavender no 17 Pokoh Baru RT 14 RW 06 Ngijo Tasikmadu', '085713456556', 'Bimbel', 'Basmala Fun Holiday', '2024-12-20', 'Aktif', ''),
(963, 'rania azzahra ( rania ) ', 'KARANGANYAR ', '2019-11-11', 'TKII AL ABIDIN ', 'tk a', 'Perempuan', 'jetu  rt 2 / 1 tegalgede karanganyar ', '081217697949', 'Bimbel', 'KELAS BASMALA KIDS', '2024-12-20', 'Aktif', ''),
(964, 'al rashya ( rashya )', 'KARANGANYAR ', '2024-12-04', 'D', 'TK B ', 'Laki - Laki', 't', '081326279894', 'Bimbel', 'Basmala Fun Holiday', '2024-12-23', 'Aktif', ''),
(965, 'nala ', 'KARANGANYAR ', '2024-12-01', 'D', 'TK B ', 'Perempuan', 'g', '081325127050', 'Bimbel', 'Basmala Fun Holiday', '2024-12-23', 'Aktif', ''),
(966, ' KHALIF ARDAM ALFARIZI (khurri )', 'KARANGANYAR ', '2024-12-09', 'PAUD Haramain Papahan', 'TK B ', 'Laki - Laki', ' Wonolopo Rt 03/ 02 Wonolopo Tasikmadu Kra', '08993483492', 'Bimbel', 'Basmala Fun Holiday', '2024-12-23', 'Aktif', ''),
(967, 'NADA SALIMA ALAM', 'KARANGANYAR ', '2019-12-23', 'TK SCA Karanganyar', 'TK A', 'Perempuan', ' Tegalsari 01/06 Bejen, Kra', '085648543331', 'Bimbel', 'Basmala Fun Holiday', '2024-12-23', 'Aktif', '-'),
(968, 'Destara naredia Wardhana', 'KARANGANYAR ', '2020-07-29', 'paud sca karanganyar', 'PAUD', 'Laki - Laki', 'jl pembangunan III no.095 Perum Dosen UnS Jati Jaten Karanganyar', '085728850209', 'Bimbel', 'Basmala Fun Holiday', '2024-12-23', 'Aktif', '-'),
(969, 'Azahra Kaylillafatih W', 'KARANGANYAR ', '2014-01-18', 'Sd Papahan Negeri 1', '5 SD', 'Perempuan', 'Perum Puri Kahuripan Tegalgede 1 blok C 15 tegalgede kra', '082223604880', 'Bimbel', 'Basmala Fun Holiday', '2024-12-23', 'Aktif', '-'),
(970, 'ADILA KHEYRA ZASKIYA (DILA)', 'SUKOHARJO ', '2020-01-08', 'TKIT INSAN KAMIL', 'TK A', 'Perempuan', 'Perum Papahan Asri', '081228211944', 'Bimbel', 'Basmala Fun Holiday', '2024-12-23', 'Aktif', '-'),
(971, 'Aleena Bening Andjani', 'KARANGANYAR ', '2020-12-28', ' Al Abidin Karanganyar', 'KB', 'Perempuan', 'Sapen, Sukoharjo', '082251248585', 'Bimbel', 'Basmala Fun Holiday', '2024-12-26', 'Aktif', '-'),
(972, 'hilya mafaza', 'KARANGANYAR ', '2017-11-02', 'MIM Kra', '1 SD', 'Perempuan', 'Gerdu RT 1/RW 6 Waru , Kebakkramat', '05725365767', 'Bimbel', 'Basmala Fun Holiday', '2024-12-26', 'Aktif', '-'),
(973, 'Adham Syarif Respati Putra (Adham)', 'Surakarta', '2019-09-05', 'TK SCA ', 'TK A', 'Laki - Laki', 'Perum Puri Kahuripan, Jungke E6, Karanganyar', '081220076869', 'Bimbel', 'KELAS BASMALA KIDS', '2025-01-02', 'Aktif', 'senin 14.30 - 16.00\r\nrabu 15.00-16.30\r\njumat 14.30 - 16.00'),
(974, 'Anisa Alima Munifa (Nifa)', 'Balikpapan', '2014-12-17', 'SDIT INSAN KAMIL ', '4SD', 'Perempuan', 'Jaten Permai, Karanganyar', '085642330305', 'Bimbel', 'PRIVAT 4 SD', '2025-01-06', 'Aktif', 'rabu dan jumat'),
(975, 'Shabira Islamidina (Shabira)', 'Solo', '2021-02-09', '-', '-', 'Perempuan', 'Tegalasri RT 03/ RW 08', '085736264730', 'Bimbel', 'KELAS BASMALA KIDS', '2025-01-06', 'Aktif', '-'),
(976, 'Farisa Ghaniya Afwa (Afwa)', 'KARANGANYAR ', '2014-11-14', 'SD IT Insal Kamil Karanganyar', '4SD', 'Perempuan', 'Perum Lalung Permai Block A1 No 20 Karanganyar', '085640733107', 'Bimbel', 'PRIVAT 4 SD', '2025-01-07', 'Aktif', '-'),
(978, 'Hanin Nur Akifah (Hanin)', 'Karanganyar', '2014-01-11', 'SDIT INSAN KAMIL ', '4SD', 'Perempuan', 'Mojo RT 01/RW 02, Jantiharjo, Karanganyar', '081283196717', 'Rumah', 'PRIVAT 4 SD', '2025-01-07', 'Aktif', 'jam 16.00'),
(979, 'Alifah Farah S (Alifah)', 'KARANGANYAR ', '2013-05-07', 'MIM KARANGANYAR ', '5SD', 'Perempuan', 'Jagan RT 01/RW 07 Lalung', '087730533524', 'Bimbel', 'KELAS 5 SD', '2025-01-08', 'Aktif', ''),
(980, 'Uwais Al Barra (Uwais)', 'Semarang', '2019-01-29', 'TK SCA ', 'TK B ', 'Laki - Laki', 'Cluster, Cangakan No. 2A', '08116607654', 'Rumah', 'BASMALA KIDS', '2025-01-09', 'Aktif', ''),
(981, 'Moazaeem Esshal Prakosa (Esshall)', 'KARANGANYAR ', '2019-06-29', 'TK AR-RAHMAN TASIKMADU', 'TK B', 'Laki - Laki', 'Buran Wetan, RT 01/RW 02, Kelurahan Buran, Tasikmadu, Kra', '0817252544', 'Bimbel', 'BASMALA KIDS', '2025-01-10', 'Aktif', ''),
(982, 'Gending Panglipur Ati (Gending)', 'KARANGANYAR ', '2020-05-12', 'belum sekolah', 'belum sekolah', 'Perempuan', 'Pungkuran, Kwangsan Jumapolo', '082136208712', 'Bimbel', 'BASMALA KIDS', '2025-01-10', 'Aktif', '-'),
(986, 'Adzkia Azizah (Adzkia)', 'KARANGANYAR ', '2014-08-14', 'MI karanganyar ', '5SD', 'Perempuan', 'Janti Harjo ', '081388246295', 'Bimbel', 'PRIVAT 5 SD', '2025-01-16', 'Aktif', 'Rabu dan Jumat jam 15.00'),
(987, 'Keisha Almahyra P.N. (Keisha)', 'Sidoarjo', '2019-04-27', 'TK AL Hadi', 'TK A', 'Perempuan', 'Perum Jaten Asri Jl. Jaten Asrii Raya No. 9 Sawahan, Jaten KRA', '082147552252', 'Bimbel', 'Kelas SEMPOA', '2025-01-16', 'Aktif', '-'),
(988, 'Hijaz Habibi (Hijaz)', 'Boyolali', '2020-04-05', 'TK AISYIAH BIBIS JUNGKE', 'TK A', 'Laki - Laki', 'Dimoro RT 02/10 Karanganyar', '085875738299', 'Bimbel', 'BASMALA KIDS', '2025-01-20', 'Aktif', ''),
(989, 'Ibnu Luthfi Haidar (Ibnu)', 'Karanganyar', '2015-06-15', 'MIM Tegalgede', '4 SD ', 'Laki - Laki', 'Brangkal, Jantiharjo', '085728316165', 'Bimbel', 'PRIVAT 4 SD', '2025-01-23', 'Aktif', '-'),
(990, 'Bhre Mahesa Putra Nugroho (Bhre)', 'Surakarta', '2018-12-09', 'TK Papahan 03', 'TK B', 'Laki - Laki', 'Ngablak RT 3 RW 10, Papahan, Tasikmadu, Karanganyar', '081329885100', 'Bimbel', 'BASMALA KIDS', '2025-01-30', 'Aktif', '-'),
(991, 'Daffa Alkhair Prasetyo (Cairo)', 'Mataram', '0018-02-26', 'SDII Al Abidin Karanganyar ', '1 SD', 'Laki - Laki', 'Rt.5 RW.10 Papahan', '081237576850', 'Rumah', 'PRIVAT 1 SD', '2025-01-31', 'Aktif', '-'),
(992, 'Fabian Rangga Saputra (Rangga)', 'Karanganyar', '2014-02-26', 'SDN 04 Jaten', '5 SD', 'Laki - Laki', 'Nglinggo RT 01/)4 Buran', '085728277113', 'Bimbel', 'KELAS 5 SD', '2025-01-31', 'Aktif', '-'),
(993, 'Satria Zafran Abinaya (Satria Zafran)', 'Kudus', '2018-03-23', 'TK Al Fatah', 'TK B ', 'Laki - Laki', 'Titang 02/07 Kel. Tegalgede, Karanganyar', '08112900118', 'Bimbel', 'BASMALA KIDS', '2025-02-03', 'Aktif', '-'),
(995, 'Arza Pranajatama Saifudin (Arza)', 'Surakarta', '2018-01-07', 'SDN 1 KARANGANYAR ', '1 SD ', 'Laki - Laki', 'Jengglong RT 03 RW 01, Bejen, Karanganyar', '08816610510', 'Bimbel', 'PRIVAT 1 SD', '2025-02-04', 'Aktif', '-'),
(996, 'Evano Rafif Abqary (Evano)', 'Surakarta', '2019-12-07', 'Surya Ceria Aisyiah', 'TK A', 'Laki - Laki', 'Perum Loh Agung 6 Kavling A2, Sawahan, Jaten', '085642620759', 'Bimbel', 'BASMALA KIDS', '2025-02-05', 'Aktif', '-'),
(998, 'Diandra Elmyra Ramadhani (DIdi)', 'Jakarta', '2014-07-15', 'SD ASC', '5SD', 'Perempuan', 'Manggung RT 004 RW 009, Cangakan, Karanganyar', '085647011998', 'Rumah', 'PRIVAT BTA', '2025-02-05', 'Aktif', '-'),
(999, 'Aulia Syifa Rusdiana (Syifa)', 'Karanganyar', '2016-05-11', 'sdn 02 bejen karanganyar', '2 SD', 'Perempuan', 'beningrejo gaum tasikmadu', '083865378878', 'Bimbel', 'Basmala Fun Holiday', '2025-02-19', 'Aktif', '-'),
(1000, 'casilda emalia ghumaysa (casi)', 'Karanganyar', '2018-09-10', 'tk Aisyiyah Dompon', 'TK B ', 'Perempuan', 'tasikmadu', '0895392890591', 'Bimbel', 'Basmala Fun Holiday', '2025-02-19', 'Aktif', '-'),
(1001, 'Muhammad  Faeyza  Abdurrahman (Faeyza)', 'Karanganyar', '2018-03-09', 'TKIT semesta ceria pokoh', 'TK B ', 'Laki - Laki', 'Nglano Rt 04/rw 01,Pandeyan,Tasikmadu,Karanganyar (Perum griya pandeyan asri B12 tasikmadu)', '082326634333', 'Bimbel', 'Basmala Fun Holiday', '2025-02-19', 'Aktif', '-'),
(1002, 'Jihan Nazia Prihantoro (Nazia)', 'Karanganyar', '2018-11-16', ' TKII Al Abidin Karanganyar', 'TK A', 'Perempuan', 'Jl. Walet 1 Tegalasri Rt.02 Rw.08, Tegalasri, Karanganyar', '08568103637', 'Bimbel', 'Basmala Fun Holiday', '2025-02-19', 'Aktif', '-'),
(1003, 'Shahinaz Avicenna ilmawan (cenna)', 'Karanganyar', '2020-04-04', 'TKII Al Abidin Karanganyar', 'TK A', 'Perempuan', ' jl walet II RT 2 RW 8 Tegalasri Bejen', '08568103637', 'Bimbel', 'Basmala Fun Holiday', '2025-02-19', 'Aktif', '-'),
(1004, 'Medina El-lubna Barrah (Lubna)', 'Karanganyar', '2020-02-24', 'TK Al-khoiriyah Polokarto', 'TK A', 'Perempuan', 'Sumberejo rt 4 rw 4 ds.mranggen kec.polokarto kab.sukoharjo', '087736029383', 'Bimbel', 'KELAS BASMALA KIDS', '2025-02-19', 'Aktif', '-'),
(1005, 'Adhyasta Javas Aldebaran (Baran)', 'Karanganyar', '2019-04-30', 'TK Al Fatah', 'TK B ', 'Laki - Laki', 'Grogol RT 2/4 Suruh, Tasikmadu, Karanganyar', '081215270071', 'Bimbel', 'BASMALA KIDS', '2025-02-20', 'Aktif', '-'),
(1006, 'Akifa Naila Hidayati (Ifa)', 'Karanganyar', '2021-01-12', '-', '-', 'Perempuan', 'Padangan rt:01/rw: 08, jungke', '089630918217', 'Bimbel', 'Basmala Fun Holiday', '2025-02-20', 'Aktif', '-'),
(1007, 'Nada Randhu Rukmana (Nada)', 'Karanganyar', '2019-06-15', 'Tk kemala Bhayangkari', 'TK B', 'Perempuan', 'Tegalasri rt03/08 Bejen karanganyar', '082111799218', 'Bimbel', 'BASMALA KIDS, Basmala Fun Holiday', '2025-02-21', 'Aktif', '-'),
(1008, 'Adnan Putra Febrianto (Adnan)', 'Karanganyar', '2022-02-22', '-', '-', 'Laki - Laki', 'Sidorejo rt:02/rw:12 kaliboto', '081902056787', 'Bimbel', 'Basmala Fun Holiday', '2025-02-27', 'Aktif', '-'),
(1009, 'Kei Nashita (Keina)', 'Karanganyar', '2017-11-09', 'SDII Al Abidin KRA', '1 SD ', 'Perempuan', 'jl. Mawar no 6 perum JPI Jaten KRA', '085647373946', 'Bimbel', 'Basmala Fun Holiday', '2025-03-01', 'Aktif', '-'),
(1010, 'Arjuna Indera Waspada (Juna)', 'Karanganyar', '2020-04-11', 'TKIT INSAN KAMIL', 'TK A', 'Laki - Laki', 'BADRANASRI RT 03 RW 10 CANGAKAN', '082145887630', 'Bimbel', 'Basmala Fun Holiday', '2025-03-03', 'Aktif', '-'),
(1011, 'Azkayra Khanza Azzahra (Kayra)', 'Karanganyar', '2018-04-05', 'SDN 01 Papahan', '1 SD ', 'Perempuan', 'Genengrejo RT 01 RW 09 Lalung Karanganyar', '083866835138', 'Bimbel', 'Basmala Fun Holiday', '2025-03-04', 'Aktif', '-'),
(1012, 'Arsya Rizkiansyah Septiano (Arsya)', 'Karanganyar', '2017-09-13', 'SDN 2 Bejen', '1 SD ', 'Laki - Laki', 'Ringin asri Rt 6/12 Bejen', '082247811999', 'Rumah', 'BASMALA KIDS', '2025-03-04', 'Aktif', '-'),
(1013, 'Kanaya Hutri Keshwari (Kanaya)', 'Karanganyar', '2018-08-17', 'TK SCA Kra', 'TK B ', 'Perempuan', 'Badranasri 03/10 Cangakan Karanganyar 57712 Jawa Tengah', '085642006464', 'Bimbel', 'Basmala Fun Holiday', '2025-03-05', 'Aktif', '-'),
(1014, 'Zevanya Chayra Nova Andriana (Zevanya)', 'Karanganyar', '2021-07-15', 'paud sca karanganyar', 'PAUD', 'Perempuan', 'matesih', '085173347673', 'Bimbel', 'Basmala Fun Holiday', '2025-03-05', 'Aktif', '-'),
(1015, 'Arsyifa Ainun Mahya (Mahya)', 'Karanganyar', '2018-12-28', 'RA Sudirman Karangmojo', 'TK B ', 'Perempuan', 'Perumahan Griya Mutiara Papahan Blok B16 ', '085790600826', 'Bimbel', 'Basmala Fun Holiday', '2025-03-12', 'Aktif', '-'),
(1016, 'Arfan Fatih Wasito (Arfan)', 'Karanganyar', '2019-01-22', 'TK Al Fatah', 'TK B ', 'Laki - Laki', 'Suruh Wangan RT 06/RW 08 Pandeyan, Tasikmadu, Karanganyar', '085658900549', 'Bimbel', 'BASMALA KIDS', '2025-03-13', 'Aktif', '-'),
(1017, 'Nabila Ayu Humaira (Nabila)', 'Karanganyar', '2021-03-24', '-', '-', 'Perempuan', 'Temuireng, Tegalgedhe KRA', '08816769170', 'Bimbel', 'Basmala Fun Holiday', '2025-03-17', 'Aktif', '-'),
(1018, 'Qeyza Zena Agca (Qeyza)', 'Karanganyar', '2019-11-18', '-', 'TK ', 'Perempuan', 'Mojo, Jantiharjo', '082141268774', 'Bimbel', 'Basmala Fun Holiday', '2025-03-17', 'Aktif', '-');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `jadwal_bimbel`
--
ALTER TABLE `jadwal_bimbel`
  ADD PRIMARY KEY (`id_bimbel`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indeks untuk tabel `kelompok_bimbel`
--
ALTER TABLE `kelompok_bimbel`
  ADD PRIMARY KEY (`id_kelompok`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indeks untuk tabel `kelompok_siswa`
--
ALTER TABLE `kelompok_siswa`
  ADD PRIMARY KEY (`id_kelompok_siswa`),
  ADD KEY `id_kelompok` (`id_kelompok`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `programpilihan`
--
ALTER TABLE `programpilihan`
  ADD PRIMARY KEY (`id_programpilihan`) USING BTREE,
  ADD KEY `pilihanprogram` (`pilihanprogram`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jadwal_bimbel`
--
ALTER TABLE `jadwal_bimbel`
  MODIFY `id_bimbel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kelompok_bimbel`
--
ALTER TABLE `kelompok_bimbel`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kelompok_siswa`
--
ALTER TABLE `kelompok_siswa`
  MODIFY `id_kelompok_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `programpilihan`
--
ALTER TABLE `programpilihan`
  MODIFY `id_programpilihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal_bimbel`
--
ALTER TABLE `jadwal_bimbel`
  ADD CONSTRAINT `jadwal_bimbel_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`),
  ADD CONSTRAINT `jadwal_bimbel_ibfk_2` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`);

--
-- Ketidakleluasaan untuk tabel `kelompok_bimbel`
--
ALTER TABLE `kelompok_bimbel`
  ADD CONSTRAINT `kelompok_bimbel_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`);

--
-- Ketidakleluasaan untuk tabel `kelompok_siswa`
--
ALTER TABLE `kelompok_siswa`
  ADD CONSTRAINT `kelompok_siswa_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok_bimbel` (`id_kelompok`),
  ADD CONSTRAINT `kelompok_siswa_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
