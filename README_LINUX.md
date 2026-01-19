# 🚀 Aplikasi Koperasi - Linux Setup Guide

## 📋 Prerequisites

- Python 3.8+
- Linux/Ubuntu/Debian
- Git (optional)

## 🛠️ Installation & Setup

### 1. Clone/Download Project
```bash
# If using git
git clone <repository-url>
cd aplikasi-formulir-pendaftaran
```

### 2. Setup Environment
```bash
# Make scripts executable
chmod +x setup_production_linux.sh
chmod +x run_production_linux.sh
chmod +x backup_production_linux.sh

# Run setup
./setup_production_linux.sh
```

### 3. Configure Environment
Edit `.env.production`:
```bash
nano .env.production
```

Update these values:
```env
SECRET_KEY=your-secure-random-key-change-this-in-production-min-32-chars

MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-16-digit-app-password
```

### 4. Run Application
```bash
./run_production_linux.sh
```

## 🌐 Access Application

- **URL**: `http://localhost:8000`
- **Server**: Gunicorn (production WSGI server)

## 👥 Default Login Credentials

| Role | Email | Password |
|------|-------|----------|
| Approval 1 | verifikatorkaryawan@gmail.com | password123 |
| Approval 2 | korpeg.shtb@gmail.com | password123 |
| Admin | koperasi.karyashtb@gmail.com | password123 |

## 📁 Project Structure

```
.
├── koperasi apps/          # Main application
│   ├── app.py              # Flask application
│   ├── config.py           # Configuration
│   ├── models.py           # Database models
│   ├── instance/           # SQLite database
│   └── ...
├── static/                 # Static files
├── templates/              # HTML templates
├── logs/                   # Application logs
├── backups/                # Database backups
├── .env.production         # Environment variables
├── requirements.txt        # Python dependencies
├── setup_production_linux.sh    # Setup script
├── run_production_linux.sh      # Run script
└── backup_production_linux.sh   # Backup script
```

## 🔧 Configuration

### Environment Variables (.env.production)
```env
FLASK_ENV=production
FLASK_DEBUG=0

# Database
DATABASE_URL=sqlite:///instance/koperasi.db

# Security (Generate random key)
SECRET_KEY=your-32-char-random-key

# Email Configuration
MAIL_SERVER=smtp.gmail.com
MAIL_PORT=587
MAIL_USE_TLS=1
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-app-password

# Upload Configuration
UPLOAD_FOLDER=uploads
MAX_CONTENT_LENGTH=16777216

# Logging
LOG_FILE=logs/app.log
LOG_LEVEL=INFO
```

### Gunicorn Configuration
- **Workers**: 4 (adjust based on CPU cores)
- **Threads**: 2 per worker
- **Port**: 8000
- **Timeout**: 120 seconds
- **Max Requests**: 1000 per worker

## 📊 Monitoring

### View Logs
```bash
# Application logs
tail -f logs/app.log

# Gunicorn access logs
tail -f logs/access.log

# Gunicorn error logs
tail -f logs/error.log
```

### Check Running Processes
```bash
ps aux | grep gunicorn
```

## 🔄 Backup & Maintenance

### Automatic Backup
```bash
./backup_production_linux.sh
```

### Manual Database Backup
```bash
cp koperasi\ apps/instance/koperasi.db backups/manual_backup_$(date +%Y%m%d_%H%M%S).db
```

## 🛑 Troubleshooting

### Port 8000 Already in Use
```bash
# Find process using port 8000
lsof -i :8000

# Kill process
kill -9 <PID>
```

### Permission Issues
```bash
# Fix permissions
chmod -R 755 .
chmod -R 777 logs/
chmod -R 777 static/uploads/
```

### Database Issues
```bash
# Reset database
cd koperasi\ apps
rm instance/koperasi.db
python init_db.py
```

## 📞 Support

If you encounter issues:
1. Check logs in `logs/` directory
2. Verify `.env.production` configuration
3. Ensure all dependencies are installed
4. Check file permissions

## 🔒 Security Notes

- Change default passwords after first login
- Use strong SECRET_KEY in production
- Configure firewall to restrict access if needed
- Regularly backup database and uploads
- Monitor logs for suspicious activity