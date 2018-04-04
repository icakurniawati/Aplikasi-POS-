-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2018 at 07:06 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pos1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbbuku`
--

CREATE TABLE `tbbuku` (
  `kd_buku` char(5) NOT NULL,
  `judul_buku` varchar(25) NOT NULL,
  `pengarang` varchar(20) NOT NULL,
  `penerbit` varchar(20) NOT NULL,
  `harga_beli` float NOT NULL,
  `harga_jual` float NOT NULL,
  `stok` float NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbbuku`
--

INSERT INTO `tbbuku` (`kd_buku`, `judul_buku`, `pengarang`, `penerbit`, `harga_beli`, `harga_jual`, `stok`, `status`) VALUES
('bk001', 'Rekayasa Perangkat Lunak', 'Tri Astuti', 'Erlangga', 10000, 12000, 12, 'ada'),
('bk002', 'Belajar Perangkat Lunak', 'Pratama', 'Bukukita', 11000, 13000, 6, 'ada'),
('bk003', 'Pemprograman1', 'Anom sejogati', 'Erlangga', 15000, 20000, 24, ''),
('bk004', 'pemprograman2', 'Anom Sutomo', 'Mitrabuku', 15000, 18000, 22, ''),
('bk005', 'Belajar C++', 'Anggriawan', 'Erlangga', 12000, 15000, 20, ''),
('bk006', 'Konsep basis data', 'Alvian Candra', 'Bukukita', 15000, 17000, 20, ''),
('bk007', 'Belajar Oddo', 'Dicky Anggriawan', 'Erlangga', 15000, 17000, 20, ''),
('bk008', 'Arsitektur komputer', 'Rizaludin', 'Bukukita', 12000, 15000, 22, ''),
('bk009', 'Pemprograman1', 'Anom Sejogati', 'mitrabuku', 13000, 15000, 20, ''),
('bk010', 'Belajar RPL', 'Imam Prayogo', 'erlangga', 14000, 17000, 20, ''),
('bk011', 'Belajar Basis data', 'Alvian yudistira', 'mitrabuku', 15000, 17000, 20, ''),
('bk012', 'Belajar java', 'Imam prayogo', 'mitrabuku', 17000, 20000, 20, ''),
('bk013', '10 jurusan programmer', 'anom sejogati', 'mitra buku', 16000, 20000, 20, ''),
('bk014', 'andi', 'erlangga', 'pertaruhan', 20000, 20000, 22, 'ada'),
('bk016', 'anggara', 'suka buku', 'belajar php', 7000, 7000, 7, 'ada'),
('Bk019', 'AHMAD', 'gramedia', 'geografi', 100000, 100000, 7, 'ada');

-- --------------------------------------------------------

--
-- Table structure for table `tbpembelian`
--

CREATE TABLE `tbpembelian` (
  `no_transbeli` char(5) NOT NULL,
  `tgl` date NOT NULL,
  `id_supplier` char(5) NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `harga_beli` float NOT NULL,
  `stok` float NOT NULL,
  `subtotal` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbpembelian`
--

INSERT INTO `tbpembelian` (`no_transbeli`, `tgl`, `id_supplier`, `kd_buku`, `harga_beli`, `stok`, `subtotal`, `total`) VALUES
('P001', '2018-01-12', '002', 'bk001', 15000, 2, 30000, 30000),
('P002', '2018-01-12', '001', 'bk001', 20000, 2, 40000, 40000);

--
-- Triggers `tbpembelian`
--
DELIMITER $$
CREATE TRIGGER `tg_stokupdate_pembelian` AFTER INSERT ON `tbpembelian` FOR EACH ROW BEGIN
UPDATE tbbuku SET stok=stok+NEW.stok
WHERE kd_buku=NEW.kd_buku;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbsupplier`
--

CREATE TABLE `tbsupplier` (
  `id_supplier` char(5) NOT NULL,
  `no_fakturbeli` char(5) NOT NULL,
  `nama_supplier` varchar(25) NOT NULL,
  `nama_perusahaan` varchar(25) NOT NULL,
  `alamat_perusahaan` text NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbsupplier`
--

INSERT INTO `tbsupplier` (`id_supplier`, `no_fakturbeli`, `nama_supplier`, `nama_perusahaan`, `alamat_perusahaan`, `no_hp`, `status`) VALUES
('001', 'citra', 'pt mekar bunga', 'Fk001', 'pekalongan', '8765432121', 'aktif'),
('001', 'F001', 'almaura', 'almaura.com', 'jakarta utara', '08990143095', 'aktif'),
('002', 'agus', 'asco', 'F002', 'kedungwuni', '08374834', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tbtransaksijual`
--

CREATE TABLE `tbtransaksijual` (
  `no_transjual` int(5) NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `tgl_transjual` date NOT NULL,
  `jml` int(11) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbtransaksijual`
--

INSERT INTO `tbtransaksijual` (`no_transjual`, `kd_buku`, `tgl_transjual`, `jml`, `total`) VALUES
(1, 'bk002', '2018-01-11', 2, 26000),
(2, 'bk002', '2018-01-11', 2, 62000),
(2, 'bk004', '2018-01-11', 2, 62000),
(3, 'bk002', '2018-01-12', 2, 44000),
(3, 'bk004', '2018-01-12', 1, 44000),
(4, 'bk001', '2018-01-12', 2, 50000),
(4, 'bk002', '2018-01-12', 2, 50000),
(5, 'bk004', '2018-01-12', 2, 53000),
(5, 'bk007', '2018-01-12', 1, 53000),
(6, 'bk001', '2018-01-12', 2, 37000),
(6, 'bk002', '2018-01-12', 1, 37000);

-- --------------------------------------------------------

--
-- Table structure for table `tbuser`
--

CREATE TABLE `tbuser` (
  `id_user` char(5) NOT NULL,
  `nama_user` varchar(25) NOT NULL,
  `jenkel` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `pass` varchar(45) NOT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') NOT NULL,
  `lev_user` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbuser`
--

INSERT INTO `tbuser` (`id_user`, `nama_user`, `jenkel`, `alamat`, `pass`, `status`, `lev_user`) VALUES
('ID001', 'dimas', 'L', 'bojong', '21232f297a57a5a743894a0e4a801fc3', 'AKTIF', 'admin'),
('ID002', 'Nissa', 'P', 'Kesesi', 'c84258e9c39059a89ab77d846ddab909', 'AKTIF', 'Kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbbuku`
--
ALTER TABLE `tbbuku`
  ADD PRIMARY KEY (`kd_buku`);

--
-- Indexes for table `tbpembelian`
--
ALTER TABLE `tbpembelian`
  ADD PRIMARY KEY (`no_transbeli`),
  ADD KEY `kd_buku` (`kd_buku`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `tbsupplier`
--
ALTER TABLE `tbsupplier`
  ADD PRIMARY KEY (`id_supplier`,`no_fakturbeli`);

--
-- Indexes for table `tbtransaksijual`
--
ALTER TABLE `tbtransaksijual`
  ADD PRIMARY KEY (`no_transjual`,`kd_buku`);

--
-- Indexes for table `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbpembelian`
--
ALTER TABLE `tbpembelian`
  ADD CONSTRAINT `tbpembelian_ibfk_1` FOREIGN KEY (`kd_buku`) REFERENCES `tbbuku` (`kd_buku`),
  ADD CONSTRAINT `tbpembelian_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `tbsupplier` (`id_supplier`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
