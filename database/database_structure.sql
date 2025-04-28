-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2025 at 11:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep_ze_wszystkim`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorie_prodoktow`
--

CREATE TABLE `kategorie_prodoktow` (
  `id` int(10) NOT NULL,
  `nazwa_kategorii` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategorie_prodoktow`
--

INSERT INTO `kategorie_prodoktow` (`id`, `nazwa_kategorii`) VALUES
(1, 'jedzenie'),
(2, 'elektronika'),
(3, 'siajs dla emerytów');

-- --------------------------------------------------------

--
-- Table structure for table `klienci`
--

CREATE TABLE `klienci` (
  `id` int(10) NOT NULL,
  `imie` varchar(40) NOT NULL,
  `nazwisko` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telefon` varchar(40) NOT NULL,
  `ulica` varchar(40) NOT NULL,
  `nr_domu` varchar(40) NOT NULL,
  `kod_pocztowy` varchar(40) NOT NULL,
  `miejscowosc` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `email`, `telefon`, `ulica`, `nr_domu`, `kod_pocztowy`, `miejscowosc`) VALUES
(1, 'Jan', '', 'janmamon12345@wp.pl', '+48666666666', 'Nowa', '1000', '11-111', 'Warszawa'),
(2, 'Jan', '', 'janmamon@onet.com.pl', '+48666666666', 'Nowa', '1000', '11-111', 'Warszawa'),
(3, 'Jan', '', 'janmamon@onet.com.pl', '+48666666666', 'Nowa', '1000', '11-111', 'Warszawa'),
(6, 'Jan', 'Mamoń', 'janmamon@onet.com.pl', '+48666666666', 'Nowa', '1000', '11-111', 'Warszawa'),
(7, 'Jan', 'Mamoń', 'janmamon@onet.com.pl', '+48666666666', 'Nowa', '1000', '22-222', 'Kraków'),
(12, 'Jan', 'Mamoń', 'janmamon@onet.com.pl', '+48666666666', 'Nowa', '1000', '33-333', 'Radom'),
(14, 'Jan', 'Mamoń', 'janmamon@onet.com.pl', '+48666666666', 'Nowa', '1000', '22-222', 'Kraków'),
(15, 'Jan', 'Nowak', 'jannowak@interia.pl', '+48123456789', 'Nowogrodzka', '1', '55-555', 'Gdańsk'),
(16, 'Jan', 'Nowak', 'jannowak@interia.pl', '+48123456789', 'Nowogrodzka', '1', '55-555', 'Gdańsk'),
(17, 'Jan', 'Nowak', 'jannowak@interia.pl', '+48123456789', 'Nowogrodzka', '1', '55-555', 'Gdańsk'),
(18, 'Jan', 'Nowak', 'jannowak@interia.pl', '+48123456789', 'Nowogrodzka', '1', '55-555', 'Gdańsk'),
(19, 'Jan', 'Nowak', 'jannowak@interia.pl', '+48123456789', 'Nowogrodzka', '1', '55-555', 'Kraków'),
(20, 'Krystyna', 'Kowal', 'krystynakowal@onet.com.pl', '+48997654822', 'Złota', '44', '11-242', 'Białystok');

-- --------------------------------------------------------

--
-- Table structure for table `produkty`
--

CREATE TABLE `produkty` (
  `id` int(10) NOT NULL,
  `nazwa` varchar(40) NOT NULL,
  `opis` varchar(40) NOT NULL,
  `cena` float(100,2) NOT NULL,
  `stan_magazynowy` int(10) NOT NULL,
  `zdjecie_link` varchar(40) NOT NULL,
  `id_kategorii` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id`, `nazwa`, `opis`, `cena`, `stan_magazynowy`, `zdjecie_link`, `id_kategorii`) VALUES
(1, 'mleko', 'Mleko od krowy.', 5.00, 1000, './img/mleko.png', 1),
(2, 'śmietana', 'Śmietana z mleka.', 7.00, 1000, './img/smietana.png', 1),
(3, 'Moherowy beret', 'Beretka dla starych bab.', 30.00, 100, './img/moherowy_beret.png', 3),
(4, 'Laska', 'Laska dla dziadków.', 50.00, 200, './img/laska.png', 3);

-- --------------------------------------------------------

--
-- Table structure for table `szczegoly_zamowienia`
--

CREATE TABLE `szczegoly_zamowienia` (
  `id` int(10) NOT NULL,
  `id_zamowienia` int(10) DEFAULT NULL,
  `id_produktu` int(10) DEFAULT NULL,
  `ilosc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `szczegoly_zamowienia`
--

INSERT INTO `szczegoly_zamowienia` (`id`, `id_zamowienia`, `id_produktu`, `ilosc`) VALUES
(1, 7, 2, 3),
(2, 7, 1, 1),
(3, 7, 3, 2),
(4, 7, 4, 2),
(5, 9, 1, 1),
(6, 9, 2, 3),
(7, 9, 3, 2),
(8, 9, 4, 4),
(9, 10, 2, 3),
(10, 10, 3, 1),
(11, 10, 4, 5),
(12, 10, 1, 5),
(13, 11, 2, 3),
(14, 11, 3, 1),
(15, 11, 4, 5),
(16, 11, 1, 5),
(17, 12, 1, 1),
(18, 12, 2, 3),
(19, 12, 3, 3),
(20, 12, 4, 1),
(21, 13, 4, 3),
(22, 14, 1, 3),
(23, 15, 4, 4),
(24, 15, 1, 2),
(25, 15, 2, 2),
(26, 15, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(10) NOT NULL,
  `id_klienta` int(10) DEFAULT NULL,
  `data_zamowienia` date NOT NULL,
  `laczna_kwota` float(100,2) NOT NULL,
  `status` enum('nie opłacone','opłacone') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `id_klienta`, `data_zamowienia`, `laczna_kwota`, `status`) VALUES
(1, 6, '2025-04-28', 0.00, 'nie opłacone'),
(2, 7, '2025-04-28', 585.00, 'nie opłacone'),
(7, 12, '2025-04-28', 186.00, 'nie opłacone'),
(9, 14, '2025-04-28', 286.00, 'nie opłacone'),
(10, 15, '2025-04-28', 326.00, 'nie opłacone'),
(11, 16, '2025-04-28', 326.00, 'nie opłacone'),
(12, 17, '2025-04-28', 166.00, 'nie opłacone'),
(13, 18, '2025-04-28', 150.00, 'nie opłacone'),
(14, 19, '2025-04-28', 15.00, 'nie opłacone'),
(15, 20, '2025-04-28', 314.00, 'nie opłacone');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorie_prodoktow`
--
ALTER TABLE `kategorie_prodoktow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategorii` (`id_kategorii`);

--
-- Indexes for table `szczegoly_zamowienia`
--
ALTER TABLE `szczegoly_zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zamowienia` (`id_zamowienia`,`id_produktu`),
  ADD KEY `integro2` (`id_produktu`);

--
-- Indexes for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorie_prodoktow`
--
ALTER TABLE `kategorie_prodoktow`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `szczegoly_zamowienia`
--
ALTER TABLE `szczegoly_zamowienia`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produkty`
--
ALTER TABLE `produkty`
  ADD CONSTRAINT `integro` FOREIGN KEY (`id_kategorii`) REFERENCES `kategorie_prodoktow` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `szczegoly_zamowienia`
--
ALTER TABLE `szczegoly_zamowienia`
  ADD CONSTRAINT `integro2` FOREIGN KEY (`id_produktu`) REFERENCES `produkty` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `integro3` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `integro4` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
