import os
from dotenv import load_dotenv
from datetime import datetime

# Load environment variables
dotenv_path = os.path.join(os.path.dirname(__file__), '..', '.env.production')
load_dotenv(dotenv_path)

# Setup database path with absolute path
_instance_path = os.path.join(os.path.dirname(__file__), 'instance')
os.makedirs(_instance_path, exist_ok=True)
_db_path = os.path.abspath(os.path.join(_instance_path, 'koperasi.db'))
# Convert Windows path to SQLite format
_db_uri = f'sqlite:///{_db_path.replace(chr(92), "/")}'

class Config:
    """Base configuration"""
    SECRET_KEY = os.getenv('SECRET_KEY', 'dev-secret-key-change-in-production')
    SQLALCHEMY_DATABASE_URI = _db_uri
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    # Upload settings
    UPLOAD_FOLDER = os.path.join(os.path.dirname(__file__), '..', 'static', 'uploads')
    ALLOWED_EXTENSIONS = {'pdf', 'png', 'jpg', 'jpeg', 'gif'}
    MAX_CONTENT_LENGTH = int(os.getenv('MAX_CONTENT_LENGTH', 16777216))  # 16MB
    
    # Email configuration
    MAIL_SERVER = os.getenv('MAIL_SERVER', 'smtp.gmail.com')
    MAIL_PORT = int(os.getenv('MAIL_PORT', 587))
    MAIL_USE_TLS = os.getenv('MAIL_USE_TLS', '1') == '1'
    MAIL_USERNAME = os.getenv('MAIL_USERNAME', '')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD', '')
    MAIL_DEFAULT_SENDER = os.getenv('MAIL_DEFAULT_SENDER', 'noreply@koperasi.local')
    
    # Session
    PERMANENT_SESSION_LIFETIME = 3600  # 1 hour
    SESSION_COOKIE_SECURE = True
    SESSION_COOKIE_HTTPONLY = True
    SESSION_COOKIE_SAMESITE = 'Lax'
    
    # Approval emails
    APPROVAL1_EMAIL = 'verifikatorkaryawan@gmail.com'
    APPROVAL2_EMAIL = 'korpeg.shtb@gmail.com'
    ADMIN_EMAIL = 'koperasi.karyashtb@gmail.com'
    
    # Departemen options
    DEPARTEMEN_OPTIONS = [
        'OPD', 'EMERGENCY', 'MCU', 'PHARMACY', 'RADIOLOGI', 'LABORATORY',
        'MEDICAL REHAB', 'MEDICAL RECORD', 'NUTRITION', 'DIALYSIS',
        'OPERATING THEATRE', 'CATHLAB', 'ENDOSCOPY', 'DOCTOR RMO',
        'CHEMOTERAPY', 'RADIOTERAPY', 'ICU', 'IN PATIENT SERVICES',
        'FRONT RELATION (CUSTOMER SERVICES, CASHIER)', 'TALENT ADMINISTRATION',
        'QUALITY & RISK', 'ANCILLARY, AMA, NURSING DIV', 'SECRETARY',
        'LDS', 'MARKETING & BUSINESS DEVELOPMENT', 'FINANCE & ACCOUNTING',
        'PROCUREMENT', 'FMS & GA', 'DAILY WORKER'
    ]

class DevelopmentConfig(Config):
    """Development configuration"""
    DEBUG = True
    TESTING = False
    SESSION_COOKIE_SECURE = False

class ProductionConfig(Config):
    """Production configuration"""
    DEBUG = False
    TESTING = False
    SQLALCHEMY_ECHO = False

class TestingConfig(Config):
    """Testing configuration"""
    TESTING = True
    SQLALCHEMY_DATABASE_URI = 'sqlite:///:memory:'
    WTF_CSRF_ENABLED = False