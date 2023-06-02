-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------
-- Destruction de la BD si elle existe.
  -- Pour être certain d'avoir la dernière version des données
  DROP DATABASE IF EXISTS bouamrioune_adil_info1c_massage_164_2023;
  -- Création d'une nouvelle base de données
  CREATE DATABASE IF NOT EXISTS bouamrioune_adil_info1c_massage_164_2023;
  -- Utilisation de cette base de données
  USE bouamrioune_adil_info1c_massage_164_2023;


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

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_mail : ~0 rows (environ)
INSERT INTO `t_mail` (`id_mail`, `adresse_email`) VALUES
	(1, 'david@lescramptés'),
	(2, 'doe.jone@example'),
	(3, 'mike#example.com'),
	(4, 'sarah@example.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_personne : ~0 rows (environ)

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_prendre_rdv
CREATE TABLE IF NOT EXISTS `t_prendre_rdv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_prendre_rdv` date NOT NULL,
  `heure_prendre_rdv` time NOT NULL,
  `fk_personne` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personne` (`fk_personne`),
  CONSTRAINT `t_prendre_rdv_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_prendre_rdv : ~0 rows (environ)

-- Listage de la structure de table bouamrioune_adil_info1c_massage_164_2023. t_tel
CREATE TABLE IF NOT EXISTS `t_tel` (
  `id_tel` int NOT NULL AUTO_INCREMENT,
  `num_tel` int DEFAULT NULL,
  PRIMARY KEY (`id_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table bouamrioune_adil_info1c_massage_164_2023.t_tel : ~0 rows (environ)
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
