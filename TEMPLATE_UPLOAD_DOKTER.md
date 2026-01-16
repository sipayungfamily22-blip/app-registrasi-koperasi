# Template Upload Data Dokter - Format Excel

## Format File Excel

File Excel harus memiliki struktur kolom sebagai berikut:

| Kolom A | Kolom B | Kolom C | Kolom D |
|---------|---------|---------|---------|
| Nama Dokter | No. Kontak | Jumlah Kupon | Keterangan |

### Penjelasan Kolom:

1. **Kolom A - Nama Dokter** (Wajib)
   - Nama lengkap dokter
   - Contoh: Budi Santoso, Dr. Siti Rahayu

2. **Kolom B - No. Kontak** (Wajib)
   - Nomor telepon atau kontak dokter
   - Contoh: 08123456789, 021-12345678

3. **Kolom C - Jumlah Kupon** (Wajib)
   - Angka jumlah kupon awal
   - Harus berupa angka positif
   - Contoh: 10, 15, 20

4. **Kolom D - Keterangan** (Opsional)
   - Catatan tambahan tentang dokter
   - Contoh: Spesialis Gigi, Jam praktik: Senin-Jumat 14:00-18:00

## Contoh Data:

```
Nama Dokter | No. Kontak | Jumlah Kupon | Keterangan
Dr. Budi Santoso | 08123456789 | 15 | Spesialis Umum
Dr. Siti Rahayu | 08198765432 | 20 | Spesialis Gigi, Jam: Sen-Jum 14:00-18:00
Dr. Ahmad Wijaya | 021-12345678 | 12 | Praktik di Klinik Utama
```

## Catatan Penting:

1. **Baris Pertama**: Dianggap sebagai header dan akan otomatis diskip
2. **Duplikat Data**: Data dengan kombinasi nama dokter + no. kontak yang sama akan ditolak
3. **Validasi**: Setiap baris akan divalidasi sebelum disimpan
4. **Format File**: Gunakan format .xlsx atau .xls
5. **Encoding**: Pastikan file menggunakan UTF-8 untuk karakter spesial

## Cara Upload:

1. Buka menu **Manajemen Dokter & Kupon** di admin panel
2. Klik tombol **Upload Excel** (tombol hijau)
3. Pilih file Excel Anda
4. Klik **Upload File**
5. Sistem akan memproses dan menampilkan laporan hasil:
   - ✓ Jumlah dokter berhasil ditambahkan
   - ⚠ Jumlah baris yang gagal (jika ada)
   - Detail error untuk setiap baris yang gagal

## Troubleshooting:

| Error | Solusi |
|-------|--------|
| "Hanya format Excel (.xlsx, .xls)" | Pastikan file dalam format .xlsx atau .xls |
| "Nama dokter, No. kontak, dan Jumlah kupon harus diisi" | Pastikan ketiga kolom wajib terisi di setiap baris |
| "Jumlah kupon harus berupa angka" | Pastikan kolom Jumlah Kupon hanya berisi angka |
| "Dokter sudah terdaftar" | Dokter dengan nama dan nomor kontak yang sama sudah ada di sistem |
| "Pilihan file Excel" | Anda belum memilih file, pilih file terlebih dahulu |

## Fitur Tambahan:

- **Auto-reset Kupon**: Setiap bulan, jumlah kupon otomatis direset sesuai nilai awal
- **Status Aktif**: Dokter baru otomatis berstatus aktif
- **Periode**: Periode berlaku ditetapkan ke bulan sekarang saat upload
