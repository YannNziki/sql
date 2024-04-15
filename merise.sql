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
-- Base de données: `merise`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherents`
--

CREATE TABLE IF NOT EXISTS `adherents` (
  `CodeAdh` varchar(50) NOT NULL,
  `NomAdh` varchar(50) NOT NULL,
  `PrenomAdh` varchar(50) NOT NULL,
  `AdressAdh` varchar(50) NOT NULL,
  PRIMARY KEY (`CodeAdh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adherents`
--


-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `CodeAuteur` varchar(50) NOT NULL,
  `NomAut` varchar(50) NOT NULL,
  `PrenomAut` varchar(50) NOT NULL,
  PRIMARY KEY (`CodeAuteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auteur`
--


-- --------------------------------------------------------

--
-- Structure de la table `auteur_de`
--

CREATE TABLE IF NOT EXISTS `auteur_de` (
  `CodeOuvrage` varchar(50) NOT NULL,
  `CodeAuteur` varchar(50) NOT NULL,
  PRIMARY KEY (`CodeOuvrage`,`CodeAuteur`),
  KEY `Auteur_de_Auteur0_FK` (`CodeAuteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auteur_de`
--


-- --------------------------------------------------------

--
-- Structure de la table `mots`
--

CREATE TABLE IF NOT EXISTS `mots` (
  `CodeMot` varchar(50) NOT NULL,
  `Mot` varchar(50) NOT NULL,
  PRIMARY KEY (`CodeMot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `mots`
--


-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

CREATE TABLE IF NOT EXISTS `ouvrage` (
  `CodeOuvrage` varchar(50) NOT NULL,
  `TitreOuvrage` varchar(50) NOT NULL,
  `CodeRayon` varchar(50) NOT NULL,
  PRIMARY KEY (`CodeOuvrage`),
  KEY `Ouvrage_Rayon_FK` (`CodeRayon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ouvrage`
--

INSERT INTO `ouvrage` (`CodeOuvrage`, `TitreOuvrage`, `CodeRayon`) VALUES
('Livre12', 'BD Histoire Informatique', 'R12'),
('Livre13', 'Réseau Informatique', 'R12');

-- --------------------------------------------------------

--
-- Structure de la table `rayon`
--

CREATE TABLE IF NOT EXISTS `rayon` (
  `CodeRayon` varchar(50) NOT NULL,
  `IntituleRayon` varchar(50) NOT NULL,
  PRIMARY KEY (`CodeRayon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rayon`
--

INSERT INTO `rayon` (`CodeRayon`, `IntituleRayon`) VALUES
('R12', 'informatique'),
('R13', 'science-fictions');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auteur_de`
--
ALTER TABLE `auteur_de`
  ADD CONSTRAINT `Auteur_de_Auteur0_FK` FOREIGN KEY (`CodeAuteur`) REFERENCES `auteur` (`CodeAuteur`),
  ADD CONSTRAINT `Auteur_de_Ouvrage_FK` FOREIGN KEY (`CodeOuvrage`) REFERENCES `ouvrage` (`CodeOuvrage`);

--
-- Contraintes pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD CONSTRAINT `Ouvrage_Rayon_FK` FOREIGN KEY (`CodeRayon`) REFERENCES `rayon` (`CodeRayon`);
