#!/bin/bash
# Docker run script for MySQL + Flask application

echo "========================================="
echo "Starting Docker Application"
echo "========================================="

# Check if containers are running
if docker-compose ps | grep -q "Up"; then
    echo "✅ Containers are already running"
    echo "Application available at: http://localhost:8000"
else
    echo "Starting containers..."
    docker-compose up -d

    echo "Waiting for services to be ready..."
    sleep 10

    echo "✅ Application started!"
    echo "Access at: http://localhost:8000"
fi

echo ""
echo "Useful commands:"
echo "  View app logs: docker-compose logs -f app"
echo "  View MySQL logs: docker-compose logs -f mysql"
echo "  Stop services: docker-compose down"
echo "  Restart services: docker-compose restart"
echo ""
echo "========================================="