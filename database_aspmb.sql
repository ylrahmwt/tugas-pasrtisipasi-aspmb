-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.17.0.7270
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_apsmb
CREATE DATABASE IF NOT EXISTS `db_apsmb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_apsmb`;

-- Dumping structure for table db_apsmb.tabel_dokumen
CREATE TABLE IF NOT EXISTS `tabel_dokumen` (
  `idDoc` int(10) NOT NULL AUTO_INCREMENT,
  `idRegis` int(10) NOT NULL,
  `pasfoto` varchar(50) NOT NULL,
  `ijazah` varchar(50) NOT NULL,
  PRIMARY KEY (`idDoc`),
  KEY `FK_tabel_dokumen_tabel_registrasi` (`idRegis`),
  CONSTRAINT `FK_tabel_dokumen_tabel_registrasi` FOREIGN KEY (`idRegis`) REFERENCES `tabel_registrasi` (`idRegis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_apsmb.tabel_orangtua
CREATE TABLE IF NOT EXISTS `tabel_orangtua` (
  `idOrangtua` int(10) NOT NULL AUTO_INCREMENT,
  `idRegis` int(10) NOT NULL,
  `namaAyah` varchar(60) NOT NULL,
  `pekerjaanAyah` varchar(20) NOT NULL,
  `penghasilanAyah` int(10) NOT NULL,
  `namaIbu` varchar(60) NOT NULL,
  `pekerjaanIbu` varchar(20) NOT NULL,
  `penghasilanIbu` int(10) NOT NULL,
  PRIMARY KEY (`idOrangtua`),
  KEY `FK_tabel_orangtua_tabel_registrasi` (`idRegis`),
  CONSTRAINT `FK_tabel_orangtua_tabel_registrasi` FOREIGN KEY (`idRegis`) REFERENCES `tabel_registrasi` (`idRegis`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_apsmb.tabel_registrasi
CREATE TABLE IF NOT EXISTS `tabel_registrasi` (
  `idRegis` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `namaDepan` varchar(20) NOT NULL,
  `namaBelakang` varchar(40) NOT NULL,
  `tempatLahir` varchar(25) NOT NULL,
  `tglLahir` date NOT NULL,
  `jenisKelamin` enum('laki-laki','perempuan') NOT NULL,
  `NISN` int(10) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `sekolahAsal` varchar(25) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  PRIMARY KEY (`idRegis`),
  KEY `FK_tabel_registrasi_tabel_user` (`username`),
  CONSTRAINT `FK_tabel_registrasi_tabel_user` FOREIGN KEY (`username`) REFERENCES `tabel_user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_apsmb.tabel_user
CREATE TABLE IF NOT EXISTS `tabel_user` (
  `idUser` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
