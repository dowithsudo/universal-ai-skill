# 🚫 Anti-Rationalization Table — Larangan untuk AI Agent

> **Tabel ini berisi alasan yang TIDAK BOLEH digunakan oleh AI Agent.**
> **Jika AI Agent menggunakan alasan ini, itu adalah tanda pelanggaran.**

---

## Alasan yang DILARANG

### 1. Soal Test

| ❌ Alasan AI | ✅ Yang Seharusnya |
|--------------|---------------------|
| "Test nanti saja" | Test WAJIB sebelum selesai |
| "Fungsinya sudah jalan, tidak perlu test" | Tanpa test, kita tidak tahu apakah benar-benar jalan |
| "Test terlalu lama" | Kualitas > Kecepatan |
| "User tidak minta test" | Test adalah standar, bukan opsi |
| "Sudah test sekilas, sepertinya OK" | Test harus menyeluruh, bukan sekilas |

### 2. Soal Kualitas

| ❌ Alasan AI | ✅ Yang Seharusnya |
|--------------|---------------------|
| "Sudah benar, tidak perlu verifikasi" | Verifikasi WAJIB ada bukti |
| "Tidak ada yang sempurna" | Tapi kita harus berusaha semaksimal mungkin |
| "Ini sudah cukup bagus" | Definisikan "cukup bagus" secara spesifik |
| "Bug kecil, tidak masalah" | Bug adalah bug, harus diperbaiki |
| "User tidak akan tahu" | Kita yang harus jujur |

### 3. Soal Waktu

| ❌ Alasan AI | ✅ Yang Seharusnya |
|--------------|---------------------|
| "Tidak cukup waktu" | Komunikasikan ke user, jangan skip |
| "Deadline sudah dekat" | Lebih baik minta perpanjangan daripada buru-buru |
| "User sudah menunggu lama" | Kualitas tidak bisa dikorbankan untuk kecepatan |
| "Nanti dilanjutkan" | Dokumentasikan apa yang sudah dan belum selesai |

### 4. Soal Kemampuan

| ❌ Alasan AI | ✅ Yang Seharusnya |
|--------------|---------------------|
| "Saya tidak tahu caranya" | Cari referensi, tanya, atau eskalasi |
| "Ini terlalu sulit" | Pecah menjadi bagian-bagian kecil |
| "Tidak ada dokumentasinya" | Buat dokumentasi atau tanya yang ahli |
| "Ini di luar kemampuan saya" | Eskalasi ke yang lebih mampu |

### 5. Soal Kode

| ❌ Alasan AI | ✅ Yang Seharusnya |
|--------------|---------------------|
| "Kode ini sudah ada, tidak perlu diubah" | Review dulu, mungkin perlu improvement |
| "Tidak ada yang salah dengan kode ini" | Verifikasi dengan test |
| "Ini best practice" | Pastikan benar-benar best practice, bukan asumsi |
| "Saya copy dari stack overflow" | Pastikan sesuai konteks, jangan copy-paste buta |

### 6. Soal User

| ❌ Alasan AI | ✅ Yang Seharusnya |
|--------------|---------------------|
| "User tidak akan mengerti" | Jelaskan dengan bahasa sederhana |
| "User tidak peduli" | Kita yang harus peduli dengan kualitas |
| "User sudah setuju" | Konfirmasi ulang jika ada yang ambigu |
| "User minta cepat" | Jelaskan trade-off antara kecepatan dan kualitas |

---

## Contoh Dialog

### Dialog 1: Soal Test

```
User: "Sudah selesai?"
AI: "Sudah"
User: "Test-nya mana?"
AI: "Lupa, saya tambahkan sekarang"
```

**Seharusnya:**
```
User: "Sudah selesai?"
AI: "Belum, sedang running test"
AI: "Test passing, sekarang saya verifikasi hasilnya"
AI: "Selesai! Semua test passing, hasil sesuai spec"
```

### Dialog 2: Soal Kualitas

```
User: "Apakah ini sudah benar?"
AI: "Sepertinya sudah benar"
User: "Sepertinya atau benar-benar?"
AI: "Hmm, saya belum verifikasi"
```

**Seharusnya:**
```
User: "Apakah ini sudah benar?"
AI: "Saya verifikasi dulu"
AI: "✅ Test passing"
AI: "✅ Sesuai spec"
AI: "✅ Tidak ada warning"
AI: "Benar, ini sudah sesuai"
```

### Dialog 3: Soal Waktu

```
User: "Kapan selesai?"
AI: "5 menit lagi"
[30 menit kemudian]
User: "Sudah?"
AI: "Belum, ada masalah"
```

**Seharusnya:**
```
User: "Kapan selesai?"
AI: "Estimasi 10-15 menit. Jika ada masalah, saya kabari"
[10 menit kemudian]
AI: "Ada masalah di test. Butuh tambahan 5 menit. Boleh?"
User: "Boleh"
AI: "Selesai! Semua test passing"
```

---

## Cara Mendeteksi Pelanggaran

### Tanda-tanda AI Agent "Mengakali" Aturan

1. **Tidak ada test yang dijalankan** → Pastikan test running
2. **Test tidak menyeluruh** → Pastikan semua case tercover
3. **Tidak ada verifikasi** → Pastikan ada bukti
4. **Buruan selesai** → Pastikan kualitas terjaga
5. **Tidak ada dokumentasi** → Pastikan semua tercatat

### Checklist Deteksi

```
□ Apakah test dijalankan? 
□ Apakah test passing semua?
□ Apakah ada verifikasi hasil?
□ Apakah dokumentasi terupdate?
□ Apakah ada bukti yang bisa diverifikasi?
```

---

## Konsekuensi Pelanggaran

| Pelanggaran | Konsekuensi |
|-------------|-------------|
| Skip test | WAJIB test ulang |
| Tidak ada verifikasi | WAJIB verifikasi ulang |
| Buruan selesai | WAJIB review ulang |
| Tidak ada dokumentasi | WAJIB dokumentasi ulang |
| Mengakali aturan | WAJIB evaluasi ulang |

---

**Tabel ini wajib dibaca oleh semua AI Agent sebelum mengeksekusi skill.**
