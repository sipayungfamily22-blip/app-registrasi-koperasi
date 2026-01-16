# QUICK START - Kelola User & Email

## 🚀 Setup Email (5 Menit)

### 1. Buka Google Account
https://myaccount.google.com/ → Login

### 2. Enable 2-Step Verification
- Security → 2-Step Verification → Ikuti langkah

### 3. Generate App Password
- Security → App passwords
- Pilih "Mail" dan "Windows Computer"
- Copy password 16 karakter

### 4. Update .env.production
```
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=xxxx xxxx xxxx xxxx
MAIL_DEFAULT_SENDER=your-email@gmail.com

APPROVAL1_EMAIL=approval1@gmail.com
APPROVAL2_EMAIL=approval2@gmail.com
ADMIN_EMAIL=admin@gmail.com
```

### 5. Restart Aplikasi
```
Ctrl+C → python app.py
```

---

## ✅ Tambah User Baru

1. **Login sebagai Admin**
   - http://localhost:5000/login
   - Email: admin@example.com
   - Password: password123

2. **Klik Menu: Kelola User**
   - URL: http://localhost:5000/admin/users

3. **Isi Form:**
   - Email: `approval1@gmail.com` (email asli)
   - Role: `Approval 1` (atau sesuai kebutuhan)
   - Klik "Tambah User"

4. **Email Otomatis Terkirim**
   - User dapat login dengan credentials dari email
   - User diminta ubah password saat login pertama

---

## 📊 Default Users (Sebelum Ubah)

| Email | Password | Role |
|-------|----------|------|
| approval1@example.com | password123 | Approval 1 |
| approval2@example.com | password123 | Approval 2 |
| admin@example.com | password123 | Admin |
| kasir@example.com | password123 | Kasir |

> ⚠️ Ganti semua email ke email asli yang ingin terima notifikasi

---

## 💡 Tips

✅ **Rekomendasi Struktur User:**
- 1 Admin (Anda)
- 1-2 Approval 1 (HR/Personalia)
- 1-2 Approval 2 (Direksi/Pimpinan)
- 1 Kasir (Bagian Kasir)

✅ **Email untuk Notifikasi:**
- Gunakan email kantor/pribadi asli
- Pastikan bisa akses email untuk lihat notifikasi
- Enable Gmail App Password untuk security

✅ **Password Management:**
- User auto-generate password saat ditambah
- User bisa reset di "Ubah Password"
- Admin bisa reset di "Kelola User"

---

## 🔗 Links Penting

- Admin Dashboard: http://localhost:5000/admin/users
- Change Password: http://localhost:5000/change-password
- Documentation: SETUP_USER_EMAIL.md
- Gmail Account: https://myaccount.google.com/

Selesai! 🎉
