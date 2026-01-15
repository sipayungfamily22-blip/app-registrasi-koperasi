@echo off
REM ============================================
REM Setup Aplikasi Koperasi untuk Production
REM ============================================
REM Script ini akan setup Waitress, database, dan directories

echo.
echo ============================================
echo Setup Aplikasi Koperasi - Production
echo ============================================
echo.

REM Step 1: Create Directories
echo [1/4] Membuat directories...
mkdir logs 2>nul
mkdir "static\uploads\ktp" 2>nul
mkdir "static\uploads\pas_foto" 2>nul
mkdir "static\uploads\id_karyawan" 2>nul
mkdir "static\uploads\buku_tabungan" 2>nul
echo ✓ Directories created

REM Step 2: Activate Virtual Environment
echo.
echo [2/4] Setup Python environment...
call .venv\Scripts\activate.bat
echo ✓ Virtual environment activated

REM Step 3: Install Dependencies
echo.
echo [3/4] Installing dependencies...
pip install -r requirements.txt -q
echo ✓ Dependencies installed (Waitress, python-dotenv, dll)

REM Step 4: Generate SECRET_KEY
echo.
echo [4/4] Generating production configuration...

REM Create .env.production dari template jika belum ada
if not exist ".env.production" (
    echo SECRET_KEY=%RANDOM%%RANDOM%%RANDOM%%RANDOM% >> .env.production
    echo FLASK_ENV=production >> .env.production
    echo FLASK_DEBUG=0 >> .env.production
    echo MAIL_USERNAME=your-email@gmail.com >> .env.production
    echo MAIL_PASSWORD=your-app-password >> .env.production
    echo ✓ File .env.production created
) else (
    echo ✓ File .env.production sudah ada
)

echo.
echo ============================================
echo ✓ Setup Selesai!
echo ============================================
echo.
echo Langkah Selanjutnya:
echo.
echo 1. Edit file .env.production:
echo    - Ganti MAIL_USERNAME dan MAIL_PASSWORD
echo    - Ubah SECRET_KEY jika diperlukan
echo.
echo 2. Jalankan aplikasi:
echo    run_production.bat
echo.
echo 3. Akses aplikasi di: http://localhost:8000
echo.
echo Untuk backup:
echo    backup_production.bat
echo.
echo ============================================
echo.

pause
