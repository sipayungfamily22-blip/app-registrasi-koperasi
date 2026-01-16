# 🎯 Diagram Setup Email per User

## 📍 Lokasi File Konfigurasi

```
Workspace: C:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\

├── .env.production ...................... ← FILE UTAMA (Setup Email Server)
│   ├── MAIL_USERNAME=agungdaniel11@gmail.com
│   ├── MAIL_PASSWORD=icanseeyou08
│   ├── MAIL_DEFAULT_SENDER=...
│   ├── APPROVAL1_EMAIL=...
│   ├── APPROVAL2_EMAIL=...
│   └── ADMIN_EMAIL=...
│
├── koperasi apps/
│   ├── app.py .......................... ← Code untuk kirim email
│   ├── config.py ....................... ← Baca config dari .env
│   ├── models.py ....................... ← Struktur User di database
│   └── instance/
│       └── koperasi.db ................. ← Database (Email User tersimpan)
│
└── templates/
    └── admin_users.html ................ ← Halaman tambah user (setup email user)
```

---

## 🔄 Alur Email dalam Sistem

```
┌─────────────────────────────────────────────────────────────┐
│                     SISTEM KOPERASI                         │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
                    ┌──────────────────┐
                    │  Ada Event       │
                    │  (Pendaftaran,   │
                    │   Approval, dll) │
                    └──────────────────┘
                              │
                              ▼
                    ┌──────────────────────────────┐
                    │  Buat Email Notifikasi       │
                    │  (Template HTML)             │
                    └──────────────────────────────┘
                              │
                              ▼
        ┌─────────────────────────────────────────┐
        │  Baca Konfigurasi dari .env.production  │
        │  ├─ MAIL_SERVER (smtp.gmail.com)        │
        │  ├─ MAIL_USERNAME (Email Pengirim)      │
        │  ├─ MAIL_PASSWORD (App Password)        │
        │  └─ MAIL_DEFAULT_SENDER                 │
        └─────────────────────────────────────────┘
                              │
                              ▼
        ┌─────────────────────────────────────────┐
        │  Kirim Email via SMTP Gmail             │
        │  (Menggunakan MAIL_USERNAME)            │
        └─────────────────────────────────────────┘
                              │
        ┌─────────┬─────────┬─────────────────────┐
        │         │         │                     │
        ▼         ▼         ▼                     ▼
    ┌────────────────────────────────┐      ┌──────────────┐
    │ Email Diterima di Inbox User   │      │ (Spam Folder)│
    │ ├─ approval1@gmail.com         │      └──────────────┘
    │ ├─ approval2@gmail.com         │
    │ ├─ admin@gmail.com             │
    │ └─ user@gmail.com              │
    └────────────────────────────────┘
                (Email User di Database)
```

---

## 🔧 Setup Email per User - STEP BY STEP

### **LANGKAH 1: Konfigurasi Email Server (Gmail Pengirim)**

File: `.env.production`

```env
# ====== MAIL CONFIGURATION ======
MAIL_SERVER=smtp.gmail.com              ← Tidak perlu ubah
MAIL_PORT=587                           ← Tidak perlu ubah
MAIL_USE_TLS=1                          ← Tidak perlu ubah

MAIL_USERNAME=agungdaniel11@gmail.com   ← ✏️ UBAH: Email Gmail Anda
MAIL_PASSWORD=icanseeyou08              ← ✏️ UBAH: App Password Gmail
MAIL_DEFAULT_SENDER=noreply@koperasi    ← ✏️ UBAH: Nama Pengirim Email
```

**Cara Dapatkan App Password:**
```
1. Buka: https://myaccount.google.com/
2. Klik: Security (Menu kiri)
3. Cari: "2-Step Verification" → Aktifkan
4. Kembali ke Security
5. Cari: "App passwords" → Klik
6. Pilih: Mail & Windows Computer
7. Copy: 16 karakter password
8. Paste ke MAIL_PASSWORD
```

---

### **LANGKAH 2: Setup Email Approval (Notifikasi Wajib)**

File: `.env.production`

```env
# ====== APPROVAL EMAILS ======
APPROVAL1_EMAIL=approval1@gmail.com     ← Email yang terima notif Approval 1
APPROVAL2_EMAIL=approval2@gmail.com     ← Email yang terima notif Approval 2
ADMIN_EMAIL=admin@gmail.com             ← Email yang terima notif Admin
```

**Atau langsung di:** `koperasi apps/config.py`

---

### **LANGKAH 3: Tambah User dengan Email Mereka**

Buka Admin Panel: `http://localhost:5000/admin/users`

```
Form Tambah User:
┌─────────────────────────────────┐
│ Email: approval1@gmail.com       │ ← Email yang akan menerima notifikasi
│ Role: Approval 1                 │ ← Pilih role mereka
│ [Tombol] Tambah User             │
└─────────────────────────────────┘

Hasil:
✓ User ditambahkan ke database
✓ Email welcome terkirim ke: approval1@gmail.com
✓ User dapat login dengan email & password dari email
✓ User akan menerima semua notifikasi ke email ini
```

---

### **LANGKAH 4: Verify di Database**

Database: `koperasi apps/instance/koperasi.db`

```
Tabel: user
┌──────┬──────────────────────┬────────────┐
│ id   │ email                │ role       │
├──────┼──────────────────────┼────────────┤
│ 1    │ approval1@gmail.com  │ approval1  │
│ 2    │ approval2@gmail.com  │ approval2  │
│ 3    │ admin@gmail.com      │ admin      │
│ 4    │ kasir@gmail.com      │ kasir      │
└──────┴──────────────────────┴────────────┘
       ↑
    Email yang akan terima notifikasi
```

---

## 📧 Contoh Email yang Dikirim

### Saat Tambah User Baru:

```
From: agungdaniel11@gmail.com (MAIL_USERNAME)
To: approval1@gmail.com (Email User)
Subject: Akun Baru - APPROVAL1 | Sistem Koperasi

Body:
───────────────────────────────────
Selamat Datang di Sistem Koperasi!

Email: approval1@gmail.com
Password: xY7kL9mN2pQ5
Role: APPROVAL1

Link Login: http://127.0.0.1:5000/login
───────────────────────────────────
```

---

## ✅ Checklist Setup Email

- [ ] Buka `.env.production`
- [ ] Ubah `MAIL_USERNAME` ke email Gmail Anda
- [ ] Generate App Password di Gmail
- [ ] Ubah `MAIL_PASSWORD` ke App Password
- [ ] Ubah `APPROVAL1_EMAIL` ke email penerima
- [ ] Ubah `APPROVAL2_EMAIL` ke email penerima
- [ ] Ubah `ADMIN_EMAIL` ke email penerima
- [ ] Restart aplikasi (Ctrl+C → python app.py)
- [ ] Test: Tambah user baru di `/admin/users`
- [ ] Cek: Email welcome diterima?
- [ ] ✓ Selesai!

---

## 🎯 Mapping Email

```
Email Server (.env.production)
    │
    └─→ MAIL_USERNAME = agungdaniel11@gmail.com
        (Gmail yang MENGIRIM email)

Email User (Database / /admin/users)
    │
    ├─→ approval1@gmail.com (Menerima notif Approval 1)
    ├─→ approval2@gmail.com (Menerima notif Approval 2)
    ├─→ admin@gmail.com (Menerima notif Admin)
    ├─→ kasir@gmail.com (Menerima notif Kasir)
    └─→ user@gmail.com (Menerima notif User)

Approval Email (.env.production - Optional)
    │
    ├─→ APPROVAL1_EMAIL = Email wajib terima notif Approval 1
    ├─→ APPROVAL2_EMAIL = Email wajib terima notif Approval 2
    └─→ ADMIN_EMAIL = Email wajib terima notif Admin
```

---

## 🚀 Quick Reference

**Ubah di mana?** → `.env.production`

```env
# Email Server (Pengirim)
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=app-password-gmail

# Email Approval (Penerima Notif)
APPROVAL1_EMAIL=approval1@gmail.com
APPROVAL2_EMAIL=approval2@gmail.com
ADMIN_EMAIL=admin@gmail.com
```

**Tambah User di mana?** → `/admin/users`
- Email yang diisi = Email penerima notifikasi user itu

**Test di mana?** → Email inbox user
- Cek apakah terima email welcome dan notifikasi

Selesai! 🎉
