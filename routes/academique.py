from flask import Blueprint, render_template, redirect, url_for, flash

fatoumata = Blueprint('fatoumata', __name__)

# ==============================================
# ROUTES PUBLIQUES - Départements, Formations, Enseignants (Fatoumata)
# ==============================================

@fatoumata.route('/')
def accueil():
    return render_template('base.html')

@fatoumata.route('/departements')
def liste_departements():
    from models import Departement
    departements = Departement.query.all()
    return render_template('departements.html', departements=departements)

@fatoumata.route('/departement/<int:id>')
def detail_departement(id):
    from models import Departement
    dept = Departement.query.get_or_404(id)
    return render_template('departement_detail.html', dept=dept)

@fatoumata.route('/formations')
def liste_formations():
    from models import Formation
    formations = Formation.query.all()
    return render_template('formations.html', formations=formations)

@fatoumata.route('/formation/<int:id>')
def detail_formation(id):
    from models import Formation
    formation = Formation.query.get_or_404(id)
    return render_template('formation_detail.html', formation=formation)

@fatoumata.route('/enseignants')
def liste_enseignants():
    from models import Enseignant
    enseignants = Enseignant.query.all()
    return render_template('enseignants.html', enseignants=enseignants)

@fatoumata.route('/enseignant/<int:id>')
def detail_enseignant(id):
    from models import Enseignant
    enseignant = Enseignant.query.get_or_404(id)
    return render_template('enseignant_detail.html', enseignant=enseignant)