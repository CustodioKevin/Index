-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 07 Décembre 2021 à 17:02
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `pays_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `communes`
--

CREATE TABLE IF NOT EXISTS `communes` (
  `code_commune` varchar(10) NOT NULL,
  `nom_commune` varchar(40) NOT NULL,
  `population_2010` varchar(40) NOT NULL,
  `population_1999` varchar(40) NOT NULL,
  `surface` varchar(40) NOT NULL,
  `longitude` varchar(40) NOT NULL,
  `latitude` varchar(40) NOT NULL,
  `num_departement` varchar(40) NOT NULL,
  PRIMARY KEY (`code_commune`),
  KEY `num_departement` (`num_departement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `communes`
--

INSERT INTO `communes` (`code_commune`, `nom_commune`, `population_2010`, `population_1999`, `surface`, `longitude`, `latitude`, `num_departement`) VALUES
('80000', 'amiens', '133448', '135501', '49,46 km²', '2.295753', '49.894067', '80'),
('91600', 'savigny-sur-orge', '36842', '36258', '6,97 km²', '2.34573507309', '48,6842', '91');

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE IF NOT EXISTS `departements` (
  `num_departement` varchar(40) NOT NULL,
  `nom_departement` varchar(40) NOT NULL,
  `code_region` varchar(40) NOT NULL,
  PRIMARY KEY (`num_departement`,`nom_departement`),
  KEY `code_region` (`code_region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `departements`
--

INSERT INTO `departements` (`num_departement`, `nom_departement`, `code_region`) VALUES
('91', 'essonne', '11'),
('80', 'somme', '22');

-- --------------------------------------------------------

--
-- Structure de la table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `code_region` varchar(40) NOT NULL,
  `nom-region` varchar(40) NOT NULL,
  PRIMARY KEY (`code_region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `regions`
--

INSERT INTO `regions` (`code_region`, `nom-region`) VALUES
('11', 'ile-de-france'),
('22', 'picardie');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `communes`
--
ALTER TABLE `communes`
  ADD CONSTRAINT `communes_ibfk_1` FOREIGN KEY (`num_departement`) REFERENCES `departements` (`num_departement`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departements`
--
ALTER TABLE `departements`
  ADD CONSTRAINT `departements_ibfk_1` FOREIGN KEY (`code_region`) REFERENCES `regions` (`code_region`) ON DELETE CASCADE ON UPDATE CASCADE;
