# 🎯 JAWABAN: Dimana Setup Email Gmail per User?

**Pertanyaan:** "Dimana saya bisa setup email Gmail per user?"

---

## ✅ JAWABAN SINGKAT (1 Menit)

Ada **2 tempat**:

### 1️⃣ Email Server (Kirim Email)
📄 File: `.env.production`

```env
MAIL_USERNAME=your-email@gmail.com
MAIL_PASSWORD=app-password-gmail
```

### 2️⃣ Email User (Terima Email)
🌐 Website: `http://localhost:5000/admin/users`

```
Tambah User:
- Email: approval1@gmail.com (email mereka)
- Role: Approval 1
- Klik: Tambah User
```

---

## 🚀 SETUP TERCEPAT (3 Langkah)

### Step 1: Edit Email Server
```
File: .env.production
Ubah: MAIL_USERNAME ke email Gmail Anda
```

### Step 2: Restart
```
Ctrl+C → python app.py
```

### Step 3: Tambah User
```
URL: http://localhost:5000/admin/users
Email: approval1@gmail.com
Klik: Tambah User
```

✓ **Selesai!**

---

## 📖 DOKUMENTASI LENGKAP

Baca salah satu file ini untuk detail:

1. **INDEX_EMAIL_SETUP.md** ← Master guide
2. **JAWABAN_EMAIL_SETUP.md** ← Jawaban lengkap
3. **LOKASI_SETUP_EMAIL.md** ← Peta folder & lokasi
4. **SETUP_EMAIL_LENGKAP.md** ← Penjelasan detail
5. **FILE_SETUP_EMAIL.md** ← Daftar file
6. **EMAIL_SETUP_DIAGRAM.md** ← Diagram alur

---

## 💡 KEY POINTS

✓ **Email Server** = 1 email Gmail (untuk semua kirim)
✓ **Email User** = Banyak email (setiap user beda)
✓ **Auto Email** = Notifikasi otomatis ke setiap user

---

## 🎯 NEXT STEPS

1. Buka file `INDEX_EMAIL_SETUP.md` untuk pilihan dokumentasi
2. Atau langsung implementasi 3 langkah di atas
3. Test dengan tambah user baru

Selesai! 🎉
