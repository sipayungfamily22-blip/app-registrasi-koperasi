#!/bin/bash
# Docker setup script for MySQL + Flask application

echo "========================================="
echo "Docker Setup - MySQL + Flask Application"
echo "========================================="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

echo "✅ Docker and Docker Compose are installed"

# Create necessary directories
echo "Creating directories..."
mkdir -p logs
mkdir -p static/uploads/buku_tabungan
mkdir -p static/uploads/id_karyawan
mkdir -p static/uploads/ktp
mkdir -p static/uploads/pas_foto
mkdir -p backups

echo "========================================="
echo "Starting Docker containers..."
echo "========================================="

# Start containers
docker-compose up -d

echo ""
echo "========================================="
echo "Waiting for MySQL to be ready..."
echo "========================================="

# Wait for MySQL to be healthy
echo "Checking MySQL health..."
sleep 30

# Check if MySQL is ready
if docker-compose exec -T mysql mysqladmin ping -h localhost --silent; then
    echo "✅ MySQL is ready!"
else
    echo "❌ MySQL failed to start. Check logs with: docker-compose logs mysql"
    exit 1
fi

echo ""
echo "========================================="
echo "Initializing database..."
echo "========================================="

# Run database initialization
docker-compose exec app python koperasi\ apps/init_db.py

echo ""
echo "========================================="
echo "Setup completed successfully!"
echo "========================================="
echo ""
echo "Application is running at: http://localhost:8000"
echo ""
echo "To view logs:"
echo "  docker-compose logs -f app"
echo "  docker-compose logs -f mysql"
echo ""
echo "To stop:"
echo "  docker-compose down"
echo ""
echo "To restart:"
echo "  docker-compose restart"
echo ""
echo "========================================="