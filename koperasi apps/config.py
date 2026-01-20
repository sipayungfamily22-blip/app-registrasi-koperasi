import os
from dotenv import load_dotenv
from datetime import datetime

# Load environment variables
dotenv_path = os.path.join(os.path.dirname(__file__), '..', '.env.production')
load_dotenv(dotenv_path)

class Config:
    """Base configuration"""
    SECRET_KEY = os.getenv('SECRET_KEY', 'dev-secret-key-change-in-production')
    
    # Database configuration - supports both SQLite and MySQL
    DATABASE_TYPE = os.getenv('DATABASE_TYPE', 'sqlite')  # 'sqlite' or 'mysql'
    
    if DATABASE_TYPE == 'mysql':
        # MySQL configuration
        DB_HOST = os.getenv('DB_HOST', 'localhost')
        DB_PORT = os.getenv('DB_PORT', '3306')
        DB_NAME = os.getenv('DB_NAME', 'koperasi')
        DB_USER = os.getenv('DB_USER', 'koperasi_user')
        DB_PASSWORD = os.getenv('DB_PASSWORD', 'koperasi_pass')
        SQLALCHEMY_DATABASE_URI = f'mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'
    else:
        # SQLite configuration (default) - use relative path for better portability
        _instance_path = os.path.join(os.path.dirname(__file__), 'instance')
        os.makedirs(_instance_path, exist_ok=True)
        _db_path = os.path.join(_instance_path, 'koperasi.db')
        # Use forward slashes for cross-platform compatibility
        SQLALCHEMY_DATABASE_URI = f'sqlite:///{_db_path}'
    
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
    
    # Session configuration - adjust for production
    PERMANENT_SESSION_LIFETIME = 3600  # 1 hour
    # Only set secure cookies if HTTPS is enabled
    SESSION_COOKIE_SECURE = os.getenv('HTTPS_ENABLED', 'false').lower() == 'true'
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
        'CHEMOTERAPY', 'RADIOTERAPY', 'ICU/ICCU/HCU', 'INPATIENT 12/16/17/18/19',
        'FRONT RELATION (CUSTOMER SERVICES,REGISTER & CASHIER)', 'HUMAN CAPITAL',
        'QUALITY & RISK', 'NURSING DIV (HDON/CNE/COORDINATOR)', 'SECRETARY',
        'LDS', 'MARKETING & SALES', 'FINANCE & ACCOUNTING',
        'PROCUREMENT', 'FMS & GA', 'DAILY WORKER', 'MANAGEMENT', 'AMA', 'THIRD PARTIES - EMPLOYEE', 'NICU/PICU', 'LAINNYA'
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