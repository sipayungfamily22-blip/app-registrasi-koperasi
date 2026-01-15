# Setup Production Aplikasi Koperasi dengan Waitress

## 📋 Persyaratan
- Windows 10+
- Python 3.7+
- Virtual Environment sudah diaktivasi

## 🚀 Langkah Setup

### 1. Update Requirements.txt
```bash
pip install waitress
pip freeze > koperasi\ apps/requirements.txt
```

### 2. Konfigurasi Environment Production

Edit file `.env.production`:
```env
SECRET_KEY=generate-random-key-min-32-chars
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-app-specific-password
```

**Cara generate SECRET_KEY:**
```python
import secrets
print(secrets.token_hex(32))
```

### 3. Create Directories
```bash
mkdir logs
mkdir "static\uploads\ktp"
mkdir "static\uploads\pas_foto"
mkdir "static\uploads\id_karyawan"
mkdir "static\uploads\buku_tabungan"
```

### 4. Setup Database
```bash
cd "koperasi apps"
python -c "from app import app, db; app.app_context().push(); db.create_all(); print('Database created!')"
cd ..
```

### 5. Jalankan Production Server

**Opsi A: Menggunakan Batch Script (Recommended)**
```bash
run_production.bat
```

**Opsi B: Manual Command**
```bash
.venv\Scripts\activate
set FLASK_ENV=production
waitress-serve --port=8000 --threads=4 "koperasi apps.app:app"
```

## 📊 Konfigurasi Waitress

File: `run_production.bat`

| Parameter | Nilai | Penjelasan |
|-----------|-------|-----------|
| `--port=8000` | 8000 | Port aplikasi |
| `--threads=4` | 4 | Thread pool (tingkatkan jika traffic tinggi) |
| `--max-request-body-size` | 16777216 | Max upload size (16MB) |
| `--channel-timeout` | 120 | Connection timeout (detik) |

## 🔒 Security Checklist

- [ ] SECRET_KEY sudah di-generate dan random
- [ ] MAIL credentials sudah dikonfigurasi
- [ ] DATABASE backup sudah di-setup
- [ ] UPLOAD_FOLDER sudah punya write permission
- [ ] HTTPS/SSL akan disetup dengan Nginx (optional)
- [ ] Log files di-monitor

## 📁 File Structure Production

```
aplikasi-formulir-pendaftaran/
├── koperasi apps/
│   ├── app.py
│   ├── wsgi.py (BARU)
│   ├── config.py (UPDATED)
│   ├── models.py
│   ├── database.py
│   ├── requirements.txt
│   └── instance/
│       └── koperasi.db
├── templates/
├── static/
│   └── uploads/
├── logs/ (BARU)
├── .env.production (BARU)
├── run_production.bat (BARU)
├── PRODUCTION_SETUP.md (BARU)
└── .venv/
```

## 🔍 Monitoring & Logging

### Check Server Status
```bash
curl http://localhost:8000
```

### View Logs
```bash
type logs\app.log
```

### Monitor Performance
```bash
tasklist | find "python"
```

## 🛑 Menghentikan Server

- **Dalam Console:** Tekan `Ctrl+C`
- **PowerShell:** `Stop-Process -Name python -Force`

## 📈 Scaling (Tingkatkan Performance)

Ubah di `run_production.bat`:
- **threads=4** → **threads=8** (untuk traffic tinggi)
- **--backlog=10** (queue untuk pending requests)
- **--socket-timeout=60** (socket timeout)

## 🌐 Setup HTTPS dengan Nginx (Optional)

Jika butuh HTTPS dan domain:

1. Install Nginx di Windows
2. Setup reverse proxy ke localhost:8000
3. Configure SSL certificate (Let's Encrypt)

## 📞 Troubleshooting

**Error: Port 8000 already in use**
```bash
netstat -ano | findstr :8000
taskkill /PID <PID> /F
```

**Error: Permission Denied (Upload)**
```bash
icacls "static\uploads" /grant Everyone:F /T
```

**Database Locked**
```bash
del instance\koperasi.db
python -c "from app import app, db; app.app_context().push(); db.create_all()"
```

## 📝 Backup Strategy

### Auto Backup Script (backup_production.bat)
```batch
@echo off
setlocal enabledelayedexpansion

set BACKUP_DIR=backups
set TIMESTAMP=%date:~-4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set BACKUP_DIR=%BACKUP_DIR%\backup_%TIMESTAMP%

mkdir %BACKUP_DIR%

REM Backup database
copy instance\koperasi.db %BACKUP_DIR%\koperasi.db

REM Backup uploads
xcopy static\uploads %BACKUP_DIR%\uploads /E /I /Y

echo Backup selesai di: %BACKUP_DIR%
```

Jalankan sebelum update production.

## 🎯 Rekomendasi Production

1. **Gunakan Nginx** sebagai reverse proxy
2. **Setup SSL/HTTPS** untuk keamanan
3. **Backup otomatis** setiap hari
4. **Monitor logs** secara berkala
5. **Update dependencies** secara rutin
6. **Disable debug mode** (sudah di config.py)

---

**Status:** ✅ Production Ready
**Last Updated:** 2026-01-13
