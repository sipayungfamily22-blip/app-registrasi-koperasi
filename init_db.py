#!/usr/bin/env python
"""Initialize database for the application"""

import sys
import os

# Add the koperasi apps directory to Python path
current_dir = os.path.dirname(os.path.abspath(__file__))
koperasi_apps_dir = os.path.join(current_dir, 'koperasi apps')
sys.path.insert(0, koperasi_apps_dir)

# Import with space handling
from importlib import import_module
import importlib.util

# Load the app module
app_path = os.path.join(koperasi_apps_dir, 'app.py')
spec = importlib.util.spec_from_file_location("app", app_path)
app_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(app_module)

app = app_module.app
db = app_module.db

# Create application context and initialize database
with app.app_context():
    try:
        db.create_all()
        print("✓ Database initialized successfully!")

        # Print database type
        db_uri = app.config['SQLALCHEMY_DATABASE_URI']
        if 'sqlite' in db_uri:
            db_type = 'SQLite'
            db_location = db_uri.split('///')[-1]
            print(f"✓ Database type: {db_type}")
            print(f"✓ Database location: {db_location}")
        elif 'mysql' in db_uri:
            db_type = 'MySQL'
            print(f"✓ Database type: {db_type}")
            print(f"✓ Database URI: {db_uri.replace(app.config.get('DB_PASSWORD', ''), '****')}")
        else:
            print(f"✓ Database URI: {db_uri}")

    except Exception as e:
        print(f"✗ Error initializing database: {e}")
        sys.exit(1)
