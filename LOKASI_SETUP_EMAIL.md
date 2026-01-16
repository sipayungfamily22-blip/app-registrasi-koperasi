# 🎯 LOKASI SETUP EMAIL - VISUAL REFERENCE

## PETA LENGKAP SETUP EMAIL

```
📦 WORKSPACE FOLDER
│
├─ 📄 .env.production ◄────── EMAIL SERVER SETUP (Edit di sini #1)
│   │
│   ├─ MAIL_USERNAME=agungdaniel11@gmail.com
│   ├─ MAIL_PASSWORD=icanseeyou08
│   ├─ MAIL_DEFAULT_SENDER=...
│   ├─ APPROVAL1_EMAIL=approval1@gmail.com
│   ├─ APPROVAL2_EMAIL=approval2@gmail.com
│   └─ ADMIN_EMAIL=admin@gmail.com
│
├─ 📁 koperasi apps/
│   │
│   ├─ 📄 app.py (Jangan edit)
│   ├─ 📄 config.py (Jangan edit)
│   │
│   └─ 📁 instance/
│       └─ 📄 koperasi.db ◄── DATABASE (Simpan email user)
│           │
│           └─ 📊 Tabel: user
│               ├─ email: approval1@gmail.com
│               ├─ email: approval2@gmail.com
│               └─ email: admin@gmail.com
│
├─ 📁 templates/
│   └─ 📄 admin_users.html ◄── FORM TAMBAH USER (Edit di sini #2)
│       │
│       ├─ [Field] Email
│       ├─ [Field] Role
│       └─ [Button] Tambah User
│
└─ 🌐 WEBSITE
    │
    └─ http://localhost:5000/admin/users ◄── HALAMAN TAMBAH USER
        │
        ├─ Tambah User Baru (Edit di sini #2)
        │   ├─ Email: approval1@gmail.com
        │   ├─ Role: Approval 1
        │   └─ [Klik] Tambah User
        │
        └─ Daftar User (Hasil)
            ├─ approval1@gmail.com (ROLE: APPROVAL1)
            ├─ approval2@gmail.com (ROLE: APPROVAL2)
            └─ admin@gmail.com (ROLE: ADMIN)
```

---

## 🔴 YANG PERLU DIEDIT

### ✏️ EDIT #1: Email Server
```
FILE: .env.production
PATH: C:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\.env.production

BUKA & UBAH:
┌─────────────────────────────────────────────────────┐
│ MAIL_USERNAME=agungdaniel11@gmail.com              │ ← UBAH
│ MAIL_PASSWORD=icanseeyou08                         │ ← UBAH
│ MAIL_DEFAULT_SENDER=noreply@koperasi.local        │ ← UBAH
│                                                    │
│ APPROVAL1_EMAIL=approval1@example.com             │ ← UBAH
│ APPROVAL2_EMAIL=approval2@example.com             │ ← UBAH
│ ADMIN_EMAIL=admin@example.com                     │ ← UBAH
└─────────────────────────────────────────────────────┘
```

### ✏️ EDIT #2: Email User (via Website)
```
URL: http://localhost:5000/admin/users

BUKA & ISIISI:
┌────────────────────────────────────────┐
│ Email: approval1@gmail.com             │ ← INPUT USER EMAIL
│ Role: [Approval 1]                     │ ← PILIH ROLE
│ [TOMBOL] Tambah User                   │ ← KLIK
└────────────────────────────────────────┘

HASIL:
✓ User ditambahkan ke database
✓ Email welcome terkirim
✓ User bisa login & terima notifikasi
```

---

## 📊 ALUR DATA EMAIL

```
┌──────────────────────────────────────────────────────────┐
│          SEBELUM SETUP                                  │
├──────────────────────────────────────────────────────────┤
│ Email belum konfigurasi                                 │
│ Tidak ada user                                          │
│ Sistem tidak bisa kirim email                           │
└──────────────────────────────────────────────────────────┘
                          │
                          │ SETUP EMAIL SERVER
                          ▼
┌──────────────────────────────────────────────────────────┐
│ .env.production                                         │
│ ├─ MAIL_USERNAME ✓ Sudah                               │
│ ├─ MAIL_PASSWORD ✓ Sudah                               │
│ └─ Sistem siap mengirim email                          │
└──────────────────────────────────────────────────────────┘
                          │
                          │ SETUP USER EMAIL
                          ▼
┌──────────────────────────────────────────────────────────┐
│ /admin/users                                            │
│ ├─ Tambah: approval1@gmail.com                          │
│ ├─ Tambah: approval2@gmail.com                          │
│ └─ Tambah: admin@gmail.com                              │
└──────────────────────────────────────────────────────────┘
                          │
                          │ EMAIL TERKIRIM
                          ▼
┌──────────────────────────────────────────────────────────┐
│ Gmail Inbox                                             │
│ ├─ approval1@gmail.com ← TERIMA Email Welcome          │
│ ├─ approval2@gmail.com ← TERIMA Email Welcome          │
│ ├─ admin@gmail.com ← TERIMA Email Welcome              │
│ ├─ approval1@gmail.com ← TERIMA Notif Pendaftaran      │
│ ├─ approval2@gmail.com ← TERIMA Notif Approval 1       │
│ ├─ admin@gmail.com ← TERIMA Notif All                  │
│ ├─ user@gmail.com ← TERIMA Notif Pendaftaran Diterima  │
│ └─ ... (lebih banyak notifikasi)                       │
└──────────────────────────────────────────────────────────┘
```

---

## 🎯 STEP BY STEP VISUAL

```
STEP 1: EDIT .env.production
┌─────────────────────────────────────────┐
│ Open: .env.production                   │
│ Find: MAIL_USERNAME                     │
│ Old: agungdaniel11@gmail.com           │
│ New: your-email@gmail.com              │ ← UBAH
│ Save: Ctrl+S                            │
│ Close: Aplikasi                         │
└─────────────────────────────────────────┘
           │
           │ Restart
           ▼
STEP 2: RESTART APLIKASI
┌─────────────────────────────────────────┐
│ Terminal:                               │
│ Ctrl+C (stop jalan)                    │
│ python app.py                           │
│ ✓ Running on http://127.0.0.1:5000     │
└─────────────────────────────────────────┘
           │
           │ Buka Browser
           ▼
STEP 3: BUKA /admin/users
┌─────────────────────────────────────────┐
│ URL: http://localhost:5000/admin/users │
│ Login: admin@example.com                │
│ Password: password123                   │
│ ✓ Login OK                              │
└─────────────────────────────────────────┘
           │
           │ Form ada
           ▼
STEP 4: TAMBAH USER BARU
┌─────────────────────────────────────────┐
│ [Form] Tambah User Baru                 │
│ Email: approval1@gmail.com              │
│ Role: Approval 1                        │
│ [Klik] Tambah User                      │
│ ✓ Success!                              │
└─────────────────────────────────────────┘
           │
           │ Email terkirim
           ▼
STEP 5: CEK EMAIL
┌─────────────────────────────────────────┐
│ approval1@gmail.com                     │
│ ├─ Subject: Akun Baru - APPROVAL1      │
│ ├─ From: agungdaniel11@gmail.com       │
│ ├─ Password: xY7kL9mN2pQ5              │
│ └─ [Link] Login ke Sistem              │
│ ✓ Email Diterima!                       │
└─────────────────────────────────────────┘
           │
           │ Bisa Login
           ▼
STEP 6: USER BISA LOGIN
┌─────────────────────────────────────────┐
│ URL: http://localhost:5000/login       │
│ Email: approval1@gmail.com              │
│ Password: xY7kL9mN2pQ5                  │
│ ✓ Login Berhasil!                       │
│ (User diminta ubah password)            │
└─────────────────────────────────────────┘
```

---

## 📋 SUMMARY TABLE

```
┌──────────────┬──────────────────┬──────────────┬──────────┐
│ Komponen     │ File/URL          │ Edit?        │ Kapan?   │
├──────────────┼──────────────────┼──────────────┼──────────┤
│ Email Server │ .env.production  │ ✅ YA        │ 1x setup │
│ Email User   │ /admin/users     │ ✅ YA        │ Per user │
│ Config       │ config.py        │ ❌ TIDAK     │ -        │
│ Logic        │ app.py           │ ❌ TIDAK     │ -        │
│ Database     │ koperasi.db      │ ❌ TIDAK     │ -        │
│ Template     │ admin_users.html │ ❌ TIDAK     │ -        │
└──────────────┴──────────────────┴──────────────┴──────────┘
```

---

## ✅ CHECKLIST LOKASI

- [ ] Tahu di mana `.env.production`?
  → `C:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\.env.production`

- [ ] Tahu di mana tambah user?
  → `http://localhost:5000/admin/users`

- [ ] Tahu di mana database?
  → `C:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\koperasi apps\instance\koperasi.db`

- [ ] Tahu di mana login?
  → `http://localhost:5000/login`

- [ ] Tahu di mana ubah password?
  → `http://localhost:5000/change-password`

---

## 🚀 FINAL ANSWER

**Dimana setup email Gmail per user?**

1. **Email Server** (Global):
   📄 `.env.production` (1x, untuk semua)

2. **Email User** (Per User):
   🌐 `http://localhost:5000/admin/users` (N times, beda per user)

**Selesai!** 🎉

---

**File lainnya untuk referensi:**
- `JAWABAN_EMAIL_SETUP.md` - Jawaban singkat
- `FILE_SETUP_EMAIL.md` - Detail file
- `SETUP_EMAIL_LENGKAP.md` - Penjelasan lengkap
- `EMAIL_SETUP_DIAGRAM.md` - Diagram alur
