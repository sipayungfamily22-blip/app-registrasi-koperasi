#!/bin/bash
# Production server script for Linux

echo "========================================="
echo "Aplikasi Koperasi - Linux Production Server"
echo "========================================="

# Set working directory
cd "$(dirname "$0")"

# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Set production environment
export FLASK_ENV=production
export FLASK_DEBUG=0

# Clear old logs if exists
if [ -f logs/app.log ]; then
    rm logs/app.log
fi

# Create logs directory if not exists
mkdir -p logs

echo ""
echo "========================================="
echo "Gunicorn Production Server starting..."
echo "Access app at: http://localhost:8000"
echo ""
echo "To stop: Press Ctrl+C"
echo "========================================="
echo ""

# Change to koperasi apps directory for module import
cd "koperasi apps"

# Run Gunicorn with production configuration
# --bind=0.0.0.0:8000: Bind to all interfaces on port 8000
# --workers=4: Number of worker processes (adjust as needed)
# --threads=2: Threads per worker
# --max-requests=1000: Restart worker after 1000 requests
# --max-requests-jitter=50: Add jitter to max-requests
# --timeout=120: Request timeout in seconds
# --limit-request-line=0: No limit on request line length
# --limit-request-field_size=0: No limit on request field size

gunicorn --bind=0.0.0.0:8000 \
         --workers=4 \
         --threads=2 \
         --max-requests=1000 \
         --max-requests-jitter=50 \
         --timeout=120 \
         --limit-request-line=0 \
         --limit-request-field_size=0 \
         --access-logfile ../logs/access.log \
         --error-logfile ../logs/error.log \
         --log-level info \
         "app:app"