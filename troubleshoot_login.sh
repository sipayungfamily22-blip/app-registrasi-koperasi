#!/bin/bash
# Troubleshooting script for login issues on server

echo "========================================="
echo "Login Troubleshooting Script"
echo "========================================="

# Set working directory
cd "$(dirname "$0")"

echo "1. Checking environment variables..."
echo "FLASK_ENV: $FLASK_ENV"
echo "DATABASE_TYPE: $DATABASE_TYPE"
echo "HTTPS_ENABLED: $HTTPS_ENABLED"

echo ""
echo "2. Testing Python imports..."
python3 -c "
import sys, os
sys.path.insert(0, 'koperasi apps')
try:
    from app import app
    print('✅ App imported successfully')
    with app.app_context():
        print('✅ App context created')
        print('SESSION_COOKIE_SECURE:', app.config['SESSION_COOKIE_SECURE'])
        print('SECRET_KEY set:', bool(app.config['SECRET_KEY']))
        print('Database URI:', app.config['SQLALCHEMY_DATABASE_URI'])
        
        # Test database connection
        from database import db
        db.create_all()
        print('✅ Database connection OK')
        
        # Check if users exist
        from models import User
        users = User.query.all()
        print(f'✅ Found {len(users)} users in database')
        for user in users:
            print(f'  - {user.email} ({user.role})')
            
except Exception as e:
    print('❌ Error:', e)
    import traceback
    traceback.print_exc()
"

echo ""
echo "3. Checking file permissions..."
echo "Database file:"
ls -la koperasi\ apps/instance/koperasi.db 2>/dev/null || echo "Database file not found"

echo ""
echo "Logs directory:"
ls -la logs/ 2>/dev/null || echo "Logs directory not found"

echo ""
echo "4. Testing server startup..."
echo "Starting server for 10 seconds..."
timeout 10 python3 koperasi\ apps/app.py &
SERVER_PID=$!
sleep 5

if kill -0 $SERVER_PID 2>/dev/null; then
    echo "✅ Server started successfully"
    kill $SERVER_PID
else
    echo "❌ Server failed to start"
fi

echo ""
echo "========================================="
echo "Troubleshooting completed"
echo "========================================="
echo ""
echo "If login still fails, check:"
echo "1. SECRET_KEY is unique and strong"
echo "2. Database file is writable"
echo "3. Session cookies are not blocked"
echo "4. Check logs/app.log for detailed errors"
echo "5. Ensure HTTPS_ENABLED=false if not using HTTPS"
echo ""