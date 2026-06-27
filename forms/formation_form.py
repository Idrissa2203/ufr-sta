class FormationForm(FlaskForm):
departement_id = SelectField('Département', coerce=int, validators=[DataRequired()])
nom = StringField('Nom de la formation', validators=[DataRequired()])
niveau = SelectField('Niveau', choices=[('Licence', 'Licence'), ('Master', 'Master')])
duree = StringField('Durée (ex: 3 ans)')
conditions_admission = TextAreaField("Conditions d'admission")
debouches = TextAreaField('Débouchés')
programme = TextAreaField('Programme détaillé')
submit = SubmitField('Enregistrer')