-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 16 Mai 2024 à 23:42
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bd_seisme`
--

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `NumRegion` int(11) NOT NULL AUTO_INCREMENT,
  `NomReg` varchar(30) NOT NULL,
  PRIMARY KEY (`NumRegion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `region`
--

INSERT INTO `region` (`NumRegion`, `NomReg`) VALUES
(1, 'kairouan'),
(2, 'ile kuriat'),
(3, 'El fahs'),
(4, 'Sidi Bousaid');

-- --------------------------------------------------------

--
-- Structure de la table `seisme`
--

CREATE TABLE IF NOT EXISTS `seisme` (
  `CodeSta` varchar(5) NOT NULL,
  `NumReg` int(11) NOT NULL,
  `DateSeisme` datetime NOT NULL,
  `Latitude` decimal(5,2) DEFAULT NULL,
  `Longitude` decimal(5,2) DEFAULT NULL,
  `Magnitude` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`CodeSta`,`NumReg`,`DateSeisme`),
  KEY `CodeSta` (`CodeSta`),
  KEY `NumReg` (`NumReg`),
  KEY `DateSeisme` (`DateSeisme`),
  KEY `CodeSta_2` (`CodeSta`),
  KEY `NumReg_2` (`NumReg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `seisme`
--

INSERT INTO `seisme` (`CodeSta`, `NumReg`, `DateSeisme`, `Latitude`, `Longitude`, `Magnitude`) VALUES
('HANT', 2, '2023-10-24 23:40:00', '23.52', '32.55', '3.9'),
('HANT', 2, '2023-11-19 09:55:00', '37.85', '52.36', '3.1'),
('HANT', 2, '2024-02-03 07:23:00', '36.89', '54.23', '3.7'),
('SDBS', 4, '2023-07-28 09:53:00', '43.52', '32.99', '3.1'),
('SDBS', 4, '2024-01-09 23:53:00', '43.24', '32.88', '3.4'),
('TROT', 1, '2022-02-18 09:37:00', '36.72', '11.00', '3.7'),
('TROT', 1, '2022-05-13 19:30:00', '35.85', '11.05', '3.2'),
('ZAGN', 3, '2023-05-08 07:22:00', '57.36', '32.99', '3.2');

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

CREATE TABLE IF NOT EXISTS `station` (
  `CodeSta` varchar(5) NOT NULL,
  `NomSta` varchar(30) DEFAULT NULL,
  `CordNord` decimal(9,5) DEFAULT NULL,
  `CordEst` decimal(9,5) DEFAULT NULL,
  `Altitude` int(4) DEFAULT NULL,
  PRIMARY KEY (`CodeSta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `station`
--

INSERT INTO `station` (`CodeSta`, `NomSta`, `CordNord`, `CordEst`, `Altitude`) VALUES
('HANT', 'EL HANIA', '35.84290', '10.37540', 143),
('SDBS', 'SIDI BOUSAID', '36.87290', '10.34760', 135),
('TROT', 'TROZZA', '35.55980', '9.59430', 969),
('ZAGN', 'ZAGHOUAN', '36.37360', '10.10990', 732);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `seisme`
--
ALTER TABLE `seisme`
  ADD CONSTRAINT `seisme_ibfk_2` FOREIGN KEY (`NumReg`) REFERENCES `region` (`NumRegion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seisme_ibfk_1` FOREIGN KEY (`CodeSta`) REFERENCES `station` (`CodeSta`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
