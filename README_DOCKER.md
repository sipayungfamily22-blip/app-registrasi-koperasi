# 🐳 Docker Setup - MySQL + Flask Application

## 📋 Prerequisites

- Docker
- Docker Compose
- Git (optional)

## 🚀 Quick Start

### 1. Clone/Download Project
```bash
git clone <repository-url>
cd aplikasi-formulir-pendaftaran
```

### 2. Setup Environment
```bash
# Make scripts executable
chmod +x docker_setup.sh
chmod +x docker_run.sh

# Run setup
./docker_setup.sh
```

### 3. Access Application
- **URL**: `http://localhost:8000`
- **MySQL**: `localhost:3306`

## 👥 Default Login Credentials

| Role | Email | Password |
|------|-------|----------|
| Approval 1 | verifikatorkaryawan@gmail.com | password123 |
| Approval 2 | korpeg.shtb@gmail.com | password123 |
| Admin | koperasi.karyashtb@gmail.com | password123 |

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐
│   Flask App     │    │     MySQL       │
│   (Gunicorn)    │◄──►│   Database      │
│   Port: 8000    │    │   Port: 3306    │
└─────────────────┘    └─────────────────┘
```

## 📁 Project Structure

```
.
├── docker-compose.yml      # Docker services configuration
├── Dockerfile             # Flask app container
├── .dockerignore          # Docker ignore file
├── docker_setup.sh        # Initial setup script
├── docker_run.sh          # Run script
├── koperasi apps/         # Flask application
├── static/                # Static files & uploads
├── logs/                  # Application logs
├── backups/               # Database backups
└── .env.production        # Environment variables
```

## 🔧 Configuration

### Environment Variables (.env.production)
```env
# Database
DATABASE_TYPE=mysql
DB_HOST=mysql
DB_PORT=3306
DB_NAME=koperasi
DB_USER=koperasi_user
DB_PASSWORD=koperasi_pass

# Flask
FLASK_ENV=production
FLASK_DEBUG=0

# Security
SECRET_KEY=your-32-char-random-key

# Email
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-app-password
```

### Docker Services

#### MySQL Container
- **Image**: `mysql:8.0`
- **Database**: `koperasi`
- **User**: `koperasi_user`
- **Password**: `koperasi_pass`
- **Root Password**: `rootpassword`
- **Port**: `3306`
- **Volume**: `mysql_data` (persistent storage)

#### Flask App Container
- **Base Image**: `python:3.11-slim`
- **WSGI Server**: Gunicorn
- **Workers**: 4
- **Threads**: 2
- **Port**: `8000`
- **Health Check**: Built-in

## 🛠️ Docker Commands

### Basic Operations
```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# Restart services
docker-compose restart

# View logs
docker-compose logs -f app
docker-compose logs -f mysql

# Check status
docker-compose ps
```

### Database Operations
```bash
# Access MySQL shell
docker-compose exec mysql mysql -u koperasi_user -p koperasi

# Backup database
docker-compose exec mysql mysqldump -u koperasi_user -p koperasi > backup.sql

# Restore database
docker-compose exec -T mysql mysql -u koperasi_user -p koperasi < backup.sql
```

### Application Operations
```bash
# Access app container
docker-compose exec app bash

# Run database initialization
docker-compose exec app python koperasi\ apps/init_db.py

# Check app health
curl http://localhost:8000
```

## 📊 Monitoring

### View Real-time Logs
```bash
# Application logs
docker-compose logs -f app

# MySQL logs
docker-compose logs -f mysql

# All logs
docker-compose logs -f
```

### Check Container Health
```bash
# Container status
docker-compose ps

# Resource usage
docker stats

# MySQL process
docker-compose exec mysql mysqladmin processlist -u root -p
```

## 🔄 Backup & Recovery

### Automated Backup
```bash
# Backup database and uploads
./backup_production_linux.sh
```

### Manual MySQL Backup
```bash
# Create backup
docker-compose exec mysql mysqldump -u koperasi_user -p koperasi > backup_$(date +%Y%m%d_%H%M%S).sql

# Restore backup
docker-compose exec -T mysql mysql -u koperasi_user -p koperasi < backup.sql
```

### Volume Backup
```bash
# Backup MySQL data volume
docker run --rm -v koperasi_mysql_data:/data -v $(pwd):/backup alpine tar czf /backup/mysql_backup.tar.gz -C /data .
```

## 🛑 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Check what's using port 8000
lsof -i :8000

# Check MySQL port
lsof -i :3306

# Stop conflicting services
docker-compose down
```

#### MySQL Connection Failed
```bash
# Check MySQL container logs
docker-compose logs mysql

# Test MySQL connection
docker-compose exec mysql mysqladmin ping -u koperasi_user -p

# Restart MySQL
docker-compose restart mysql
```

#### App Container Won't Start
```bash
# Check app logs
docker-compose logs app

# Check app container
docker-compose ps

# Rebuild and restart
docker-compose up --build -d app
```

#### Database Initialization Failed
```bash
# Manual initialization
docker-compose exec app python koperasi\ apps/init_db.py

# Check database exists
docker-compose exec mysql mysql -u koperasi_user -p -e "SHOW DATABASES;"
```

### Reset Everything
```bash
# Stop and remove everything
docker-compose down -v --remove-orphans

# Remove images
docker-compose down --rmi all

# Clean up
docker system prune -f

# Restart setup
./docker_setup.sh
```

## 🔒 Security Considerations

- Change default MySQL passwords in production
- Use strong SECRET_KEY for Flask
- Configure firewall rules
- Regularly update Docker images
- Monitor logs for suspicious activity
- Use HTTPS in production (add reverse proxy)

## 📈 Scaling

### Scale Application
```bash
# Increase app instances
docker-compose up -d --scale app=3
```

### Database Optimization
- Monitor MySQL slow query log
- Adjust MySQL configuration in docker-compose.yml
- Consider using MySQL 8.0 features

## 🔄 Migration from SQLite

If migrating from existing SQLite database:

1. Export data from SQLite
2. Convert to MySQL format
3. Import into MySQL container
4. Update .env.production to use MySQL
5. Restart services

## 📞 Support

For issues:
1. Check container logs: `docker-compose logs`
2. Verify environment variables
3. Test database connectivity
4. Check Docker and Docker Compose versions
5. Review firewall and network settings