-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2025 at 11:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `levelup`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL COMMENT 'PK',
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Monitor'),
(2, 'Headset'),
(3, 'Gaming Chair'),
(4, 'Keyboard'),
(5, 'Mouse'),
(6, 'Mousepad'),
(7, 'VR'),
(8, 'Console'),
(9, 'White'),
(10, 'Black');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL COMMENT 'PK',
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `stock`, `price`, `image`, `date_added`) VALUES
(156, 'AOC 27\" 180Hz', 'AOC Gaming Monitor', 6, 2490.00, '156-AOC-27-180Hz.png', '2025-04-23 17:17:12'),
(164, 'Samsung Odyssey G9', 'Samsung Gaming Monitor', 2, 15990.00, '164-Samsung-Odyssey-G9.png', '2025-04-23 17:17:12'),
(249, 'Logitech Lightspeed', 'Logitech G733 Wireless Headset', 0, 1349.00, '249-Logitech-G733-Lightspeed.png', '2025-04-23 17:28:30'),
(264, 'HyperX Cloud Alpha', 'HyperX Wireless Headset', 6, 1990.00, '264-HyperX-Cloud-Alpha.png', '2025-04-23 17:28:30'),
(282, 'Corsair VOID', 'Corsair Wireless Headset', 1, 1349.00, '282-Corsair-VOID.png', '2025-04-23 17:28:30'),
(335, 'Mission SG Heimdall', 'Mission SG RGB Gaming Chair', 2, 1990.00, '335-MissionSG-Heimdall.png', '2025-04-23 18:44:55'),
(391, 'Mission SG Ymir V2', 'Mission SG Gaming Chair', 5, 799.00, '391-MissionSG-Ymir-V2.png', '2025-04-23 19:23:59'),
(422, 'Razer Huntsman Pro', 'Razer Huntsman V3 Pro Gaming Keyboard', 8, 3490.00, '422-Razer-Huntsman-V3-Pro.png', '2025-04-23 19:32:55'),
(497, 'SteelSeries Apex 3', 'SteelSeries TKL Keyboard', 8, 689.00, '497-SteelSeries-Apex-3.png', '2025-04-23 19:32:55'),
(529, 'SteelSeries Aerox 3', 'SteelSeries Onyx Wireless Mouse', 4, 1189.00, '529-SteelSeries-Aerox-3-Onyx.png', '2025-04-23 19:59:19'),
(563, 'SteelSeries Rival 5', 'SteelSeries Gaming Mouse', 7, 649.00, '563-SteelSeries-Rival-5.png', '2025-04-23 19:59:19'),
(588, 'Razer Basilisk V3', 'Razer Gaming Mouse', 5, 729.00, '588-Razer-Basilisk-V3.png', '2025-04-23 19:41:47'),
(639, 'Mission SG Mousepad', 'Mission SG RGB Mousepad', 6, 299.00, '639-MissionSG-Mousepad.png', '2025-04-23 20:07:46'),
(655, 'HyperX Wrist Wrest', 'HyperX Wrist Wrest', 2, 199.00, '655-HyperX-Wrist-Rest.png', '2025-04-23 20:07:46'),
(671, 'Mission SG White', 'Mission SG XXL Mousepad - White', 1, 199.00, '671-MissionSG-White-Mousepad.png', '2025-04-23 20:07:46'),
(694, 'SteelSeries Mousepad', 'SteelSeries Speed Performance Mousepad', 4, 529.00, '694-SteelSeries-Speed-Performance.png', '2025-04-23 20:07:46'),
(715, 'Nintendo Switch 2', 'Nintendo Switch 2', 0, 6795.00, '715-Nintendo-Switch-2.png', '2025-04-23 20:12:30'),
(723, 'Meta Quest 3', 'Meta Quest 3 VR - 512 GB', 0, 6990.00, '723-Meta-Quest-3.png', '2025-04-23 20:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(156, 1),
(156, 10),
(164, 1),
(164, 10),
(249, 2),
(249, 9),
(264, 2),
(264, 10),
(282, 2),
(282, 9),
(335, 3),
(391, 3),
(422, 4),
(422, 10),
(497, 4),
(497, 9),
(529, 5),
(563, 5),
(588, 5),
(639, 6),
(639, 10),
(655, 6),
(655, 10),
(671, 6),
(671, 9),
(694, 6),
(694, 10),
(715, 8),
(723, 7),
(723, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK', AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
