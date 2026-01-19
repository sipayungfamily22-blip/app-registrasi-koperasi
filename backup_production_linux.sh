#!/bin/bash
# Backup script for Linux production environment

echo "========================================="
echo "Database & Uploads Backup - Linux"
echo "========================================="

# Set working directory
cd "$(dirname "$0")"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="backups/backup_$TIMESTAMP"

# Create backup directory
mkdir -p "$BACKUP_DIR"

echo ""
echo "Backup location: $BACKUP_DIR"
echo ""

# Backup database
echo "Backing up database..."
if [ -f "koperasi apps/instance/koperasi.db" ]; then
    cp "koperasi apps/instance/koperasi.db" "$BACKUP_DIR/koperasi.db"
    echo "✓ Database backup completed"
else
    echo "✗ Database not found"
fi

# Backup uploads
echo "Backing up uploads..."
if [ -d "static/uploads" ]; then
    cp -r "static/uploads" "$BACKUP_DIR/uploads"
    echo "✓ Uploads backup completed"
else
    echo "✗ Uploads folder not found"
fi

# Backup configuration files
echo "Backing up configuration..."
cp ".env.production" "$BACKUP_DIR/.env.production" 2>/dev/null || true
cp "koperasi apps/config.py" "$BACKUP_DIR/config.py" 2>/dev/null || true
echo "✓ Configuration backup completed"

# Backup logs
echo "Backing up logs..."
if [ -d "logs" ]; then
    cp -r "logs" "$BACKUP_DIR/logs"
    echo "✓ Logs backup completed"
fi

echo ""
echo "========================================="
echo "Backup completed successfully!"
echo "Backup saved to: $BACKUP_DIR"
echo "========================================="