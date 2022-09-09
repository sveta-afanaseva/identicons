import unittest
from app.identidock import app


class TestCase(unittest.TestCase):
    
    def setUp(self):
        app.config["TESTING"] = True 
        self.app = app.test_client()
    
    def test_get_mainpage(self):
        page = self.app.post("/", data=dict(name="Moby Dick"))
        assert page.status_code == 200
        assert 'Hello' in str(page.data)
        assert 'Moby Dick' in str(page.data)
    
    def test_html_escaping(self):
        page = self.app.post("/", data=dict(name='"><b>TEST</b><!--'))
        assert '<b>' not in str(page.data)


if __name__ == '__main__':
    unittest.main()
