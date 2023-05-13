-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2022 at 07:11 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_skripsi_arel`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_berkas`
--

CREATE TABLE `tb_berkas` (
  `id_berkas` int(11) NOT NULL,
  `kode_pemohon` varchar(16) DEFAULT NULL,
  `nama_berkas` varchar(255) DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_berkas`
--

INSERT INTO `tb_berkas` (`id_berkas`, `kode_pemohon`, `nama_berkas`, `nama_file`) VALUES
(1, 'A01', 'Berkas 1', '912Berkas 1.pdf'),
(3, 'A02', 'ktp', '939ktp.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelurahan`
--

CREATE TABLE `tb_kelurahan` (
  `kode_kelurahan` varchar(16) NOT NULL,
  `nama_kelurahan` varchar(16) DEFAULT NULL,
  `ket_kelurahan` varchar(16) DEFAULT NULL,
  `user` varchar(16) DEFAULT NULL,
  `pass` binary(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kelurahan`
--

INSERT INTO `tb_kelurahan` (`kode_kelurahan`, `nama_kelurahan`, `ket_kelurahan`, `user`, `pass`) VALUES
('K01', 'kemasan', 'data pengajuan k', 'kemasan', 0x24327924313024332f4f4a4f594d4f4956586f4d574858656e724d68756c616f5662443153527170304663685866306769614362394757374d41556d),
('K02', 'balowerti', 'data pengajuan k', 'balowerti', 0x2432792431302464654754704e6a6165564a6c7439654e51634868794f4f5763567033674a65422f77475149423662717a39615932766f38785a734f);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `kode_kriteria` varchar(16) NOT NULL,
  `nama_kriteria` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `atribut` varchar(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kriteria`
--

INSERT INTO `tb_kriteria` (`kode_kriteria`, `nama_kriteria`, `keterangan`, `atribut`) VALUES
('C01', 'KTP domisili', '', 'benefit'),
('C02', 'Usia maks. 18', '', 'benefit'),
('C03', 'SK orangtua meninggal covid', '', 'benefit'),
('C04', 'kondisi ekonomi', '', 'benefit'),
('C05', 'kondisi psikologis', '', 'benefit'),
('C06', 'kondisi pendidikan', '', 'benefit');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemohon`
--

CREATE TABLE `tb_pemohon` (
  `kode_pemohon` varchar(16) NOT NULL,
  `nama_pemohon` varchar(255) DEFAULT NULL,
  `kode_kelurahan` varchar(16) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `user` varchar(16) DEFAULT NULL,
  `pass` binary(60) DEFAULT NULL,
  `verifikasi` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pemohon`
--

INSERT INTO `tb_pemohon` (`kode_pemohon`, `nama_pemohon`, `kode_kelurahan`, `keterangan`, `total`, `rank`, `user`, `pass`, `verifikasi`) VALUES
('A01', 'NIHAYATUL \'ALIYAH', 'K01', '', 1, 4, 'A01', 0x24327924313024525059644d714e64392f53426a33417758696978584f4e7147344b4d413737496f68456d62317152666867354a6a744c7375475032, 1),
('A02', 'I PUTU KEVIN KRISHNA DEWANDARU', 'K01', '', 0, 1, 'A02', 0x2432792431302468586f514f466d4163744668536a38544b575169724f4c634b484a75336d496a455a6a4e7373754b48334a4a4b6c777056794b4b65, 1),
('A03', 'MUHAMMAD YANUAR NAJATAN NAIM', 'K01', '', 0, 2, 'A03', 0x2432792431302453457479307a396b6e746f3361654f786854756c522e596d504867323655647566362f796b4d56686d44776a4162786a4e504a4653, 1),
('A04', 'FERI YUDA UBAIDILAH', 'K01', '', 0, 3, 'A04', 0x243279243130242e5949706e4d41344f68464357577941462e517a737546566241735a77626a43484b516a557179464d616d4e645a6578766c45336d, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rel_kriteria`
--

CREATE TABLE `tb_rel_kriteria` (
  `ID` int(11) NOT NULL,
  `ID1` varchar(16) DEFAULT NULL,
  `ID2` varchar(16) DEFAULT NULL,
  `nilai` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rel_kriteria`
--

INSERT INTO `tb_rel_kriteria` (`ID`, `ID1`, `ID2`, `nilai`) VALUES
(87, 'C04', 'C04', 1),
(88, 'C01', 'C04', 2),
(89, 'C02', 'C04', 3),
(90, 'C03', 'C04', 2),
(75, 'C01', 'C01', 1),
(77, 'C02', 'C02', 1),
(78, 'C01', 'C02', 1),
(79, 'C03', 'C01', 0.5),
(80, 'C03', 'C02', 1),
(81, 'C03', 'C03', 1),
(82, 'C01', 'C03', 2),
(83, 'C02', 'C03', 1),
(84, 'C04', 'C01', 0.5),
(85, 'C04', 'C02', 0.5),
(86, 'C04', 'C03', 0.5),
(76, 'C02', 'C01', 1),
(185, 'C04', 'C05', 1),
(184, 'C03', 'C05', 1),
(183, 'C02', 'C05', 2),
(182, 'C01', 'C05', 3),
(181, 'C05', 'C05', 1),
(180, 'C05', 'C04', 1),
(179, 'C05', 'C03', 1),
(178, 'C05', 'C02', 0.5),
(177, 'C05', 'C01', 0.333333333),
(219, 'C06', 'C01', 1),
(220, 'C06', 'C02', 1),
(221, 'C06', 'C03', 1),
(222, 'C06', 'C04', 1),
(223, 'C06', 'C05', 1),
(224, 'C06', 'C06', 1),
(225, 'C01', 'C06', 2),
(226, 'C02', 'C06', 3),
(227, 'C03', 'C06', 1),
(228, 'C04', 'C06', 1),
(229, 'C05', 'C06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rel_pemohon`
--

CREATE TABLE `tb_rel_pemohon` (
  `ID` int(11) NOT NULL,
  `kode_pemohon` varchar(16) DEFAULT NULL,
  `kode_kriteria` varchar(16) DEFAULT NULL,
  `nilai` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rel_pemohon`
--

INSERT INTO `tb_rel_pemohon` (`ID`, `kode_pemohon`, `kode_kriteria`, `nilai`) VALUES
(1, 'A01', 'C01', 5),
(2, 'A01', 'C02', 5),
(3, 'A01', 'C03', 5),
(4, 'A01', 'C04', 2),
(42, 'A04', 'C03', 5),
(6, 'A02', 'C01', 5),
(7, 'A02', 'C02', 5),
(8, 'A02', 'C03', 5),
(9, 'A02', 'C04', 5),
(41, 'A04', 'C02', 5),
(11, 'A03', 'C01', 5),
(12, 'A03', 'C02', 5),
(13, 'A03', 'C03', 5),
(14, 'A03', 'C04', 4),
(40, 'A04', 'C01', 5),
(36, 'A03', 'C05', 2),
(35, 'A02', 'C05', 4),
(34, 'A01', 'C05', 2),
(43, 'A04', 'C04', 4),
(44, 'A04', 'C05', 4),
(45, 'A05', 'C01', 0),
(46, 'A05', 'C02', 0),
(47, 'A05', 'C03', 0),
(48, 'A05', 'C04', 0),
(49, 'A05', 'C05', 0),
(70, 'A01', 'C06', 1),
(71, 'A02', 'C06', 3),
(72, 'A03', 'C06', 1),
(73, 'A04', 'C06', 2),
(74, 'A05', 'C06', 0),
(75, 'A09', 'C01', -1),
(76, 'A09', 'C02', -1),
(77, 'A09', 'C03', -1),
(78, 'A09', 'C04', -1),
(79, 'A09', 'C05', -1),
(80, 'A09', 'C06', -1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `kode_user` varchar(16) NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `user` varchar(16) DEFAULT NULL,
  `pass` binary(60) DEFAULT NULL,
  `level` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`kode_user`, `nama_user`, `user`, `pass`, `level`) VALUES
('a6', 'burengan', 'burengan', 0x2432792431302451636d75644d7a634d6c6e375a6430762f454b773275364a3139317733414e526d4b35424f5331636435424851684a7a3263443636, 'dinas'),
('U001', 'Administrator', 'admin', 0x24327924313024474b68506767665939556a57426277732e4d43766a6537376269702f51426a32733476636a394b66514c6f4d35494c657156474947, 'admin'),
('U002', 'Dinas Sosial', 'dinsos', 0x24327924313024747a456e594270646751594f7641475074776269672e4334356378534d796b6b5658374f424d69466c5937514d5a4c552f64364932, 'dinas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_berkas`
--
ALTER TABLE `tb_berkas`
  ADD PRIMARY KEY (`id_berkas`);

--
-- Indexes for table `tb_kelurahan`
--
ALTER TABLE `tb_kelurahan`
  ADD PRIMARY KEY (`kode_kelurahan`);

--
-- Indexes for table `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`kode_kriteria`);

--
-- Indexes for table `tb_pemohon`
--
ALTER TABLE `tb_pemohon`
  ADD PRIMARY KEY (`kode_pemohon`);

--
-- Indexes for table `tb_rel_kriteria`
--
ALTER TABLE `tb_rel_kriteria`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_rel_pemohon`
--
ALTER TABLE `tb_rel_pemohon`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`kode_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_berkas`
--
ALTER TABLE `tb_berkas`
  MODIFY `id_berkas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_rel_kriteria`
--
ALTER TABLE `tb_rel_kriteria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `tb_rel_pemohon`
--
ALTER TABLE `tb_rel_pemohon`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
