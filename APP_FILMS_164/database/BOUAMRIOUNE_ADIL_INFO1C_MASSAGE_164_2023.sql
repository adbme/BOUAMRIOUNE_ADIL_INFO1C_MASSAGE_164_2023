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

DROP DATABASE IF EXISTS bouamrioune_adil_info1c_massage_164_2023;
-- Listage de la structure de la base pour bouamrioune_adil_info1c_massage_164_2023
CREATE DATABASE IF NOT EXISTS `bouamrioune_adil_info1c_massage_164_2023` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bouamrioune_adil_info1c_massage_164_2023`;

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_personne
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom_personne` varchar(50) DEFAULT NULL,
  `prenom_personne` varchar(50) DEFAULT NULL,
  `fk_mail` int DEFAULT NULL,
  `fk_tel` int DEFAULT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `fk_mail` (`fk_mail`),
  KEY `fk_tel` (`fk_tel`),
  CONSTRAINT `t_personne_ibfk_1` FOREIGN KEY (`fk_mail`) REFERENCES `t_mail` (`id_mail`),
  CONSTRAINT `t_personne_ibfk_2` FOREIGN KEY (`fk_tel`) REFERENCES `t_tel` (`id_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;




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

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_film : ~0 rows (environ)

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_genre
CREATE TABLE IF NOT EXISTS `t_genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `intitule_genre` varchar(50) DEFAULT NULL,
  `untruc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_genre`),
  UNIQUE KEY `intitule_genre` (`intitule_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_genre : ~0 rows (environ)

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

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_genre_film : ~0 rows (environ)

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_mail
CREATE TABLE IF NOT EXISTS `t_mail` (
  `id_mail` int NOT NULL AUTO_INCREMENT,
  `adresse_email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_mail : ~4 rows (environ)
INSERT INTO `t_mail` (`id_mail`, `adresse_email`) VALUES
	(1, 'david@lescramptés'),
	(2, 'doe.jone@example'),
	(3, 'mike#example.com'),
	(4, 'sarah@example.com');


-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_personne : ~5 rows (environ)
INSERT INTO `t_personne` (`id_personne`, `nom_personne`, `prenom_personne`, `fk_mail`, `fk_tel`) VALUES
	(1, 'david', 'lescramptés', 1, 1),
	(2, 'doe', 'jone', 2, 2),
	(3, 'mike', 'larue', 3, 3),
	(4, 'sarah', 'hmara', 4, 4),
	(5, 'oka', NULL, NULL, NULL);

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_prendre_rdv
CREATE TABLE IF NOT EXISTS `t_prendre_rdv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_prendre_rdv` timestamp NOT NULL,
  `heure_prendre_rdv` timestamp NOT NULL,
  `fk_personne` int DEFAULT NULL,
  `fk_service` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_service` (`fk_service`),
  CONSTRAINT `t_prendre_rdv_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  CONSTRAINT `t_prendre_rdv_ibfk_2` FOREIGN KEY (`fk_service`) REFERENCES `t_service` (`id_service`),
  CONSTRAINT `t_prendre_rdv_ibfk_3` FOREIGN KEY (`fk_service`) REFERENCES `t_service` (`id_service`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_prendre_rdv : ~4 rows (environ)
INSERT INTO `t_prendre_rdv` (`id`, `date_prendre_rdv`, `heure_prendre_rdv`, `fk_personne`, `fk_service`) VALUES
	(1, '2023-06-01 22:00:00', '2023-06-04 08:00:00', 1, 1),
	(2, '2023-06-02 22:00:00', '2023-06-04 12:30:00', 2, 4),
	(3, '2023-06-03 22:00:00', '2023-06-04 14:45:00', 3, 2),
	(4, '2023-06-04 22:00:00', '2023-06-04 10:02:00', 4, 1);

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_service
CREATE TABLE IF NOT EXISTS `t_service` (
  `id_service` int NOT NULL AUTO_INCREMENT,
  `nom_technique_service` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_service : ~6 rows (environ)
INSERT INTO `t_service` (`id_service`, `nom_technique_service`) VALUES
	(1, 'Reiki'),
	(2, 'Réflexologie'),
	(3, 'Massage 3'),
	(4, 'Massage 4'),
	(5, 'massage 5'),
	(6, 'massage 6'),
	(7, 'massage 7');

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_tel
CREATE TABLE IF NOT EXISTS `t_tel` (
  `id_tel` int NOT NULL AUTO_INCREMENT,
  `num_tel` int DEFAULT NULL,
  PRIMARY KEY (`id_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_tel : ~4 rows (environ)
INSERT INTO `t_tel` (`id_tel`, `num_tel`) VALUES
	(1, 78444092),
	(2, 21902102),
	(3, 91283838),
	(4, 893320832);

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_test
CREATE TABLE IF NOT EXISTS `t_test` (
  `test` varchar(50) DEFAULT NULL,
  `adil` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_test : 0 rows
/*!40000 ALTER TABLE `t_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_test` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
