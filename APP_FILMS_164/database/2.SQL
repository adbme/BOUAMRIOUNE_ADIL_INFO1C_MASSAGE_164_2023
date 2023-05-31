-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: MACCAUD_OLIVIER_INFO1X_FILMS_164_2023

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS BOUAMRIOUNE_ADIL_INFO1c_MASSAGE_164_2023;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS BOUAMRIOUNE_ADIL_INFO1c_MASSAGE_164_2023;

-- Utilisation de cette base de donnée

USE MACCAUD_OLIVIER_INFO1X_FILMS_164_2023;
"""
    Fichier : 1_ImportationDumpSql.py
    Auteur : OM 2023.03.21 Connection par l'instanciation de la classe Toolsbd.

    On obtient un objet "objet_dumpbd"

    Cela permet de construire la base de donnée à partir de votre fichier DUMP en SQL
    obtenu par l'exportation de votre bd dans PhpMyAdmin.
    Le fichier .env doit être correctement paramétré. (host, user, password, nomdevotrebd)
    Le fichier DUMP de la BD doit se trouver dans le répertoire "database" de votre projet Python.

    On signale les erreurs importantes
"""
from APP_FILMS_164.database import database_tools

try:
    objet_dumpbd = database_tools.ToolsBd().load_dump_sql_bd_init()
except Exception as erreur_load_dump_sql:
    print(f"Initialisation de la BD Impossible ! (voir DUMP ou .env) "
          f"{erreur_load_dump_sql.args[0]} , "
          f"{erreur_load_dump_sql}")
