# RINGKASAN FITUR MANAJEMEN USER & EMAIL

## ✅ Yang Sudah Ditambahkan

### 1. **Halaman Kelola User untuk Admin**
   - Route: `/admin/users`
   - Akses: Hanya admin yang dapat akses
   - Fitur:
     - ✓ Tambah user baru dengan email asli
     - ✓ Pilih role (user, approval1, approval2, admin, kasir)
     - ✓ Password auto-generate dan kirim via email
     - ✓ Reset password user
     - ✓ Hapus user

### 2. **Email Otomatis**
   - Saat user baru ditambah:
     - ✓ Kirim email welcome dengan credentials
     - ✓ Instruksi untuk ubah password
   
   - Saat reset password:
     - ✓ Kirim email dengan password baru
     - ✓ Notifikasi ke user

### 3. **Konfigurasi Email Gmail**
   - File: `.env.production`
   - Setting sudah ada:
     ```
     MAIL_USERNAME=agungdaniel11@gmail.com
     MAIL_PASSWORD=icanseeyou08
     ```

---

## 🔧 Cara Menggunakan

### **Step 1: Setup Email Gmail Anda (SATU KALI)**

1. **Enable 2-Step Verification di Google Account:**
   - https://myaccount.google.com/
   - Klik Security → 2-Step Verification
   - Ikuti langkah-langkahnya

2. **Generate App Password:**
   - Kembali ke Security
   - Cari "App passwords"
   - Pilih Mail & Windows Computer
   - Copy 16 karakter password yang digenerate

3. **Update .env.production:**
   - Buka file: `.env.production`
   - Update:
     ```
     MAIL_USERNAME=your-email@gmail.com
     MAIL_PASSWORD=xxxx xxxx xxxx xxxx
     MAIL_DEFAULT_SENDER=your-email@gmail.com
     ```

4. **Update Approval Emails:**
   ```
   APPROVAL1_EMAIL=approval1@gmail.com
   APPROVAL2_EMAIL=approval2@gmail.com
   ADMIN_EMAIL=admin@gmail.com
   ```

### **Step 2: Tambah User Baru di Aplikasi**

1. **Login sebagai Admin**
   - Email: admin@example.com
   - Password: password123 (atau sesuai database)

2. **Buka Menu Admin → Kelola User**
   - URL: `http://localhost:5000/admin/users`

3. **Isi Form Tambah User:**
   - Email: `approval1@gmail.com` (gunakan email asli)
   - Role: `Approval 1`
   - Klik "Tambah User"

4. **Email Otomatis Terkirim:**
   - User akan terima email welcome dengan password sementara
   - User bisa langsung login dengan credentials tersebut
   - User diminta ubah password saat login pertama

### **Step 3: Testing**

Coba login dengan user baru:
- Email: approval1@gmail.com
- Password: (lihat di email yang diterima)
- Ubah password saat diminta

---

## 📧 Format Email yang Dikirim

### **Email Welcome (Saat User Baru Ditambah):**
```
Subject: Akun Baru - APPROVAL1 | Sistem Koperasi

Isi:
- Email
- Password Sementara (auto-generate)
- Role/Jabatan
- Link untuk login
- Instruksi untuk ubah password
```

### **Email Reset Password:**
```
Subject: Reset Password - Sistem Koperasi

Isi:
- Password Baru
- Link untuk login
- Instruksi untuk ubah password
```

---

## ⚙️ Troubleshooting

### **Email tidak terkirim?**

1. **Cek konfigurasi .env.production:**
   ```
   MAIL_USERNAME=correct@gmail.com
   MAIL_PASSWORD=correct-app-password
   ```

2. **Restart aplikasi:**
   ```
   Ctrl+C untuk stop, lalu jalankan ulang
   ```

3. **Check error log:**
   - Buka browser console (F12)
   - Cek network tab

4. **Cek App Password Gmail:**
   - Pastikan sudah generate App Password (bukan password biasa)
   - Pastikan format benar (16 karakter dengan spasi)

### **User tidak bisa login?**

1. Cek email yang diterima (cek spam folder)
2. Pastikan password benar (copy-paste dari email)
3. Email harus sesuai yang didaftarkan
4. Coba reset password via admin

---

## 🔐 Security Notes

⚠️ **PENTING:**
- Jangan hardcode email/password di kode
- Selalu gunakan .env.production
- Jangan share app password Gmail
- Ubah SECRET_KEY di production
- Enable 2FA di email Gmail

---

## 📝 User Roles Penjelasan

| Role | Deskripsi | Akses |
|------|-----------|-------|
| **user** | Calon anggota biasa | Dashboard dasar |
| **approval1** | Approval tahap 1 | Review pendaftaran tahap 1 |
| **approval2** | Approval tahap 2 | Review pendaftaran tahap 2 |
| **kasir** | Kasir koperasi | Kelola kupon dokter |
| **admin** | Administrator | Semua akses + Kelola user |

---

## ✨ Next Steps

1. Setup email Gmail Anda
2. Update .env.production dengan email asli
3. Restart aplikasi
4. Login sebagai admin → Tambah user baru
5. Test email dengan menambah user
6. Ubah approval emails ke email asli yang ingin terima notifikasi

Semuanya sudah siap! Tinggal konfigurasi email Anda aja 🚀
