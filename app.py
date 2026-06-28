import os
from flask import Flask
from dotenv import load_dotenv
from extensions import db

load_dotenv()

def create_app():
    app = Flask(__name__)
    
    app.config["SECRET_KEY"] = "change-moi"
    app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:@localhost/ufr_sta"
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.init_app(app)
    
    import models

    #from routes.auth_activites import idrissa
    from routes.academique import fatoumata
    #from routes.communication import elimane

    #app.register_blueprint(idrissa)
    app.register_blueprint(fatoumata)
    #app.register_blueprint(elimane)

    with app.app_context():
        db.create_all()
    
    return app

app = create_app()

if __name__ == "__main__":
    app.run(debug=True)
    