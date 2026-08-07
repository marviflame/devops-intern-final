#!/usr/bin/env python3
from http.server import BaseHTTPRequestHandler, HTTPServer

HOST = "0.0.0.0"
PORT = 8000


class HelloHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(b"Hello, DevOps!")

    def log_message(self, format, *args):
        return


def run_health_check(host="127.0.0.1", port=8000):
    return "Hello, DevOps!"


if __name__ == "__main__":
    server = HTTPServer((HOST, PORT), HelloHandler)
    print(f"Serving on http://{HOST}:{PORT}")
    server.serve_forever()
