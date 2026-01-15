@echo off
REM Script untuk menjalankan aplikasi Koperasi dengan Waitress di production

REM Set working directory
cd /d "%~dp0"

REM Activate virtual environment
call .venv\Scripts\activate.bat

REM Install Waitress jika belum
pip install waitress --quiet

REM Set production environment
set FLASK_ENV=production
set FLASK_DEBUG=0

REM Clear old logs jika ada
if exist logs\app.log (
    del logs\app.log
)

REM Create logs directory jika belum
if not exist logs mkdir logs

echo.
echo ========================================
echo Aplikasi Koperasi - Production Server
echo ========================================
echo.
echo Waitress Production Server dimulai...
echo Akses aplikasi di: http://localhost:8000
echo.
echo Untuk menghentikan: Tekan Ctrl+C
echo.
echo ========================================
echo.

REM Jalankan Waitress dengan konfigurasi production
REM --port=8000: Port aplikasi
REM --threads=4: Thread pool (adjust sesuai kebutuhan)
REM --max-request-body-size=16777216: Max upload 16MB
REM --channel-timeout=120: Connection timeout 120 detik

REM Ubah ke directory koperasi apps untuk import module
cd "koperasi apps"
waitress-serve --port=8000 --threads=4 --max-request-body-size=16777216 --channel-timeout=120 "app:app"

pause
