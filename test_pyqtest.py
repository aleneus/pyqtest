import unittest
from pyqtest import TestApp
from PyQt5 import QtWidgets


class TestTouch(unittest.TestCase):
    def test_touch(self):
        app = TestApp(self)
        w = QtWidgets.QWidget()
        app(w, ["You see this text"])
