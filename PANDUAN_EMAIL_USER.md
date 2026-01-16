# Panduan Setup Email Gmail dan Manajemen User

## 1. Setup Email Gmail

### Langkah-Langkah Generate App Password Gmail:

1. **Buka Google Account Anda**
   - Kunjungi: https://myaccount.google.com/
   - Login dengan email Anda

2. **Aktifkan 2-Step Verification**
   - Klik "Security" di menu sebelah kiri
   - Cari "2-Step Verification"
   - Ikuti proses untuk mengaktifkannya

3. **Generate App Password**
   - Kembali ke Security
   - Cari "App passwords" (hanya muncul jika 2FA aktif)
   - Pilih "Mail" dan "Windows Computer"
   - Google akan generate 16 karakter password
   - Copy password ini

4. **Update File .env.production**
   ```
   MAIL_USERNAME=your-email@gmail.com
   MAIL_PASSWORD=xxxx xxxx xxxx xxxx
   MAIL_DEFAULT_SENDER=your-email@gmail.com
   MAIL_SERVER=smtp.gmail.com
   MAIL_PORT=587
   ```

---

## 2. Manajemen User Baru

### Bagaimana cara menambah user baru?

**Opsi 1: Via Database (Manual)**
- Buka file database di folder `instance/koperasi.db`
- Tambah user baru dengan email asli

**Opsi 2: Via Admin Panel (Recommended)**
- Login sebagai admin
- Klik "Kelola User" 
- Klik "Tambah User Baru"
- Isi email asli dan pilih role
- Password akan digenerate otomatis dan dikirim ke email

### User Roles yang Tersedia:
- **user**: Calon anggota biasa
- **approval1**: Approval tahap pertama
- **approval2**: Approval tahap kedua  
- **admin**: Administrator sistem
- **kasir**: Kasir untuk kelola kupon

---

## 3. Email Notifikasi Otomatis

Sistem akan otomatis mengirim email ke:

✉️ **Saat Pendaftaran Baru:**
- Email ke Approval1
- Email ke Admin
- Email ke Calon Anggota

✉️ **Saat Ada Perubahan Status:**
- Approval1 approve/reject → Email ke Approval2 dan Calon Anggota
- Approval2 approve/reject → Email ke Admin dan Calon Anggota

✉️ **Saat User Baru Ditambah:**
- Email welcome dengan password temporary

---

## 4. Testing Email

Untuk test apakah email berfungsi:
1. Login sebagai admin
2. Klik "Test Email"
3. Masukkan email tujuan
4. Klik "Kirim"
5. Cek inbox

---

## Catatan Penting

⚠️ **Security:**
- Jangan share password Gmail Anda
- Gunakan App Password, bukan password asli
- Jangan hardcode password di kode

⚠️ **Email Limits:**
- Gmail limit ~500 email per hari
- Tunggu beberapa detik antar email

✅ **Best Practice:**
- Update config di `.env.production`
- Jangan edit config.py langsung
- Restart aplikasi setelah ubah config
