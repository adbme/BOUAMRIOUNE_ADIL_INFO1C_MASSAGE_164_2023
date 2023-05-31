-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour bouamrioune_adil_info1c_massage_164_2023
CREATE DATABASE IF NOT EXISTS `bouamrioune_adil_info1c_massage_164_2023` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bouamrioune_adil_info1c_massage_164_2023`;

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. mail
CREATE TABLE IF NOT EXISTS `mail` (
  `id_mail` int NOT NULL AUTO_INCREMENT,
  `adresse_mail` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_mail`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.mail : 4 rows
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom_personne` varchar(50) DEFAULT NULL,
  `prenom_personne` varchar(50) DEFAULT NULL,
  `fk_mail` int DEFAULT NULL,
  `fk_tel` int DEFAULT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `fk_mail` (`fk_mail`),
  KEY `fk_tel` (`fk_tel`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.personne : 8 rows
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. prendre_rdv
CREATE TABLE IF NOT EXISTS `prendre_rdv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_prendre_rdv` date NOT NULL,
  `heure_prendre_rdv` time NOT NULL,
  `fk_personne` int NOT NULL,
  `duree_film` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personne` (`fk_personne`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.prendre_rdv : 4 rows
/*!40000 ALTER TABLE `prendre_rdv` DISABLE KEYS */;
/*!40000 ALTER TABLE `prendre_rdv` ENABLE KEYS */;

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. tel
CREATE TABLE IF NOT EXISTS `tel` (
  `id_tel` int NOT NULL AUTO_INCREMENT,
  `num_tel` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tel`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.tel : 4 rows
/*!40000 ALTER TABLE `tel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tel` ENABLE KEYS */;

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_film
CREATE TABLE IF NOT EXISTS `t_film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `nom_film` varchar(255) DEFAULT NULL,
  `duree_film` int DEFAULT NULL,
  `description_film` text COMMENT 'RÃ©sume du film',
  `cover_link_film` text COMMENT 'lien photo couverture du film',
  `date_sortie_film` date DEFAULT NULL COMMENT 'date sortie du film',
  `Colonne 7` int DEFAULT NULL,
  PRIMARY KEY (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_film : ~13 rows (environ)

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_genre
CREATE TABLE IF NOT EXISTS `t_genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `intitule_genre` varchar(50) DEFAULT NULL,
  `untruc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_genre`),
  UNIQUE KEY `intitule_genre` (`intitule_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_genre : ~18 rows (environ)

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_genre_film
CREATE TABLE IF NOT EXISTS `t_genre_film` (
  `id_genre_film` int NOT NULL AUTO_INCREMENT,
  `fk_genre` int DEFAULT NULL,
  `fk_film` int DEFAULT NULL,
  `date_insert_genre` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_genre_film`),
  KEY `fk_genre` (`fk_genre`),
  KEY `fk_film` (`fk_film`),
  CONSTRAINT `t_genre_film_ibfk_1` FOREIGN KEY (`fk_genre`) REFERENCES `t_genre` (`id_genre`),
  CONSTRAINT `t_genre_film_ibfk_2` FOREIGN KEY (`fk_film`) REFERENCES `t_film` (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_genre_film : ~17 rows (environ)

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_test
CREATE TABLE IF NOT EXISTS `t_test` (
  `test` varchar(50) DEFAULT NULL,
  `adil` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_test : 13 rows
/*!40000 ALTER TABLE `t_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_test` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
