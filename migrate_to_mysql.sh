#!/bin/bash
# Migration script from SQLite to MySQL

echo "========================================="
echo "SQLite to MySQL Migration Script"
echo "========================================="

# Check if Docker is running
if ! docker-compose ps | grep -q "Up"; then
    echo "❌ Docker containers are not running. Please run './docker_run.sh' first."
    exit 1
fi

echo "✅ Docker containers are running"

# Check if SQLite database exists
SQLITE_DB="koperasi apps/instance/koperasi.db"
if [ ! -f "$SQLITE_DB" ]; then
    echo "❌ SQLite database not found at $SQLITE_DB"
    echo "Nothing to migrate. MySQL will be initialized fresh."
    exit 0
fi

echo "✅ SQLite database found at $SQLITE_DB"

# Create migration directory
MIGRATION_DIR="migration_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$MIGRATION_DIR"

echo "========================================="
echo "Step 1: Export SQLite data"
echo "========================================="

# Export SQLite data to SQL
docker run --rm -v "$(pwd):/data" -w /data python:3.11-slim bash -c "
apt-get update && apt-get install -y sqlite3 && \
sqlite3 '$SQLITE_DB' .dump > '$MIGRATION_DIR/sqlite_dump.sql'
"

if [ ! -f "$MIGRATION_DIR/sqlite_dump.sql" ]; then
    echo "❌ Failed to export SQLite data"
    exit 1
fi

echo "✅ SQLite data exported to $MIGRATION_DIR/sqlite_dump.sql"

echo "========================================="
echo "Step 2: Convert SQLite dump to MySQL format"
echo "========================================="

# Convert SQLite syntax to MySQL
sed -i '
s/PRAGMA foreign_keys=OFF;//g
s/BEGIN TRANSACTION;//g
s/COMMIT;//g
s/sqlite_sequence//g
s/AUTOINCREMENT/AUTO_INCREMENT/g
s/INTEGER PRIMARY KEY AUTO_INCREMENT/INT AUTO_INCREMENT PRIMARY KEY/g
s/UNSIGNED BIG INT/BIGINT UNSIGNED/g
' "$MIGRATION_DIR/sqlite_dump.sql"

# Remove problematic lines
sed -i '/^INSERT INTO sqlite_sequence/d' "$MIGRATION_DIR/sqlite_dump.sql"

echo "✅ SQLite dump converted to MySQL format"

echo "========================================="
echo "Step 3: Import data to MySQL"
echo "========================================="

# Import to MySQL
docker-compose exec -T mysql mysql -u koperasi_user -pkoperasi_pass koperasi < "$MIGRATION_DIR/sqlite_dump.sql"

if [ $? -eq 0 ]; then
    echo "✅ Data successfully imported to MySQL"
else
    echo "❌ Failed to import data to MySQL"
    echo "Check MySQL logs: docker-compose logs mysql"
    exit 1
fi

echo "========================================="
echo "Step 4: Verify migration"
echo "========================================="

# Verify tables exist
docker-compose exec -T mysql mysql -u koperasi_user -pkoperasi_pass -e "SHOW TABLES;" koperasi > "$MIGRATION_DIR/mysql_tables.txt"

echo "MySQL Tables:"
cat "$MIGRATION_DIR/mysql_tables.txt"

# Count records in each table
echo ""
echo "Record counts:"
docker-compose exec -T mysql mysql -u koperasi_user -pkoperasi_pass -e "
SELECT 'Users' as table_name, COUNT(*) as count FROM user
UNION ALL
SELECT 'Pendaftaran', COUNT(*) FROM pendaftaran
UNION ALL
SELECT 'Dokter', COUNT(*) FROM dokter
UNION ALL
SELECT 'Penggunaan Kupon', COUNT(*) FROM penggunaan_kupon;
" koperasi

echo ""
echo "========================================="
echo "Migration completed successfully!"
echo "========================================="
echo ""
echo "Migration files saved in: $MIGRATION_DIR/"
echo ""
echo "You can now:"
echo "1. Update .env.production to use MySQL (DATABASE_TYPE=mysql)"
echo "2. Restart the application"
echo "3. Test the application functionality"
echo ""
echo "To rollback to SQLite, restore from backup and change DATABASE_TYPE=sqlite"
echo ""
echo "========================================="