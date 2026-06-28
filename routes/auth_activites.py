from flask import Blueprint, render_template
from models import Activite, Actualite

idrissa = Blueprint("idrissa", __name__)

@idrissa.route("/")
def accueil():
    actualites = Actualite.query.order_by(Actualite.date.desc()).limit(3).all()
    return render_template("index.html", actualites=actualites)

@idrissa.route("/activites")
def liste_activites():
    activites = Activite.query.order_by(Activite.date.desc()).all()
    return render_template("activites.html", activites=activites)

@idrissa.route("/activites/<int:activite_id>")
def detail_activite(activite_id):
    activite = Activite.query.get_or_404(activite_id)
    return render_template("activite_detail.html", activite=activite)

@idrissa.route("/admin/login")
def admin_login():
    return render_template("admin/login.html")

@idrissa.route("/admin/dashboard")
def admin_dashboard():
    return render_template("admin/dashboard.html")