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
-- Base de données: `bibliothèque`
--

-- --------------------------------------------------------

--
-- Structure de la table `adhérents`
--

CREATE TABLE IF NOT EXISTS `adhérents` (
  `ID_Adherent` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Date_naissance` date NOT NULL,
  `Date_adhesion` date NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `Num_tel` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Adherent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `adhérents`
--


-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE IF NOT EXISTS `auteurs` (
  `ID_Auteur` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Date_naissance` date NOT NULL,
  PRIMARY KEY (`ID_Auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auteurs`
--


-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE IF NOT EXISTS `emprunts` (
  `ID_Emprunts` int(11) NOT NULL AUTO_INCREMENT,
  `Date_emprunt` date NOT NULL,
  `Duree` varchar(50) NOT NULL,
  `#_ID_Adherents` int(11) NOT NULL,
  `#_Reference_livre` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Emprunts`),
  KEY `#_ID_Adherents` (`#_ID_Adherents`),
  KEY `#_Reference_livre` (`#_Reference_livre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `emprunts`
--


-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE IF NOT EXISTS `livres` (
  `Reference_livre` varchar(50) NOT NULL,
  `Nbr_pages` int(11) NOT NULL,
  `#_ID_Auteur` varchar(50) NOT NULL,
  `Année` date NOT NULL,
  `Genre` varchar(50) NOT NULL,
  `Disponibilité` tinyint(1) NOT NULL,
  `Nbr_emprunts` int(11) NOT NULL,
  `Etat` varchar(50) NOT NULL,
  `Nbr_exemplaire` int(11) NOT NULL,
  PRIMARY KEY (`Reference_livre`),
  KEY `#_ID_Auteur` (`#_ID_Auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livres`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `adhérents`
--
ALTER TABLE `adhérents`
  ADD CONSTRAINT `adh@0prents_ibfk_1` FOREIGN KEY (`ID_Adherent`) REFERENCES `emprunts` (`#_ID_Adherents`);

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`#_ID_Auteur`) REFERENCES `auteurs` (`ID_Auteur`),
  ADD CONSTRAINT `livres_ibfk_2` FOREIGN KEY (`Reference_livre`) REFERENCES `emprunts` (`#_Reference_livre`);
