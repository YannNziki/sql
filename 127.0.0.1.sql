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
-- Base de données: `agence_location_voiture_bd`
--
CREATE DATABASE `agence_location_voiture_bd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `agence_location_voiture_bd`;

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
--
-- Base de données: `bibliothèque`
--
CREATE DATABASE `bibliothèque` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bibliothèque`;

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
--
-- Base de données: `client_avis`
--
CREATE DATABASE `client_avis` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `client_avis`;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `num_contact` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(50) NOT NULL,
  `email_client` varchar(50) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`num_contact`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `contact`
--

INSERT INTO `contact` (`num_contact`, `nom_client`, `email_client`, `commentaire`) VALUES
(1, 'Rémy', 'Rémy@yahoo.fr', 'je n''arrive pas à me connecter'),
(2, 'David', 'david@gmail.com', 'Mon panier est bloqué');
--
-- Base de données: `merise`
--
CREATE DATABASE `merise` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `merise`;

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
--
-- Base de données: `scolarite`
--
CREATE DATABASE `scolarite` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `scolarite`;

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE IF NOT EXISTS `eleves` (
  `num` int(11) NOT NULL,
  `Moyenne` varchar(30) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `num_telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`num`, `Moyenne`, `nom`, `adresse`, `num_telephone`) VALUES
(15, '16', 'Yann', '5square', '072456146'),
(1000, '11', 'aaaaa', 'nice', '07777'),
(1244, '12', 'EE', 'paris', '06'),
(1299, '13', 'David77', '', ''),
(1500, '', 'David', 'paris', '06'),
(1666, '', 'DAVID55', '', ''),
(3000, '', 'ss', 'ss', '06'),
(5000, '', 'TT', 'TT', '06'),
(7000, '', 'dsfddg', 'dsfs', '08'),
(12223, '', 'david2222', '', ''),
(1211111, '', 'AAAAA', '', '');

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
('', '', ''),
('aa', 'aa', 'enseignant'),
('anischergui', 'aa', 'administratif'),
('bb', 'bb', 'administratif'),
('ee', 'ee', ''),
('ft', 'ft', ''),
('gg', 'gg', ''),
('mm', 'b3cd915d758008bd19d0f2428fbb354a', ''),
('oo', 'e47ca7a09cf6781e29634502345930a7', ''),
('tt', 'tt', ''),
('ttt', '9990775155c3518a0d79', ''),
('uu', '6277e2a7446059985dc9bcf0a4ac1a8f', ''),
('Yann', '1234', 'eleve'),
('yy', '2fb1c5cf58867b5bbc9a1b145a86f3a0', ''),
('yyy', 'yyy', ''),
('zzz', 'zzz', '');
--
-- Base de données: `scolarite44`
--
CREATE DATABASE `scolarite44` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `scolarite44`;

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
--
-- Base de données: `zoo`
--
CREATE DATABASE `zoo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `zoo`;

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE IF NOT EXISTS `animaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_de_naissance` date NOT NULL,
  `nom_animal` varchar(50) NOT NULL,
  `commentaire` text NOT NULL,
  `id_Especes` int(11) NOT NULL,
  `sexe` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Especes` (`id_Especes`),
  KEY `sexe` (`sexe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11112 ;

--
-- Contenu de la table `animaux`
--

INSERT INTO `animaux` (`id`, `date_de_naissance`, `nom_animal`, `commentaire`, `id_Especes`, `sexe`) VALUES
(99, '2023-12-08', 'Serpent', 'Dangereux', 23, 'F'),
(11111, '2024-01-10', 'Lion', 'Dangereux', 26, 'M');

-- --------------------------------------------------------

--
-- Structure de la table `enclos`
--

CREATE TABLE IF NOT EXISTS `enclos` (
  `id` varchar(50) NOT NULL,
  `capacite_max` int(11) NOT NULL,
  `eau` tinyint(1) NOT NULL,
  `Taille` float NOT NULL,
  `id_Personnels` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Personnels` (`id_Personnels`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `enclos`
--


-- --------------------------------------------------------

--
-- Structure de la table `especes`
--

CREATE TABLE IF NOT EXISTS `especes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_race` varchar(50) NOT NULL,
  `duree_vie_moyenne` int(4) NOT NULL,
  `aquatique` tinyint(1) NOT NULL,
  `type_nourriture` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_nourriture` (`type_nourriture`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Contenu de la table `especes`
--

INSERT INTO `especes` (`id`, `nom_race`, `duree_vie_moyenne`, `aquatique`, `type_nourriture`) VALUES
(23, 'Mammifères', 15, 1, 'Carnivore'),
(24, 'Oiseau', 5, 0, 'Herbivore'),
(25, 'Reptile', 5, 1, 'Carnivore'),
(26, 'Mammifères', 15, 0, 'Herbivore'),
(27, 'Reptile', 5, 0, 'Carnivore');

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE IF NOT EXISTS `fonction` (
  `fonctions` varchar(50) NOT NULL,
  PRIMARY KEY (`fonctions`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fonction`
--

INSERT INTO `fonction` (`fonctions`) VALUES
('directeur'),
('employe');

-- --------------------------------------------------------

--
-- Structure de la table `loc_animaux`
--

CREATE TABLE IF NOT EXISTS `loc_animaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_arrive` date NOT NULL,
  `date_sortie` date NOT NULL,
  `id_Animaux` int(11) NOT NULL,
  `id_Enclos` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Animaux` (`id_Animaux`),
  KEY `id_Enclos` (`id_Enclos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `loc_animaux`
--


-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

CREATE TABLE IF NOT EXISTS `personnels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `salaire` decimal(15,3) NOT NULL,
  `sexe` varchar(50) NOT NULL,
  `fonctions` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sexe` (`sexe`),
  KEY `fonction` (`fonctions`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `personnels`
--

INSERT INTO `personnels` (`id`, `nom`, `prenom`, `date_de_naissance`, `login`, `password`, `salaire`, `sexe`, `fonctions`) VALUES
(1, 'Nziki', 'Yann', '2015-06-03', 'Yann', '1234', 6000.000, 'M', 'directeur'),
(4, 'aa', 'aa', '1999-03-27', 'aa', 'aa', 6000.000, 'F', 'directeur'),
(14, '', '', '0000-00-00', 'yy', 'yy', 0.000, 'M', 'employe'),
(15, '', '', '0000-00-00', 'william', '1234', 0.000, 'M', 'directeur'),
(18, '', '', '0000-00-00', 'azerty', '1234', 0.000, 'M', 'directeur'),
(22, 'c', 'c', '0000-00-00', 'c', 'c', 0.000, 'M', 'employe');

-- --------------------------------------------------------

--
-- Structure de la table `sexe`
--

CREATE TABLE IF NOT EXISTS `sexe` (
  `sexe` varchar(50) NOT NULL,
  PRIMARY KEY (`sexe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sexe`
--

INSERT INTO `sexe` (`sexe`) VALUES
('F'),
('M');

-- --------------------------------------------------------

--
-- Structure de la table `type_nourriture`
--

CREATE TABLE IF NOT EXISTS `type_nourriture` (
  `type_nourriture` varchar(50) NOT NULL,
  PRIMARY KEY (`type_nourriture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_nourriture`
--

INSERT INTO `type_nourriture` (`type_nourriture`) VALUES
('Carnivore'),
('Herbivore');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD CONSTRAINT `animaux_ibfk_2` FOREIGN KEY (`sexe`) REFERENCES `sexe` (`sexe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `animaux_ibfk_3` FOREIGN KEY (`id_Especes`) REFERENCES `especes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enclos`
--
ALTER TABLE `enclos`
  ADD CONSTRAINT `enclos_ibfk_1` FOREIGN KEY (`id_Personnels`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `especes`
--
ALTER TABLE `especes`
  ADD CONSTRAINT `especes_ibfk_1` FOREIGN KEY (`type_nourriture`) REFERENCES `type_nourriture` (`type_nourriture`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `loc_animaux`
--
ALTER TABLE `loc_animaux`
  ADD CONSTRAINT `loc_animaux_ibfk_3` FOREIGN KEY (`id_Animaux`) REFERENCES `animaux` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loc_animaux_ibfk_4` FOREIGN KEY (`id_Enclos`) REFERENCES `enclos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personnels`
--
ALTER TABLE `personnels`
  ADD CONSTRAINT `personnels_ibfk_3` FOREIGN KEY (`sexe`) REFERENCES `sexe` (`sexe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personnels_ibfk_4` FOREIGN KEY (`fonctions`) REFERENCES `fonction` (`fonctions`) ON DELETE CASCADE ON UPDATE CASCADE;
