# 📚 INDEX - Dokumentasi Setup Email Gmail

## Anda Bertanya: "Dimana saya bisa setup email Gmail per user?"

---

## 📁 DOKUMENTASI TERSEDIA (Pilih Sesuai Kebutuhan)

### 1️⃣ **JAWABAN CEPAT** ⚡ (Baca ini dulu!)
**File:** `JAWABAN_EMAIL_SETUP.md`
- ✓ Jawaban singkat (3 menit)
- ✓ Langsung ke poin
- ✓ Cocok untuk yang sibuk

### 2️⃣ **LOKASI FILE** 📍 (Visual Reference)
**File:** `LOKASI_SETUP_EMAIL.md`
- ✓ Peta folder workspace
- ✓ Diagram alur email
- ✓ Step by step visual
- ✓ Checklist lokasi

### 3️⃣ **SETUP EMAIL LENGKAP** 📖 (Panduan Komprehensif)
**File:** `SETUP_EMAIL_LENGKAP.md`
- ✓ Penjelasan detail
- ✓ Perbandingan sistem
- ✓ Alur email lengkap
- ✓ FAQ & Troubleshooting

### 4️⃣ **FILE YANG DIDIT** 📂 (File-file yang Relevan)
**File:** `FILE_SETUP_EMAIL.md`
- ✓ Detail setiap file
- ✓ Path lengkap
- ✓ Apa yang diedit
- ✓ Highlight penting

### 5️⃣ **DIAGRAM EMAIL** 📊 (Visualisasi Alur)
**File:** `EMAIL_SETUP_DIAGRAM.md`
- ✓ Diagram alur email
- ✓ Mapping email
- ✓ Contoh real
- ✓ Checklist setup

### 6️⃣ **QUICKSTART** 🚀 (5 Menit Setup)
**File:** `QUICKSTART_USER_EMAIL.md`
- ✓ Setup tercepat
- ✓ Default users
- ✓ Quick links

---

## 🎯 MANA YANG HARUS DIBACA?

```
Anda ingin...                          Baca file...
════════════════════════════════════════════════════════
Tahu cepat di mana setup    →  JAWABAN_EMAIL_SETUP.md
Melihat lokasi file/folder  →  LOKASI_SETUP_EMAIL.md
Setup email lengkap         →  SETUP_EMAIL_LENGKAP.md
Tahu file apa saja diedit   →  FILE_SETUP_EMAIL.md
Melihat diagram alur        →  EMAIL_SETUP_DIAGRAM.md
Setup dalam 5 menit         →  QUICKSTART_USER_EMAIL.md
Kelola user baru            →  PANDUAN_EMAIL_USER.md
Upload dokter dari Excel    →  PANDUAN_UPLOAD_DOKTER.md
```

---

## ⚡ INSTANT ANSWER

### Q: "Dimana setup email Gmail per user?"

### A: Ada 2 tempat:

```
1. EMAIL SERVER (Mengirim email)
   File: .env.production
   Lokasi: C:\...\aplikasi formulir pendaftaran\.env.production
   
   MAIL_USERNAME=your-email@gmail.com
   MAIL_PASSWORD=app-password-gmail

2. EMAIL USER (Menerima email)
   Website: http://localhost:5000/admin/users
   
   Tambah User:
   - Email: approval1@gmail.com
   - Role: Approval 1
```

---

## 📌 STEP PALING CEPAT (3 MENIT)

### 1. Edit `.env.production`
```
MAIL_USERNAME=agungdaniel11@gmail.com → your-email@gmail.com
MAIL_PASSWORD=icanseeyou08 → app-password-gmail
```

### 2. Restart aplikasi
```
Ctrl+C → python app.py
```

### 3. Buka `/admin/users`
```
http://localhost:5000/admin/users

Tambah:
Email: approval1@gmail.com
Role: Approval 1
```

### ✓ Selesai!

---

## 🔗 LINK PENTING

| Aksi | Link |
|------|------|
| Edit Email Server | `.env.production` |
| Tambah User | `http://localhost:5000/admin/users` |
| Login Admin | `http://localhost:5000/login` |
| Database | `koperasi apps/instance/koperasi.db` |

---

## 📊 QUICK REFERENCE

### Email Server (1x, Global)
```
File: .env.production
Apa: Email Gmail untuk kirim notifikasi
Edit: 1 kali saja (setup awal)
```

### Email User (N times, Per User)
```
Website: /admin/users
Apa: Email setiap user untuk terima notifikasi
Edit: Setiap kali tambah user baru
```

---

## ✅ CHECKLIST

- [ ] Baca salah satu file dokumentasi
- [ ] Pahami perbedaan Email Server & Email User
- [ ] Edit `.env.production`
- [ ] Restart aplikasi
- [ ] Buka `/admin/users`
- [ ] Tambah user baru
- [ ] Cek email welcome
- [ ] Test login user baru
- ✓ Selesai!

---

## 🎓 PEMBELAJARAN

Dokumentasi ini menjelaskan:

✅ **Konsep:**
- Email Server vs Email User
- Konfigurasi SMTP Gmail
- App Password Gmail
- Database user

✅ **Praktik:**
- Edit `.env.production`
- Tambah user baru
- Kirim email otomatis
- Test notifikasi email

✅ **Troubleshooting:**
- Email tidak terkirim?
- User tidak bisa login?
- Password lupa?

---

## 📞 SUPPORT

Jika ada masalah, check:

1. **Email tidak terkirim?**
   → Baca: `SETUP_EMAIL_LENGKAP.md` (bagian FAQ)

2. **Tidak tahu file mana?**
   → Baca: `LOKASI_SETUP_EMAIL.md`

3. **Mau setup cepat?**
   → Baca: `JAWABAN_EMAIL_SETUP.md`

4. **Mau lihat diagram?**
   → Baca: `EMAIL_SETUP_DIAGRAM.md`

---

## 🎉 SELESAI!

Semua file dokumentasi sudah siap. Pilih salah satu sesuai kebutuhan Anda!

**Rekomendasi: Baca `JAWABAN_EMAIL_SETUP.md` dulu** ⚡

---

**Update Terakhir:** 16 Januari 2026
**Status:** ✅ Semua fitur siap digunakan
