from flask import Flask, current_app


def create_app():
    app = Flask(__name__)

    from app.api import bp as api_bp

    app.register_blueprint(api_bp)

    return app
