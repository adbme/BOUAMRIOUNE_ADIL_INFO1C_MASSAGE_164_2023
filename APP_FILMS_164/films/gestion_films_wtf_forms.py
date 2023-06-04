"""Gestion des formulaires avec WTF pour les films
Fichier : gestion_films_wtf_forms.py
Auteur : OM 2022.04.11

"""
import datetime

from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, DateField, TimeField
from wtforms import SubmitField
from wtforms.validators import Length, InputRequired, NumberRange, DataRequired
from wtforms.validators import Regexp
from wtforms.widgets import TextArea


class FormWTFAddFilm(FlaskForm):
    """
        Dans le formulaire "genres_ajouter_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """

    inputName = StringField("Entrez un nom de service")


    submit = SubmitField("Enregistrer film")


class FormWTFUpdateFilm(FlaskForm):
    """
        Dans le formulaire "film_update_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """

    nom_film_update_wtf = StringField("Modifier le nom du service", widget=TextArea())



    submit = SubmitField("Update film")


class FormWTFDeleteFilm(FlaskForm):
    """
        Dans le formulaire "film_delete_wtf.html"

        nom_film_delete_wtf : Champ qui reçoit la valeur du film, lecture seule. (readonly=true)
        submit_btn_del : Bouton d'effacement "DEFINITIF".
        submit_btn_conf_del : Bouton de confirmation pour effacer un "film".
        submit_btn_annuler : Bouton qui permet d'afficher la table "t_prendre_rdv".
    """
    nom_film_delete_wtf = StringField("Effacer ce film")
    submit_btn_del_film = SubmitField("Effacer film")
    submit_btn_conf_del_film = SubmitField("Etes-vous sur d'effacer ?")
    submit_btn_annuler = SubmitField("Annuler")
