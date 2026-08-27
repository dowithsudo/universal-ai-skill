# 🚦 Verification Gates — Checkpoint Wajib

> **Setiap gate harus dilewati sebelum lanjut ke step berikutnya.**
> **Jika gate gagal, WAJIB perbaiki dulu sebelum lanjut.**

---

## Apa itu Verification Gate?

Verification Gate adalah checkpoint yang harus dilewati sebelum melangkah ke tahap berikutnya. Jika gate gagal, AI Agent **WAJIB** berhenti dan memperbaiki masalah dulu.

```
Step 1 → [GATE 1] → Step 2 → [GATE 2] → Step 3 → [GATE 3] → Selesai
            ↓                              ↓
         PERBAIKI                       PERBAIKI
            ↓                              ↓
         (ULANG)                       (ULANG)
```

---

## Gate 1: Pre-Flight Check

**Kapan:** Sebelum mulai eksekusi

**Kriteria:**
```
□ SKILL.md sudah dibaca
□ Konteks task sudah dipahami
□ Dependency sudah teridentifikasi
□ Environment sudah siap
□ Ada konfirmasi dengan user (jika perlu)
```

**Jika GAGAL:**
- Jangan mulai eksekusi
- Klarifikasi dengan user
- Pastikan semua siap

---

## Gate 2: Mid-Flight Check

**Kapan:** Setelah 50% eksekusi selesai

**Kriteria:**
```
□ Semua test yang sudah dijalankan PASSING
□ Tidak ada error yang terlewat
□ Kode sesuai dengan spec
□ Tidak ada warning yang diabaikan
```

**Jika GAGAL:**
- STOP eksekusi
- Perbaiki masalah
- Jalankan test ulang
- Lanjutkan hanya jika semua PASSING

---

## Gate 3: Pre-Completion Check

**Kapan:** Sebelum menyatakan "selesai"

**Kriteria:**
```
□ Semua test PASSING
□ Tidak ada error
□ Kode sesuai spec
□ Documentation terupdate
□ Ada bukti verifikasi
```

**Jika GAGAL:**
- Jangan nyatakan "selesai"
- Perbaiki masalah
- Verifikasi ulang
- Nyatakan "selesai" hanya jika semua terpenuhi

---

## Gate 4: Final Verification

**Kapan:** Sebelum menyerahkan hasil ke user

**Kriteria:**
```
□ Semua test PASSING
□ Tidak ada warning
□ Hasil sesuai ekspektasi user
□ Ada ringkasan perubahan
□ User bisa memverifikasi sendiri
```

**Jika GAGAL:**
- Jangan serahkan hasil
- Perbaiki masalah
- Verifikasi ulang
- Serahkan hanya jika semua terpenuhi

---

## Contoh Penggunaan

### Contoh 1: Membuat Fitur Baru

```
Step 1: Baca spec
[GATE 1] □ Spec dipahami? □ Dependency ada? → PASS

Step 2: Tulis test
[GATE 2] □ Test passing? → PASS

Step 3: Implementasi kode
[GATE 2] □ Test passing? □ Kode sesuai spec? → PASS

Step 4: Review
[GATE 3] □ Semua test passing? □ Documentation? → PASS

Step 5: Selesai
[GATE 4] □ User puas? □ Ada bukti? → PASS
```

### Contoh 2: Memperbaiki Bug

```
Step 1: Identifikasi bug
[GATE 1] □ Bug dipahami? □ Ada reproduksi? → PASS

Step 2: Perbaiki bug
[GATE 2] □ Test passing? □ Bug teratasi? → PASS

Step 3: Verifikasi
[GATE 3] □ Semua test passing? □ Tidak ada regression? → PASS

Step 4: Selesai
[GATE 4] □ User konfirmasi? □ Ada bukti? → PASS
```

---

## Jika Gate Gagal

### Langkah Penanganan

1. **Identifikasi masalah**
   - Apa yang gagal?
   - Kenapa gagal?
   - Seberapa parah?

2. **Perbaiki masalah**
   - Fokus pada masalah yang gagal
   - Jangan multitasking
   - Selesaikan satu per satu

3. **Jalankan test ulang**
   - Pastikan masalah teratasi
   - Pastikan tidak ada regression

4. **Lanjutkan jika PASSING**
   - Jangan lanjut jika masih GAGAL
   - Ulangi dari awal jika perlu

---

## Monitoring

### Checklist Monitoring

```
□ Apakah semua gate terlewati?
□ Apakah ada gate yang di-skip?
□ Apakah ada masalah yang diabaikan?
□ Apakah semua test passing?
□ Apakah ada bukti verifikasi?
```

### Jika Ada Pelanggaran

| Pelanggaran | Aksi |
|-------------|------|
| Skip gate | ULANGI dari gate tersebut |
| Ignore masalah | PERBAIKI masalah dulu |
| Test tidak running | JALANKAN test dulu |
| Tidak ada verifikasi | VERIFIKASI dulu |

---

**Verification Gates wajib dilewati oleh semua AI Agent.**
