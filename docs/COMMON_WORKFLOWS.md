# 🔄 Common Workflows — Alur Kerja Umum

> **Template workflow siap pakai untuk tugas-tugas umum.**

---

## Workflow 1: Membuat Landing Page

```
Step 1: Persiapan
├── Baca skill design-taste-frontend
├── Pahami brief dari user
└── Konfirmasi jika ada yang ambigu

Step 2: Design
├── Brief inference (Section 0)
├── Set design dials (Section 1)
├── Pilih design system (Section 2)
└── Tentukan color palette & typography

Step 3: Implementasi
├── Buat HTML structure
├── Implementasi CSS
├── Tambah JavaScript (jika perlu)
└── Tambah motion/animation

Step 4: Verifikasi
├── Test responsive (mobile, tablet, desktop)
├── Test accessibility
├── Test performance
└── Screenshot hasil

Step 5: Serahkan
├── Present ke user
├── Jelaskan fitur
└── Minta feedback
```

**Contoh prompt:**
```
"Baca skill dari sources/taste-skill/skills/taste-skill/SKILL.md
Lalu buatkan landing page untuk SaaS produk AI writing tool
dengan target audiens developer, design style minimalist"
```

---

## Workflow 2: Audit SEO

```
Step 1: Persiapan
├── Baca skill seo (orchestrator)
├── Pahami website yang akan di-audit
└── Siapkan URL target

Step 2: Audit
├── Jalankan /seo audit [url]
├── Tunggu parallel agents selesai
└── Kumpulkan semua hasil

Step 3: Review
├── Baca laporan hasil
├── Identifikasi issue kritis
└── Prioritaskan perbaikan

Step 4: Action Plan
├── Buat daftar perbaikan
├── Prioritaskan berdasarkan dampak
└── Estimasi waktu perbaikan

Step 5: Present
├── Present ke user
├── Jelaskan findings
└── Rekomendasikan langkah selanjutnya
```

**Contoh prompt:**
```
"Baca skill dari sources/claude-seo/skills/seo-audit/SKILL.md
Lalu jalankan full audit untuk website https://example.com"
```

---

## Workflow 3: Membuat Fitur dengan TDD

```
Step 1: Persiapan
├── Baca skill test-driven-development
├── Pahami requirement
└── Identifikasi test cases

Step 2: Red (Tulis Test)
├── Tulis test untuk happy path
├── Tulis test untuk edge cases
├── Tulis test untuk error handling
└── Pastikan test GAGAL (belum ada kode)

Step 3: Green (Implementasi)
├── Implementasi kode minimal
├── Jalankan test
├── Pastikan test PASSING
└── Jangan over-engineering

Step 4: Refactor
├── Review kode
├── Simplifikasi jika perlu
├── Pastikan test masih PASSING
└── Dokumentasikan perubahan

Step 5: Verifikasi
├── Jalankan semua test
├── Pastikan semua PASSING
├── Code review
└── Serahkan ke user
```

**Contoh prompt:**
```
"Baca skill dari sources/agent-skills/skills/test-driven-development/SKILL.md
Lalu buatkan fitur user authentication dengan pendekatan TDD"
```

---

## Workflow 4: Code Review

```
Step 1: Persiapan
├── Baca skill code-review-and-quality
├── Pahami konteks kode
└── Identifikasi area yang perlu difokuskan

Step 2: Review
├── Cek readability
├── Cek maintainability
├── Cek test coverage
├── Cek security
└── Cek performance

Step 3: Feedback
├── Berikan feedback yang spesifik
├── Prioritaskan issue (Critical/Important/Nit)
├── Berikan saran perbaikan
└── Jangan hanya kritik, berikan solusi

Step 4: Follow-up
├── Tunggu perbaikan dari author
├── Review ulang jika perlu
└── Approve jika sudah sesuai
```

**Contoh prompt:**
```
"Baca skill dari sources/agent-skills/skills/code-review-and-quality/SKILL.md
Lalu review kode berikut: [paste kode]"
```

---

## Workflow 5: Bersihkan Tulisan dari AI Slop

```
Step 1: Persiapan
├── Baca skill no-ai-slop
├── Pahami konteks tulisan
└── Identifikasi audiens

Step 2: Deteksi
├── Baca tulisan dengan seksama
├── Identifikasi pola AI slop
├── Catat semua pola yang ditemukan
└── Jangan langsung edit

Step 3: Edit
├── Hapus pola AI slop
├── Pertahankan voice penulis
├── Perbaiki kalimat yang awkward
└── Pastikan pesan tetap tersampaikan

Step 4: Verifikasi
├── Baca ulang hasil edit
├── Pastikan tidak ada pola AI slop yang tersisa
├── Pastikan voice penulis masih ada
└── Bandingkan dengan original

Step 5: Serahkan
├── Present hasil edit
├── Jelaskan apa yang diubah
└── Minta feedback
```

**Contoh prompt:**
```
"Baca skill dari sources/no-ai-slop/skills/no-ai-slop/SKILL.md
Lalu bersihkan tulisan ini dari AI slop: [paste tulisan]"
```

---

## Workflow 6: Buat API Baru

```
Step 1: Persiapan
├── Baca skill api-and-interface-design
├── Pahami requirement
└── Identifikasi endpoints

Step 2: Design
├── Tentukan resource
├── Tentukan endpoints (CRUD)
├── Tentukan request/response format
└── Dokumentasikan API spec

Step 3: Implementasi
├── Buat routing
├── Implementasi handlers
├── Tambah validation
├── Tambah error handling
└── Tambah authentication (jika perlu)

Step 4: Test
├── Tulis test untuk setiap endpoint
├── Test happy path
├── Test error cases
├── Test edge cases
└── Pastikan semua PASSING

Step 5: Document
├── Update API documentation
├── Berikan contoh penggunaan
└── Jelaskan authentication (jika ada)
```

**Contoh prompt:**
```
"Baca skill dari sources/agent-skills/skills/api-and-interface-design/SKILL.md
Lalu buatkan REST API untuk aplikasi e-commerce dengan
endpoints: /products, /orders, /users"
```

---

## Tips

1. **Ikuti urutan workflow** — Jangan skip langkah
2. **Jangan buru-buru** — Kualitas > Kecepatan
3. **Verifikasi di setiap step** — Pastikan test passing
4. **Dokumentasikan** — Catat apa yang dilakukan
5. **Komunikasikan** — Kabari user jika ada masalah

---

**Gunakan workflow ini sebagai panduan saat mengerjakan tugas.**
