from flask import jsonify, request, abort
from app.api import bp


@bp.route("/greeting", methods=["GET"])
def greeting():
    return jsonify({"message": "hello"})


@bp.route("/greeting/<msg>", methods=["GET"])
def greeting_with_additional_path(msg):
    return jsonify({"message": f"hello {msg}"})
