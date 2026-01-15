#!/usr/bin/env python
"""Initialize database for the application"""

import sys
import os

# Add the current directory to Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Import with space handling
from importlib import import_module
import importlib.util

# Load the app module
spec = importlib.util.spec_from_file_location("app", r"C:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\koperasi apps\app.py")
app_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(app_module)

app = app_module.app
db = app_module.db

# Create application context and initialize database
with app.app_context():
    try:
        db.create_all()
        print("✓ Database initialized successfully!")
        print("✓ Tables created in instance/koperasi.db")
    except Exception as e:
        print(f"✗ Error initializing database: {e}")
        sys.exit(1)
