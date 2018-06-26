from unittest import TestCase
from app import app


class BaseTest(TestCase):
    def setUp(self):
        # for the lifetime of this app, this is in testing mode:
        app.testing = True
        self.app = app.test_client
