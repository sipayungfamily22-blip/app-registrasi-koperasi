# Panduan Format Upload File Excel Dokter

## Format Kolom

File Excel untuk upload data dokter harus memiliki **4 kolom** dengan urutan sebagai berikut:

| No. | Nama Kolom | Tipe Data | Wajib | Keterangan |
|-----|-----------|-----------|-------|-----------|
| 0 (A) | Nama Dokter | Text | ✓ Ya | Nama lengkap dokter (misal: dr. Agung Wijaya, SpB) |
| 1 (B) | Nomor Kontak | Text/Number | ✓ Ya | Nomor telepon atau WhatsApp dokter |
| 2 (C) | Jumlah Kupon | Number | ✓ Ya | Jumlah kupon awal yang tersedia |
| 3 (D) | Keterangan | Text | ✗ Tidak | Informasi tambahan (misal: Spesialisasi, alamat praktik) |

---

## Contoh Data yang Benar

```
Nama Dokter               | Nomor Kontak  | Jumlah Kupon | Keterangan
--------------------------|---------------|--------------|-----------------------------
dr. Agung Wijaya, SpB     | 081806996558  | 5            | Spesialis Bedah
dr. Siti Nurhaliza, SpPD  | 082145789123  | 3            | Spesialis Penyakit Dalam
dr. Budi Santoso, SpJP    | 083456789012  | 4            | Spesialis Jantung
dr. Ratna Dewi, SpA       | 084567890123  | 6            | Spesialis Anak
```

---

## Langkah-Langkah Upload

1. **Buka file Excel**
   - Gunakan Microsoft Excel, LibreOffice Calc, atau Google Sheets
   - File harus format `.xlsx` atau `.xls`

2. **Isi data sesuai format**
   - Baris pertama: Header (Nama Dokter, Nomor Kontak, Jumlah Kupon, Keterangan)
   - Baris kedua dst: Data dokter

3. **Simpan file**
   - Format: `.xlsx` atau `.xls`
   - Nama file: Terserah (misal: dokter.xlsx)

4. **Upload ke aplikasi**
   - Login sebagai Admin
   - Klik menu "Data Dokter"
   - Klik "Upload Excel"
   - Pilih file Anda
   - Klik "Upload"

---

## Catatan Penting

✓ **Boleh dilakukan:**
- Kolom "Keterangan" boleh kosong
- Nomor kontak bisa dengan atau tanpa format
- Jumlah kupon bisa angka desimal (misal: 5.5 akan jadi 5)

✗ **TIDAK boleh dilakukan:**
- Nama dokter kosong
- Nomor kontak kosong
- Jumlah kupon kosong
- Memindahkan urutan kolom

⚠ **Error yang mungkin terjadi:**
- "Baris X: Nama dokter, No. kontak, dan Jumlah kupon harus diisi" → Ada data yang kosong
- "Dokter dengan nama dan no. kontak sudah terdaftar" → Dokter sudah ada di sistem

---

## Contoh File Excel yang Siap Digunakan

File template siap pakai: **Contoh_Format_Upload_Dokter.xlsx**

Cukup copy dan sesuaikan data Anda dengan template tersebut!
