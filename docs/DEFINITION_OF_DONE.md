# 📋 Definition of Done — Kriteria Selesai

> **Sebuah task TIDAK BISA dinyatakan "selesai" jika ada 1 kriteria pun yang belum terpenuhi.**

---

## Apa itu Definition of Done?

Definition of Done (DoD) adalah daftar kriteria yang HARUS terpenuhi sebelum AI Agent menyatakan sebuah task "selesai". Jika ada 1 kriteria pun yang belum terpenuhi, task BELUM SELESAI.

---

## Kriteria Selesai (Universal)

### 1. Functional

```
□ Semua test PASSING
□ Fitur berfungsi sesuai spec
□ Tidak ada error
□ Tidak ada warning yang diabaikan
```

### 2. Quality

```
□ Kode bersih dan mudah dibaca
□ Tidak ada code smell
□ Mengikuti coding standards
□ Tidak ada duplicasi kode yang tidak perlu
```

### 3. Documentation

```
□ Kode memiliki komentar yang cukup
□ README terupdate (jika perlu)
□ API documentation terupdate (jika ada)
□ Changelog terupdate (jika perlu)
```

### 4. Testing

```
□ Unit test covering happy path
□ Edge cases tercover
□ Error handling tercover
□ Integration test (jika perlu)
```

### 5. Security

```
□ Tidak ada vulnerability yang diketahui
□ Input tervalidasi
□ Output ter-escape
□ Tidak ada sensitive data yang bocor
```

---

## Kriteria Selesai per Jenis Task

### Feature Development

```
□ Spec terpenuhi 100%
□ Semua test PASSING
□ Code review lulus
□ Documentation terupdate
□ Tidak ada regression
□ User acceptance test lulus
```

### Bug Fix

```
□ Bug teratasi
□ Test untuk bug tersebut PASSING
□ Tidak ada regression
□ Root cause teridentifikasi
□ Preventive measure (jika perlu)
```

### Refactoring

```
□ Kode lebih bersih
□ Semua test PASSING
□ Tidak ada perubahan behavior
□ Performance tidak menurun
□ Documentation terupdate
```

### Documentation

```
□ Accuracy: informasi benar
□ Completeness: tidak ada yang terlewat
□ Clarity: mudah dipahami
□ Consistency: tidak ada kontradiksi
□ Accessibility: mudah ditemukan
```

---

## Checklist Selesai

### Sebelum Nyatakan "Selesai"

```
□ Jalankan semua test
□ Pastikan semua PASSING
□ Verifikasi hasil sesuai spec
□ Review kode
□ Update documentation
□ Pastikan tidak ada warning
□ Siapkan ringkasan perubahan
```

### Saat Nyatakan "Selesai"

```
□ Nyatakan dengan jelas: "Selesai"
□ Berikan bukti: test results, screenshots, dll
□ Berikan ringkasan: apa yang dilakukan
□ Berikan next steps (jika ada)
```

---

## Contoh

### Contoh 1: Membuat Fitur Login

```
User: "Buatkan fitur login"
AI: "Sedang mengerjakan..."

[Proses pengerjaan...]

AI: "Selesai! Berikut ringkasan:"
□ Spec terpenuhi: Login dengan email dan password
□ Test: 15/15 PASSING
□ Security: Password di-hash, rate limiting aktif
□ Documentation: README terupdate
□ Bukti: Screenshot login page

User: "Terima kasih!"
```

### Contoh 2: Memperbaiki Bug

```
User: "Ada bug di halaman profil"
AI: "Sedang investigasi..."

[Proses perbaikan...]

AI: "Bug teratasi! Berikut ringkasan:"
□ Root cause: Query tidak handle null value
□ Fix: Tambah null check
□ Test: 5/5 PASSING (termasuk test untuk bug ini)
□ Regression: Tidak ada
□ Bukti: Screenshot sebelum dan sesudah

User: "Mantap!"
```

---

## Jika Belum Selesai

### Tanda-tanda Belum Selesai

```
❌ Ada test yang GAGAL
❌ Ada error yang belum diperbaiki
❌ Belum ada verifikasi
❌ Documentation belum terupdate
❌ Ada warning yang diabaikan
❌ Tidak ada bukti
```

### Yang Harus Dilakukan

```
1. Identifikasi apa yang belum selesai
2. Perbaiki satu per satu
3. Jalankan test ulang
4. Verifikasi ulang
5. Nyatakan "selesai" hanya jika SEMUA terpenuhi
```

---

## Monitoring

### Checklist Monitoring

```
□ Apakah semua kriteria terpenuhi?
□ Apakah ada yang di-skip?
□ Apakah ada yang diabaikan?
□ Apakah semua test PASSING?
□ Apakah ada bukti verifikasi?
```

### Jika Ada Pelanggaran

| Pelanggaran | Aksi |
|-------------|------|
| Skip test | ULANGI test dulu |
| Tidak ada verifikasi | VERIFIKASI dulu |
| Documentation belum update | UPDATE documentation dulu |
| Nyatakan "selesai" tanpa bukti | CARI bukti dulu |

---

**Definition of Done wajib dipatuhi oleh semua AI Agent.**
