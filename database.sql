-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Okt 2026 pada 10.08
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
-- Database: `sla_pln`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_users`
--

CREATE TABLE `app_users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'Viewer',
  `status` varchar(20) NOT NULL DEFAULT 'Aktif',
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL,
  `theme_preference` varchar(5) NOT NULL DEFAULT 'light'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `app_users`
--

INSERT INTO `app_users` (`id`, `nama`, `username`, `email`, `password`, `foto`, `role`, `status`, `must_change_password`, `created_at`, `reset_token`, `reset_token_expires`, `theme_preference`) VALUES
(1, 'Administrator', 'admin', 'admin@plnnusadaya.co.id', '$2y$10$lIf72KNl5OUdz6WPFL.DCuqR5yV9.uOcpdMrmaHBcdqUqEMcDMS9C', NULL, 'SuperAdmin', 'Aktif', 0, '2026-07-01 11:26:53', NULL, NULL, 'light'),
(2, 'admin2', 'admin2', 'ivancanz1234@gmail.com', '$2y$10$RC0WaGh6UO5OrAmnuScIYOgXaBs9z3PHftNAnGbVdnJa0XCpCQ1iy', NULL, 'Monitoring', 'Aktif', 0, '2026-07-01 11:28:05', NULL, NULL, 'light'),
(3, 'admin4', 'admin4', 'admin4@gmail.com', '$2y$10$xuhsAOD3USqUu6vvE53vO.Ox0Ds14BZQyR2OwR3yrB4GFklI12mCa', NULL, 'Koordinator', 'Aktif', 0, '2026-07-02 03:04:39', NULL, NULL, 'light'),
(4, 'admin3', 'admin3', 'admin3@gmail.com', '$2y$10$qaoLYe65Y4NAXGLJbNhrA.INJbdwiTlY541bEUynKKPytYdmNh8ma', NULL, 'Viewer', 'Aktif', 0, '2026-07-02 03:05:27', NULL, NULL, 'light'),
(5, 'tes1', 'tes', 'tes@gmail.com', '$2y$10$djGmxk06u0kfRz2zPTirY.yNKhh.FCOSo.TI2Jbt2BM0//zBwkyJW', NULL, 'Koordinator', 'Aktif', 0, '2026-09-28 11:38:26', NULL, NULL, 'light');

-- --------------------------------------------------------

--
-- Struktur dari tabel `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `aksi` varchar(50) NOT NULL,
  `modul` varchar(50) NOT NULL,
  `detail` text DEFAULT NULL,
  `data_lama` text DEFAULT NULL,
  `data_baru` text DEFAULT NULL,
  `alasan` text DEFAULT NULL,
  `ip_address` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_id`, `username`, `aksi`, `modul`, `detail`, `data_lama`, `data_baru`, `alasan`, `ip_address`, `created_at`) VALUES
(1, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-01 19:27:03'),
(2, 1, 'admin', 'create', 'user', 'Tambah user: admin2', NULL, '{\"nama\":\"admin2\",\"username\":\"admin2\",\"email\":\"admin2@gmail.com\",\"role\":\"Monitoring\",\"status\":\"Aktif\"}', NULL, '::1', '2026-07-01 19:28:05'),
(3, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=1', '{\"id\":1,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 MANADO (B)\",\"no_kontrak_1\":\"0399.PJ\\/DAN.01.03\\/F15000000\\/2025\",\"no_kontrak_2\":\"0146.Pj\\/DIS.01.01\\/PLNND010000\\/2025\",\"tgl_kontrak\":\"01 September 2025\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":1,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"FEBRUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"nilai_tagihan_tahap1\":1875861098,\"nilai_tagihan_tahap2\":1392889343,\"created_at\":\"2026-06-26 05:21:41\"}', NULL, NULL, '::1', '2026-07-01 19:48:23'),
(4, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=2', '{\"id\":2,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 MANADO (B)\",\"no_kontrak_1\":\"0399.PJ\\/DAN.01.03\\/F15000000\\/2025\",\"no_kontrak_2\":\"0146.Pj\\/DIS.01.01\\/PLNND010000\\/2025\",\"tgl_kontrak\":\"01 September 2025\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":1,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"FEBRUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"nilai_tagihan_tahap1\":1875861098,\"nilai_tagihan_tahap2\":1392889343,\"created_at\":\"2026-06-26 05:22:32\"}', NULL, NULL, '::1', '2026-07-01 19:48:27'),
(5, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=3', '{\"id\":3,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 MANADO (B)\",\"no_kontrak_1\":\"0399.PJ\\/DAN.01.03\\/F15000000\\/2025\",\"no_kontrak_2\":\"0146.Pj\\/DIS.01.01\\/PLNND010000\\/2025\",\"tgl_kontrak\":\"01 September 2025\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":1,\"up3\":\"UP3 MANADO-B\",\"periode_bulan\":\"FEBRUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"OPERASI DAN PEMELIHARAAN DISTRIBUSI\",\"nilai_tagihan_tahap1\":1875861098.0235357,\"nilai_tagihan_tahap2\":1392889343.2679217,\"created_at\":\"2026-07-01 19:47:12\"}', NULL, NULL, '::1', '2026-07-01 19:52:05'),
(6, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=4', '{\"id\":4,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 KOTAMOBAGU\",\"no_kontrak_1\":\"0403.PJ\\/DAN.01.03\\/F15000000\\/2025\",\"no_kontrak_2\":\"0149.Pj\\/DIS.01.01\\/PLNND010000\\/2025\",\"tgl_kontrak\":\"01 September 2025\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":1,\"up3\":\"UP3 KOTAMOBAGU\",\"periode_bulan\":\"DESEMBER\",\"tahun\":2025,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"OPERASI DAN PEMELIHARAAN DISTRIBUSI\",\"nilai_tagihan_tahap1\":1322098946.629397,\"nilai_tagihan_tahap2\":1096007773.3508332,\"created_at\":\"2026-07-01 19:47:12\"}', NULL, NULL, '::1', '2026-07-01 19:52:09'),
(7, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-02 09:32:22'),
(8, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=3', '{\"id\":3,\"nama_kontrak\":\"PEMBORONGAN PEKERJAAN PENGOPERASIAN & PEMELIHARAAN GARDU INDUK PT PLN (PERSERO) UPT MANADO\",\"no_kontrak_1\":\"013.PJ.PkL\\/DAN.01.02.03\\/C48000000\\/2021\",\"no_kontrak_2\":\"0044.Pj\\/DAN.01.03\\/PLNT010000\\/2021\",\"tgl_kontrak\":\"30 September 2021\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":1,\"up3\":\"UPT MANADO\",\"periode_bulan\":\"FEBRUARI\",\"tahun\":2026,\"tahap\":\"-\",\"jenis_kontrak\":\"TRANSMISI\",\"nilai_tagihan_tahap1\":1101033873.05,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-07-02 09:14:01\"}', NULL, NULL, '::1', '2026-07-02 09:32:29'),
(9, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-02 11:02:44'),
(10, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-02 11:03:55'),
(11, 1, 'admin', 'create', 'user', 'Tambah user: admin4', NULL, '{\"nama\":\"admin4\",\"username\":\"admin4\",\"email\":\"admin4@gmail.com\",\"role\":\"Koordinator\",\"status\":\"Aktif\"}', NULL, '::1', '2026-07-02 11:04:39'),
(12, 1, 'admin', 'create', 'user', 'Tambah user: admin3', NULL, '{\"nama\":\"admin3\",\"username\":\"admin3\",\"email\":\"admin3@gmail.com\",\"role\":\"Viewer\",\"status\":\"Aktif\"}', NULL, '::1', '2026-07-02 11:05:27'),
(13, 4, 'admin3', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-02 11:05:47'),
(14, 3, 'admin4', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-02 11:23:33'),
(15, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-02 11:36:57'),
(16, 1, 'admin', 'update', 'user', 'Update user id=1 (password diganti)', '{\"password\":\"(tersembunyi)\"}', '{\"password\":\"(diganti)\"}', NULL, '::1', '2026-07-02 11:37:30'),
(17, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-02 16:15:14'),
(18, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-05 19:32:27'),
(19, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 08:21:46'),
(20, 4, 'admin3', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 09:48:59'),
(21, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 09:51:28'),
(22, 4, 'admin3', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 09:51:55'),
(23, 4, 'admin3', 'create', 'kontrak', 'Tambah kontrak id=10', NULL, NULL, NULL, '::1', '2026-07-10 09:52:33'),
(24, 4, 'admin3', 'create', 'monitoring_harian', 'Input harian kontrak_id=10 tanggal=2026-07-10 (menunggu verifikasi)', NULL, NULL, NULL, '::1', '2026-07-10 09:53:10'),
(25, 4, 'admin3', 'create', 'monitoring_harian', 'Input harian kontrak_id=10 tanggal=2026-07-10 (menunggu verifikasi)', NULL, NULL, NULL, '::1', '2026-07-10 09:53:13'),
(26, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 09:53:22'),
(27, 2, 'admin2', 'recalc', 'rekap_sla', 'Hitung ulang dari data harian kontrak_id=8', NULL, NULL, NULL, '::1', '2026-07-10 10:09:13'),
(28, 3, 'admin4', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 10:15:32'),
(29, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 10:17:53'),
(30, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 10:18:25'),
(31, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 10:31:15'),
(32, 1, 'admin', 'approve', 'monitoring_harian', 'Menyetujui 21 data monitoring harian (id: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21)', NULL, NULL, NULL, '::1', '2026-07-10 10:31:48'),
(33, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=10', '{\"id\":10,\"nama_kontrak\":\"tes 10\\/07\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"10 juli\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":1,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JULI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-07-10 09:52:33\"}', NULL, NULL, '::1', '2026-07-10 10:32:34'),
(34, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=11', NULL, NULL, NULL, '::1', '2026-07-10 10:35:51'),
(35, 1, 'admin', 'update', 'input_sla', 'Update target/realisasi manual kontrak_id=11', '{\"Response Time Gangguan\":\"target=30, realisasi=0\",\"Recovery Time Gangguan\":\"target=100, realisasi=0\",\"Gangguan Berulang\":\"target=0.09, realisasi=0\",\"Inspeksi Tier 1 & 2\":\"target=100, realisasi=0\",\"Pemeliharaan ROW\":\"target=100, realisasi=0\",\"Pemeliharaan Gardu\":\"target=100, realisasi=0\",\"Pemeliharaan Peralatan Jaringan\":\"target=100, realisasi=0\",\"Kesesuaian Sampling\":\"target=100, realisasi=0\",\"Kompetensi SDM\":\"target=100, realisasi=0\",\"Peralatan Kerja Laik\":\"target=100, realisasi=0\",\"APD Sesuai Risiko\":\"target=100, realisasi=0\",\"Rambu dan LOTO\":\"target=100, realisasi=0\",\"Inspeksi K3 Management\":\"target=6, realisasi=0\"}', '{\"Response Time Gangguan\":\"target=30, realisasi=30\",\"Recovery Time Gangguan\":\"target=100, realisasi=100\",\"Gangguan Berulang\":\"target=0.09, realisasi=0.09\",\"Inspeksi Tier 1 & 2\":\"target=100, realisasi=100\",\"Pemeliharaan ROW\":\"target=100, realisasi=100\",\"Pemeliharaan Gardu\":\"target=100, realisasi=100\",\"Pemeliharaan Peralatan Jaringan\":\"target=100, realisasi=100\",\"Kesesuaian Sampling\":\"target=100, realisasi=100\",\"Kompetensi SDM\":\"target=100, realisasi=100\",\"Peralatan Kerja Laik\":\"target=100, realisasi=100\",\"APD Sesuai Risiko\":\"target=100, realisasi=100\",\"Rambu dan LOTO\":\"target=100, realisasi=100\",\"Inspeksi K3 Management\":\"target=6, realisasi=6\"}', NULL, '::1', '2026-07-10 10:35:56'),
(36, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=11', '{\"id\":11,\"nama_kontrak\":\"tesss\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"11\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":1,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JULI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-07-10 10:35:51\"}', NULL, NULL, '::1', '2026-07-10 10:39:56'),
(37, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 16:43:55'),
(38, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 16:52:50'),
(39, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-10 16:53:03'),
(40, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-13 08:48:25'),
(41, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-13 08:49:54'),
(42, 1, 'admin', 'update', 'user', 'Update user id=2', '{\"email\":\"admin2@gmail.com\"}', '{\"email\":\"ivancanz1234@gmail.com\"}', NULL, '::1', '2026-07-13 08:50:08'),
(43, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-13 09:06:17'),
(44, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-13 10:32:05'),
(45, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-15 08:37:43'),
(46, 1, 'admin', 'create', 'keypoint', 'Tambah data keypoint: tateli', NULL, '{\"kota\":\"Manado\",\"bidang\":\"SCADA\",\"tanggal\":\"2026-07-16\",\"bulan\":\"JULI\",\"lokasi\":\"tateli\",\"jenis_aset\":\"kp\",\"area\":\"SULUTGO\",\"wilayah\":\"Manado\",\"tim\":\"\",\"pekerjaan\":\"PEMELIHARAAN\",\"uraian_pekerjaan\":\"1. Mengukur Tegangan Ac dan dc\\r\\n2. Fuse Bagus\\r\\n3. Kondisi Luar\\/Dalam RTU  sudah di bersihkan\\r\\n4. Komisioning\",\"keterangan\":\"\",\"hasil_pemeliharaan\":\"NORMAL\",\"created_by\":1}', NULL, '::1', '2026-07-15 10:04:59'),
(47, 1, 'admin', 'update', 'keypoint', 'Update keypoint id=1', '{\"id\":1,\"kota\":\"Manado\",\"bidang\":\"SCADA\",\"tanggal\":\"2026-07-16\",\"bulan\":\"JULI\",\"lokasi\":\"tateli\",\"jenis_aset\":\"kp\",\"area\":\"SULUTGO\",\"wilayah\":\"Manado\",\"tim\":\"\",\"pekerjaan\":\"PEMELIHARAAN\",\"uraian_pekerjaan\":\"1. Mengukur Tegangan Ac dan dc\\r\\n2. Fuse Bagus\\r\\n3. Kondisi Luar\\/Dalam RTU  sudah di bersihkan\\r\\n4. Komisioning\",\"keterangan\":\"\",\"hasil_pemeliharaan\":\"NORMAL\",\"created_by\":1,\"created_at\":\"2026-07-15 10:04:59\",\"updated_at\":\"2026-07-15 10:04:59\"}', '{\"kota\":\"Manado\",\"bidang\":\"SCADA\",\"tanggal\":\"2026-07-16\",\"bulan\":\"JULI\",\"lokasi\":\"tateli\",\"jenis_aset\":\"kp\",\"area\":\"SULUTGO\",\"wilayah\":\"Manado\",\"tim\":\"\",\"pekerjaan\":\"PEMELIHARAAN\",\"uraian_pekerjaan\":\"1. Mengukur Tegangan Ac dan dc\\r\\n2. Fuse Bagus\\r\\n3. Kondisi Luar\\/Dalam RTU  sudah di bersihkan\\r\\n4. Komisioning\",\"keterangan\":\"asjnhndubajsnd\",\"hasil_pemeliharaan\":\"NORMAL\"}', NULL, '::1', '2026-07-15 10:07:22'),
(48, 1, 'admin', 'update', 'keypoint', 'Update keypoint id=1', '{\"id\":1,\"kota\":\"Manado\",\"bidang\":\"SCADA\",\"tanggal\":\"2026-07-16\",\"bulan\":\"JULI\",\"lokasi\":\"tateli\",\"jenis_aset\":\"kp\",\"area\":\"SULUTGO\",\"wilayah\":\"Manado\",\"tim\":\"\",\"pekerjaan\":\"PEMELIHARAAN\",\"uraian_pekerjaan\":\"1. Mengukur Tegangan Ac dan dc\\r\\n2. Fuse Bagus\\r\\n3. Kondisi Luar\\/Dalam RTU  sudah di bersihkan\\r\\n4. Komisioning\",\"keterangan\":\"asjnhndubajsnd\",\"hasil_pemeliharaan\":\"NORMAL\",\"created_by\":1,\"created_at\":\"2026-07-15 10:04:59\",\"updated_at\":\"2026-07-15 10:07:22\"}', '{\"kota\":\"Manado\",\"bidang\":\"SCADA\",\"tanggal\":\"2026-07-16\",\"bulan\":\"JULI\",\"lokasi\":\"tateli\",\"jenis_aset\":\"kp\",\"area\":\"SULUTGO\",\"wilayah\":\"Manado\",\"tim\":\"scadatel kotamubagu\",\"pekerjaan\":\"PEMELIHARAAN\",\"uraian_pekerjaan\":\"1. Mengukur Tegangan Ac dan dc\\r\\n2. Fuse Bagus\\r\\n3. Kondisi Luar\\/Dalam RTU  sudah di bersihkan\\r\\n4. Komisioning\",\"keterangan\":\"asjnhndubajsnd\",\"hasil_pemeliharaan\":\"NORMAL\"}', NULL, '::1', '2026-07-15 10:40:08'),
(49, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-17 15:06:12'),
(50, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-20 08:22:20'),
(51, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-20 09:43:46'),
(52, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 09:53:00'),
(53, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 13:22:16'),
(54, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 13:23:17'),
(55, 3, 'admin4', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 13:25:30'),
(56, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 13:26:29'),
(57, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 13:44:33'),
(58, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 15:09:24'),
(59, 2, 'admin2', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 15:10:55'),
(60, 3, 'admin4', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 15:17:38'),
(61, 3, 'admin4', 'delete', 'kontrak', 'Hapus kontrak id=8', '{\"id\":8,\"nama_kontrak\":\"PEMBORONGAN PEKERJAAN PENGOPERASIAN DAN PEMELIHARAAN GARDU INDUK UPT MANADO\",\"no_kontrak_1\":\"013.PJ.PkL\\/DAN.01.02.03\\/C48000000\\/2021\",\"no_kontrak_2\":\"0044.Pj\\/DAN.01.03\\/PLNT010000\\/2021\",\"tgl_kontrak\":\"30 September 2021\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":1,\"up3\":\"UPT MANADO\",\"periode_bulan\":\"FEBRUARI\",\"tahun\":2026,\"tahap\":\"2\",\"jenis_kontrak\":\"TRANSMISI\",\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-07-02 10:34:46\"}', NULL, NULL, '::1', '2026-07-21 15:18:23'),
(62, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 15:20:26'),
(63, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 16:32:23'),
(64, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-21 16:46:33'),
(65, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-07-24 11:38:39'),
(66, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-04 07:50:05'),
(67, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-04 08:24:35'),
(68, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-12 15:50:28'),
(69, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-19 08:20:57'),
(70, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-19 08:44:28'),
(71, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-26 09:30:12'),
(72, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-27 03:01:52'),
(73, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-28 11:26:46'),
(74, 1, 'admin', 'delete', 'vendor', 'Hapus vendor id=1', '{\"id\":1,\"nama_vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"alamat\":null,\"pic\":null,\"no_telp\":null,\"email\":null,\"npwp\":null,\"status\":\"Aktif\",\"created_at\":\"2026-08-28 11:32:09\"}', NULL, NULL, '::1', '2026-08-28 11:44:15'),
(75, 1, 'admin', 'delete', 'vendor', 'Hapus vendor id=2', '{\"id\":2,\"nama_vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"alamat\":null,\"pic\":null,\"no_telp\":null,\"email\":null,\"npwp\":null,\"status\":\"Aktif\",\"created_at\":\"2026-08-28 11:44:15\"}', NULL, NULL, '::1', '2026-08-28 15:33:49'),
(76, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-08-31 10:38:01'),
(77, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=1', NULL, NULL, NULL, '::1', '2026-08-31 14:06:09'),
(78, 1, 'admin', 'update', 'sla_entries', 'Ubah target bulanan sla_entry_id=8', '{\"target\":0}', '{\"target\":100}', NULL, '::1', '2026-08-31 14:06:51'),
(79, 1, 'admin', 'create', 'monitoring_harian', 'Input harian kontrak_id=1 tanggal=2026-01-15', NULL, NULL, NULL, '::1', '2026-08-31 14:06:51'),
(80, 1, 'admin', 'create', 'monitoring_harian', 'Input harian kontrak_id=1 tanggal=2026-01-15', NULL, NULL, NULL, '::1', '2026-08-31 14:06:52'),
(81, 1, 'admin', 'update', 'sla_entries', 'Ubah target bulanan sla_entry_id=9', '{\"target\":0}', '{\"target\":5}', NULL, '::1', '2026-08-31 14:07:09'),
(82, 1, 'admin', 'create', 'monitoring_harian', 'Input harian kontrak_id=1 tanggal=2026-01-15', NULL, NULL, NULL, '::1', '2026-08-31 14:07:09'),
(83, 1, 'admin', 'update', 'sla_entries', 'Isi keterangan indikator SLA: Kompetensi SDM Pembangkit (kontrak_id=1)', NULL, NULL, NULL, '::1', '2026-08-31 14:12:55'),
(84, 1, 'admin', 'update', 'sla_entries', 'Isi keterangan indikator SLA: Kompetensi SDM Pembangkit (kontrak_id=1)', NULL, NULL, NULL, '::1', '2026-08-31 14:13:13'),
(85, 1, 'admin', 'update', 'sla_entries', 'Isi keterangan indikator SLA: Kompetensi SDM Pembangkit (kontrak_id=1)', NULL, NULL, NULL, '::1', '2026-08-31 14:13:40'),
(86, 1, 'admin', 'create', 'monitoring_harian', 'Input harian kontrak_id=1 tanggal=2026-01-15', NULL, NULL, NULL, '::1', '2026-08-31 14:37:29'),
(87, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=1', '{\"id\":1,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO)\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JANUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"PEMBANGKIT\",\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-08-31 14:06:09\"}', NULL, NULL, '::1', '2026-08-31 14:39:31'),
(88, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=2', NULL, NULL, NULL, '::1', '2026-08-31 14:39:36'),
(89, 1, 'admin', 'update', 'input_sla', 'Update target/realisasi manual kontrak_id=2', '{\"Response Time Gangguan\":\"target=30, realisasi=0\"}', '{\"Response Time Gangguan\":\"target=30, realisasi=20\"}', NULL, '::1', '2026-08-31 14:41:35'),
(90, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-01 08:03:38'),
(91, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=2', '{\"id\":2,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO)\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JANUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-08-31 14:39:36\"}', NULL, NULL, '::1', '2026-09-01 09:02:39'),
(92, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-02 09:12:46'),
(93, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=3', NULL, NULL, NULL, '::1', '2026-09-02 09:12:57'),
(94, 1, 'admin', 'update', 'input_sla', 'Update target/realisasi manual kontrak_id=3', NULL, NULL, NULL, '::1', '2026-09-02 09:13:01'),
(95, 1, 'admin', 'create', 'monitoring_harian', 'Input harian kontrak_id=3 tanggal=2026-01-25', NULL, NULL, NULL, '::1', '2026-09-02 09:13:08'),
(96, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=3', '{\"id\":3,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO)\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JANUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":null,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-02 09:12:57\"}', NULL, NULL, '::1', '2026-09-02 10:15:53'),
(97, 1, 'admin', 'update', 'unit_kerja', 'Update unit kerja id=1', '{\"jenis_kontrak\":\"DISTRIBUSI\"}', '{\"jenis_kontrak\":\"TRANSMISI\"}', NULL, '::1', '2026-09-02 11:29:13'),
(98, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=3', '{\"id\":3,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"OPGI\",\"nama\":\"OPGI\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-02 11:29:13\"}', NULL, NULL, '::1', '2026-09-02 11:29:18'),
(99, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=4', '{\"id\":4,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"OPGI\",\"nama\":\"OPGI\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-02 11:29:18\"}', NULL, NULL, '::1', '2026-09-02 11:30:42'),
(100, 1, 'admin', 'update', 'unit_kerja', 'Update unit kerja id=2', '{\"nama\":\"GP\"}', '{\"nama\":\"UPT MANADO\"}', NULL, '::1', '2026-09-02 11:31:06'),
(101, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=5', '{\"id\":5,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"OPGI\",\"nama\":\"OPGI\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-02 11:30:42\"}', NULL, NULL, '::1', '2026-09-02 11:31:20'),
(102, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=4', NULL, NULL, NULL, '::1', '2026-09-02 11:35:46'),
(103, 1, 'admin', 'update', 'input_sla', 'Update target/realisasi manual kontrak_id=4', NULL, NULL, NULL, '::1', '2026-09-02 11:36:10'),
(104, 1, 'admin', 'update', 'input_sla', 'Update target/realisasi manual kontrak_id=4', NULL, NULL, NULL, '::1', '2026-09-02 11:36:14'),
(105, 1, 'admin', 'recalc', 'rekap_sla', 'Hitung ulang dari data harian kontrak_id=4', NULL, NULL, NULL, '::1', '2026-09-02 11:36:39'),
(106, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=4', '{\"id\":4,\"nama_kontrak\":\"O&M Distribusi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JANUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"TRANSMISI\",\"unit_id\":2,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-02 11:35:46\"}', NULL, NULL, '::1', '2026-09-02 11:57:38'),
(107, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=5', NULL, NULL, NULL, '::1', '2026-09-02 11:57:47'),
(108, 1, 'admin', 'create', 'unit_kerja', 'Tambah unit kerja: DISTRIBUSI - bbb', NULL, '{\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"aaaa\",\"nama\":\"bbb\",\"keterangan\":null,\"urutan\":0,\"is_active\":1}', NULL, '::1', '2026-09-02 13:40:45'),
(109, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=6', NULL, NULL, NULL, '::1', '2026-09-02 13:41:19'),
(110, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-08 07:43:49'),
(111, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-08 07:48:14'),
(112, 1, 'admin', 'create', 'monitoring_harian', 'Input harian kontrak_id=6 periode=1 waktu_input=2026-09-08 04:11:29', NULL, NULL, NULL, '::1', '2026-09-08 10:11:29'),
(113, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=5', '{\"id\":5,\"nama_kontrak\":\"O&M Distribusi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JANUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"TRANSMISI\",\"unit_id\":2,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-02 11:57:47\"}', NULL, NULL, '::1', '2026-09-08 10:32:32'),
(114, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=7', NULL, NULL, NULL, '::1', '2026-09-08 10:33:25'),
(115, 1, 'admin', 'create', 'unit_kerja', 'Tambah unit kerja: TRANSMISI - hartrans', NULL, '{\"jenis_kontrak\":\"TRANSMISI\",\"kode\":\"hartrans\",\"nama\":\"hartrans\",\"keterangan\":null,\"urutan\":0,\"is_active\":1}', NULL, '::1', '2026-09-08 10:37:50'),
(116, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=6', '{\"id\":6,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"OPGI\",\"nama\":\"OPGI\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-02 11:31:21\"}', NULL, NULL, '::1', '2026-09-08 10:41:18'),
(117, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=9', '{\"id\":9,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"OPGI\",\"nama\":\"OPGI\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-08 10:41:18\"}', NULL, NULL, '::1', '2026-09-08 10:41:28'),
(118, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=6', '{\"id\":6,\"nama_kontrak\":\"aaaa\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"bbb\",\"periode_bulan\":\"AGUSTUS\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":7,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-02 13:41:19\"}', NULL, NULL, '::1', '2026-09-08 11:38:41'),
(119, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=8', NULL, NULL, NULL, '::1', '2026-09-08 14:35:45'),
(120, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=10', '{\"id\":10,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"OPGI\",\"nama\":\"OPGI\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-08 10:41:28\"}', NULL, NULL, '::1', '2026-09-08 14:43:16'),
(121, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=8', '{\"id\":8,\"jenis_kontrak\":\"TRANSMISI\",\"kode\":\"hartrans\",\"nama\":\"hartrans\",\"keterangan\":null,\"urutan\":0,\"is_active\":1,\"created_at\":\"2026-09-08 10:37:50\"}', NULL, NULL, '::1', '2026-09-08 15:21:08'),
(122, 1, 'admin', 'create', 'unit_kerja', 'Tambah unit kerja: DISTRIBUSI - keypoint scada', NULL, '{\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"SCADA\",\"nama\":\"keypoint scada\",\"keterangan\":null,\"urutan\":0,\"is_active\":1}', NULL, '::1', '2026-09-08 15:42:53'),
(123, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=9', NULL, NULL, NULL, '::1', '2026-09-08 15:43:22'),
(124, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=11', '{\"id\":11,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"SCADA\",\"nama\":\"keypoint scada\",\"keterangan\":null,\"urutan\":0,\"is_active\":1,\"created_at\":\"2026-09-08 15:42:53\"}', NULL, NULL, '::1', '2026-09-09 08:41:15'),
(125, 1, 'admin', 'create', 'unit_kerja', 'Tambah unit kerja: DISTRIBUSI - UNIT LAYANAN MANADO', NULL, '{\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"UL MANADO\",\"nama\":\"UNIT LAYANAN MANADO\",\"keterangan\":null,\"urutan\":0,\"is_active\":1}', NULL, '::1', '2026-09-09 09:04:10'),
(126, 1, 'admin', 'create', 'unit_kerja', 'Tambah unit kerja: DISTRIBUSI - UNIT LAYANAN TAHUNA', NULL, '{\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"UL TAHUNA\",\"nama\":\"UNIT LAYANAN TAHUNA\",\"keterangan\":null,\"urutan\":0,\"is_active\":1}', NULL, '::1', '2026-09-09 09:04:26'),
(127, 1, 'admin', 'create', 'unit_kerja', 'Tambah unit kerja: DISTRIBUSI - UNIT LAYANAN KOTAMOBAGU', NULL, '{\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"UL KOTAMOBAGU\",\"nama\":\"UNIT LAYANAN KOTAMOBAGU\",\"keterangan\":null,\"urutan\":0,\"is_active\":1}', NULL, '::1', '2026-09-09 09:04:49'),
(128, 1, 'admin', 'update', 'unit_kerja', 'Update unit kerja id=2', '{\"nama\":\"UPT MANADO\"}', '{\"nama\":\"GROUND PATROL\"}', NULL, '::1', '2026-09-09 09:05:09'),
(129, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=9', '{\"id\":9,\"nama_kontrak\":\"distribusi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JUNI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":null,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-08 15:43:21\"}', NULL, NULL, '::1', '2026-09-09 09:05:30'),
(130, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=8', '{\"id\":8,\"nama_kontrak\":\"O&M Distribusi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"AGUSTUS\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":null,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-08 14:35:45\"}', NULL, NULL, '::1', '2026-09-09 09:05:33'),
(131, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=7', '{\"id\":7,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"aaaa\",\"nama\":\"bbb\",\"keterangan\":null,\"urutan\":0,\"is_active\":1,\"created_at\":\"2026-09-02 13:40:45\"}', NULL, NULL, '::1', '2026-09-09 09:06:19'),
(132, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=13', '{\"id\":13,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"UL TAHUNA\",\"nama\":\"UNIT LAYANAN TAHUNA\",\"keterangan\":null,\"urutan\":0,\"is_active\":1,\"created_at\":\"2026-09-09 09:04:26\"}', NULL, NULL, '::1', '2026-09-09 09:32:19'),
(133, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=12', '{\"id\":12,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"UL MANADO\",\"nama\":\"UNIT LAYANAN MANADO\",\"keterangan\":null,\"urutan\":0,\"is_active\":1,\"created_at\":\"2026-09-09 09:04:10\"}', NULL, NULL, '::1', '2026-09-09 09:32:22'),
(134, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=14', '{\"id\":14,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"UL KOTAMOBAGU\",\"nama\":\"UNIT LAYANAN KOTAMOBAGU\",\"keterangan\":null,\"urutan\":0,\"is_active\":1,\"created_at\":\"2026-09-09 09:04:49\"}', NULL, NULL, '::1', '2026-09-09 09:32:24'),
(135, 1, 'admin', 'update', 'unit_kerja', 'Update unit kerja id=15', '{\"nama\":\"Distribusi\"}', '{\"nama\":\"Unit Layanan Kotamobagu\"}', NULL, '::1', '2026-09-09 09:32:46'),
(136, 1, 'admin', 'update', 'unit_kerja', 'Update unit kerja id=15', '{\"kode\":\"DISTRIBUSI\"}', '{\"kode\":\"KOTAMOBAGU\"}', NULL, '::1', '2026-09-09 09:32:59'),
(137, 1, 'admin', 'update', 'unit_kerja', 'Update unit kerja id=18', '{\"nama\":\"Distribusi\"}', '{\"nama\":\"TES\"}', NULL, '::1', '2026-09-09 14:45:03'),
(138, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=10', NULL, NULL, NULL, '::1', '2026-09-09 14:45:39'),
(139, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=11', NULL, NULL, NULL, '::1', '2026-09-09 14:46:14'),
(140, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=12', NULL, NULL, NULL, '::1', '2026-09-09 14:47:04'),
(141, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-16 09:30:03'),
(142, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-17 08:56:27'),
(143, 1, 'admin', 'update', 'unit_kerja', 'Update unit kerja id=18', '{\"kode\":\"DISTRIBUSI\"}', '{\"kode\":\"tes\"}', NULL, '::1', '2026-09-17 09:04:31'),
(144, 1, 'admin', 'update', 'unit_kerja', 'Update unit kerja id=19', '{\"nama\":\"Distribusi\"}', '{\"nama\":\"tes\"}', NULL, '::1', '2026-09-17 09:04:41'),
(145, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=19', '{\"id\":19,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"DISTRIBUSI\",\"nama\":\"tes\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-17 09:04:31\"}', NULL, NULL, '::1', '2026-09-17 09:04:47'),
(146, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=20', '{\"id\":20,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"DISTRIBUSI\",\"nama\":\"Distribusi\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-17 09:04:47\"}', NULL, NULL, '::1', '2026-09-17 09:05:00'),
(147, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=18', '{\"id\":18,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"tes\",\"nama\":\"TES\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-09 09:32:59\"}', NULL, NULL, '::1', '2026-09-17 09:05:04'),
(148, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=13', NULL, NULL, NULL, '::1', '2026-09-17 09:09:38'),
(149, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=13', '{\"id\":13,\"nama_kontrak\":\"tes opgi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"APRIL\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"TRANSMISI\",\"unit_id\":1,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-17 09:09:38\"}', NULL, NULL, '::1', '2026-09-17 14:45:27'),
(150, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=7', '{\"id\":7,\"nama_kontrak\":\"tes transmisi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JANUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"TRANSMISI\",\"unit_id\":2,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-08 10:33:25\"}', NULL, NULL, '::1', '2026-09-17 14:45:37'),
(151, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=12', '{\"id\":12,\"nama_kontrak\":\"TES OPGI TRANSMISI\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"OKTOBER\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"TRANSMISI\",\"unit_id\":1,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-09 14:47:04\"}', NULL, NULL, '::1', '2026-09-17 14:46:50'),
(152, 1, 'admin', 'delete', 'unit_kerja', 'Hapus unit kerja id=15', '{\"id\":15,\"jenis_kontrak\":\"DISTRIBUSI\",\"kode\":\"KOTAMOBAGU\",\"nama\":\"Unit Layanan Kotamobagu\",\"keterangan\":null,\"urutan\":1,\"is_active\":1,\"created_at\":\"2026-09-09 09:31:49\"}', NULL, NULL, '::1', '2026-09-17 14:47:12'),
(153, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=14', NULL, NULL, NULL, '::1', '2026-09-17 14:47:33'),
(154, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-17 16:08:58'),
(155, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=14', '{\"id\":14,\"nama_kontrak\":\"tes O&M Distribusi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"JANUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":16,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-17 14:47:33\"}', NULL, NULL, '::1', '2026-09-18 12:29:14'),
(156, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=11', '{\"id\":11,\"nama_kontrak\":\"TES GP TRANSMISI\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"APRIL\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"TRANSMISI\",\"unit_id\":2,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-09 14:46:14\"}', NULL, NULL, '::1', '2026-09-18 13:22:20'),
(157, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=10', '{\"id\":10,\"nama_kontrak\":\"O&M Distribusi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"APRIL\",\"tahun\":2026,\"tahap\":\"TAHAP-1\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":null,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-09 14:45:39\"}', NULL, NULL, '::1', '2026-09-18 13:22:24'),
(158, 1, 'admin', 'update', 'kontrak', 'Update kontrak id=17', '{\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 TAHUNA\",\"nilai_tagihan_tahap1\":1783514989.95,\"nilai_tagihan_tahap2\":736934721.72}', '{\"nama_kontrak\":\"O&M Distribusi Tahuna\",\"nilai_tagihan_tahap1\":178351498995,\"nilai_tagihan_tahap2\":73693472172}', NULL, '::1', '2026-09-18 13:22:43'),
(159, 1, 'admin', 'update', 'input_sla', 'Update target/realisasi manual kontrak_id=17', '{\"Melakukan penanganan gangguan\":\"target=80.890041516784, realisasi=62.41\",\"Melakukan inspeksi tier 1 dan tier 2 ja…\":\"target=320.1825, realisasi=137.76677137807\",\"Melakukan pemeliharaan jaringan, melipu…\":\"target=87.75, realisasi=45.819644605177\",\"Alat Keselamatan Kerja ( APD, Rambu, LO…\":\"target=1, realisasi=0.90725326991677\"}', '{\"Melakukan penanganan gangguan\":\"target=80.890041516784, realisasi=62.41\",\"Melakukan inspeksi tier 1 dan tier 2 ja…\":\"target=320.1825, realisasi=137.76677137807\",\"Melakukan pemeliharaan jaringan, melipu…\":\"target=87.75, realisasi=45.819644605177\",\"Alat Keselamatan Kerja ( APD, Rambu, LO…\":\"target=1, realisasi=0.90725326991677\"}', NULL, '::1', '2026-09-18 13:23:03'),
(160, 1, 'admin', 'update', 'kontrak', 'Update kontrak id=15', '{\"nama_kontrak\":\"PEMBORONGAN PEKERJAAN PENGOPERASIAN & PEMELIHARAAN GARDU INDUK PT PLN (PERSERO) UPT MANADO\",\"nilai_tagihan_tahap2\":1101033873.05}', '{\"nama_kontrak\":\"O&M GI UPT MANADO\",\"nilai_tagihan_tahap2\":110103387305}', NULL, '::1', '2026-09-18 13:24:00'),
(161, 1, 'admin', 'update', 'kontrak', 'Update kontrak id=16', '{\"nama_kontrak\":\"PEKERJAAN PELAKSANAAN GROUND PATROL VOLUME BASED DI LINGKUNGAN PT PLN (PERSERO) UIP3B SULAWESI PADA UPT MANADO\"}', '{\"nama_kontrak\":\"GROUND PATROL UPT MANADO\"}', NULL, '::1', '2026-09-18 13:24:54'),
(162, 1, 'admin', 'update', 'kontrak', 'Update kontrak id=16', NULL, NULL, NULL, '::1', '2026-09-18 13:24:58'),
(163, 1, 'admin', 'update', 'kontrak', 'Update kontrak id=16', NULL, NULL, NULL, '::1', '2026-09-18 13:25:10'),
(164, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=18', NULL, NULL, NULL, '::1', '2026-09-18 14:07:54'),
(165, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=19', '{\"id\":19,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 MANADO (B)\",\"no_kontrak_1\":\"0399.PJ\\/DAN.01.03\\/F15000000\\/2025\",\"no_kontrak_2\":null,\"tgl_kontrak\":null,\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO (B)\",\"periode_bulan\":\"FEBRUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":16,\"nilai_tagihan_tahap1\":1875861098.02,\"nilai_tagihan_tahap2\":1392889343.27,\"created_at\":\"2026-09-18 15:18:40\"}', NULL, NULL, '::1', '2026-09-18 15:36:49'),
(166, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=20', '{\"id\":20,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 KEPULAUAN\",\"no_kontrak_1\":null,\"no_kontrak_2\":null,\"tgl_kontrak\":null,\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 KEPULAUAN\",\"periode_bulan\":\"FEBRUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":26,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-18 15:18:40\"}', NULL, NULL, '::1', '2026-09-18 15:36:55'),
(167, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=23', '{\"id\":23,\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 MANADO (B)\",\"no_kontrak_1\":\"0399.PJ\\/DAN.01.03\\/F15000000\\/2025\",\"no_kontrak_2\":null,\"tgl_kontrak\":null,\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO (B)\",\"periode_bulan\":\"FEBRUARI\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":16,\"nilai_tagihan_tahap1\":1875861098.02,\"nilai_tagihan_tahap2\":1392889343.27,\"created_at\":\"2026-09-18 15:25:02\"}', NULL, NULL, '::1', '2026-09-18 15:36:59'),
(168, 1, 'admin', 'delete', 'kontrak', 'Hapus kontrak id=18', '{\"id\":18,\"nama_kontrak\":\"O&M Distribusi\",\"no_kontrak_1\":\"\",\"no_kontrak_2\":\"\",\"tgl_kontrak\":\"\",\"vendor\":\"PT PELAYANAN LISTRIK NASIONAL NUSA DAYA\",\"vendor_id\":3,\"up3\":\"UP3 MANADO\",\"periode_bulan\":\"SEPTEMBER\",\"tahun\":2026,\"tahap\":\"TAHAP-2\",\"jenis_kontrak\":\"DISTRIBUSI\",\"unit_id\":23,\"nilai_tagihan_tahap1\":0,\"nilai_tagihan_tahap2\":0,\"created_at\":\"2026-09-18 14:07:54\"}', NULL, NULL, '::1', '2026-09-18 15:37:32'),
(169, 1, 'admin', 'update', 'kontrak', 'Update kontrak id=24', '{\"nama_kontrak\":\"PENUGASAN PEKERJAAN LAYANAN OPERASI DAN PEMELIHARAAN DISTRIBUSI PT PLN (PERSERO) UP3 MANADO (B)\",\"nilai_tagihan_tahap1\":1875861098.02,\"nilai_tagihan_tahap2\":1392889343.27}', '{\"nama_kontrak\":\"O&M Distribusi Manado\",\"nilai_tagihan_tahap1\":187586109802,\"nilai_tagihan_tahap2\":139288934327}', NULL, '::1', '2026-09-18 15:38:19'),
(170, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-23 08:07:32'),
(171, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-28 08:10:50'),
(172, 1, 'admin', 'update', 'kontrak', 'Update kontrak id=24', NULL, NULL, NULL, '::1', '2026-09-28 08:12:01'),
(173, 1, 'admin', 'create', 'kontrak', 'Tambah kontrak id=25', NULL, NULL, NULL, '::1', '2026-09-28 08:12:40'),
(174, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '192.168.120.112', '2026-09-28 19:36:06'),
(175, 1, 'admin', 'create', 'user', 'Tambah user: tes', NULL, '{\"nama\":\"tes1\",\"username\":\"tes\",\"email\":\"tes@gmail.com\",\"role\":\"Koordinator\",\"status\":\"Aktif\"}', NULL, '::1', '2026-09-28 19:38:26'),
(176, 5, 'tes', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-28 19:39:07'),
(177, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-09-28 20:06:17'),
(178, 1, 'admin', 'update', 'input_sla', 'Update target/realisasi manual kontrak_id=25', '{\"Inspeksi Tier 1 & 2\":\"target=100, realisasi=0\",\"Pemeliharaan ROW\":\"target=100, realisasi=0\"}', '{\"Inspeksi Tier 1 & 2\":\"target=100, realisasi=100\",\"Pemeliharaan ROW\":\"target=100, realisasi=13\"}', NULL, '::1', '2026-09-28 20:20:12'),
(179, 1, 'admin', 'login', 'auth', 'Login berhasil', NULL, NULL, NULL, '::1', '2026-10-01 09:11:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL,
  `kontrak_id` int(11) NOT NULL,
  `ulp_id` int(11) DEFAULT NULL,
  `jenis_kendaraan` enum('MOBIL','MOTOR') DEFAULT NULL,
  `fungsi_kendaraan` varchar(150) DEFAULT NULL,
  `merk_type` varchar(150) DEFAULT NULL,
  `tahun` varchar(10) DEFAULT NULL,
  `nomor_polisi` varchar(30) DEFAULT NULL,
  `warna` varchar(50) DEFAULT NULL,
  `lokasi` varchar(150) DEFAULT NULL,
  `nama_ulp` varchar(150) DEFAULT NULL,
  `nama_koordinator` varchar(150) DEFAULT NULL,
  `no_hp_koordinator` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keypoint_entries`
--

CREATE TABLE `keypoint_entries` (
  `id` int(11) NOT NULL,
  `kota` varchar(30) NOT NULL COMMENT 'Manado, Tahuna, Kotamobagu, Tolitoli, Gorontalo, Luwuk, Palu',
  `bidang` varchar(30) NOT NULL COMMENT 'SCADA, Telekomunikasi, Proteksi',
  `tanggal` date NOT NULL,
  `bulan` varchar(20) DEFAULT NULL COMMENT 'Nama bulan (Indonesia), diturunkan otomatis dari tanggal',
  `lokasi` varchar(150) DEFAULT NULL COMMENT 'Nama titik / gardu / lokasi keypoint, mis. LBS SAMPIRO',
  `jenis_aset` varchar(50) DEFAULT NULL COMMENT 'Mis. KP, GI, LBS, dll',
  `area` varchar(50) DEFAULT NULL COMMENT 'Mis. SULUTGO',
  `wilayah` varchar(50) DEFAULT NULL COMMENT 'Mis. Kotamobagu, Manado',
  `tim` varchar(150) DEFAULT NULL COMMENT 'Nama tim pelaksana, mis. Tim SCADATEL Kotamobagu',
  `pekerjaan` varchar(150) DEFAULT NULL COMMENT 'Mis. Pemeliharaan Preventif',
  `uraian_pekerjaan` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `hasil_pemeliharaan` varchar(100) DEFAULT NULL COMMENT 'Mis. NORMAL / ADA GANGGUAN',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keypoint_entries`
--

INSERT INTO `keypoint_entries` (`id`, `kota`, `bidang`, `tanggal`, `bulan`, `lokasi`, `jenis_aset`, `area`, `wilayah`, `tim`, `pekerjaan`, `uraian_pekerjaan`, `keterangan`, `hasil_pemeliharaan`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Manado', 'SCADA', '2026-07-16', 'JULI', 'tateli', 'kp', 'SULUTGO', 'Manado', 'scadatel kotamubagu', 'PEMELIHARAAN', '1. Mengukur Tegangan Ac dan dc\r\n2. Fuse Bagus\r\n3. Kondisi Luar/Dalam RTU  sudah di bersihkan\r\n4. Komisioning', 'asjnhndubajsnd', 'NORMAL', 1, '2026-07-15 10:04:59', '2026-07-15 10:40:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keypoint_eviden`
--

CREATE TABLE `keypoint_eviden` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keypoint_eviden`
--

INSERT INTO `keypoint_eviden` (`id`, `entry_id`, `file_path`, `urutan`, `created_at`) VALUES
(1, 1, 'storage/keypoint/kp_1_1784081099_01cb664b.jpg', 1, '2026-07-15 10:04:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keypoint_personil`
--

CREATE TABLE `keypoint_personil` (
  `id` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL COMMENT 'Nomor urut sesuai data sumber (Excel)',
  `jabatan` varchar(100) NOT NULL COMMENT 'Mis. Koordinator, Pengawas K3, Admin, Har Proteksi, Har Scada, Dispatcher',
  `penempatan` varchar(50) NOT NULL COMMENT 'Kota/wilayah penempatan, mis. Manado, Kotamobagu, Manado-Tahuna',
  `nama` varchar(150) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keypoint_personil`
--

INSERT INTO `keypoint_personil` (`id`, `no_urut`, `jabatan`, `penempatan`, `nama`, `nip`, `created_at`, `updated_at`) VALUES
(1, 1, 'Koordinator + Pengawas K3', 'Manado', 'STEVY STEVANUS TAMA', '02235848MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(2, 2, 'Pengawas K3', 'Manado', 'ARNALDO TUKUSAN', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(3, 3, 'Pengawas K3', 'Palu', 'MUHAMAD FAISAL', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(4, 5, 'Admin', 'Manado', 'MUH AQSA TRIPUTRA', '02253790MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(5, 6, 'Admin', 'Manado', 'RICCHAD JOY SAMOSIR', '99253788MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(6, 7, 'Admin', 'Manado', 'THEODORA PAULINA SINAMBELA', '99253789MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(7, 8, 'Admin', 'Palu', 'FITRI NATALIA', '00253739MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(8, 9, 'Har Proteksi', 'Manado', 'STEINER STEFANUS PAILAH', '02253735MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(9, 10, 'Har Proteksi', 'Manado', 'JULIO CHRISTOFEL MONTOLALU', '97253787MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(10, 11, 'Har Proteksi', 'Kotamobagu', 'HENDRA VAN GOBEL', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(11, 12, 'Har Proteksi', 'Kotamobagu', 'YOSUA MOMONGAN', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(12, 13, 'Har Proteksi', 'Manado-Tahuna', 'GHYAN F.DAMBAT', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(13, 14, 'Har Proteksi', 'Manado-Tahuna', 'ANDRIS WILEM SASUBE', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(14, 15, 'Har Proteksi', 'Gorontalo', 'FADLI BIKI', '91253737MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(15, 16, 'Har Proteksi', 'Gorontalo', 'MOHAMAD REYNALDI', '03253738MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(16, 17, 'Har Proteksi', 'Palu', 'MUHAMMAD ARDIANSYAH HUSFIRA', '01242910MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(17, 18, 'Har Proteksi', 'Palu', 'ADI PUTRA', '94242906MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(18, 19, 'Har Proteksi', 'Toli-Toli', 'ALDI ARDIANSYAH', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(19, 20, 'Har Proteksi', 'Toli-Toli', 'ARIYANTO ZEES', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(20, 21, 'Har Proteksi', 'Luwuk', 'WAHYU HIDAYATULLAH', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(21, 22, 'Har Proteksi', 'Luwuk', 'AGHIL FAHREZY', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(22, 23, 'Har Scada', 'Manado-Tahuna', 'CHRISTY DAVID BIONDY MENDUR', '91242908MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(23, 24, 'Har Scada', 'Manado-Tahuna', 'KEVIN NOEHANS RAJAGUKGUK', '03253460MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(24, 25, 'Har Scada', 'Kotamobagu', 'DENFRI LEMPOY', '80242912MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(25, 26, 'Har Scada', 'Kotamobagu', 'ALAN ROY OPING', '03242913MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(26, 27, 'Har Scada', 'Manado-Tahuna', 'EVAN ELIEZER SIALLANGAN', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(27, 28, 'Har Scada', 'Manado-Tahuna', 'ARIF KEMPA', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(28, 29, 'Har Scada', 'Gorontalo', 'ISMAIL ABDUL GANI', '95242907MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(29, 30, 'Har Scada', 'Gorontalo', 'IQRAM ANDRIYAN RAHMAN', '94242905MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(30, 31, 'Har Scada', 'Palu', 'STEVAN UMBURANTE', '95242911MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(31, 32, 'Har Scada', 'Palu', 'VERON LASORO', '02242909MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(32, 33, 'Har Scada', 'Palu', 'AFRANDI', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(33, 34, 'Har Scada', 'Palu', 'RISALDI MUNANDAR', NULL, '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(34, 35, 'Har Scada', 'Toli-Toli', 'TAKBIR', '02253736MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(35, 36, 'Har Scada', 'Toli-Toli', 'SUTJIPTO', '01253742MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(36, 37, 'Har Scada', 'Luwuk', 'SARIPUDIN', '95253740MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(37, 38, 'Har Scada', 'Luwuk', 'FAGIL DEWANSYAH', '97253741MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(38, 39, 'Dispatcher', 'Luwuk', 'AQSYA RADITYA', '97263980MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(39, 40, 'Dispatcher', 'Luwuk', 'DANI KURNIAWAN', '06263977MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(40, 41, 'Dispatcher', 'Luwuk', 'FIRMANSYAH BAOMPOM', '00263981MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(41, 42, 'Dispatcher', 'Luwuk', 'MUCHTAR ADITYA', '99263976MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(42, 43, 'Dispatcher', 'Luwuk', 'MUHAMMAD ZHADZID', '00263978MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(43, 44, 'Dispatcher', 'Luwuk', 'JANUAR RISKI PUTRA', '94263974MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(44, 45, 'Dispatcher', 'Luwuk', 'SUMAN YEHUDA SAMOSIR', '01263975MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24'),
(45, 46, 'Dispatcher', 'Luwuk', 'YUDITH PRANATA LAGAMU', '97263979MDO', '2026-07-15 10:32:24', '2026-07-15 10:32:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keypoint_tim`
--

CREATE TABLE `keypoint_tim` (
  `id` int(11) NOT NULL,
  `kota` varchar(30) NOT NULL,
  `bidang` varchar(30) NOT NULL,
  `nama_tim` varchar(150) NOT NULL,
  `personil` varchar(255) DEFAULT NULL COMMENT 'Nama-nama anggota, dipisah koma',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontrak`
--

CREATE TABLE `kontrak` (
  `id` int(11) NOT NULL,
  `nama_kontrak` text DEFAULT NULL,
  `no_kontrak_1` varchar(255) DEFAULT NULL,
  `no_kontrak_2` varchar(255) DEFAULT NULL,
  `tgl_kontrak` varchar(100) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `up3` varchar(255) DEFAULT NULL,
  `periode_bulan` varchar(50) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `tahap` varchar(50) DEFAULT NULL,
  `jenis_kontrak` varchar(50) DEFAULT 'DISTRIBUSI',
  `unit_id` int(11) DEFAULT NULL,
  `nilai_tagihan_tahap1` double DEFAULT 0,
  `nilai_tagihan_tahap2` double DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontrak`
--

INSERT INTO `kontrak` (`id`, `nama_kontrak`, `no_kontrak_1`, `no_kontrak_2`, `tgl_kontrak`, `vendor`, `vendor_id`, `up3`, `periode_bulan`, `tahun`, `tahap`, `jenis_kontrak`, `unit_id`, `nilai_tagihan_tahap1`, `nilai_tagihan_tahap2`, `created_at`) VALUES
(15, 'O&M GI UPT MANADO', '013.PJ.PkL/DAN.01.02.03/C48000000/2021', '0044.Pj/DAN.01.03/PLNT010000/2021', '30 September 2021', 'PT PELAYANAN LISTRIK NASIONAL NUSA DAYA', 3, 'UPT MANADO', 'FEBRUARI', 2026, 'TAHAP-2', 'TRANSMISI', 1, 0, 110103387305, '2026-09-18 12:28:41'),
(16, 'GROUND PATROL UPT MANADO', '0007.Pj/DAN.01.02/C48000000/2021', '00010.Add/HKM.02.01/F47000000/2025', '30 September 2021 (Addendum VII)', 'PT PELAYANAN LISTRIK NASIONAL NUSA DAYA', 3, 'UPT MANADO', 'FEBRUARI', 2026, 'TAHAP-2', 'TRANSMISI', 2, 0, 0, '2026-09-18 12:59:20'),
(17, 'O&M Distribusi Tahuna', '0401.PJ/DAN.01.03/F15000000/2025', '', '', 'PT PELAYANAN LISTRIK NASIONAL NUSA DAYA', 3, 'UP3 TAHUNA', 'JANUARI', 2026, 'TAHAP-2', 'DISTRIBUSI', 17, 178351498995, 73693472172, '2026-09-18 13:21:26'),
(24, 'O&M Distribusi Manado', '0399.PJ/DAN.01.03/F15000000/2025', '', '', 'PT PELAYANAN LISTRIK NASIONAL NUSA DAYA', 3, 'UP3 MANADO (B)', 'FEBRUARI', 2026, 'TAHAP-2', 'DISTRIBUSI', 16, 187586109802, 139288934327, '2026-09-18 15:37:13'),
(25, 'tes', '', '', '', 'PT PELAYANAN LISTRIK NASIONAL NUSA DAYA', NULL, 'UP3 MANADO', 'SEPTEMBER', 2026, 'TAHAP-2', 'DISTRIBUSI', 23, 0, 0, '2026-09-28 08:12:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `username`, `ip_address`, `success`, `created_at`) VALUES
(1, 'admin', '::1', 1, '2026-07-01 19:27:03'),
(2, 'admin', '::1', 0, '2026-07-02 09:32:18'),
(3, 'admin', '::1', 1, '2026-07-02 09:32:22'),
(4, 'admin2', '::1', 1, '2026-07-02 11:02:44'),
(5, 'admin', '::1', 1, '2026-07-02 11:03:55'),
(6, 'admin3', '::1', 1, '2026-07-02 11:05:47'),
(7, 'admin4', '::1', 1, '2026-07-02 11:23:33'),
(8, 'admin', '::1', 1, '2026-07-02 11:36:57'),
(9, 'admin', '::1', 1, '2026-07-02 16:15:14'),
(10, 'admin', '::1', 0, '2026-07-05 19:32:20'),
(11, 'admin', '::1', 1, '2026-07-05 19:32:27'),
(12, 'admin', '::1', 1, '2026-07-10 08:21:46'),
(13, 'admin3', '::1', 1, '2026-07-10 09:48:59'),
(14, 'admin2', '::1', 1, '2026-07-10 09:51:28'),
(15, 'admin3', '::1', 0, '2026-07-10 09:51:49'),
(16, 'admin3', '::1', 1, '2026-07-10 09:51:54'),
(17, 'admin2', '::1', 1, '2026-07-10 09:53:22'),
(18, 'admin4', '::1', 1, '2026-07-10 10:15:32'),
(19, 'admin2', '::1', 1, '2026-07-10 10:17:53'),
(20, 'admin', '::1', 0, '2026-07-10 10:18:21'),
(21, 'admin', '::1', 1, '2026-07-10 10:18:25'),
(22, 'admin', '::1', 1, '2026-07-10 10:31:15'),
(23, 'admin2', '::1', 1, '2026-07-10 16:43:55'),
(24, 'admin2', '::1', 1, '2026-07-10 16:52:50'),
(25, 'admin', '::1', 1, '2026-07-10 16:53:03'),
(26, 'admin2', '::1', 1, '2026-07-13 08:48:25'),
(27, 'admin', '::1', 1, '2026-07-13 08:49:54'),
(28, 'admin', '::1', 0, '2026-07-13 09:06:12'),
(29, 'admin', '::1', 1, '2026-07-13 09:06:17'),
(30, 'admin', '::1', 1, '2026-07-13 10:32:05'),
(31, 'admin', '::1', 1, '2026-07-15 08:37:43'),
(32, 'admin', '::1', 1, '2026-07-17 15:06:12'),
(33, 'admin', '::1', 1, '2026-07-20 08:22:20'),
(34, 'admin', '::1', 1, '2026-07-20 09:43:46'),
(35, 'admin', '::1', 1, '2026-07-21 09:53:00'),
(36, 'admin', '::1', 1, '2026-07-21 13:22:16'),
(37, 'admin2', '::1', 1, '2026-07-21 13:23:17'),
(38, 'admin4', '::1', 0, '2026-07-21 13:25:27'),
(39, 'admin4', '::1', 1, '2026-07-21 13:25:30'),
(40, 'admin', '::1', 1, '2026-07-21 13:26:29'),
(41, 'admin', '::1', 1, '2026-07-21 13:44:33'),
(42, 'admin', '::1', 1, '2026-07-21 15:09:24'),
(43, 'admin2', '::1', 1, '2026-07-21 15:10:55'),
(44, 'admin4', '::1', 1, '2026-07-21 15:17:38'),
(45, 'admin', '::1', 1, '2026-07-21 15:20:26'),
(46, 'admin', '::1', 1, '2026-07-21 16:32:23'),
(47, 'admin', '::1', 1, '2026-07-21 16:46:33'),
(48, 'admin', '::1', 1, '2026-07-24 11:38:39'),
(49, 'admin', '::1', 1, '2026-08-04 07:50:05'),
(50, 'admin', '::1', 1, '2026-08-04 08:24:35'),
(51, 'admin', '::1', 1, '2026-08-12 15:50:28'),
(52, 'admin', '::1', 1, '2026-08-19 08:20:57'),
(53, 'admin', '::1', 0, '2026-08-19 08:44:24'),
(54, 'admin', '::1', 1, '2026-08-19 08:44:28'),
(55, 'admin', '::1', 1, '2026-08-26 09:30:12'),
(56, 'admin', '::1', 1, '2026-08-27 03:01:52'),
(57, 'admin', '::1', 1, '2026-08-28 11:26:46'),
(58, 'admin', '::1', 1, '2026-08-31 10:38:01'),
(59, 'admin', '::1', 1, '2026-09-01 08:03:38'),
(60, 'admin', '::1', 1, '2026-09-02 09:12:46'),
(61, 'admin', '::1', 1, '2026-09-08 07:43:49'),
(62, 'admin', '::1', 1, '2026-09-08 07:48:14'),
(63, 'admin', '::1', 1, '2026-09-16 09:30:03'),
(64, 'admin', '::1', 1, '2026-09-17 08:56:27'),
(65, 'admin', '::1', 0, '2026-09-17 16:08:52'),
(66, 'admin', '::1', 1, '2026-09-17 16:08:58'),
(67, 'admin', '::1', 1, '2026-09-23 08:07:32'),
(68, 'admin', '::1', 1, '2026-09-28 08:10:50'),
(69, 'Admin', '192.168.120.112', 1, '2026-09-28 19:36:06'),
(70, 'tes', '::1', 1, '2026-09-28 19:39:07'),
(71, 'admin', '::1', 1, '2026-09-28 20:06:17'),
(72, 'admin', '::1', 1, '2026-10-01 09:11:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `monitoring_harian`
--

CREATE TABLE `monitoring_harian` (
  `id` int(11) NOT NULL,
  `sla_entry_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `periode` tinyint(1) DEFAULT NULL,
  `nilai_harian` double DEFAULT 0,
  `catatan` varchar(255) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_by_email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personil`
--

CREATE TABLE `personil` (
  `id` int(11) NOT NULL,
  `kontrak_id` int(11) NOT NULL,
  `ulp_id` int(11) DEFAULT NULL,
  `nama_ulp` varchar(150) DEFAULT NULL,
  `nama_kp` varchar(150) DEFAULT NULL,
  `daftar_tim` varchar(150) DEFAULT NULL,
  `nama_petugas` varchar(150) NOT NULL,
  `jabatan` varchar(150) DEFAULT NULL,
  `no_hp` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekap_sla`
--

CREATE TABLE `rekap_sla` (
  `id` int(11) NOT NULL,
  `kontrak_id` int(11) DEFAULT NULL,
  `sla_teknis` double DEFAULT 0,
  `sla_k3` double DEFAULT 0,
  `sla_kecelakaan` double DEFAULT 0,
  `sla_ilp` double DEFAULT 0,
  `total_bobot` double DEFAULT 0,
  `sla_overall` double DEFAULT 0,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rekap_sla`
--

INSERT INTO `rekap_sla` (`id`, `kontrak_id`, `sla_teknis`, `sla_k3`, `sla_kecelakaan`, `sla_ilp`, `total_bobot`, `sla_overall`, `updated_at`) VALUES
(13, 15, 100.51282051282051, 100, 0, 100, 6420, 100.3125, '2026-09-18 12:28:42'),
(14, 16, 99.90222222222222, 100, 0, 100, 2698.24, 99.9348148148148, '2026-09-18 12:59:21'),
(15, 17, 80.972567413948, 98.454221165279, 100, 100, 3462.8471370902, 88.790952233082, '2026-09-18 13:23:03'),
(21, 24, 87.43469393939395, 100, 100, 100, 21741.3796, 92.91187863247863, '2026-09-18 15:37:14'),
(22, 25, 51.625, 16.666666666667, 100, 100, 1526, 46.242424242424, '2026-09-28 20:20:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sla_entries`
--

CREATE TABLE `sla_entries` (
  `id` int(11) NOT NULL,
  `kontrak_id` int(11) DEFAULT NULL,
  `ulp_id` int(11) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `no_urut` varchar(20) DEFAULT NULL,
  `ruang_lingkup` text DEFAULT NULL,
  `kriteria` text DEFAULT NULL,
  `target_kinerja` text DEFAULT NULL,
  `eviden` text DEFAULT NULL,
  `polaritas` enum('Positif','Negatif') NOT NULL DEFAULT 'Positif',
  `satuan` varchar(50) DEFAULT NULL,
  `bobot` double DEFAULT 2,
  `jenis_bobot` varchar(50) DEFAULT 'Prioritas 1',
  `target` double DEFAULT 0,
  `realisasi` double DEFAULT 0,
  `persen_pencapaian` double DEFAULT 0,
  `nilai_bobot` double DEFAULT 0,
  `keterangan` text DEFAULT NULL,
  `target_waktu_input` datetime DEFAULT NULL,
  `unit_pelaksana` varchar(100) DEFAULT NULL,
  `unit_layanan` varchar(50) DEFAULT NULL,
  `site` varchar(150) DEFAULT NULL,
  `project` varchar(150) DEFAULT NULL,
  `catatan_tidak_tercapai` text DEFAULT NULL,
  `tanggal_input` date DEFAULT NULL,
  `blth` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sla_entries`
--

INSERT INTO `sla_entries` (`id`, `kontrak_id`, `ulp_id`, `kategori`, `no_urut`, `ruang_lingkup`, `kriteria`, `target_kinerja`, `eviden`, `polaritas`, `satuan`, `bobot`, `jenis_bobot`, `target`, `realisasi`, `persen_pencapaian`, `nilai_bobot`, `keterangan`, `target_waktu_input`, `unit_pelaksana`, `unit_layanan`, `site`, `project`, `catatan_tidak_tercapai`, `tanggal_input`, `blth`) VALUES
(347, 15, NULL, 'TEKNIS', '1.1', 'Kesiapan SDM', 'Mengenakan APD Lemngkap dan Layak', '100% kesesuaian\r\nAPD dengan persyaratan dan dalam kondisi laik', 'Formulir checklist\r\npemeriksaan APD', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(348, 15, NULL, 'TEKNIS', '1.2', 'Kesiapan SDM', 'Melakukan Absensi shift melalui Tools Absensi Online dan atau manual', '100% kehadiran', 'Dokumen Verifikasi kehadiran yang di ttd in pejabat ULTG yang bertanggung jawab', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(349, 15, NULL, 'TEKNIS', '1.3', 'Kesiapan SDM', 'Operator dan tenaga pemeliharaan memiliki serkom', '100% kompetensi SDM sesuai dengan kualifikasi pekerjaan', 'Sertifikat kompetensi', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(350, 15, NULL, 'TEKNIS', '1.4', 'Kesiapan SDM', 'Melakukan CoC atau Knowledge Sharing / OBAMMA ( Operator Belajar Mengoperasikan dan Memelihara Aset ) untuk meningkatkan kompetensi Operator GI dan Tenaga Pemeliharaan', '100% Akurasi kegiatan COC atau Knowledge Sharing dengan PLN sesuai dengan kebutuhan (syarat COC atau Knowledge Sharing ( OBAMMA) dihitung sebagai realisasi 70% kehadiran online maupun offline.. untuk perhitungan 1x bobot 100%.. Lebih dari 1x bobot 100%\r\n', 'Dokumentasi, daftar hadir kegiatan COC dgn  baik offline atau online minimal kehadiran 70% (screenshoot, google form)', 'Positif', 'Kali', 1, 'Prioritas 2', 1, 1, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(351, 15, NULL, 'TEKNIS', '2.1', 'Pengoperasian Gardu Induk (GI)', 'Melaksanakan kegiatan pengoperasian peralatan Gardu Induk (kebutuhan sistem) atas perintah pengendali operasi sistem (Dispatcher) sesuai dengan seluruh Standard Operating Procedure (SOP) PLN, meliputi: a. Prosedur operasi sistem\r\nb. Prosedur komunikasi\r\nc. Prosedur K3', '100% akurasi kegiatan pengoperasian peralatan GI (sistem) sesuai dengan SOP', 'Dokumen Pencatatan Manuver; BA Investigasi Kejadian Khusus', 'Positif', 'Kali', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(352, 15, NULL, 'TEKNIS', '2.2', 'Pengoperasian Gardu Induk (GI)', 'Melaksanakan kegiatan pengoperasian peralatan Gardu Induk (kebutuhan Pemeliharaan/operasi aset) sesuai dengan seluruh SOP PLN meliputi:\r\na. Prosedur operasi peralatan GI\r\nb. Prosedur Komunikasi\r\nc. Prosedur K3', 'Kondisi Pencapaian sebagai berikut :\r\n1x kali kejadian diantara :\r\n a) Black Out \r\n b)Gangguan Meluas \r\nc) Kecelakaan Kerja mengakibatkan Meninggal/ cacat permanen maka bobot 0% jika tidak terdapat kejadian bobot 100%', 'Dokumen Pencatatan Manuver; BA Investigasi Kejadian Khusus', 'Negatif', 'kali', 2, 'Prioritas 1', 1, 0, 110, 220, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(353, 15, NULL, 'TEKNIS', '2.3', 'Pengoperasian Gardu Induk (GI)', 'Melaksanakan inspeksi level 1\r\n(visual) kondisi peralatan GI dan melakukan pencatatan formulir\r\nhasil inspeksi level 1', '100% kelengkapan pencatatan hasil inspeksi\r\nlevel 1 (visual) kondisi peralatan GI pada Formulir Hasil Inspeksi/Aplikasi\r\nCBM', 'Formulir Hasil\r\nInspeksi/Aplikasi CBM', 'Positif', 'persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(354, 15, NULL, 'TEKNIS', '2.4', 'Pengoperasian Gardu Induk (GI)', 'Melaksanakan inspeksi level 2\r\n(termasuk namun tidak terbatas pada thermovisi, pengukuran tegangan baterai, pengukuran tegangan relay mekanik, pengukuran arus bocor) dan melakukan pencatatan formulir hasil inspeksi level 2', '100% kelengkapan pencatatan hasil inspeksi\r\nlevel 2 pada Formulir Hasil Inspeksi/Aplikasi\r\nCBM', 'Formulir Hasil\r\nInspeksi/Aplikasi CBM', 'Positif', 'persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(355, 15, NULL, 'TEKNIS', '2.5', 'Pengoperasian Gardu Induk (GI)', 'Mencegah dan melaporkan anomali serta kondisi yang dapat membahayakan atau menimbulkan kerawanan terhadap pengoperasian GI', '100% kelengkapan dan akurasi pengisian laporan ketidaksesuaian', 'Laporan ketidak sesuaian', 'Positif', 'persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(356, 15, NULL, 'TEKNIS', '2.6', 'Pengoperasian Gardu Induk (GI)', 'Melakukan tindakan pengamanan peralatan dan pelaporan dalam keadaan darurat sesuai Standard Operating Procedur (SOP) PLN', '100% akurasi tindakan\r\npengamanan peralatan sesuai dengan SOP atau pedoman pada masing- masing unit', 'Logsheet dan\r\nDokumentasi', 'Positif', 'persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(357, 15, NULL, 'TEKNIS', '2.6b', 'Pengoperasian Gardu Induk (GI)', 'Melakukan tindakan pengamanan peralatan dan pelaporan dalam keadaan darurat sesuai Standard Operating Procedur (SOP) PLN', '100% pencapaian target waktu pelaporan sesuai SOP atau pedoman pada masing-masing unit', 'Laporan gangguan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(358, 15, NULL, 'TEKNIS', '2.7', 'Pengoperasian Gardu Induk (GI)', 'Melakukan pengelolaan seluruh dokumen hasil pengoperasian dan pemeliharaan', '100% kelengkapan dokumen hasil pengoperasian dan pemeliharaan sesuai dengan periodenya (harian/mingguan/bulanan)', 'Dokumen fisik hasil, \r\npengoperasian dan pemeliharaan (Format Form dokumen dari PLN) yang divalidasi oleh PLNND Region', 'Negatif', 'menit', 1, 'Prioritas 2', 5, 5, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(359, 15, NULL, 'TEKNIS', '2.8', 'Pengoperasian Gardu Induk (GI)', 'Melakukan Koordinasi dengan pihak PLN Distribusi (Piket Pengatur Beban setempat) bila akan dilakukan pekerjaan pada sisi 20 kV  (incoming atau outgoing)', '100% kelengkapan dan akurasi pengisian logsheet', 'Logsheet', 'Negatif', 'tanggal', 1, 'Prioritas 2', 4, 4, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(360, 15, NULL, 'TEKNIS', '2.9', 'Pengoperasian Gardu Induk (GI)', 'Melaksanakan pemeliharaan dan pembersihan (program 5S, CGS, ABH) terhadap fasilitas operasi GI (termasuk namun tidak terbatas pada penggantian lampu indikator, pembersihan baterai dan panel)', '100% fasilitas ruangan GI dalam keadaan bersih dan terawat', 'Laporan Pemeliharaan dan Pembersihan (5S)', 'Positif', '100% fasilitas ruangan GI dalam keadaan bersih dan', 1, 'Prioritas 2', 100, 100, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(361, 15, NULL, 'TEKNIS', '2.10', 'Pengoperasian Gardu Induk (GI)', 'Melaksanakan penyimpanan dan pembersihan terhadap peralatan kerja, peralatan uji, dan peralatan K3', '100% kelengkapan dan akurasi pengisian checklist', 'Checklist', 'Positif', '100% kelengkapan dan akurasi pengisian checklist', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(362, 15, NULL, 'TEKNIS', '2.11', 'Pengoperasian Gardu Induk (GI)', 'Pencatatan angka-angka pengusahaan (VAC, A, MW, MVAR, kWh) di excel Logsheet GI melalui web maupun manual dan mencatat  laporan gangguan/anomali peralatan (Seperti: Gangguan/ Alarm Pada Peralatan Catu Daya,  Proteksi,  Scada/SAS, dan  Telekomunikasi )', '100% kelengkapan dan akurasi pengisian logsheet', 'Logsheet', 'Positif', '100% kelengkapan dan akurasi pengisian logsheet', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(363, 15, NULL, 'TEKNIS', '2.12', 'Pengoperasian Gardu Induk (GI)', 'Penyampaian informasi kondisi peralatan yang bersifat emergensi tidak dilaporkan secara Real Time (maksimal 10 menit setelah ditemukan kondisi anomali)', 'Tidak ada (0)laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'kali', 1, 'Prioritas 2', 1, 1, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(364, 15, NULL, 'TEKNIS', '2.13', 'Pengoperasian Gardu Induk (GI)', 'Terjadi gangguan karena ada pekerjaan yang telah diminta oleh UP3B/ UPT terkait untuk dikerjakan, namun pelaksanaannya ditunda sepihak oleh Pelaksana Pekerjaan', 'Tidak ada (0)laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'kali', 1, 'Prioritas 2', 1, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(365, 15, NULL, 'TEKNIS', '2.14', 'Pengoperasian Gardu Induk (GI)', 'Melakukan pencatatan pada formulir gangguan yang disediakan PLN jika terjadi gangguan dan melaporkan ke Dispatcher & Manajer ULTG saat adanya gangguan', '100% kelengkapan dan akurasi pengisian formulir gangguan', 'Formulir gangguan', 'Positif', '100% kelengkapan dan akurasi pengisian formulir ga', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(366, 15, NULL, 'TEKNIS', '3.1', 'Pemeliharaan Gardu Induk (GI)', 'Melakukan Pemeliharaan di Gardu Induk dan Transmisi sesuai dengan Jadwal Pemeliharaan yang disusun oleh  ULTG atau UPT / UP3B', '100% pekerjaan yang dileah disusun oleh ULTG atau UPT / UP3B dilaksanakan', 'Dokumentasi dan Daftar Kehadiran TAD dalam kegiatan pemeliharaan Gardu Induk dan bukti penyelesaian SPK', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(367, 15, NULL, 'TEKNIS', '3.2', 'Pemeliharaan Gardu Induk (GI)', 'Membantu melaksanakan pemeliharaan emergency di transmisi maupun gardu Induk (275kV / 150 kV / 70 kV / 20 kV)', '100% membantu pekerjaan yang dileah disusun oleh ULTG atau UPT / UP3B dilaksanakan', 'Dokumentasi dan Daftar Kehadiran TAD dalam kegiatan pemeliharaan emergency', 'Positif', 'persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(368, 15, NULL, 'TEKNIS', '3.3', 'Pemeliharaan Gardu Induk (GI)', 'Membantu melaksanakan penelusuran gangguan di transmisi maupun gardu Induk (275kV / 150 kV / 70kV / 20 kV)', '100% membantu pekerjaan yang dileah disusun oleh ULTG atau UPT / UP3B dilaksanakan', 'Dokumentasi dan Daftar Kehadiran TAD dalam kegiatan penelusuran gangguan', 'Positif', 'persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(369, 15, NULL, 'TEKNIS', '3.4', 'Pemeliharaan Gardu Induk (GI)', 'Membuat laporan bulanan kegiatan pemeliharaan dan assesment Inspeksi Level 1 dan 2, selambat-lambatnya tanggal  N+5', '100% laporan bulanan disampaikan kepada MULTG', 'Dokumen laporan bulanan', 'Positif', 'persen', 1, 'Prioritas 2', 100, 100, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(370, 15, NULL, 'K3', '4.1', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat kerja', 'Kualitas SDM dan Kompetensi Pekerja', '100% kompetensi SDM sesuai dengan kualifikasi pekerjaan', 'Sertifikat kompetensi', 'Positif', 'Sertifikat kompetensi', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(371, 15, NULL, 'K3', '4.2', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat kerja', 'Peralatan Kerja sesuai dengan persyaratan dan dalam kondisi laik', '100% kesesuaian\r\nperalatan kerja dengan persyaratan dan dalam kondisi laik', 'Formulir checklist\r\npemeriksaan alat kerja', 'Negatif', 'tanggal', 2, 'Prioritas 1', 6, 6, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(372, 15, NULL, 'K3', '4.3', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat kerja', 'Alat Keselamatan Kerja (APD, Rambu dan LOTO)', '100% penyediaan alat pelindung diri sesuai resiko pekerjaan', 'Checklist APD', 'Positif', 'persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(373, 15, NULL, 'K3', '4.3b', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat kerja', 'Alat Keselamatan Kerja (APD, Rambu dan LOTO)', '100% Penyediaan rambu dan LOTO pada satuan\r\nkerja', 'Checklist rambu dan LOTO', 'Negatif', 'tanggal', 2, 'Prioritas 1', 6, 6, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(374, 15, NULL, 'K3', '4.4', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat kerja', 'Melakukan pekerjaan sesuai dengan prosedur dan instruksi kerja yang berlaku (SOP, IK, WP)', 'Nol (0) temuan pelanggaran prosedur dan instruksi kerja sesuai dengan sistem manajemen K3', 'Laporan inspeksi K3', 'Negatif', 'tanggal', 2, 'Prioritas 1', 6, 6, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(375, 15, NULL, 'K3', '4.5', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat kerja', 'Selama melaksanakan tugas, Petugas Operator dan Pemeliharaan tidak menggunakan pakaian seragam dan dilengkapi dengan tanda pengenal dan peralatan K3 dalam pelaksanaan pekerjaan', 'Tidak ada (0)laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'kali', 1, 'Prioritas 2', 1, 1, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(376, 15, NULL, 'K3', '4.6', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat kerja', 'Mengabaikan dan tidak mentaati peraturan K2, K3 dan standar mutu yang diterapkan di UPT / UP3B (ISO 9001, SMK3, OPI)', 'Tidak ada (0)laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'kali', 1, 'Prioritas 2', 1, 1, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(377, 15, NULL, 'ILP', '5.1', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Mengadakan\r\nhubungan kerja dengan Pekerja dalam bentuk Perjanjian\r\nKerja Waktu Tertentu\r\n(PKWT) atau\r\nPerjanjian Kerja Waktu\r\nTidak Tertentu\r\n(PKWTT)', '100% ketersediaan\r\ndokumen Perjanjian Kerja (PKWT/ PKWTT) dengan seluruh Pekerja', 'Dokumen Perjanjian\r\nKerja (PKWT/ PKWTT)', 'Positif', '100% ketersediaan\r\ndokumen Perjanjian Kerja (PKWT/', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(378, 15, NULL, 'ILP', '5.2', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Membayarkan upah\r\nkepada para Pekerjanya paling lambat pada tanggal 1 setiap bulannya (n+1)', '100% upah Pekerja\r\nterbayar paling lambat pada tanggal 1 setiap bulannya (n+1)', 'Bukti transfer & daftar\r\npembayaran', 'Negatif', '100% upah Pekerja\r\nterbayar paling lambat pada tan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(379, 15, NULL, 'ILP', '5.3', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Membayarkan\r\nTunjangan Hari Raya Keagamaan (THRK) dan hak normatif lainnya sesuai peraturan perundang- undangan', '100% THRK dan hak\r\nnormatif lainnya terbayar sesuai peraturan perundang- undangan', 'Bukti transfer & daftar\r\npembayaran', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(380, 15, NULL, 'ILP', '5.4', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Membayar angsuran\r\nuang pengakhiran hubungan kerja (uang pesangon, uang penghargaan masa kerja, dan uang penggantian hak) atau uang kompensasi Pekerja sesuai dengan peraturan perundang- undangan dengan program Dana\r\nPensiun Lembaga Keuangan (DPLK) yang dijamin LPS paling lambat pada tanggal 1 setiap bulannya', '100% angsuran uang\r\npengakhiran hubungan Pekerja terbayar sesuai peraturan perundang- undangan', 'Bukti transfer & daftar\r\npembayaran', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(381, 15, NULL, 'ILP', '5.5', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Mengikutsertakan\r\nPekerja dalam program Badan Penyelenggaraan Jaminan Sosial (BPJS Kesehatan dan Ketenagakerjaan) dan membayar iuran tersebut sesuai peraturan perundang- undangan paling lambat pada tanggal 1 setiap bulannya', '100% Pekerja terdaftar\r\ndalam program BPJS Kesehatan dan Ketenagakerjaan', 'Bukti transfer & daftar\r\npembayaran', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(382, 15, NULL, 'ILP', '5.5b', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Mengikutsertakan\r\nPekerja dalam program Badan Penyelenggaraan Jaminan Sosial (BPJS Kesehatan dan Ketenagakerjaan) dan membayar iuran tersebut sesuai peraturan perundang- undangan paling lambat pada tanggal 1 setiap bulannya', '100% iuran BPJS\r\nKesehatan dan Ketenagakerjaan terbayar sesuai peraturan perundang- undangan pada tanggal\r\n1 setiap bulan', 'Bukti transfer & daftar\r\npembayaran', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(383, 15, NULL, 'ILP', '5.6', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Memberikan minimal 2\r\nset seragam per tahun kepada Pekerja selama jangka waktu Perjanjian', '100% ketersediaan\r\nbukti tanda terima pemberian seragam pada Pekerja', 'Bukti tanda terima\r\npemberian seragam', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(384, 15, NULL, 'ILP', '5.7', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Memastikan kelengkapan dan\r\nakurasi data Pekerja yang diinput pertama kali pada Aplikasi Alih Daya serta melakukan pengkinian data paling\r\nlambat 5 hari kerja\r\numum sebelum tanggal dimulai Pelaksanaan Pekerjaan dan minggu ke-1 setiap bulan\r\nuntuk masa Pelaksanaan Pekerjaan', '100% akurasi dan kelengkapan atas data\r\npada Aplikasi Alih Daya', 'Aplikasi Alih Daya', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(385, 15, NULL, 'ILP', '5.7b', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Memastikan kelengkapan dan\r\nakurasi data Pekerja yang diinput pertama kali pada Aplikasi Alih Daya serta melakukan pengkinian data paling\r\nlambat 5 hari kerja\r\numum sebelum tanggal dimulai Pelaksanaan Pekerjaan dan minggu ke-1 setiap bulan\r\nuntuk masa Pelaksanaan Pekerjaan', '100% ketersediaan\r\nbukti data pemutakhiran', 'Bukti data\r\npemutakhiran', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(386, 15, NULL, 'ILP', '5.8', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Memenuhi kewajiban memiliki modal yang cukup untuk pembayaran\r\noperasional, termasuk\r\nnamun tidak terbatas pada modal pemenuhan hak normatif ketenagakerjaan Pekerja selama 90 hari kalender berikutnya, dan selanjutnya sejak tagihan per bulan terakhir telah\r\ndibayarkan oleh Pihak\r\nPertama', '100% ketersediaan bukti rekening koran dalam nominal modal yang cukup untuk\r\nmembayar operasional\r\npekerjaan selama minimal 90 hari', 'Bukti Rekening Koran dari Bank atas nama PIHAK KEDUA yang berisi saldo untuk\r\nmembayar operasional\r\nPekerjaan selama 90 hari kalender berikutnya', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(387, 15, NULL, 'ILP', '5.9', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Menyalurkan reward\r\natas pencapaian service level agreement yang diberikan oleh PLN kepada Perusahaan Alih Daya paling sedikit sebesar 70% (tujuh puluh persen) kepada Tenaga Alih Daya berdasarkan capaian kinerja individual', '100% ketersediaan\r\nbukti penyaluran reward and consequence atas pencapaian SLA', 'Bukti transfer & daftar\r\npembayaran', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(388, 15, NULL, 'ILP', '5.10', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Perusahaan Alih Daya\r\ndapat memberikan consequence kepada Tenaga Alih Daya dalam hal tidak mencapai service level agreement dengan tetap mematuhi peraturan perundang- undangan yang\r\nberlaku', '100% ketersediaan\r\nbukti pemberian consequence kepada Tenaga Alih Daya', 'Bukti transfer & daftar\r\npembayaran', 'Positif', 'Tanggal', 1, 'Prioritas 2', 31, 31, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(389, 15, NULL, 'ILP', '5.11', 'Pemenuhan Hak\r\nNormatif\r\nKetenagakerjaan', 'Penyampaian berkas tagihan tahap I  secara lengkap dan benar diterima oleh PLN UIP3B Sul maksimal tanggal 15 setiap bulannya', 'Berkas tagihan Tahap 1 lengkap dan benar', 'Tanda terima berkas tagihan', 'Negatif', 'tanggal', 1, 'Prioritas 2', 15, 15, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M GI UPT MANADO', NULL, NULL, NULL),
(390, 16, NULL, 'TEKNIS', '01', 'Jasa Inspeksi dan Pelaporan Aset Jaringan (SUTT/SUTET) / Jasa Inspeksi dan Pelaporan Aset Kabel (SKTT)', 'Pemeriksaan/Inspeksi anomali komponen saluran Jaringan.', 'Kecepatan Pencapaian 100% baik secara manual maupun menggunakan aplikasi (contoh: SRINTAMI)', 'Dokumen laporan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(391, 16, NULL, 'TEKNIS', '02', 'Jasa Inspeksi dan Pelaporan Aset Jaringan (SUTT/SUTET) / Jasa Inspeksi dan Pelaporan Aset Kabel (SKTT)', 'Melaksanakan pemeriksaan jarak aman SUTT dan SKTT serta jarak bebas di Right of Way (ROW).', 'Kecepatan Pencapaian 100% baik secara manual maupun menggunakan aplikasi (contoh: SRINTAMI)', 'Dokumen laporan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(392, 16, NULL, 'TEKNIS', '03', 'Jasa Inspeksi dan Pelaporan Aset Jaringan (SUTT/SUTET) / Jasa Inspeksi dan Pelaporan Aset Kabel (SKTT)', 'Pemeriksaan dan Pengawasan Tanam Tumbuh ataupun bangunan yang berpotensi gangguan', 'Kecepatan Pencapaian 100% baik secara manual maupun menggunakan aplikasi (contoh: SRINTAMI)', 'Dokumen laporan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(393, 16, NULL, 'TEKNIS', '04', 'Jasa Inspeksi dan Pelaporan Aset Jaringan (SUTT/SUTET) / Jasa Inspeksi dan Pelaporan Aset Kabel (SKTT)', 'Melaksanakan pemeriksaan kelengkapan tower (member, pentanahan, dll)', 'Kecepatan Pencapaian 100% baik secara manual maupun menggunakan aplikasi (contoh: SRINTAMI)', 'Dokumen laporan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(394, 16, NULL, 'TEKNIS', '05', 'Jasa Inspeksi dan Pelaporan Aset Jaringan (SUTT/SUTET) / Jasa Inspeksi dan Pelaporan Aset Kabel (SKTT)', 'Pemeriksaan/Inspeksi kelengkapan komponen saluran Jaringan (penghantar, isolator dan aksesoris)', 'Kecepatan Pencapaian 100% baik secara manual maupun menggunakan aplikasi (contoh: SRINTAMI)', 'Dokumen laporan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(395, 16, NULL, 'TEKNIS', '06', 'Jasa Inspeksi dan Pelaporan Aset Jaringan (SUTT/SUTET) / Jasa Inspeksi dan Pelaporan Aset Kabel (SKTT)', 'Melaksanakan pemeriksaan kondisi pondasi tower, Pentanahan (termasuk pelaksanaan pengukuran pentanahan sebanyak 17% dari total tower per bulan) dan lingkungan sekitar tapak tower', 'Kecepatan Pencapaian 100% baik secara manual maupun menggunakan aplikasi (contoh: SRINTAMI)', 'Dokumen laporan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(396, 16, NULL, 'TEKNIS', '07', 'Jasa Inspeksi dan Pelaporan Aset Jaringan (SUTT/SUTET) / Jasa Inspeksi dan Pelaporan Aset Kabel (SKTT)', 'Melaksanakan pembersihan lokasi tapak tower.', 'Kecepatan Pencapaian 100% baik secara manual maupun menggunakan aplikasi (contoh: SRINTAMI)', 'Dokumen laporan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 99.12, 99.12, 198.24, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(397, 16, NULL, 'TEKNIS', '08', 'Jasa Inspeksi dan Pelaporan Aset Jaringan (SUTT/SUTET) / Jasa Inspeksi dan Pelaporan Aset Kabel (SKTT)', 'Mencegah dan melaporkan kondisi yang dapat membahayakan atau menimbulkan kerawanan terhadap tower dan jaringan dilengkapi dengan dokumentasi/foto (termasuk melakukan pemangkasan terhadap pohon yang mengancam keandalan jaringan)', 'Kecepatan Pencapaian 100% baik secara manual maupun menggunakan aplikasi (contoh: SRINTAMI)', 'Dokumen laporan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(398, 16, NULL, 'TEKNIS', '09', 'Hasil dan Gangguan Transmisi', 'Ketidaksesuaian laporan dengan kondisi di jaringan', 'benar dan akurat', 'Harian, Mingguan, Bulanan', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(399, 16, NULL, 'K3', '01', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat Kerja', 'Melaksanakan dan mentaati peraturan K3 dan lingkungan', 'Menggunakan alat pelindung diri (APD) dan mentaati peraturan K2 dan Lingkungan.', '1) Surat Pernyataan / 2) Dokumentasi', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(400, 16, NULL, 'K3', '02', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat Kerja', 'Mutu Peralatan Kerja/K3 yang disediakan oleh PIHAK KEDUA wajib dapat dipertanggungjawabkan mutunya sesuai dengan spesifikasi yang ditetapkan oleh PIHAK PERTAMA', 'Peralatan sesuai spesifikasi yang ditetapkan oleh PIHAK PERTAMA', 'Checklist', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(401, 16, NULL, 'K3', '03', 'Penerapan Keselamatan dan Kesehatan Kerja (K3) di tempat Kerja', 'Ketersediaan Peralatan Kerja / K3', 'Peralatan tersedia dengan lengkap sesuai yang dipersyaratkan oleh PIHAK PERTAMA (Sesuai checklist)', 'Checklist', 'Positif', 'Persen', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(402, 16, NULL, 'ILP', '01', 'Komitmen Integritas Layanan Publik (ILP)', 'Meminta/menerima imbalan (gratifikasi) dari pelanggan yang dilayani dan/atau dari PIHAK PERTAMA secara langsung', 'Tidak ada (0) laporan pelanggaran ILP', 'Tidak ada (0) laporan pelanggaran ILP', 'Negatif', 'Kali', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(403, 16, NULL, 'ILP', '02', 'Komitmen Integritas Layanan Publik (ILP)', 'Melakukan pungutan liar, Kolusi Korupsi atau Nepotisme dll; atau', 'Tidak ada (0) laporan pelanggaran ILP', 'Tidak ada (0) laporan pelanggaran ILP', 'Negatif', 'Kali', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(404, 16, NULL, 'ILP', '03', 'Komitmen Integritas Layanan Publik (ILP)', 'Dengan sengaja tidak memberikan kemudahan, kecepatan dan transparansi terkait layanan publik', 'Tidak ada (0) laporan pelanggaran ILP', 'Tidak ada (0) laporan pelanggaran ILP', 'Negatif', 'Kali', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'GROUND PATROL UPT MANADO', NULL, NULL, NULL),
(405, 17, NULL, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata response time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Respone-Dispatching', 'Negatif', 'Menit', 2, 'Prioritas 1', 25, 11.37, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(406, 17, NULL, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata recovery time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Recovery', 'Negatif', 'Menit', 2, 'Prioritas 1', 80.890041516784, 62.41, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(407, 17, NULL, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata recovery time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Kali', 2, 'Prioritas 1', 0.04, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(408, 17, NULL, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah gangguan berulang bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Kali', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(409, 17, NULL, 'TEKNIS', '2.1', 'Inspeksi Jaringan Distribusi', 'Melakukan inspeksi tier 1 dan tier 2 jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD)', '100% tercapainya jumlah inspeksi jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD) sesuai dengan target yang ditetapkan pada WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'Kms', 2, 'Prioritas 1', 320.1825, 137.76677137807, 43.027576890701, 86.055153781403, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(410, 17, NULL, 'TEKNIS', '3.1', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan jaringan, meliputi:\r\n- Right of Way (ROW)\r\n- Komponen dan peralatan\r\n- Konstruksi', '100% terlaksananya pemeliharaan ROW sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'Kms', 2, 'Prioritas 1', 87.75, 45.819644605177, 52.216119208179, 104.43223841636, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(411, 17, NULL, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan gardu distribusi, meliputi:\r\n- Trafo dan panel bagi\r\n- Kubikel', '100% terlaksananya pemeliharaan trafo dan panel bagi sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'WO', 2, 'Prioritas 1', 15, 15, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(412, 17, NULL, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan peralatan jaringan', '100% terlaksanannya pemeliharaan peralatan jaringan sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi', 'Positif', 'WO', 2, 'Prioritas 1', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(413, 17, NULL, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', '100% kesesuaian data hasil sampling yang dilakukan oleh PLN terhadap pekerjaan yang dilaporkan oleh Pihak Kedua', 'Berita Acara Sampling', 'Positif', 'Sampling', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(414, 17, NULL, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', 'Tidak ada (0) Gangguan Pasca pemeliharaan sesuai aset yang dipelihara dalam masa garansi yang ditentukan masing-masing unit (30 hari Garansi)', 'laporan dan Hasil Sidang Engineering gangguan', 'Negatif', 'Gangguan pasca Har', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(415, 17, NULL, 'TEKNIS', '3.5', 'Pemeliharaan Jaringan Distribusi', 'Memastikan pencapaian kinerja distribusi:\r\n- Gangguan penyulang zona 1\r\n- Gangguan penyulang zona 2\r\n\r\n', 'Kali Gangguan kali dalam 1 (satu) Periode bulanan.  \r\nGangguan yang diakibatkan Sesuai KPI Unit Masing-masing : \r\n-SLA ROW SUTM\r\n-Flashover\r\n-Binatang diKubikel\r\n-Gangguan Tidak jelas', 'laporan gangguan/Logsheet UP2D/DCC', 'Negatif', 'Kali Gangguan', 2, 'Prioritas 1', 21, 22, 95.454545454545, 190.90909090909, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(416, 17, NULL, 'K3', '1.1', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Kualitas SDM dan Kompetensi Pekerja', '100% Kompetensi SDM sesuai dengan Kualifikasi pekerjaannya', 'Sertfifikasi Atau Pelatihan', 'Positif', 'Sertifikat', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(417, 17, NULL, 'K3', '1.2', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Peralatan Kerja sesuai dengan persyaratan dan dalam konsisi Laik', '100% Kesesuaian peralatan kerja dengan persyaratan dan dalam kondisi Laik', 'Formulir Chcelist Pemeriksaan alat kerja', 'Positif', '%', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(418, 17, NULL, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Alat Pelindung diri sesuai Risiko pekerjaan', 'Checklist APD', 'Positif', '%', 2, 'Prioritas 1', 1, 0.90725326991677, 90.725326991677, 181.45065398335, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(419, 17, NULL, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Rambu dan LOTO pada Satuan Kerja', 'Checklist Rambu dan LOTO', 'Positif', '%', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(420, 17, NULL, 'K3', '1.4', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Melakukan pekerjaan sesuai dengan Prosedur dan Instruksi Kerja yang berlaku ( SOP,IK,WP)', 'Nol temuan pelanggaran prosedur dan instruksi kerja sesuai dengan sistem Manajemen K3', 'Laporan Inspsksi K3', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(421, 17, NULL, 'K3', '1.5', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Inpeksi K3 oleh Direksi dan Management Perusahaan Alih Daya', 'Pelaksanaan Inspeksi oleh Direksi dan Management Perusahaan Alih Daya 2 kali / bulan', 'Laporan Inspsksi K3', 'Positif', 'Kali', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(422, 17, NULL, 'KECELAKAAN', '3.1', NULL, 'Kecelakaan Kerja', 'Nol temuan Kecelakaan Kerja', 'Laporan Investigasi', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(423, 17, NULL, 'ILP', '1.1', 'Komitmen Integritas Layanan Publik (ILP)', 'Meminta / menerima imbalan (gratifikasi) dari pelanggan yang dilayani dan/atau dari PIHAK PERTAMA secara langsung', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(424, 17, NULL, 'ILP', '1.2', 'Komitmen Integritas Layanan Publik (ILP)', 'Melakukan pungutan liar, Kolusi Korupsi atau Nepotisme dll; atau', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(425, 17, NULL, 'ILP', '1.3', 'Komitmen Integritas Layanan Publik (ILP)', 'Dengan sengaja tidak memberikan kemudahan, kecepatan dan transparansi terkait layanan publik', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. TAHUNA', NULL, NULL, NULL),
(867, 24, 19, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata response time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Respone-Dispatching', 'Negatif', 'Menit', 2, 'Prioritas 1', 30, 12.35, 158.8333, 317.6666, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(868, 24, 19, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata recovery time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Recovery', 'Negatif', 'Menit', 2, 'Prioritas 1', 100, 78.65, 121.35, 242.7, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(869, 24, 19, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah gangguan berulang bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Rasio', 2, 'Prioritas 1', 0.09, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(870, 24, 19, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah skip step bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Kali', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(871, 24, 19, 'TEKNIS', '2.1', 'Inspeksi Jaringan Distribusi', 'Melakukan inspeksi tier 1 dan tier 2 jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD)', '100% tercapainya jumlah inspeksi jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD) sesuai dengan target yang ditetapkan pada WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', '%', 2, 'Prioritas 1', 333, 100.08426291793313, 30.0553, 60.1106, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(872, 24, 19, 'TEKNIS', '3.1', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan jaringan, meliputi:\r\n- Right of Way (ROW)\r\n- Komponen dan peralatan\r\n- Konstruksi', '100% terlaksananya pemeliharaan ROW sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'Kms', 2, 'Prioritas 1', 58.08, 23.35, 40.2032, 80.4064, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(873, 24, 19, 'TEKNIS', '3.2', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan gardu distribusi, meliputi:\r\n- Trafo dan panel bagi\r\n- Kubikel', '100% terlaksananya pemeliharaan trafo dan panel bagi sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(874, 24, 19, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan peralatan jaringan', '100% terlaksanannya pemeliharaan peralatan jaringan sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(875, 24, 19, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', '100% kesesuaian data hasil sampling yang dilakukan oleh PLN terhadap pekerjaan yang dilaporkan oleh Pihak Kedua', 'Berita Acara Sampling', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(876, 24, 19, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', 'Tidak ada (0) Gangguan Pasca pemeliharaan sesuai aset yang dipelihara dalam masa garansi yang ditentukan masing-masing unit (30 hari Garansi)', 'laporan dan Hasil Sidang Engineering gangguan', 'Negatif', 'Gangguan pasca Har', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(877, 24, 19, 'TEKNIS', '3.5', 'Pemeliharaan Jaringan Distribusi', 'Memastikan pencapaian kinerja distribusi:\r\n- Gangguan penyulang zona 1\r\n- Gangguan penyulang zona 2\r\n\r\n', 'Kali Gangguan kali dalam 1 (satu) Periode bulanan.  \r\nGangguan yang diakibatkan Sesuai KPI Unit Masing-masing : \r\n-SLA ROW SUTM\r\n-Flashover\r\n-Binatang diKubikel\r\n-Gangguan Tidak jelas', 'laporan gangguan/Logsheet UP2D/DCC', 'Negatif', 'Kali Gangguan', 2, 'Prioritas 1', 4, 4, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(878, 24, 19, 'K3', '1.1', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Kualitas SDM dan Kompetensi Pekerja', '100% Kompetensi SDM sesuai dengan Kualifikasi pekerjaannya', 'Sertfifikasi Atau Pelatihan', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(879, 24, 19, 'K3', '1.2', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Peralatan Kerja sesuai dengan persyaratan dan dalam konsisi Laik', '100% Kesesuaian peralatan kerja dengan persyaratan dan dalam kondisi Laik', 'Formulir Chcelist Pemeriksaan alat kerja', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(880, 24, 19, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Alat Pelindung diri sesuai Risiko pekerjaan', 'Checklist APD', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(881, 24, 19, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Rambu dan LOTO pada Satuan Kerja', 'Checklist Rambu dan LOTO', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(882, 24, 19, 'K3', '1.4', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Melakukan pekerjaan sesuai dengan Prosedur dan Instruksi Kerja yang berlaku ( SOP,IK,WP)', 'Nol temuan pelanggaran prosedur dan instruksi kerja sesuai dengan sistem Manajemen K3', 'Laporan Inspsksi K3', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(883, 24, 19, 'K3', '1.5', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Inpeksi K3 oleh Direksi dan Management Perusahaan Alih Daya', 'Pelaksanaan Inspeksi oleh Direksi dan Management Perusahaan Alih Daya 2 kali / bulan', 'Laporan Inspsksi K3', 'Positif', 'Kali', 2, 'Prioritas 1', 2, 2, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(884, 24, 19, 'KECELAKAAN', '2.1', 'Kejadian Kecelakaan', 'Nihil Kejadian Kecelakaan Kerja Luka Berat dan Fatality', 'Nol temuan Kecelakaan Kerja', 'Laporan Investigasi', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(885, 24, 19, 'ILP', '1.1', 'Komitmen Integritas Layanan Publik (ILP)', 'Meminta / menerima imbalan (gratifikasi) dari pelanggan yang dilayani dan/atau dari PIHAK PERTAMA secara langsung', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(886, 24, 19, 'ILP', '1.2', 'Komitmen Integritas Layanan Publik (ILP)', 'Melakukan pungutan liar, Kolusi Korupsi atau Nepotisme dll; atau', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(887, 24, 19, 'ILP', '1.3', 'Komitmen Integritas Layanan Publik (ILP)', 'Dengan sengaja tidak memberikan kemudahan, kecepatan dan transparansi terkait layanan publik', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(888, 24, 20, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata response time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Respone-Dispatching', 'Negatif', 'Menit', 2, 'Prioritas 1', 30, 15.29, 149.0333, 298.0666, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(889, 24, 20, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata recovery time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Recovery', 'Negatif', 'Menit', 2, 'Prioritas 1', 100, 89.58, 110.42, 220.84, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(890, 24, 20, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah gangguan berulang bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Rasio', 2, 'Prioritas 1', 0.09, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(891, 24, 20, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah skip step bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Kali', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(892, 24, 20, 'TEKNIS', '2.1', 'Inspeksi Jaringan Distribusi', 'Melakukan inspeksi tier 1 dan tier 2 jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD)', '100% tercapainya jumlah inspeksi jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD) sesuai dengan target yang ditetapkan pada WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', '%', 2, 'Prioritas 1', 351, 105.61792207792206, 30.0906, 60.1812, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(893, 24, 20, 'TEKNIS', '3.1', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan jaringan, meliputi:\r\n- Right of Way (ROW)\r\n- Komponen dan peralatan\r\n- Konstruksi', '100% terlaksananya pemeliharaan ROW sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'Kms', 2, 'Prioritas 1', 80.96, 29.148999999999997, 36.0042, 72.0084, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(894, 24, 20, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan gardu distribusi, meliputi:\r\n- Trafo dan panel bagi\r\n- Kubikel', '100% terlaksananya pemeliharaan trafo dan panel bagi sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(895, 24, 20, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan peralatan jaringan', '100% terlaksanannya pemeliharaan peralatan jaringan sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(896, 24, 20, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', '100% kesesuaian data hasil sampling yang dilakukan oleh PLN terhadap pekerjaan yang dilaporkan oleh Pihak Kedua', 'Berita Acara Sampling', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(897, 24, 20, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', 'Tidak ada (0) Gangguan Pasca pemeliharaan sesuai aset yang dipelihara dalam masa garansi yang ditentukan masing-masing unit (30 hari Garansi)', 'laporan dan Hasil Sidang Engineering gangguan', 'Negatif', 'Gangguan pasca Har', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(898, 24, 20, 'TEKNIS', '3.5', 'Pemeliharaan Jaringan Distribusi', 'Memastikan pencapaian kinerja distribusi:\r\n- Gangguan penyulang zona 1\r\n- Gangguan penyulang zona 2\r\n\r\n', 'Kali Gangguan kali dalam 1 (satu) Periode bulanan.  \r\nGangguan yang diakibatkan Sesuai KPI Unit Masing-masing : \r\n-SLA ROW SUTM\r\n-Flashover\r\n-Binatang diKubikel\r\n-Gangguan Tidak jelas', 'laporan gangguan/Logsheet UP2D/DCC', 'Negatif', 'Kali Gangguan', 2, 'Prioritas 1', 20, 36, 20, 40, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL);
INSERT INTO `sla_entries` (`id`, `kontrak_id`, `ulp_id`, `kategori`, `no_urut`, `ruang_lingkup`, `kriteria`, `target_kinerja`, `eviden`, `polaritas`, `satuan`, `bobot`, `jenis_bobot`, `target`, `realisasi`, `persen_pencapaian`, `nilai_bobot`, `keterangan`, `target_waktu_input`, `unit_pelaksana`, `unit_layanan`, `site`, `project`, `catatan_tidak_tercapai`, `tanggal_input`, `blth`) VALUES
(899, 24, 20, 'K3', '1.1', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Kualitas SDM dan Kompetensi Pekerja', '100% Kompetensi SDM sesuai dengan Kualifikasi pekerjaannya', 'Sertfifikasi Atau Pelatihan', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(900, 24, 20, 'K3', '1.2', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Peralatan Kerja sesuai dengan persyaratan dan dalam konsisi Laik', '100% Kesesuaian peralatan kerja dengan persyaratan dan dalam kondisi Laik', 'Formulir Chcelist Pemeriksaan alat kerja', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(901, 24, 20, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Alat Pelindung diri sesuai Risiko pekerjaan', 'Checklist APD', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(902, 24, 20, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Rambu dan LOTO pada Satuan Kerja', 'Checklist Rambu dan LOTO', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(903, 24, 20, 'K3', '1.4', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Melakukan pekerjaan sesuai dengan Prosedur dan Instruksi Kerja yang berlaku ( SOP,IK,WP)', 'Nol temuan pelanggaran prosedur dan instruksi kerja sesuai dengan sistem Manajemen K3', 'Laporan Inspsksi K3', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(904, 24, 20, 'K3', '1.5', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Inpeksi K3 oleh Direksi dan Management Perusahaan Alih Daya', 'Pelaksanaan Inspeksi oleh Direksi dan Management Perusahaan Alih Daya 2 kali / bulan', 'Laporan Inspsksi K3', 'Positif', 'Kali', 2, 'Prioritas 1', 2, 2, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(905, 24, 20, 'KECELAKAAN', '2.1', 'Kejadian Kecelakaan', 'Nihil Kejadian Kecelakaan Kerja Luka Berat dan Fatality', 'Nol temuan Kecelakaan Kerja', 'Laporan Investigasi', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(906, 24, 20, 'ILP', '1.1', 'Komitmen Integritas Layanan Publik (ILP)', 'Meminta / menerima imbalan (gratifikasi) dari pelanggan yang dilayani dan/atau dari PIHAK PERTAMA secara langsung', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(907, 24, 20, 'ILP', '1.2', 'Komitmen Integritas Layanan Publik (ILP)', 'Melakukan pungutan liar, Kolusi Korupsi atau Nepotisme dll; atau', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(908, 24, 20, 'ILP', '1.3', 'Komitmen Integritas Layanan Publik (ILP)', 'Dengan sengaja tidak memberikan kemudahan, kecepatan dan transparansi terkait layanan publik', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(909, 24, 21, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata response time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Respone-Dispatching', 'Negatif', 'Menit', 2, 'Prioritas 1', 30, 11.77, 160.7667, 321.5334, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(910, 24, 21, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata recovery time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Recovery', 'Negatif', 'Menit', 2, 'Prioritas 1', 100, 63.98, 136.02, 272.04, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(911, 24, 21, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah gangguan berulang bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Rasio', 2, 'Prioritas 1', 0.09, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(912, 24, 21, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah skip step bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Kali', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(913, 24, 21, 'TEKNIS', '2.1', 'Inspeksi Jaringan Distribusi', 'Melakukan inspeksi tier 1 dan tier 2 jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD)', '100% tercapainya jumlah inspeksi jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD) sesuai dengan target yang ditetapkan pada WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', '%', 2, 'Prioritas 1', 425, 103.47038007863696, 24.346, 48.692, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(914, 24, 21, 'TEKNIS', '3.1', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan jaringan, meliputi:\r\n- Right of Way (ROW)\r\n- Komponen dan peralatan\r\n- Konstruksi', '100% terlaksananya pemeliharaan ROW sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'Kms', 2, 'Prioritas 1', 159.94, 64.31400000000001, 40.2113, 80.4226, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(915, 24, 21, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan gardu distribusi, meliputi:\r\n- Trafo dan panel bagi\r\n- Kubikel', '100% terlaksananya pemeliharaan trafo dan panel bagi sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(916, 24, 21, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan peralatan jaringan', '100% terlaksanannya pemeliharaan peralatan jaringan sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(917, 24, 21, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', '100% kesesuaian data hasil sampling yang dilakukan oleh PLN terhadap pekerjaan yang dilaporkan oleh Pihak Kedua', 'Berita Acara Sampling', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(918, 24, 21, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', 'Tidak ada (0) Gangguan Pasca pemeliharaan sesuai aset yang dipelihara dalam masa garansi yang ditentukan masing-masing unit (30 hari Garansi)', 'laporan dan Hasil Sidang Engineering gangguan', 'Negatif', 'Gangguan pasca Har', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(919, 24, 21, 'TEKNIS', '3.5', 'Pemeliharaan Jaringan Distribusi', 'Memastikan pencapaian kinerja distribusi:\r\n- Gangguan penyulang zona 1\r\n- Gangguan penyulang zona 2\r\n\r\n', 'Kali Gangguan kali dalam 1 (satu) Periode bulanan.  \r\nGangguan yang diakibatkan Sesuai KPI Unit Masing-masing : \r\n-SLA ROW SUTM\r\n-Flashover\r\n-Binatang diKubikel\r\n-Gangguan Tidak jelas', 'laporan gangguan/Logsheet UP2D/DCC', 'Negatif', 'Kali Gangguan', 2, 'Prioritas 1', 15, 26, 26.6667, 53.3334, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(920, 24, 21, 'K3', '1.1', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Kualitas SDM dan Kompetensi Pekerja', '100% Kompetensi SDM sesuai dengan Kualifikasi pekerjaannya', 'Sertfifikasi Atau Pelatihan', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(921, 24, 21, 'K3', '1.2', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Peralatan Kerja sesuai dengan persyaratan dan dalam konsisi Laik', '100% Kesesuaian peralatan kerja dengan persyaratan dan dalam kondisi Laik', 'Formulir Chcelist Pemeriksaan alat kerja', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(922, 24, 21, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Alat Pelindung diri sesuai Risiko pekerjaan', 'Checklist APD', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(923, 24, 21, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Rambu dan LOTO pada Satuan Kerja', 'Checklist Rambu dan LOTO', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(924, 24, 21, 'K3', '1.4', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Melakukan pekerjaan sesuai dengan Prosedur dan Instruksi Kerja yang berlaku ( SOP,IK,WP)', 'Nol temuan pelanggaran prosedur dan instruksi kerja sesuai dengan sistem Manajemen K3', 'Laporan Inspsksi K3', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(925, 24, 21, 'K3', '1.5', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Inpeksi K3 oleh Direksi dan Management Perusahaan Alih Daya', 'Pelaksanaan Inspeksi oleh Direksi dan Management Perusahaan Alih Daya 2 kali / bulan', 'Laporan Inspsksi K3', 'Positif', 'Kali', 2, 'Prioritas 1', 2, 2, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(926, 24, 21, 'KECELAKAAN', '2.1', 'Kejadian Kecelakaan', 'Nihil Kejadian Kecelakaan Kerja Luka Berat dan Fatality', 'Nol temuan Kecelakaan Kerja', 'Laporan Investigasi', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(927, 24, 21, 'ILP', '1.1', 'Komitmen Integritas Layanan Publik (ILP)', 'Meminta / menerima imbalan (gratifikasi) dari pelanggan yang dilayani dan/atau dari PIHAK PERTAMA secara langsung', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(928, 24, 21, 'ILP', '1.2', 'Komitmen Integritas Layanan Publik (ILP)', 'Melakukan pungutan liar, Kolusi Korupsi atau Nepotisme dll; atau', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(929, 24, 21, 'ILP', '1.3', 'Komitmen Integritas Layanan Publik (ILP)', 'Dengan sengaja tidak memberikan kemudahan, kecepatan dan transparansi terkait layanan publik', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(930, 24, 22, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata response time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Respone-Dispatching', 'Negatif', 'Menit', 2, 'Prioritas 1', 30, 13.34, 155.5333, 311.0666, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(931, 24, 22, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata recovery time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Recovery', 'Negatif', 'Menit', 2, 'Prioritas 1', 100, 69.14, 130.86, 261.72, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(932, 24, 22, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah gangguan berulang bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Rasio', 2, 'Prioritas 1', 0.09, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(933, 24, 22, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah skip step bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Kali', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(934, 24, 22, 'TEKNIS', '2.1', 'Inspeksi Jaringan Distribusi', 'Melakukan inspeksi tier 1 dan tier 2 jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD)', '100% tercapainya jumlah inspeksi jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD) sesuai dengan target yang ditetapkan pada WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', '%', 2, 'Prioritas 1', 393, 100.02780337941628, 25.4524, 50.9048, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(935, 24, 22, 'TEKNIS', '3.1', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan jaringan, meliputi:\r\n- Right of Way (ROW)\r\n- Komponen dan peralatan\r\n- Konstruksi', '100% terlaksananya pemeliharaan ROW sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'Kms', 2, 'Prioritas 1', 135.96, 90.55099999999999, 66.6012, 133.2024, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(936, 24, 22, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan gardu distribusi, meliputi:\r\n- Trafo dan panel bagi\r\n- Kubikel', '100% terlaksananya pemeliharaan trafo dan panel bagi sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(937, 24, 22, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan peralatan jaringan', '100% terlaksanannya pemeliharaan peralatan jaringan sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(938, 24, 22, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', '100% kesesuaian data hasil sampling yang dilakukan oleh PLN terhadap pekerjaan yang dilaporkan oleh Pihak Kedua', 'Berita Acara Sampling', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(939, 24, 22, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', 'Tidak ada (0) Gangguan Pasca pemeliharaan sesuai aset yang dipelihara dalam masa garansi yang ditentukan masing-masing unit (30 hari Garansi)', 'laporan dan Hasil Sidang Engineering gangguan', 'Negatif', 'Gangguan pasca Har', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(940, 24, 22, 'TEKNIS', '3.5', 'Pemeliharaan Jaringan Distribusi', 'Memastikan pencapaian kinerja distribusi:\r\n- Gangguan penyulang zona 1\r\n- Gangguan penyulang zona 2\r\n\r\n', 'Kali Gangguan kali dalam 1 (satu) Periode bulanan.  \r\nGangguan yang diakibatkan Sesuai KPI Unit Masing-masing : \r\n-SLA ROW SUTM\r\n-Flashover\r\n-Binatang diKubikel\r\n-Gangguan Tidak jelas', 'laporan gangguan/Logsheet UP2D/DCC', 'Negatif', 'Kali Gangguan', 2, 'Prioritas 1', 15, 42, -80, -160, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(941, 24, 22, 'K3', '1.1', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Kualitas SDM dan Kompetensi Pekerja', '100% Kompetensi SDM sesuai dengan Kualifikasi pekerjaannya', 'Sertfifikasi Atau Pelatihan', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(942, 24, 22, 'K3', '1.2', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Peralatan Kerja sesuai dengan persyaratan dan dalam konsisi Laik', '100% Kesesuaian peralatan kerja dengan persyaratan dan dalam kondisi Laik', 'Formulir Chcelist Pemeriksaan alat kerja', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(943, 24, 22, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Alat Pelindung diri sesuai Risiko pekerjaan', 'Checklist APD', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(944, 24, 22, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Rambu dan LOTO pada Satuan Kerja', 'Checklist Rambu dan LOTO', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(945, 24, 22, 'K3', '1.4', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Melakukan pekerjaan sesuai dengan Prosedur dan Instruksi Kerja yang berlaku ( SOP,IK,WP)', 'Nol temuan pelanggaran prosedur dan instruksi kerja sesuai dengan sistem Manajemen K3', 'Laporan Inspsksi K3', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(946, 24, 22, 'K3', '1.5', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Inpeksi K3 oleh Direksi dan Management Perusahaan Alih Daya', 'Pelaksanaan Inspeksi oleh Direksi dan Management Perusahaan Alih Daya 2 kali / bulan', 'Laporan Inspsksi K3', 'Positif', 'Kali', 2, 'Prioritas 1', 2, 2, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(947, 24, 22, 'KECELAKAAN', '2.1', 'Kejadian Kecelakaan', 'Nihil Kejadian Kecelakaan Kerja Luka Berat dan Fatality', 'Nol temuan Kecelakaan Kerja', 'Laporan Investigasi', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(948, 24, 22, 'ILP', '1.1', 'Komitmen Integritas Layanan Publik (ILP)', 'Meminta / menerima imbalan (gratifikasi) dari pelanggan yang dilayani dan/atau dari PIHAK PERTAMA secara langsung', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(949, 24, 22, 'ILP', '1.2', 'Komitmen Integritas Layanan Publik (ILP)', 'Melakukan pungutan liar, Kolusi Korupsi atau Nepotisme dll; atau', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(950, 24, 22, 'ILP', '1.3', 'Komitmen Integritas Layanan Publik (ILP)', 'Dengan sengaja tidak memberikan kemudahan, kecepatan dan transparansi terkait layanan publik', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(951, 24, 23, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata response time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Respone-Dispatching', 'Negatif', 'Menit', 2, 'Prioritas 1', 30, 15.11, 149.6333, 299.2666, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(952, 24, 23, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata recovery time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Recovery', 'Negatif', 'Menit', 2, 'Prioritas 1', 100, 61.41, 138.59, 277.18, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(953, 24, 23, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah gangguan berulang bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Rasio', 2, 'Prioritas 1', 0.09, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(954, 24, 23, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah skip step bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Kali', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(955, 24, 23, 'TEKNIS', '2.1', 'Inspeksi Jaringan Distribusi', 'Melakukan inspeksi tier 1 dan tier 2 jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD)', '100% tercapainya jumlah inspeksi jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD) sesuai dengan target yang ditetapkan pada WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', '%', 2, 'Prioritas 1', 402, 100.05890652557319, 24.8903, 49.7806, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(956, 24, 23, 'TEKNIS', '3.1', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan jaringan, meliputi:\r\n- Right of Way (ROW)\r\n- Komponen dan peralatan\r\n- Konstruksi', '100% terlaksananya pemeliharaan ROW sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'Kms', 2, 'Prioritas 1', 119.02, 43.504999999999995, 36.5527, 73.1054, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(957, 24, 23, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan gardu distribusi, meliputi:\r\n- Trafo dan panel bagi\r\n- Kubikel', '100% terlaksananya pemeliharaan trafo dan panel bagi sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(958, 24, 23, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan peralatan jaringan', '100% terlaksanannya pemeliharaan peralatan jaringan sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(959, 24, 23, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', '100% kesesuaian data hasil sampling yang dilakukan oleh PLN terhadap pekerjaan yang dilaporkan oleh Pihak Kedua', 'Berita Acara Sampling', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(960, 24, 23, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', 'Tidak ada (0) Gangguan Pasca pemeliharaan sesuai aset yang dipelihara dalam masa garansi yang ditentukan masing-masing unit (30 hari Garansi)', 'laporan dan Hasil Sidang Engineering gangguan', 'Negatif', 'Gangguan pasca Har', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(961, 24, 23, 'TEKNIS', '3.5', 'Pemeliharaan Jaringan Distribusi', 'Memastikan pencapaian kinerja distribusi:\r\n- Gangguan penyulang zona 1\r\n- Gangguan penyulang zona 2\r\n\r\n', 'Kali Gangguan kali dalam 1 (satu) Periode bulanan.  \r\nGangguan yang diakibatkan Sesuai KPI Unit Masing-masing : \r\n-SLA ROW SUTM\r\n-Flashover\r\n-Binatang diKubikel\r\n-Gangguan Tidak jelas', 'laporan gangguan/Logsheet UP2D/DCC', 'Negatif', 'Kali Gangguan', 2, 'Prioritas 1', 22, 36, 36.3636, 72.7272, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(962, 24, 23, 'K3', '1.1', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Kualitas SDM dan Kompetensi Pekerja', '100% Kompetensi SDM sesuai dengan Kualifikasi pekerjaannya', 'Sertfifikasi Atau Pelatihan', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(963, 24, 23, 'K3', '1.2', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Peralatan Kerja sesuai dengan persyaratan dan dalam konsisi Laik', '100% Kesesuaian peralatan kerja dengan persyaratan dan dalam kondisi Laik', 'Formulir Chcelist Pemeriksaan alat kerja', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(964, 24, 23, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Alat Pelindung diri sesuai Risiko pekerjaan', 'Checklist APD', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(965, 24, 23, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Rambu dan LOTO pada Satuan Kerja', 'Checklist Rambu dan LOTO', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(966, 24, 23, 'K3', '1.4', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Melakukan pekerjaan sesuai dengan Prosedur dan Instruksi Kerja yang berlaku ( SOP,IK,WP)', 'Nol temuan pelanggaran prosedur dan instruksi kerja sesuai dengan sistem Manajemen K3', 'Laporan Inspsksi K3', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(967, 24, 23, 'K3', '1.5', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Inpeksi K3 oleh Direksi dan Management Perusahaan Alih Daya', 'Pelaksanaan Inspeksi oleh Direksi dan Management Perusahaan Alih Daya 2 kali / bulan', 'Laporan Inspsksi K3', 'Positif', 'Kali', 2, 'Prioritas 1', 2, 2, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(968, 24, 23, 'KECELAKAAN', '2.1', 'Kejadian Kecelakaan', 'Nihil Kejadian Kecelakaan Kerja Luka Berat dan Fatality', 'Nol temuan Kecelakaan Kerja', 'Laporan Investigasi', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(969, 24, 23, 'ILP', '1.1', 'Komitmen Integritas Layanan Publik (ILP)', 'Meminta / menerima imbalan (gratifikasi) dari pelanggan yang dilayani dan/atau dari PIHAK PERTAMA secara langsung', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(970, 24, 23, 'ILP', '1.2', 'Komitmen Integritas Layanan Publik (ILP)', 'Melakukan pungutan liar, Kolusi Korupsi atau Nepotisme dll; atau', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(971, 24, 23, 'ILP', '1.3', 'Komitmen Integritas Layanan Publik (ILP)', 'Dengan sengaja tidak memberikan kemudahan, kecepatan dan transparansi terkait layanan publik', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(972, 24, 24, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata response time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Respone-Dispatching', 'Negatif', 'Menit', 2, 'Prioritas 1', 30, 15.59, 148.0333, 296.0666, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(973, 24, 24, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya rata-rata recovery time bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi Gangguan all Recovery', 'Negatif', 'Menit', 2, 'Prioritas 1', 100, 85.75, 114.25, 228.5, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(974, 24, 24, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah gangguan berulang bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Rasio', 2, 'Prioritas 1', 0.09, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(975, 24, 24, 'TEKNIS', '1.1', 'Pelayanan Teknik', 'Melakukan penanganan gangguan', '100% terpenuhinya jumlah skip step bulanan gangguan total sesuai dengan target yang ditetapkan pada masing-masing unit', 'EIS APKT Menu Rekapitulasi dan/atau Laporan Hasil Investigasi', 'Negatif', 'Kali', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(976, 24, 24, 'TEKNIS', '2.1', 'Inspeksi Jaringan Distribusi', 'Melakukan inspeksi tier 1 dan tier 2 jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD)', '100% tercapainya jumlah inspeksi jaringan, gardu distribusi, dan peralatan jaringan (titik sambung, SSO, recloser, keypoint, CBO, PMFD, GFD) sesuai dengan target yang ditetapkan pada WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', '%', 2, 'Prioritas 1', 301, 119.9916423712342, 39.8643, 79.7286, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(977, 24, 24, 'TEKNIS', '3.1', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan jaringan, meliputi:\r\n- Right of Way (ROW)\r\n- Komponen dan peralatan\r\n- Konstruksi', '100% terlaksananya pemeliharaan ROW sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'Kms', 2, 'Prioritas 1', 71.94, 56, 77.8426, 155.6852, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(978, 24, 24, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan gardu distribusi, meliputi:\r\n- Trafo dan panel bagi\r\n- Kubikel', '100% terlaksananya pemeliharaan trafo dan panel bagi sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi Maximo', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(979, 24, 24, 'TEKNIS', '3.3', 'Pemeliharaan Jaringan Distribusi', 'Melakukan pemeliharaan peralatan jaringan', '100% terlaksanannya pemeliharaan peralatan jaringan sesuai dengan WO', 'Work Order (WO) dan terinput di Aplikasi', 'Positif', 'WO', 2, 'Prioritas 1', 1, 1, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(980, 24, 24, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', '100% kesesuaian data hasil sampling yang dilakukan oleh PLN terhadap pekerjaan yang dilaporkan oleh Pihak Kedua', 'Berita Acara Sampling', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(981, 24, 24, 'TEKNIS', '3.4', 'Pemeliharaan Jaringan Distribusi', 'Memastikan kualitas pekerjaan pasca pemeliharaan jaringan dan gardu (Sampling maks 10%)', 'Tidak ada (0) Gangguan Pasca pemeliharaan sesuai aset yang dipelihara dalam masa garansi yang ditentukan masing-masing unit (30 hari Garansi)', 'laporan dan Hasil Sidang Engineering gangguan', 'Negatif', 'Gangguan pasca Har', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(982, 24, 24, 'TEKNIS', '3.5', 'Pemeliharaan Jaringan Distribusi', 'Memastikan pencapaian kinerja distribusi:\r\n- Gangguan penyulang zona 1\r\n- Gangguan penyulang zona 2\r\n\r\n', 'Kali Gangguan kali dalam 1 (satu) Periode bulanan.  \r\nGangguan yang diakibatkan Sesuai KPI Unit Masing-masing : \r\n-SLA ROW SUTM\r\n-Flashover\r\n-Binatang diKubikel\r\n-Gangguan Tidak jelas', 'laporan gangguan/Logsheet UP2D/DCC', 'Negatif', 'Kali Gangguan', 2, 'Prioritas 1', 18, 50, -77.7778, -155.5556, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(983, 24, 24, 'K3', '1.1', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Kualitas SDM dan Kompetensi Pekerja', '100% Kompetensi SDM sesuai dengan Kualifikasi pekerjaannya', 'Sertfifikasi Atau Pelatihan', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(984, 24, 24, 'K3', '1.2', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Peralatan Kerja sesuai dengan persyaratan dan dalam konsisi Laik', '100% Kesesuaian peralatan kerja dengan persyaratan dan dalam kondisi Laik', 'Formulir Chcelist Pemeriksaan alat kerja', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(985, 24, 24, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Alat Pelindung diri sesuai Risiko pekerjaan', 'Checklist APD', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(986, 24, 24, 'K3', '1.3', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Alat Keselamatan Kerja ( APD, Rambu, LOTO)', '100% Penyediaan Rambu dan LOTO pada Satuan Kerja', 'Checklist Rambu dan LOTO', 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(987, 24, 24, 'K3', '1.4', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Melakukan pekerjaan sesuai dengan Prosedur dan Instruksi Kerja yang berlaku ( SOP,IK,WP)', 'Nol temuan pelanggaran prosedur dan instruksi kerja sesuai dengan sistem Manajemen K3', 'Laporan Inspsksi K3', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(988, 24, 24, 'K3', '1.5', 'Penerapan Keselamatan dan Keseharan Kerja (K3) di tempat Kerja', 'Inpeksi K3 oleh Direksi dan Management Perusahaan Alih Daya', 'Pelaksanaan Inspeksi oleh Direksi dan Management Perusahaan Alih Daya 2 kali / bulan', 'Laporan Inspsksi K3', 'Positif', 'Kali', 2, 'Prioritas 1', 2, 2, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(989, 24, 24, 'KECELAKAAN', '2.1', 'Kejadian Kecelakaan', 'Nihil Kejadian Kecelakaan Kerja Luka Berat dan Fatality', 'Nol temuan Kecelakaan Kerja', 'Laporan Investigasi', 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(990, 24, 24, 'ILP', '1.1', 'Komitmen Integritas Layanan Publik (ILP)', 'Meminta / menerima imbalan (gratifikasi) dari pelanggan yang dilayani dan/atau dari PIHAK PERTAMA secara langsung', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(991, 24, 24, 'ILP', '1.2', 'Komitmen Integritas Layanan Publik (ILP)', 'Melakukan pungutan liar, Kolusi Korupsi atau Nepotisme dll; atau', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(992, 24, 24, 'ILP', '1.3', 'Komitmen Integritas Layanan Publik (ILP)', 'Dengan sengaja tidak memberikan kemudahan, kecepatan dan transparansi terkait layanan publik', 'Tidak ada (0) laporan pelanggaran ILP', 'Dokumen laporan pelanggaran ILP', 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, 'O&M DIST. MANADO', NULL, NULL, NULL),
(993, 25, NULL, 'TEKNIS', '1', 'Pelayanan Teknik', 'Response Time Gangguan', '100% terpenuhinya rata-rata response time', NULL, 'Negatif', 'Menit', 2, 'Prioritas 1', 30, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, 25, NULL, 'TEKNIS', '1', 'Pelayanan Teknik', 'Recovery Time Gangguan', '100% terpenuhinya rata-rata recovery time', NULL, 'Negatif', 'Menit', 2, 'Prioritas 1', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(995, 25, NULL, 'TEKNIS', '1', 'Pelayanan Teknik', 'Gangguan Berulang', '100% terpenuhinya jumlah gangguan berulang', NULL, 'Negatif', 'Rasio', 2, 'Prioritas 1', 0.09, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(996, 25, NULL, 'TEKNIS', '1', 'Pelayanan Teknik', 'Skip Step', '100% terpenuhinya jumlah skip step', NULL, 'Negatif', 'Kali', 2, 'Prioritas 1', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(997, 25, NULL, 'TEKNIS', '2', 'Inspeksi Jaringan Distribusi', 'Inspeksi Tier 1 & 2', '100% tercapainya jumlah inspeksi jaringan, gardu distribusi', NULL, 'Positif', '%', 2, 'Prioritas 1', 100, 100, 100, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(998, 25, NULL, 'TEKNIS', '3', 'Pemeliharaan Jaringan Distribusi', 'Pemeliharaan ROW', '100% terlaksananya pemeliharaan ROW sesuai WO', NULL, 'Positif', 'Kms', 2, 'Prioritas 1', 100, 13, 13, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(999, 25, NULL, 'TEKNIS', '3', 'Pemeliharaan Jaringan Distribusi', 'Pemeliharaan Gardu', '100% terlaksananya pemeliharaan trafo dan panel bagi sesuai WO', NULL, 'Positif', '%', 2, 'Prioritas 1', 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1000, 25, NULL, 'TEKNIS', '3', 'Pemeliharaan Jaringan Distribusi', 'Pemeliharaan Peralatan Jaringan', '100% terlaksananya pemeliharaan peralatan jaringan sesuai WO', NULL, 'Positif', '%', 2, 'Prioritas 1', 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, 25, NULL, 'TEKNIS', '3', 'Pemeliharaan Jaringan Distribusi', 'Kesesuaian Sampling', '100% kesesuaian data hasil sampling', NULL, 'Positif', '%', 2, 'Prioritas 1', 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1002, 25, NULL, 'TEKNIS', '3', 'Pemeliharaan Jaringan Distribusi', 'Gangguan Pasca Pemeliharaan', 'Tidak ada gangguan pasca pemeliharaan (30 hari garansi)', NULL, 'Negatif', 'Gangguan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, 25, NULL, 'TEKNIS', '3', 'Pemeliharaan Jaringan Distribusi', 'Gangguan Penyulang', 'Kali gangguan dalam 1 periode bulanan', NULL, 'Negatif', 'Kali Gangguan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, 25, NULL, 'K3', '1', 'Penerapan K3 di Tempat Kerja', 'Kompetensi SDM', '100% Kompetensi SDM sesuai Kualifikasi', NULL, 'Positif', '%', 2, 'Prioritas 1', 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1005, 25, NULL, 'K3', '1', 'Penerapan K3 di Tempat Kerja', 'Peralatan Kerja Laik', '100% Kesesuaian peralatan kerja', NULL, 'Positif', '%', 2, 'Prioritas 1', 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1006, 25, NULL, 'K3', '1', 'Penerapan K3 di Tempat Kerja', 'APD Sesuai Risiko', '100% Penyediaan APD sesuai risiko pekerjaan', NULL, 'Positif', '%', 2, 'Prioritas 1', 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1007, 25, NULL, 'K3', '1', 'Penerapan K3 di Tempat Kerja', 'Rambu dan LOTO', '100% Penyediaan Rambu dan LOTO', NULL, 'Positif', '%', 2, 'Prioritas 1', 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1008, 25, NULL, 'K3', '1', 'Penerapan K3 di Tempat Kerja', 'Prosedur dan IK', 'Nol temuan pelanggaran prosedur K3', NULL, 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1009, 25, NULL, 'K3', '1', 'Penerapan K3 di Tempat Kerja', 'Inspeksi K3 Management', 'Inspeksi oleh Direksi 2 kali/bulan per ULP', NULL, 'Positif', 'Kali', 2, 'Prioritas 1', 6, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1010, 25, NULL, 'KECELAKAAN', '2', 'Kejadian Kecelakaan', 'Nihil Kecelakaan', 'Nol temuan Kecelakaan Kerja Luka Berat/Fatality', NULL, 'Negatif', 'Temuan', 2, 'Prioritas 1', 0, 0, 100, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1011, 25, NULL, 'ILP', '1', 'Komitmen ILP', 'Gratifikasi', 'Tidak ada laporan pelanggaran gratifikasi', NULL, 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1012, 25, NULL, 'ILP', '1', 'Komitmen ILP', 'Pungli/KKN', 'Tidak ada laporan pelanggaran Pungli/KKN', NULL, 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1013, 25, NULL, 'ILP', '1', 'Komitmen ILP', 'Layanan Publik', 'Tidak ada laporan pelanggaran layanan publik', NULL, 'Negatif', 'Laporan', 1, 'Prioritas 2', 0, 0, 100, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sla_history`
--

CREATE TABLE `sla_history` (
  `id` int(11) NOT NULL,
  `kontrak_id` int(11) NOT NULL,
  `tgl_rekap` date NOT NULL,
  `sla_teknis` double DEFAULT 0,
  `sla_k3` double DEFAULT 0,
  `sla_kecelakaan` double DEFAULT 0,
  `sla_ilp` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sla_history`
--

INSERT INTO `sla_history` (`id`, `kontrak_id`, `tgl_rekap`, `sla_teknis`, `sla_k3`, `sla_kecelakaan`, `sla_ilp`) VALUES
(13, 15, '2026-09-18', 100.51282051282051, 100, 0, 100),
(14, 16, '2026-09-18', 99.90222222222222, 100, 0, 100),
(15, 17, '2026-09-18', 97.09673636363637, 98.45421666666668, 100, 100),
(21, 24, '2026-09-18', 87.43469393939395, 100, 100, 100),
(22, 25, '2026-09-28', 51.625, 16.666666666667, 100, 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulp`
--

CREATE TABLE `ulp` (
  `id` int(11) NOT NULL,
  `kontrak_id` int(11) DEFAULT NULL,
  `ulp_master_id` int(11) DEFAULT NULL,
  `nama_ulp` varchar(255) DEFAULT NULL,
  `manager_pln` varchar(255) DEFAULT NULL,
  `koordinator_nd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ulp`
--

INSERT INTO `ulp` (`id`, `kontrak_id`, `ulp_master_id`, `nama_ulp`, `manager_pln`, `koordinator_nd`) VALUES
(19, 24, 7, 'ULP Tomohon', NULL, NULL),
(20, 24, 8, 'ULP Tondano', NULL, NULL),
(21, 24, 21, 'ULP Kawangkoan', NULL, NULL),
(22, 24, 22, 'ULP Ratahan', NULL, NULL),
(23, 24, 23, 'ULP Amurang', NULL, NULL),
(24, 24, 24, 'ULP Motoling', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulp_master`
--

CREATE TABLE `ulp_master` (
  `id` int(11) NOT NULL,
  `nama_ulp` varchar(255) NOT NULL,
  `manager_pln` varchar(255) DEFAULT NULL,
  `koordinator_nd` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ulp_master`
--

INSERT INTO `ulp_master` (`id`, `nama_ulp`, `manager_pln`, `koordinator_nd`, `keterangan`, `is_active`, `created_at`) VALUES
(1, 'ULP Kotamobagu', NULL, NULL, NULL, 1, '2026-09-17 08:56:21'),
(2, 'ULP Inobonto', NULL, NULL, NULL, 1, '2026-09-17 08:56:21'),
(3, 'ULP Bolmut', NULL, NULL, NULL, 1, '2026-09-17 08:56:21'),
(4, 'ULP Imandi', NULL, NULL, NULL, 1, '2026-09-17 08:56:21'),
(5, 'ULP Modayag', NULL, NULL, NULL, 1, '2026-09-17 08:56:21'),
(6, 'ULP Molibagu', NULL, NULL, NULL, 1, '2026-09-17 08:56:21'),
(7, 'ULP Tomohon', NULL, NULL, NULL, 1, '2026-09-17 08:56:21'),
(8, 'ULP Tondano', NULL, NULL, NULL, 1, '2026-09-17 08:56:21'),
(9, 'ULP Kawangkoan', NULL, NULL, NULL, 1, '2026-09-18 15:18:40'),
(10, 'ULP Ratahan', NULL, NULL, NULL, 1, '2026-09-18 15:18:40'),
(11, 'ULP Amurang', NULL, NULL, NULL, 1, '2026-09-18 15:18:40'),
(12, 'ULP Motoling', NULL, NULL, NULL, 1, '2026-09-18 15:18:40'),
(17, 'ULP Kawangkoan', NULL, NULL, NULL, 1, '2026-09-18 15:25:02'),
(18, 'ULP Ratahan', NULL, NULL, NULL, 1, '2026-09-18 15:25:02'),
(19, 'ULP Amurang', NULL, NULL, NULL, 1, '2026-09-18 15:25:02'),
(20, 'ULP Motoling', NULL, NULL, NULL, 1, '2026-09-18 15:25:02'),
(21, 'ULP Kawangkoan', NULL, NULL, NULL, 1, '2026-09-18 15:37:13'),
(22, 'ULP Ratahan', NULL, NULL, NULL, 1, '2026-09-18 15:37:13'),
(23, 'ULP Amurang', NULL, NULL, NULL, 1, '2026-09-18 15:37:13'),
(24, 'ULP Motoling', NULL, NULL, NULL, 1, '2026-09-18 15:37:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit_kerja`
--

CREATE TABLE `unit_kerja` (
  `id` int(11) NOT NULL,
  `jenis_kontrak` varchar(50) NOT NULL DEFAULT 'DISTRIBUSI',
  `kode` varchar(30) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `urutan` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `unit_kerja`
--

INSERT INTO `unit_kerja` (`id`, `jenis_kontrak`, `kode`, `nama`, `keterangan`, `urutan`, `is_active`, `created_at`) VALUES
(1, 'TRANSMISI', 'OPGI', 'O&M GI UPT MANADO', NULL, 1, 1, '2026-09-02 09:24:29'),
(2, 'TRANSMISI', 'GP', 'GROUND PATROL UPT MANADO', NULL, 1, 1, '2026-09-02 09:24:29'),
(16, 'DISTRIBUSI', 'MANADO', 'O&M DIST. MANADO', NULL, 2, 1, '2026-09-09 09:31:49'),
(17, 'DISTRIBUSI', 'TAHUNA', 'O&M DIST. TAHUNA', NULL, 3, 1, '2026-09-09 09:31:50'),
(21, 'DISTRIBUSI', 'DISTRIBUSI', 'O&M DIST. KOTAMOBAGU', NULL, 1, 1, '2026-09-17 09:05:00'),
(22, 'TRANSMISI', 'HAR_TRANS', 'HAR. TRANS. UPT MANADO', NULL, 3, 1, '2026-09-17 14:45:16'),
(23, 'DISTRIBUSI', 'KEYPOINT_SCADA', 'HAR. KEYPOINT SCADA', NULL, 4, 1, '2026-09-17 14:45:16'),
(24, 'PEMBANGKIT', 'KIT_MINAHASA', 'O&M KIT MINAHASA', NULL, 1, 1, '2026-09-17 14:45:16'),
(25, 'PEMBANGKIT', 'KIT_LAHENDONG', 'O&M KIT. PLTP LAHENDONG', NULL, 2, 1, '2026-09-17 14:45:16'),
(26, 'DISTRIBUSI', 'KEPULAUAN', 'O&M DIST. KEPULAUAN', NULL, 5, 1, '2026-09-18 15:18:40');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_modul_time` (`modul`,`created_at`);

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_kendaraan_nopol` (`nomor_polisi`),
  ADD KEY `kontrak_id` (`kontrak_id`),
  ADD KEY `fk_kendaraan_ulp_id` (`ulp_id`);

--
-- Indeks untuk tabel `keypoint_entries`
--
ALTER TABLE `keypoint_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kota_bidang` (`kota`,`bidang`),
  ADD KEY `idx_tanggal` (`tanggal`);

--
-- Indeks untuk tabel `keypoint_eviden`
--
ALTER TABLE `keypoint_eviden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entry` (`entry_id`);

--
-- Indeks untuk tabel `keypoint_personil`
--
ALTER TABLE `keypoint_personil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_keypoint_personil` (`nama`,`jabatan`,`penempatan`),
  ADD KEY `idx_penempatan` (`penempatan`),
  ADD KEY `idx_jabatan` (`jabatan`);

--
-- Indeks untuk tabel `keypoint_tim`
--
ALTER TABLE `keypoint_tim`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kontrak`
--
ALTER TABLE `kontrak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kontrak_unit_id` (`unit_id`),
  ADD KEY `fk_kontrak_vendor_id` (`vendor_id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_username_time` (`username`,`created_at`),
  ADD KEY `idx_ip_time` (`ip_address`,`created_at`);

--
-- Indeks untuk tabel `monitoring_harian`
--
ALTER TABLE `monitoring_harian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_entry_periode` (`sla_entry_id`,`periode`);

--
-- Indeks untuk tabel `personil`
--
ALTER TABLE `personil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_personil_kontrak_nama` (`kontrak_id`,`nama_petugas`),
  ADD KEY `fk_personil_ulp_id` (`ulp_id`);

--
-- Indeks untuk tabel `rekap_sla`
--
ALTER TABLE `rekap_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kontrak_id` (`kontrak_id`);

--
-- Indeks untuk tabel `sla_entries`
--
ALTER TABLE `sla_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kontrak_id` (`kontrak_id`),
  ADD KEY `ulp_id` (`ulp_id`);

--
-- Indeks untuk tabel `sla_history`
--
ALTER TABLE `sla_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_kontrak_tgl` (`kontrak_id`,`tgl_rekap`);

--
-- Indeks untuk tabel `ulp`
--
ALTER TABLE `ulp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ulp_kontrak_nama` (`kontrak_id`,`nama_ulp`),
  ADD KEY `fk_ulp_ulp_master_id` (`ulp_master_id`);

--
-- Indeks untuk tabel `ulp_master`
--
ALTER TABLE `ulp_master`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `unit_kerja`
--
ALTER TABLE `unit_kerja`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_unit_jenis_kode` (`jenis_kontrak`,`kode`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keypoint_entries`
--
ALTER TABLE `keypoint_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `keypoint_eviden`
--
ALTER TABLE `keypoint_eviden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `keypoint_personil`
--
ALTER TABLE `keypoint_personil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20795;

--
-- AUTO_INCREMENT untuk tabel `keypoint_tim`
--
ALTER TABLE `keypoint_tim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kontrak`
--
ALTER TABLE `kontrak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT untuk tabel `monitoring_harian`
--
ALTER TABLE `monitoring_harian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT untuk tabel `personil`
--
ALTER TABLE `personil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rekap_sla`
--
ALTER TABLE `rekap_sla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `sla_entries`
--
ALTER TABLE `sla_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;

--
-- AUTO_INCREMENT untuk tabel `sla_history`
--
ALTER TABLE `sla_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `ulp`
--
ALTER TABLE `ulp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `ulp_master`
--
ALTER TABLE `ulp_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `unit_kerja`
--
ALTER TABLE `unit_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `fk_kendaraan_ulp_id` FOREIGN KEY (`ulp_id`) REFERENCES `ulp` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`kontrak_id`) REFERENCES `kontrak` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keypoint_eviden`
--
ALTER TABLE `keypoint_eviden`
  ADD CONSTRAINT `fk_keypoint_eviden_entry` FOREIGN KEY (`entry_id`) REFERENCES `keypoint_entries` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kontrak`
--
ALTER TABLE `kontrak`
  ADD CONSTRAINT `fk_kontrak_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit_kerja` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_kontrak_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `monitoring_harian`
--
ALTER TABLE `monitoring_harian`
  ADD CONSTRAINT `monitoring_harian_ibfk_1` FOREIGN KEY (`sla_entry_id`) REFERENCES `sla_entries` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `personil`
--
ALTER TABLE `personil`
  ADD CONSTRAINT `fk_personil_ulp_id` FOREIGN KEY (`ulp_id`) REFERENCES `ulp` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `personil_ibfk_1` FOREIGN KEY (`kontrak_id`) REFERENCES `kontrak` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rekap_sla`
--
ALTER TABLE `rekap_sla`
  ADD CONSTRAINT `rekap_sla_ibfk_1` FOREIGN KEY (`kontrak_id`) REFERENCES `kontrak` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sla_entries`
--
ALTER TABLE `sla_entries`
  ADD CONSTRAINT `sla_entries_ibfk_1` FOREIGN KEY (`kontrak_id`) REFERENCES `kontrak` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sla_entries_ibfk_2` FOREIGN KEY (`ulp_id`) REFERENCES `ulp` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sla_history`
--
ALTER TABLE `sla_history`
  ADD CONSTRAINT `sla_history_ibfk_1` FOREIGN KEY (`kontrak_id`) REFERENCES `kontrak` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ulp`
--
ALTER TABLE `ulp`
  ADD CONSTRAINT `fk_ulp_ulp_master_id` FOREIGN KEY (`ulp_master_id`) REFERENCES `ulp_master` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ulp_ibfk_1` FOREIGN KEY (`kontrak_id`) REFERENCES `kontrak` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
