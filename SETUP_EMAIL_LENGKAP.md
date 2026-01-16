# Setup Email Gmail untuk Sistem Koperasi

## 📍 Lokasi Konfigurasi Email

Ada 2 tempat untuk setup email:

---

## 1️⃣ EMAIL SERVER (Untuk Mengirim Email)
**File:** `.env.production`  
**Lokasi:** `c:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\.env.production`

### Apa itu Email Server?
Email Server adalah Gmail account yang digunakan **sistem untuk mengirim email** ke semua user.

### Konfigurasi:
```env
# Email Server (Email yang mengirim notifikasi)
MAIL_SERVER=smtp.gmail.com
MAIL_PORT=587
MAIL_USE_TLS=1
MAIL_USERNAME=agungdaniel11@gmail.com        ← Email Gmail Anda
MAIL_PASSWORD=icanseeyou08                    ← App Password Gmail
MAIL_DEFAULT_SENDER=noreply@koperasi.local    ← Nama pengirim
```

### Cara Setup:

**Step 1: Buka File .env.production**
```
Lokasi: C:\Users\agung.daniel\Project PBO\aplikasi formulir pendaftaran\.env.production
```

**Step 2: Update Email Server Gmail Anda**
```env
MAIL_USERNAME=your-email@gmail.com
```

**Step 3: Generate App Password Gmail**
1. Buka https://myaccount.google.com/
2. Klik Security
3. Enable 2-Step Verification (jika belum)
4. Klik "App passwords"
5. Pilih "Mail" dan "Windows Computer"
6. Copy 16 karakter password

**Step 4: Isi App Password**
```env
MAIL_PASSWORD=xxxx xxxx xxxx xxxx
```

**Step 5: Ubah Pengirim Email (Opsional)**
```env
MAIL_DEFAULT_SENDER=your-email@gmail.com
```

---

## 2️⃣ EMAIL USER (Untuk Menerima Email)
**File:** Database (Otomatis dari Email User)  
**Lokasi:** Setiap user memiliki email mereka sendiri

### Bagaimana Email User Bekerja?

```
Sistem Koperasi
│
├─ Email Server (MAIL_USERNAME)
│  └─ Digunakan untuk MENGIRIM email
│
└─ User Emails (Database)
   ├─ approval1@gmail.com     ← Menerima notifikasi Approval 1
   ├─ approval2@gmail.com     ← Menerima notifikasi Approval 2
   ├─ admin@gmail.com         ← Menerima notifikasi Admin
   ├─ kasir@gmail.com         ← Menerima notifikasi Kasir
   └─ user@gmail.com          ← Menerima notifikasi User
```

### Setiap User Menerima Email ke:
- **Email mereka saat login** (yang terdaftar di database)
- Contoh: Jika user login dengan `approval1@gmail.com`, notifikasi akan ke email itu

---

## 3️⃣ APPROVAL EMAILS (Opsional)
**File:** `.env.production` atau `config.py`

### Approval Emails adalah Email untuk:
- Email yang WAJIB menerima notifikasi tertentu
- Bukan email user individual

### Konfigurasi:
```env
# Email yang WAJIB terima notifikasi
APPROVAL1_EMAIL=approval1@gmail.com    ← Email wajib terima notifikasi Approval 1
APPROVAL2_EMAIL=approval2@gmail.com    ← Email wajib terima notifikasi Approval 2
ADMIN_EMAIL=admin@gmail.com            ← Email wajib terima notifikasi Admin
```

---

## 📊 Perbandingan

| Jenis | Lokasi | Fungsi | Contoh |
|------|--------|--------|---------|
| **Email Server** | `.env.production` | Mengirim email | `agungdaniel11@gmail.com` |
| **Email User** | Database | Menerima email | `approval1@gmail.com` |
| **Approval Email** | `.env.production` | Email wajib terima notif | `approval1@gmail.com` |

---

## ⚡ Alur Email dalam Sistem

### Saat Pendaftaran Baru:
```
User Submit Form
    ↓
Sistem Koperasi
    ↓
Kirim Email via Email Server (MAIL_USERNAME)
    ↓
Email Approval 1
    ├─ Ke: APPROVAL1_EMAIL
    └─ Dari: MAIL_DEFAULT_SENDER (agungdaniel11@gmail.com)
    
Email Admin
    ├─ Ke: ADMIN_EMAIL
    └─ Dari: MAIL_DEFAULT_SENDER
    
Email Calon Anggota
    ├─ Ke: Email yang daftar (alamat_email)
    └─ Dari: MAIL_DEFAULT_SENDER
```

---

## 🔧 Setup Lengkap (Step by Step)

### **STEP 1: Setup Email Server Gmail Anda**

1. Buka: `.env.production`
2. Ubah:
   ```env
   MAIL_USERNAME=your-email@gmail.com
   MAIL_PASSWORD=your-app-password
   MAIL_DEFAULT_SENDER=your-email@gmail.com
   ```

### **STEP 2: Update Approval Emails (Opsional)**

1. Edit `.env.production`:
   ```env
   APPROVAL1_EMAIL=approval1@gmail.com
   APPROVAL2_EMAIL=approval2@gmail.com
   ADMIN_EMAIL=admin@gmail.com
   ```

### **STEP 3: Add Users dengan Email Asli**

1. Login Admin: http://localhost:5000/admin/users
2. Tambah User:
   - Email: `approval1@gmail.com`
   - Role: `Approval 1`
   - Klik "Tambah User"
3. User akan terima email welcome

### **STEP 4: Restart Aplikasi**
```
Ctrl+C
python app.py
```

---

## ✅ Testing

### Test 1: Email Server Berfungsi
1. Tambah user baru
2. User akan terima email welcome
3. Cek inbox (atau spam folder)

### Test 2: Email User Menerima Notifikasi
1. Login sebagai user biasa
2. Submit pendaftaran
3. Email approval1/admin akan terima notifikasi
4. Email user akan terima konfirmasi

---

## 🎯 Summary

**Untuk setup email per user:**

1. **Email Server** = Edit `.env.production`
   ```
   MAIL_USERNAME = Gmail Anda (untuk mengirim)
   MAIL_PASSWORD = App Password Gmail
   ```

2. **Email User** = Saat tambah user di `/admin/users`
   ```
   Masukkan email user yang ingin menerima notifikasi
   ```

3. **Approval Email** = Edit `.env.production` (opsional)
   ```
   APPROVAL1_EMAIL = Email approval 1
   APPROVAL2_EMAIL = Email approval 2
   ADMIN_EMAIL = Email admin
   ```

**Restart aplikasi** dan semuanya sudah siap! 🚀

---

## ❓ FAQ

**Q: Bisakah setiap user punya email server sendiri?**  
A: Tidak perlu. Email server adalah gmail yang sama untuk semua mengirim. Setiap user punya email untuk menerima notifikasi.

**Q: Dimana email yang diterima user?**  
A: Di email mereka saat login (yang terdaftar di `/admin/users`)

**Q: Bisa pakai email bukan Gmail?**  
A: Bisa, ubah `MAIL_SERVER` ke SMTP email provider lain (Outlook, Yahoo, dll)

**Q: Password benar tapi email tidak terkirim?**  
A: Cek:
1. 2FA sudah enable di Gmail?
2. Pakai App Password, bukan password biasa?
3. Restart aplikasi?
4. Check firewall/antivirus?
