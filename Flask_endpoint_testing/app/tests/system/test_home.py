from tests.system.base_test import BaseTest
import json



class TestHome(BaseTest):
    # what this test does is:
    # Launches the test client,
    # made a request to it,
    # stored the answer in response and
    # checked that response is getting a status code 200, which means that it is ok.
    def test_home(self):
        with self.app() as c:
            response = c.get("/")

            self.assertEqual(response.status_code, 200)
            self.assertEqual(json.loads(response.get_data()),
                            {"message": "Hello, world!"})
            #json.loads loads a string, that is the converted dict


