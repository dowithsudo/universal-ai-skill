# 🤝 Contributing — Panduan Berkontribusi

> Terima kasih telah berkontribusi! Panduan ini akan membantu Anda memahami cara berkontribusi dengan benar.

---

## Daftar Isi

- [Cara Berkontribusi](#cara-berkontribusi)
- [Menambahkan Skill Baru](#menambahkan-skill-baru)
- [Memperbaiki Bug](#memperbaiki-bug)
- [Format SKILL.md](#format-skillmd)
- [Testing](#testing)
- [Pull Request](#pull-request)
- [Code of Conduct](#code-of-conduct)

---

## Cara Berkontribusi

### 1. Fork Repository

```bash
# Fork via GitHub UI, lalu clone
git clone git@github.com:YOUR_USERNAME/universal-ai-skill.git
cd universal-ai-skill
```

### 2. Buat Branch Baru

```bash
git checkout -b fitur/nama-fitur-baru
# atau
git checkout -b perbaikan/nama-bug
```

### 3. Lakukan Perubahan

- Ikuti format yang sudah ada
- Pastikan test passing
- Update dokumentasi jika perlu

### 4. Submit Pull Request

```bash
git add .
git commit -m "deskripsi: penjelasan singkat"
git push origin fitur/nama-fitur-baru
```

Lalu buka GitHub dan buat Pull Request.

---

## Menambahkan Skill Baru

### Langkah 1: Buat Folder

```bash
mkdir -p sources/nama-repo/skills/nama-skill
```

### Langkah 2: Buat SKILL.md

Buat file `SKILL.md` dengan format yang benar (lihat [Format SKILL.md](#format-skillmd)).

### Langkah 3: Update Registry

Jalankan script auto-generate:
```bash
bash scripts/generate_registry.sh
```

Atau update manual `registry/skill_index.json`.

### Langkah 4: Test

```bash
bash scripts/test_all_skills.sh
```

### Langkah 5: Submit PR

Ikuti langkah di [Pull Request](#pull-request).

---

## Memperbaiki Bug

### Langkah 1: Identifikasi Bug

- Pastikan bug benar-benar ada
- Kumpulkan informasi:
  - Skill yang terpengaruh
  - Langkah reproduksi
  - Error message (jika ada)

### Langkah 2: Buat Fix

- Perbaiki bug di file yang sesuai
- Jangan modifikasi file lain yang tidak terkait

### Langkah 3: Test

```bash
bash scripts/test_all_skills.sh
```

### Langkah 4: Submit PR

Ikuti langkah di [Pull Request](#pull-request).

---

## Format SKILL.md

### Struktur Wajib

```markdown
---
name: nama-skill
description: Deskripsi singkat skill
---

# Judul Skill

> Tagline atau penjelasan singkat

## Kapan Menggunakan

Kapan skill ini harus digunakan.

## Proses

Langkah-langkah eksekusi.

## Verifikasi

Cara memverifikasi hasil.

## Catatan Tambahan

Informasi tambahan (opsional).
```

### Contoh

```markdown
---
name: design-taste-frontend
description: Anti-slop frontend skill for landing pages
---

# Design Taste Frontend

> Landing pages, portfolios, and redesigns. Not dashboards.

## Kapan Menggunakan

Gunakan skill ini saat:
- Membuat landing page
- Membuat portfolio
- Redesign website existing

## Proses

1. Baca brief dari user
2. Infer design direction
3. Set tiga dials (VARIANCE, MOTION, DENSITY)
4. Implementasi dengan framework yang dipilih

## Verifikasi

- [ ] Layout sesuai brief
- [ ] Tidak ada elemen template
- [ ] Responsive di semua device

## Catatan Tambahan

- Skill ini tidak untuk dashboard atau data tables
- Gunakan anti-slop rules untuk menghindari output yang terlihat generik
```

---

## Testing

### Jalankan Semua Test

```bash
bash scripts/test_all_skills.sh
```

### Jalankan Test Tertentu

```bash
# Test skill tertentu
cat sources/taste-skill/skills/taste-skill/SKILL.md

# Cek format
head -10 sources/taste-skill/skills/taste-skill/SKILL.md
```

### Validasi Registry

```bash
cat registry/skill_index.json | jq '.categories'
```

---

## Pull Request

### Template

```markdown
## Deskripsi
Penjelasan singkat tentang perubahan.

## Jenis Perubahan
- [ ] Skill baru
- [ ] Perbaikan bug
- [ ] Peningkatan dokumentasi
- [ ] Refactoring
- [ ] Lainnya

## Skill yang Terpengaruh
- [ ] taste-skill
- [ ] claude-seo
- [ ] agent-skills
- [ ] no-ai-slop

## Testing
- [ ] test_all_skills.sh passing
- [ ] SKILL.md format benar
- [ ] Registry terupdate

## Catatan Tambahan
Informasi lain yang perlu diketahui reviewer.
```

### Checklist Sebelum Submit

- [ ] Kode sesuai dengan konvensi yang ada
- [ ] Test passing
- [ ] Dokumentasi terupdate (jika perlu)
- [ ] Tidak ada file temporary yang ter-commit
- [ ] Commit message jelas dan deskriptif

---

## Code of Conduct

### Prinsip Dasar

1. **Hormati semua kontributor** — Tanpa diskriminasi, harassment, atau intimidasi
2. **Konstruktif** — Berikan feedback yang membangun, bukan merusak
3. **Profesional** — Jaga komunikasi tetap sopan dan profesional
4. **Inklusif** — Terbuka untuk semua latar belakang dan tingkat pengalaman

### Yang Tidak Diperbolehkan

- 🔴 Hate speech atau diskriminasi
- 🔴 Harassment atau intimidasi
- 🔴 Spam atau konten tidak relevan
- 🔴 Pelanggaran hak cipta
- 🔴 Merubah file asli tanpa izin

### Konsekuensi

- Peringatan pertama: DM dari maintainer
- Peringatan kedua: Sementara tidak bisa submit PR
- Peringatan ketiga: Banned dari repository

---

## Pertanyaan?

Jika ada pertanyaan, buka GitHub Issues atau hubungi maintainer.

---

**Terima kasih telah berkontribusi! 🎉**
