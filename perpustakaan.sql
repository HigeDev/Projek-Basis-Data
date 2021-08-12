-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2019 at 02:16 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` char(4) NOT NULL,
  `judul` char(20) DEFAULT NULL,
  `pengarang` char(15) DEFAULT NULL,
  `jml_buku` int(11) DEFAULT NULL,
  `kode_penerbit` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode_buku`, `judul`, `pengarang`, `jml_buku`, `kode_penerbit`) VALUES
('BD01', 'dBase III plus', 'Epsi B', 5, '01'),
('BD04', 'Clipper', 'Ahmad G', 4, '02'),
('FI01', 'Fisika', 'Sutrisno', 10, '04'),
('S001', 'DOS', 'M. Urip', 10, '01');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(9) NOT NULL,
  `nama` char(20) DEFAULT NULL,
  `alamat` char(20) DEFAULT NULL,
  `kota` char(15) DEFAULT 'Yogyakarta',
  `tgl_lhr` date DEFAULT NULL,
  `jenis_kel` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `alamat`, `kota`, `tgl_lhr`, `jenis_kel`) VALUES
('123010001', 'Ifan', 'Jl Babarsari', '', '1980-07-27', 'L'),
('123010002', 'Adi', 'Jl Janti', '', '1979-06-28', 'L'),
('123010003', 'Ayu', 'Jl Pemuda', 'Klaten', '1981-05-10', 'P'),
('123010004', 'Yulia', 'Jl Veteran', 'Sleman', '1970-04-15', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `kode_penerbit` char(2) NOT NULL,
  `nama_penerbit` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`kode_penerbit`, `nama_penerbit`) VALUES
('01', 'Piksi ITB'),
('02', 'Ganesha'),
('03', 'Epsilon'),
('04', 'Gramedia');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `tgl_pinjam` date DEFAULT NULL,
  `mhs_no_induk` char(9) DEFAULT NULL,
  `buk_kode_buku` char(4) DEFAULT NULL,
  `tgl_hrs_kembali` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`tgl_pinjam`, `mhs_no_induk`, `buk_kode_buku`, `tgl_hrs_kembali`, `tgl_kembali`) VALUES
('2003-04-20', '123010001', 'S001', '2003-04-23', '2003-04-23'),
('2003-04-20', '123010002', 'BD01', '2003-04-23', '2003-04-22'),
('2003-04-20', '123010003', 'BD04', '2003-04-23', '2003-04-24'),
('2003-04-21', '123010003', 'FI01', '2003-04-24', '2003-04-25'),
('2003-04-21', '123010004', 'S001', '2003-04-24', '2003-04-25'),
('2003-04-21', '123010001', 'BD01', '2003-04-24', '2003-04-24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`),
  ADD KEY `fkkode_penerbit` (`kode_penerbit`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`kode_penerbit`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD KEY `fkmhs_no_induk` (`mhs_no_induk`),
  ADD KEY `fkbuk_kode_buku` (`buk_kode_buku`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fkkode_penerbit` FOREIGN KEY (`kode_penerbit`) REFERENCES `penerbit` (`kode_penerbit`);

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `fkbuk_kode_buku` FOREIGN KEY (`buk_kode_buku`) REFERENCES `buku` (`kode_buku`),
  ADD CONSTRAINT `fkmhs_no_induk` FOREIGN KEY (`mhs_no_induk`) REFERENCES `mahasiswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
