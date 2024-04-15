-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Lun 15 Avril 2024 à 14:42
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `scolarite44`
--

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE IF NOT EXISTS `eleves` (
  `num` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `num_telephone` varchar(20) NOT NULL,
  `moyennes` float NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`num`, `nom`, `adresse`, `num_telephone`, `moyennes`) VALUES
(0, 'tt', 'tt', '06', 7),
(255, '255', '255', '255', 255),
(1244, 'EE', 'paris', '06454545', 17),
(1299, 'David77', '', '', 20),
(1666, 'DAVID55', '', '', 3),
(3000, 'ss', 'ss', '06', 0),
(12223, 'david2222', '', '', 12),
(1211111, 'AAAAA', '', '', 10);

-- --------------------------------------------------------

--
-- Structure de la table `eleve_v2`
--

CREATE TABLE IF NOT EXISTS `eleve_v2` (
  `identifiant` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `niveau` varchar(50) NOT NULL,
  `commentaire` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `eleve_v2`
--


-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `login` varchar(20) NOT NULL,
  `motdepasse` varchar(67) NOT NULL,
  `statut` varchar(20) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`login`, `motdepasse`, `statut`) VALUES
('aa', 'aa', 'enseignant'),
('anischergui', 'aa', 'administratif'),
('bb', 'bb', 'administratif'),
('david', 'david', 'eleve'),
('ee', 'ee', ''),
('ft', 'ft', ''),
('gg', 'gg', ''),
('Kevin', 'kevin', 'statut'),
('leon', 'leon', 'eleve'),
('mm', 'b3cd915d758008bd19d0f2428fbb354a', ''),
('oo', 'e47ca7a09cf6781e29634502345930a7', ''),
('test', 'test', 'student'),
('tt', 'tt', ''),
('ttt', '9990775155c3518a0d79', ''),
('uu', '6277e2a7446059985dc9bcf0a4ac1a8f', ''),
('yy', '2fb1c5cf58867b5bbc9a1b145a86f3a0', ''),
('yyy', 'yyy', ''),
('zzz', 'zzz', '');
