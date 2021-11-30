import unittest
import json
from app import create_app


class APITestCase(unittest.TestCase):
    def setUp(self) -> None:
        self.app = create_app()
        self.app_context = self.app.app_context()
        self.app_context.push()
        self.client = self.app.test_client()

    def tearDown(self) -> None:
        self.app_context.pop()

    def test_greeting_returns_hello(self):
        response = self.client.get("/greeting")
        self.assertEqual(response.status_code, 200)
        json_response = json.loads(response.get_data(as_text=True))
        self.assertEqual(json_response["message"], "hello")

    def test_greeting_followed_by_name_in_path(self):
        response = self.client.get("/greeting/world")
        self.assertEqual(response.status_code, 200)
        json_response = json.loads(response.get_data(as_text=True))
        self.assertEqual(json_response["message"], "hello world")
from flask import Blueprint

bp = Blueprint("api", __name__)

from app.api import routes
