-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database:3306
-- Generation Time: Oct 02, 2023 at 02:25 PM
-- Server version: 8.0.33
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku_saku`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_agama`
--

CREATE TABLE `t_agama` (
  `id_agama` int NOT NULL,
  `agama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_agama`
--

INSERT INTO `t_agama` (`id_agama`, `agama`) VALUES
(1, 'Islam'),
(2, 'Kristen(Protestan)'),
(3, 'Katholik'),
(4, 'Budha'),
(6, 'Hindu'),
(7, 'Konghucu');

-- --------------------------------------------------------

--
-- Table structure for table `t_biodata`
--

CREATE TABLE `t_biodata` (
  `id_biodata` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_lengkap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jk` int NOT NULL,
  `id_agama` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_biodata`
--

INSERT INTO `t_biodata` (`id_biodata`, `nik`, `nama_lengkap`, `jk`, `id_agama`) VALUES
('31cc49ec-3ab8-11ee-824b-0242ac120002', '934212144148309', 'Anggraini Noe', 2, 1),
('8c6666d3-39ba-11ee-b7ec-0242ac120002', '7501140405010003', 'Jefranda Modjo', 1, 1),
('94f60f3a-39ba-11ee-b7ec-0242ac120002', '750114040501002', 'Serlin S Ahmad', 2, 1),
('9f39b478-39ba-11ee-b7ec-0242ac120002', '7501140405010001', 'Tofa Deo Ahmad', 1, 1),
('aec6aa66-39ba-11ee-b7ec-0242ac120002', '7501140405010004', 'Lamin H Datau', 1, 1),
('bc5a2c9d-39ba-11ee-b7ec-0242ac120002', '7501140405010005', 'Hartati Mahmud', 2, 1),
('d3913bd3-39ba-11ee-b7ec-0242ac120002', '7501140405010006', 'Sonia Triwati Rauf', 2, 1),
('d4c67315-3ab7-11ee-824b-0242ac120002', '134390483204823', 'Ahmad Nur Tunggi', 1, 1),
('fb8193f1-3ab7-11ee-824b-0242ac120002', '2398259739529', 'Isran Noho', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_jawaban`
--

CREATE TABLE `t_jawaban` (
  `id_jawaban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jawaban` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_nilai` int DEFAULT NULL,
  `createt_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jawaban`
--

INSERT INTO `t_jawaban` (`id_jawaban`, `id_user`, `id_soal`, `jawaban`, `id_nilai`, `createt_at`) VALUES
('dea2f23f-4873-11ee-b773-0242ac120002', '4637bb62-3cf7-11ee-8947-0242ac120002', '9dd37f33-4872-11ee-b773-0242ac120002', 'tuhan itu 1', 1, '2023-09-01 03:01:38');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_kelamin`
--

CREATE TABLE `t_jenis_kelamin` (
  `id_jk` int NOT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_jenis_kelamin`
--

INSERT INTO `t_jenis_kelamin` (`id_jk`, `jenis_kelamin`) VALUES
(1, 'Laki-Laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `t_login`
--

CREATE TABLE `t_login` (
  `id_login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_role` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` int DEFAULT NULL,
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_login`
--

INSERT INTO `t_login` (`id_login`, `id_role`, `username`, `password`, `is_active`, `nim`) VALUES
('4637bb62-3cf7-11ee-8947-0242ac120002', 2, 'tofa', '202cb962ac59075b964b07152d234b70', 1, '20501043'),
('509746b5-3abe-11ee-824b-0242ac120002', 2, 'gorgon', '202cb962ac59075b964b07152d234b70', 1, '20501018');

-- --------------------------------------------------------

--
-- Table structure for table `t_mahasiswa`
--

CREATE TABLE `t_mahasiswa` (
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_biodata` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status_mhs` int NOT NULL DEFAULT '1',
  `id_prodi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_mahasiswa`
--

INSERT INTO `t_mahasiswa` (`nim`, `id_biodata`, `status_mhs`, `id_prodi`) VALUES
('20501018', '8c6666d3-39ba-11ee-b7ec-0242ac120002', 1, 1),
('20501037', '94f60f3a-39ba-11ee-b7ec-0242ac120002', 1, 1),
('20501043', '9f39b478-39ba-11ee-b7ec-0242ac120002', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_materi`
--

CREATE TABLE `t_materi` (
  `id_materi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `materi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_materi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_materi`
--

INSERT INTO `t_materi` (`id_materi`, `materi`, `file_materi`) VALUES
('d5ded38d-10f8-42c9-a642-3c32fd45ac16', 'konsep ketuhanan', 'MODUL_1_KONSEP_KETUHANAN_YANG_MAHA_ESA5.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `t_nilai`
--

CREATE TABLE `t_nilai` (
  `id_nilai` int NOT NULL,
  `nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_nilai`
--

INSERT INTO `t_nilai` (`id_nilai`, `nilai`) VALUES
(1, 'Sangat Baik'),
(2, 'Baik'),
(3, 'Cukup'),
(4, 'Kurang'),
(5, 'Sangat Kurang');

-- --------------------------------------------------------

--
-- Table structure for table `t_periode`
--

CREATE TABLE `t_periode` (
  `id_periode` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_prodi` int NOT NULL,
  `mulai_periode` date NOT NULL,
  `selesai_periode` date NOT NULL,
  `status_periode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_periode`
--

INSERT INTO `t_periode` (`id_periode`, `id_prodi`, `mulai_periode`, `selesai_periode`, `status_periode`) VALUES
('433c5f76-3aba-11ee-824b-0242ac120002', 1, '2023-09-11', '2023-12-31', 1),
('608f7124-3aba-11ee-824b-0242ac120002', 3, '2023-09-11', '2024-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_prodi`
--

CREATE TABLE `t_prodi` (
  `id_prodi` int NOT NULL,
  `prodi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_prodi`
--

INSERT INTO `t_prodi` (`id_prodi`, `prodi`) VALUES
(1, 'Teknik Informatika'),
(2, 'Teknologi Hasil Pertanian'),
(3, 'Mesin dan Peralatan Pertanian'),
(4, 'Teknologi Rekayasa Pangan');

-- --------------------------------------------------------

--
-- Table structure for table `t_role`
--

CREATE TABLE `t_role` (
  `id_role` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_role`
--

INSERT INTO `t_role` (`id_role`, `role`) VALUES
(1, 'dosen'),
(2, 'mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `t_soal`
--

CREATE TABLE `t_soal` (
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_materi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `soal` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int NOT NULL,
  `created_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_soal`
--

INSERT INTO `t_soal` (`id_soal`, `id_materi`, `soal`, `status`, `created_at`) VALUES
('9dd37f33-4872-11ee-b773-0242ac120002', 'd5ded38d-10f8-42c9-a642-3c32fd45ac16', 'apa itu konsep ketuhanan?', 1, '2023-09-01 10:52:40.000000');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id_useradmin` varchar(255) NOT NULL,
  `id_role` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id_useradmin`, `id_role`, `username`, `password`, `created_at`, `status`) VALUES
('5b461a02-481f-11ee-baf5-0242ac120002', 1, 'admin', '202cb962ac59075b964b07152d234b70', '2023-08-31 16:56:40', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_agama`
--
ALTER TABLE `t_agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `t_biodata`
--
ALTER TABLE `t_biodata`
  ADD PRIMARY KEY (`id_biodata`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD KEY `agama` (`id_agama`),
  ADD KEY `id_agama` (`id_agama`),
  ADD KEY `jk` (`jk`);

--
-- Indexes for table `t_jawaban`
--
ALTER TABLE `t_jawaban`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `id_soal` (`id_soal`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_nilai` (`id_nilai`);

--
-- Indexes for table `t_jenis_kelamin`
--
ALTER TABLE `t_jenis_kelamin`
  ADD PRIMARY KEY (`id_jk`);

--
-- Indexes for table `t_login`
--
ALTER TABLE `t_login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `FKdl2tfqxtf7hotltdo6jn05f4p` (`nim`);

--
-- Indexes for table `t_mahasiswa`
--
ALTER TABLE `t_mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `nik` (`id_biodata`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `t_materi`
--
ALTER TABLE `t_materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `t_nilai`
--
ALTER TABLE `t_nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `t_periode`
--
ALTER TABLE `t_periode`
  ADD PRIMARY KEY (`id_periode`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `t_prodi`
--
ALTER TABLE `t_prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `t_role`
--
ALTER TABLE `t_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `t_soal`
--
ALTER TABLE `t_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `id_materi` (`id_materi`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id_useradmin`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_agama`
--
ALTER TABLE `t_agama`
  MODIFY `id_agama` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_jenis_kelamin`
--
ALTER TABLE `t_jenis_kelamin`
  MODIFY `id_jk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_nilai`
--
ALTER TABLE `t_nilai`
  MODIFY `id_nilai` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_prodi`
--
ALTER TABLE `t_prodi`
  MODIFY `id_prodi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_role`
--
ALTER TABLE `t_role`
  MODIFY `id_role` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_biodata`
--
ALTER TABLE `t_biodata`
  ADD CONSTRAINT `t_biodata_ibfk_1` FOREIGN KEY (`id_agama`) REFERENCES `t_agama` (`id_agama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_biodata_ibfk_2` FOREIGN KEY (`jk`) REFERENCES `t_jenis_kelamin` (`id_jk`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `t_jawaban`
--
ALTER TABLE `t_jawaban`
  ADD CONSTRAINT `t_jawaban_ibfk_1` FOREIGN KEY (`id_soal`) REFERENCES `t_soal` (`id_soal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `t_jawaban_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `t_login` (`id_login`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `t_jawaban_ibfk_3` FOREIGN KEY (`id_nilai`) REFERENCES `t_nilai` (`id_nilai`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `t_login`
--
ALTER TABLE `t_login`
  ADD CONSTRAINT `t_login_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `t_role` (`id_role`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `t_login_ibfk_3` FOREIGN KEY (`nim`) REFERENCES `t_mahasiswa` (`nim`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `t_mahasiswa`
--
ALTER TABLE `t_mahasiswa`
  ADD CONSTRAINT `t_mahasiswa_ibfk_2` FOREIGN KEY (`id_biodata`) REFERENCES `t_biodata` (`id_biodata`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `t_mahasiswa_ibfk_3` FOREIGN KEY (`id_prodi`) REFERENCES `t_prodi` (`id_prodi`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `t_periode`
--
ALTER TABLE `t_periode`
  ADD CONSTRAINT `t_periode_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `t_prodi` (`id_prodi`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `t_soal`
--
ALTER TABLE `t_soal`
  ADD CONSTRAINT `t_soal_ibfk_1` FOREIGN KEY (`id_materi`) REFERENCES `t_materi` (`id_materi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `t_role` (`id_role`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
