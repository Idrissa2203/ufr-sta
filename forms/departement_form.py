from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, SubmitField
from wtforms.validators import DataRequired

class DepartementForm(FlaskForm):
nom = StringField('Nom du département', validators=[DataRequired()])
description = TextAreaField('Description')
responsable = StringField('Responsable')
contact = StringField('Contact (email ou téléphone)')
submit = SubmitField('Enregistrer')