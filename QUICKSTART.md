# 🚀 SETUP WAITRESS PRODUCTION - QUICK START

## ✅ File-file yang Sudah Dibuat

```
✓ wsgi.py                    - Entry point untuk Waitress
✓ config.py (Updated)        - Production configuration dengan .env support
✓ .env.production            - Environment variables (EDIT SEBELUM JALANKAN)
✓ requirements.txt (Updated) - Sudah termasuk waitress==2.1.2
✓ run_production.bat         - Script untuk menjalankan server
✓ backup_production.bat      - Script untuk backup database dan uploads
✓ setup_production.bat       - Script setup awal
✓ PRODUCTION_SETUP.md        - Dokumentasi lengkap
```

## 🎯 3 Langkah Setup Cepat

### Langkah 1: Edit .env.production
Buka file `.env.production` di root folder, ganti:
```env
SECRET_KEY=your-secure-random-key-change-this-in-production-min-32-chars

# Gmail Example:
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=your-16-digit-app-password
```

**Cara dapat App Password Gmail:**
1. Buka https://myaccount.google.com/security
2. Enable 2-Factor Authentication
3. Cari "App passwords" → pilih Mail, Windows Computer
4. Copy 16-digit password ke `.env.production`

### Langkah 2: Jalankan Setup
```bash
setup_production.bat
```
Ini akan membuat directories dan install dependencies.

### Langkah 3: Jalankan Server Production
```bash
run_production.bat
```

**Output yang benar:**
```
========================================
Aplikasi Koperasi - Production Server
========================================

Waitress Production Server dimulai...
Akses aplikasi di: http://localhost:8000

Untuk menghentikan: Tekan Ctrl+C
```

## 📊 Konfigurasi Waitress (di run_production.bat)

| Setting | Nilai | Untuk |
|---------|-------|-------|
| `--port=8000` | 8000 | Port aplikasi |
| `--threads=4` | 4 | Concurrent users (tingkat normal) |
| `--max-request-body-size` | 16MB | Max upload size |
| `--channel-timeout` | 120 detik | Connection timeout |

**Untuk traffic tinggi, ubah threads menjadi:**
```batch
--threads=8   (untuk ~50-100 users)
--threads=16  (untuk ~200+ users)
```

## 🔒 Security Checklist

Sebelum jalankan di production:
- [ ] `SECRET_KEY` di `.env.production` sudah di-generate random
- [ ] `MAIL_USERNAME` dan `MAIL_PASSWORD` sudah diset
- [ ] Database backup sudah dibuat: `backup_production.bat`
- [ ] Folder `logs/` sudah ada
- [ ] Folder `static/uploads/` sudah ada dengan semua subfolder

## 📁 Struktur Folder Production

```
aplikasi-formulir-pendaftaran/
├── koperasi apps/
│   ├── app.py
│   ├── wsgi.py ← BARU (Waitress entry point)
│   ├── config.py ← UPDATED
│   ├── models.py
│   ├── database.py
│   └── instance/
│       └── koperasi.db
├── templates/
├── static/
│   └── uploads/ ← CREATE FOLDER
├── logs/ ← CREATE FOLDER (untuk log files)
├── backups/ ← AUTO CREATED
├── .env.production ← EDIT INI
├── run_production.bat ← JALANKAN INI
├── backup_production.bat
├── setup_production.bat
└── requirements.txt ← UPDATED
```

## 🧪 Test Server

Setelah jalankan `run_production.bat`:

```bash
# Cek server running:
curl http://localhost:8000

# Di browser:
http://localhost:8000
```

Login dengan:
- Email: `approval1@example.com`
- Password: `password123`

## 🛑 Menghentikan Server

- **Dalam console:** Tekan `Ctrl+C`
- **PowerShell lain:** 
```bash
taskkill /IM python.exe /F
```

## 💾 Backup Database

Jalankan sebelum update atau maintenance:
```bash
backup_production.bat
```

Backup akan tersimpan di `backups/backup_YYYYMMDD_HHMMSS/`

## 📈 Monitor Logs

```bash
# View log file:
type logs\app.log

# Real-time monitoring (PowerShell):
Get-Content logs\app.log -Wait
```

## ❌ Troubleshooting

### Error: Port 8000 sudah digunakan
```bash
netstat -ano | findstr :8000
taskkill /PID <PID> /F
```

### Error: Permission Denied pada upload
```bash
icacls "static\uploads" /grant Everyone:F /T
```

### Error: Database locked
Hapus file lama:
```bash
del "koperasi apps\instance\koperasi.db"
```
Server akan auto-recreate database saat startup.

### Waitress tidak ditemukan
```bash
python -m pip install waitress
```

## 🌐 Setup HTTPS dengan Nginx (Optional)

Jika butuh SSL/TLS:

1. **Install Nginx di Windows**
2. **Konfigurasi reverse proxy** ke localhost:8000
3. **Install Let's Encrypt certificate** (gratis)

Lihat `PRODUCTION_SETUP.md` untuk detail lengkap.

## 📞 Support

Dokumentasi lengkap: `PRODUCTION_SETUP.md`

Versi Waitress yang digunakan: 2.1.2 (latest stable)

---

## ⚡ TL;DR

```bash
# 1. Edit .env.production (SECRET_KEY, EMAIL)
# 2. Jalankan setup
setup_production.bat

# 3. Jalankan server
run_production.bat

# 4. Akses di http://localhost:8000
```

✅ **Siap Production!**
