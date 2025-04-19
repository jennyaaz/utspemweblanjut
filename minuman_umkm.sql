-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2025 at 12:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minuman_umkm`
--

-- --------------------------------------------------------

--
-- Table structure for table `minuman`
--

CREATE TABLE `minuman` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `minuman`
--

INSERT INTO `minuman` (`id`, `nama`, `kategori`, `harga`) VALUES
(68, 'Jus Apel dan Lemon', 'Jus Buah', 17000),
(69, 'Jus Wortel dan Apel', 'Jus Buah', 17000),
(70, 'Jus Semangka dan Mint', 'Jus Buah', 15000),
(71, 'Smoothie Bayam + Pisang', 'Green Smoothies', 20000),
(72, 'Kale + Nanas Smoothie', 'Green Smoothies', 22000),
(73, 'Alpukat + Cokelat Kakao', 'Green Smoothies', 25000),
(74, 'Jamu Kunyit Asem', 'Minuman Herbal Tradisional', 10000),
(75, 'Wedang Jahe Madu', 'Minuman Herbal Tradisional', 10000),
(76, 'Beras Kencur', 'Minuman Herbal Tradisional', 10000),
(77, 'Lemon, Timun, Mint', 'Infused Water', 12000),
(78, 'Nanas, Daun Mint', 'Infused Water', 13000),
(81, 'Susu Almond Original', 'Plant Based Milk', 20000),
(82, 'Susu Kedelai', 'Plant Based Milk', 10000),
(87, 'Jus Jeruk Murni', 'Jus Buah', 10000),
(89, 'Jus Tomat', 'Jus Buah', 10000),
(94, 'Jus Apel', 'Jus Buah', 11000),
(95, 'Jus Buah Naga', 'Jus Buah', 10000),
(96, 'Jus Melon', 'Jus Buah', 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `minuman`
--
ALTER TABLE `minuman`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `minuman`
--
ALTER TABLE `minuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
