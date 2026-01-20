"""
WSGI entry point untuk Waitress production server
Gunakan: waitress-serve --port=8000 wsgi:app
"""

from app import app

if __name__ == "__main__":
    app.run()
