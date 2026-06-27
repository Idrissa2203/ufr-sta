from datetime import datetime
from extensions import db


# ==============================
#  Idrissa
# ==============================

class Admin(db.Model):
    __tablename__ = "admins"
    id = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(150), unique=True, nullable=False)
    mot_de_passe_hash = db.Column(db.String(255), nullable=False)
    role = db.Column(db.String(50), default="admin")
    cree_le = db.Column(db.DateTime, default=datetime.utcnow)


class Activite(db.Model):
    __tablename__ = "activites"
    id = db.Column(db.Integer, primary_key=True)
    titre = db.Column(db.String(200), nullable=False)
    type_activite = db.Column(db.String(50))
    date = db.Column(db.Date, nullable=False)
    lieu = db.Column(db.String(150))
    organisateur = db.Column(db.String(150))
    description = db.Column(db.Text)
    cree_le = db.Column(db.DateTime, default=datetime.utcnow)


# ==============================
#  Fatoumata
# ==============================

class Departement(db.Model):
    __tablename__ = "departements"
    id = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String(150), nullable=False)
    description = db.Column(db.Text)
    responsable = db.Column(db.String(150))
    contact = db.Column(db.String(150))


class Formation(db.Model):
    __tablename__ = "formations"
    id = db.Column(db.Integer, primary_key=True)
    departement_id = db.Column(db.Integer, db.ForeignKey("departements.id"), nullable=False)
    nom = db.Column(db.String(150), nullable=False)
    niveau = db.Column(db.String(50))
    duree = db.Column(db.String(50))
    conditions_admission = db.Column(db.Text)
    debouches = db.Column(db.Text)
    programme = db.Column(db.Text)


class Enseignant(db.Model):
    __tablename__ = "enseignants"
    id = db.Column(db.Integer, primary_key=True)
    departement_id = db.Column(db.Integer, db.ForeignKey("departements.id"))
    nom = db.Column(db.String(150), nullable=False)
    grade = db.Column(db.String(100))
    email = db.Column(db.String(150))
    domaines_recherche = db.Column(db.Text)
    photo = db.Column(db.String(255))


# ==============================
#  Elimane
# ==============================

class Actualite(db.Model):
    __tablename__ = "actualites"
    id = db.Column(db.Integer, primary_key=True)
    titre = db.Column(db.String(200), nullable=False)
    date = db.Column(db.Date, nullable=False)
    description = db.Column(db.Text)
    photo = db.Column(db.String(255))
    cree_le = db.Column(db.DateTime, default=datetime.utcnow)


class Album(db.Model):
    __tablename__ = "albums"
    id = db.Column(db.Integer, primary_key=True)
    titre = db.Column(db.String(150), nullable=False)
    description = db.Column(db.Text)
    date = db.Column(db.Date)


class MessageContact(db.Model):
    __tablename__ = "messages_contact"
    id = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String(150), nullable=False)
    email = db.Column(db.String(150), nullable=False)
    sujet = db.Column(db.String(200))
    message = db.Column(db.Text, nullable=False)
    envoye_le = db.Column(db.DateTime, default=datetime.utcnow)