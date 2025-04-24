-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 24, 2025 at 11:24 PM
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
  `emile` varchar(40) NOT NULL,
  `telefon` varchar(40) NOT NULL,
  `ulica` varchar(40) NOT NULL,
  `nr_domu` varchar(40) NOT NULL,
  `kod_pocztowy` varchar(40) NOT NULL,
  `miejscowosc` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `szczegoly_zamowienia`
--
ALTER TABLE `szczegoly_zamowienia`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `integro4` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
