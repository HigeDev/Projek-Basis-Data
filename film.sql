-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2019 at 04:56 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `film`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `no_identitas` varchar(3) NOT NULL,
  `jenis_identitas` varchar(3) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`no_identitas`, `jenis_identitas`, `nama`, `alamat`) VALUES
('001', 'SIM', 'Andi', 'Pontianak'),
('002', 'SIM', 'Budi', 'Pontianak');

-- --------------------------------------------------------

--
-- Table structure for table `detailmenyewa`
--

CREATE TABLE `detailmenyewa` (
  `kode_sewa` varchar(5) NOT NULL,
  `kode_film` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailmenyewa`
--

INSERT INTO `detailmenyewa` (`kode_sewa`, `kode_film`) VALUES
('S0001', 'A01'),
('S0001', 'A02'),
('S0002', 'D01'),
('S0003', 'A02'),
('S0003', 'D01'),
('S0003', 'H01');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `kode_film` varchar(3) NOT NULL,
  `jenis` varchar(15) NOT NULL,
  `judul` varchar(15) NOT NULL,
  `jmlkeping` int(2) NOT NULL,
  `jmlfilm` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`kode_film`, `jenis`, `judul`, `jmlkeping`, `jmlfilm`) VALUES
('A01', 'action', 'Spiderman', 2, 3),
('A02', 'action', 'Spiderman 2', 2, 5),
('D01', 'drama', 'Love Story', 2, 3),
('H01', 'horor', 'Evil Death', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kelompokfilm`
--

CREATE TABLE `kelompokfilm` (
  `jenis` varchar(9) NOT NULL,
  `hargasewa` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelompokfilm`
--

INSERT INTO `kelompokfilm` (`jenis`, `hargasewa`) VALUES
('action', 3000),
('drama', 3500),
('horor', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `menyewa`
--

CREATE TABLE `menyewa` (
  `kode_sewa` varchar(5) NOT NULL,
  `no_identitas` varchar(3) NOT NULL,
  `tglsewa` date NOT NULL,
  `totalfilm` int(3) NOT NULL,
  `tglkembali` date NOT NULL,
  `totalharga` int(9) NOT NULL,
  `denda` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menyewa`
--

INSERT INTO `menyewa` (`kode_sewa`, `no_identitas`, `tglsewa`, `totalfilm`, `tglkembali`, `totalharga`, `denda`) VALUES
('S0001', '001', '2007-01-01', 2, '2007-01-02', 6000, 0),
('S0002', '002', '2007-01-03', 1, '2007-01-03', 3500, 0),
('S0003', '001', '2007-01-06', 3, '2007-01-08', 9500, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`no_identitas`);

--
-- Indexes for table `detailmenyewa`
--
ALTER TABLE `detailmenyewa`
  ADD KEY `fkkodefilm` (`kode_film`),
  ADD KEY `fkkodesewa` (`kode_sewa`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`kode_film`),
  ADD KEY `fkjenis` (`jenis`);

--
-- Indexes for table `kelompokfilm`
--
ALTER TABLE `kelompokfilm`
  ADD PRIMARY KEY (`jenis`);

--
-- Indexes for table `menyewa`
--
ALTER TABLE `menyewa`
  ADD PRIMARY KEY (`kode_sewa`),
  ADD KEY `fkno_identitas` (`no_identitas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailmenyewa`
--
ALTER TABLE `detailmenyewa`
  ADD CONSTRAINT `fkkodefilm` FOREIGN KEY (`kode_film`) REFERENCES `film` (`kode_film`),
  ADD CONSTRAINT `fkkodesewa` FOREIGN KEY (`kode_sewa`) REFERENCES `menyewa` (`kode_sewa`);

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `fkjenis` FOREIGN KEY (`jenis`) REFERENCES `kelompokfilm` (`jenis`);

--
-- Constraints for table `menyewa`
--
ALTER TABLE `menyewa`
  ADD CONSTRAINT `fkno_identitas` FOREIGN KEY (`no_identitas`) REFERENCES `customer` (`no_identitas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
