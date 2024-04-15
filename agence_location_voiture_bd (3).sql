-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Lun 15 Avril 2024 à 14:43
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `agence_location_voiture_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `code_client` varchar(20) NOT NULL,
  `nom_prenom` varchar(20) NOT NULL,
  `adresse` text NOT NULL,
  `date_naissance` date NOT NULL,
  `num_tel` varchar(20) NOT NULL,
  `ville` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`code_client`, `nom_prenom`, `adresse`, `date_naissance`, `num_tel`, `ville`, `email`) VALUES
('12A', 'Rémy P', '35 allée Claude monet', '2000-12-14', '06120880', 'paris', 'Rémy@gmail.com'),
('13A', 'David', '7 avenue général Leclerc', '2001-12-14', '065555555', 'creteil', 'david@gmail.com'),
('19A', 'David', '7 Avenue Général Leclerc', '2001-12-14', '065555555', 'Créteil', 'david@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `code_location` varchar(7) NOT NULL,
  `date_location` date NOT NULL,
  `prix_jour` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  `caution` int(11) NOT NULL,
  `code_client` varchar(20) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  PRIMARY KEY (`code_location`),
  KEY `code_client` (`code_client`,`immatriculation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `locations`
--


-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE IF NOT EXISTS `voitures` (
  `immatriculation` varchar(20) NOT NULL,
  `carburant` varchar(20) NOT NULL,
  `couleur` varchar(10) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `modele` varchar(20) NOT NULL,
  `nbre_porte` int(11) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `nbre_place` int(11) NOT NULL,
  `annee_circulation` date NOT NULL,
  `marque` varchar(20) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `carburant`, `couleur`, `kilometrage`, `modele`, `nbre_porte`, `etat`, `nbre_place`, `annee_circulation`, `marque`) VALUES
('12 TU 2000', 'essence', 'noire', 20000, 'AMG', 5, 'Bon', 5, '2020-12-12', 'Mercedes'),
('16 RR 3000', 'diesel', 'rouge', 30000, 'Megane', 5, 'bon', 5, '2020-12-12', 'Renault');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`code_client`) REFERENCES `clients` (`code_client`) ON DELETE CASCADE ON UPDATE CASCADE;
