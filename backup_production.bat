@echo off
REM Script untuk backup database dan uploads production

setlocal enabledelayedexpansion

REM Set working directory
cd /d "%~dp0"

REM Generate timestamp
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)

set BACKUP_DIR=backups\backup_%mydate%_%mytime%

REM Create backup directory
mkdir "%BACKUP_DIR%"

echo.
echo ========================================
echo Database & Uploads Backup
echo ========================================
echo.
echo Backup location: %BACKUP_DIR%
echo.

REM Backup database
echo Backing up database...
if exist "koperasi apps\instance\koperasi.db" (
    copy "koperasi apps\instance\koperasi.db" "%BACKUP_DIR%\koperasi.db"
    echo ✓ Database backup selesai
) else (
    echo ✗ Database tidak ditemukan
)

REM Backup uploads
echo Backing up uploads...
if exist "static\uploads" (
    xcopy "static\uploads" "%BACKUP_DIR%\uploads" /E /I /Y > nul
    echo ✓ Uploads backup selesai
) else (
    echo ✗ Uploads folder tidak ditemukan
)

REM Backup configuration files
echo Backing up configuration...
copy ".env.production" "%BACKUP_DIR%\.env.production" > nul 2>&1
copy "koperasi apps\config.py" "%BACKUP_DIR%\config.py" > nul 2>&1
echo ✓ Configuration backup selesai

echo.
echo ========================================
echo Backup Selesai!
echo Total backup folders: 
dir /ad /b backups 2>nul | find /c "backup_"
echo ========================================
echo.

pause
