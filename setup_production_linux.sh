#!/bin/bash
# Setup script for Linux production environment

echo "========================================="
echo "Setup Aplikasi Koperasi - Linux Production"
echo "========================================="

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv .venv

# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install requirements
echo "Installing requirements..."
pip install -r requirements.txt

# Create necessary directories
echo "Creating directories..."
mkdir -p logs
mkdir -p static/uploads/buku_tabungan
mkdir -p static/uploads/id_karyawan
mkdir -p static/uploads/ktp
mkdir -p static/uploads/pas_foto
mkdir -p koperasi\ apps/instance

# Initialize database
echo "Initializing database..."
cd koperasi\ apps
python init_db.py
cd ..

echo ""
echo "========================================="
echo "Setup completed successfully!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Edit .env.production with your email settings"
echo "2. Run: ./run_production.sh"
echo ""
echo "========================================="