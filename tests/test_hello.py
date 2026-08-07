import unittest

import hello


class HelloTests(unittest.TestCase):
    def test_health_check_returns_expected_message(self):
        response = hello.run_health_check(host="127.0.0.1", port=0)
        self.assertEqual(response, "Hello, DevOps!")


if __name__ == "__main__":
    unittest.main()
