# 📂 File-File untuk Setup Email per User

## 1️⃣ FILE UTAMA - Konfigurasi Email Server

**Path:** `c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\.env.production`

**Edit bagian ini:**
```env
# Line 11-16: MAIL CONFIGURATION
MAIL_SERVER=smtp.gmail.com
MAIL_PORT=587
MAIL_USE_TLS=1
MAIL_USERNAME=agungdaniel11@gmail.com        ← UBAH KE EMAIL ANDA
MAIL_PASSWORD=icanseeyou08                    ← UBAH KE APP PASSWORD
MAIL_DEFAULT_SENDER=noreply@koperasi.local    ← UBAH NAMA PENGIRIM
```

**Langkah:**
1. Buka file `.env.production` dengan text editor
2. Ubah MAIL_USERNAME ke email Gmail Anda
3. Ubah MAIL_PASSWORD ke app password (dapatkan dari myaccount.google.com)
4. Simpan file
5. Restart aplikasi

---

## 2️⃣ FILE KONFIGURASI ALTERNATIF - Config.py

**Path:** `c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\koperasi apps\config.py`

**Edit bagian ini (jika ingin hardcode):**
```python
# Line 17-24: Email configuration
MAIL_SERVER = 'smtp.gmail.com'
MAIL_PORT = 587
MAIL_USE_TLS = True
MAIL_USERNAME = 'agungdaniel11@gmail.com'    ← UBAH KE EMAIL ANDA
MAIL_PASSWORD = 'icanseeyou08'                ← UBAH KE APP PASSWORD
MAIL_DEFAULT_SENDER = 'your-email@gmail.com'  ← UBAH KE EMAIL ANDA

# Line 26-28: Approval emails
APPROVAL1_EMAIL = 'approval1@example.com'     ← UBAH KE EMAIL USER
APPROVAL2_EMAIL = 'approval2@example.com'     ← UBAH KE EMAIL USER
ADMIN_EMAIL = 'admin@example.com'             ← UBAH KE EMAIL USER
```

⚠️ **CATATAN:** `.env.production` lebih aman daripada config.py

---

## 3️⃣ FILE UNTUK TAMBAH USER - admin_users.html

**Path:** `c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\templates\admin_users.html`

**Halaman:** `http://localhost:5000/admin/users`

**Fungsi:** Di sini Anda menambahkan user dengan email mereka

**Form yang ada:**
```
Email: [input field] ← Email yang akan menerima notifikasi
Role: [dropdown]    ← Pilih role user
[Tombol] Tambah User
```

**Contoh:**
```
Email: approval1@gmail.com
Role: Approval 1
→ User akan terima email welcome ke approval1@gmail.com
→ Approval1 akan terima semua notifikasi ke email ini
```

---

## 4️⃣ FILE UNTUK LOGIKA EMAIL - app.py

**Path:** `c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\koperasi apps\app.py`

**Fungsi:** Code untuk mengirim email

**Bagian penting:**
- Line 46-62: Fungsi `send_email()`
- Line 1635+: Route `/admin/users` untuk tambah user

**Tidak perlu diedit**, sudah siap pakai.

---

## 5️⃣ DATABASE - Tempat Email User Disimpan

**Path:** `c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\koperasi apps\instance\koperasi.db`

**Tabel:** `user`

**Kolom penting:**
- `email` - Email user (akan menerima notifikasi)
- `role` - Role user (approval1, approval2, admin, dll)

**Cara melihat:**
1. Install SQLite Browser
2. Buka file `.db` tersebut
3. Lihat tabel `user`

---

## 📋 SUMMARY - File yang Perlu Diedit

| File | Lokasi | Apa | Edit? |
|------|--------|-----|-------|
| `.env.production` | Root folder | Email Server Gmail | ✅ YA |
| `config.py` | koperasi apps/ | Config alternatif | ❌ Tidak perlu (gunakan .env) |
| `admin_users.html` | templates/ | Halaman tambah user | ❌ Tidak perlu |
| `app.py` | koperasi apps/ | Logic email | ❌ Tidak perlu |
| `koperasi.db` | koperasi apps/instance/ | Database user | Hanya lihat |

---

## 🚀 SETUP CEPAT

### **HANYA EDIT 1 FILE: `.env.production`**

```env
# SEBELUM:
MAIL_USERNAME=agungdaniel11@gmail.com
MAIL_PASSWORD=icanseeyou08

# SESUDAH:
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=xxxx xxxx xxxx xxxx
```

---

## ✅ AFTER SETUP

### 1. Restart Aplikasi
```powershell
cd c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\koperasi apps
Ctrl+C (hentikan yang jalan)
python app.py
```

### 2. Buka Admin Users
```
http://localhost:5000/admin/users
```

### 3. Tambah User Baru
```
Email: approval1@gmail.com
Role: Approval 1
→ Klik "Tambah User"
```

### 4. Cek Email
```
Email akan terkirim ke: approval1@gmail.com
Cek inbox untuk welcome email
```

### 5. Test Login
```
Email: approval1@gmail.com
Password: (dari email yang diterima)
```

---

## 🔗 FILE LINKS

Buka file dengan teks editor (Notepad++ atau VS Code):

**Email Server:**
- `c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\.env.production`

**Tambah User:**
- Browser: `http://localhost:5000/admin/users`

**Lihat Database:**
- `c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\koperasi apps\instance\koperasi.db`

---

## 💡 TIPS

✅ Gunakan `.env.production` untuk email server
✅ Gunakan `/admin/users` untuk tambah user dengan email mereka
✅ Setiap user email = email yang terima notifikasi
✅ Email server adalah yang sama untuk semua (tidak per user)
✅ Restart aplikasi setelah ubah `.env.production`

❌ Jangan share app password Gmail
❌ Jangan pakai password biasa Gmail
❌ Jangan hardcode password di code
❌ Jangan ubah code tanpa tahu apa yang dilakukan

Selesai! 🎉
