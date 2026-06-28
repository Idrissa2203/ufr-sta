from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SelectField, FileField, SubmitField
from wtforms.validators import DataRequired, Email

class EnseignantForm(FlaskForm):
    departement_id = SelectField('Département', coerce=int, validators=[DataRequired()])
    nom = StringField('Nom complet', validators=[DataRequired()])
    grade = StringField('Grade')
    email = StringField('Email professionnel', validators=[Email()])
    domaines_recherche = TextAreaField('Domaines de recherche')
    photo = FileField('Photo (fichier image)')
    submit = SubmitField('Enregistrer')