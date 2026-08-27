# 📝 Skill Templates — Template Membuat Skill Baru

> **Template untuk membuat skill baru. Copy paste dan isi sesuai kebutuhan.**

---

## Template Dasar

```markdown
---
name: [nama-skill]
description: [deskripsi singkat skill]
tags: [tag1, tag2, tag3]
---

# [Judul Skill]

> [Tagline atau penjelasan singkat]

## Kapan Menggunakan

Gunakan skill ini saat:
- [Kondisi 1]
- [Kondisi 2]
- [Kondisi 3]

## Yang Tidak Boleh Dilakukan

- ❌ [Larangan 1]
- ❌ [Larangan 2]
- ❌ [Larangan 3]

## Proses

### Step 1: [Nama Step]

[Penjelasan step]

**Checklist:**
- [ ] [Ceklist 1]
- [ ] [Ceklist 2]
- [ ] [Ceklist 3]

### Step 2: [Nama Step]

[Penjelasan step]

**Checklist:**
- [ ] [Ceklist 1]
- [ ] [Ceklist 2]
- [ ] [Ceklist 3]

### Step 3: [Nama Step]

[Penjelasan step]

**Checklist:**
- [ ] [Ceklist 1]
- [ ] [Ceklist 2]
- [ ] [Ceklist 3]

## Verifikasi

### Kriteria Selesai

- [ ] [Kriteria 1]
- [ ] [Kriteria 2]
- [ ] [Kriteria 3]

### Cara Verifikasi

1. [Cara verifikasi 1]
2. [Cara verifikasi 2]
3. [Cara verifikasi 3]

## Contoh Penggunaan

### Contoh 1: [Judul Contoh]

**User:** "[Prompt user]"

**Proses:**
1. [Langkah 1]
2. [Langkah 2]
3. [Langkah 3]

**Hasil:**
[Hasil yang diharapkan]

### Contoh 2: [Judul Contoh]

**User:** "[Prompt user]"

**Proses:**
1. [Langkah 1]
2. [Langkah 2]
3. [Langkah 3]

**Hasil:**
[Hasil yang diharapkan]

## Catatan Tambahan

- [Catatan 1]
- [Catatan 2]
- [Catatan 3]

## Referensi

- [Link 1]
- [Link 2]
- [Link 3]
```

---

## Template untuk Frontend Design

```markdown
---
name: design-[nama]
description: [deskripsi singkat]
tags: [frontend, design, ui]
---

# Design [Nama]

> [Tagline]

## Kapan Menggunakan

Gunakan skill ini saat:
- Membuat [jenis UI]
- Target audiens [audiens]
- Style [style]

## Yang Tidak Boleh Dilakukan

- ❌ Tidak untuk dashboard
- ❌ Tidak untuk data tables
- ❌ Tidak untuk multi-step forms

## Proses

### Step 1: Brief Inference

Baca brief dari user dan infer:
- Page kind (landing, portfolio, redesign)
- Vibe words
- Reference signals
- Audience
- Brand assets
- Quiet constraints

### Step 2: Set Design Dials

```
DESIGN_VARIANCE: [1-10]
MOTION_INTENSITY: [1-10]
VISUAL_DENSITY: [1-10]
```

### Step 3: Pilih Design System

Pilih salah satu:
- Tailwind + Geist
- Native CSS
- Bootstrap
- Lainnya

### Step 4: Implementasi

1. Buat HTML structure
2. Implementasi CSS
3. Tambah JavaScript
4. Tambah motion

### Step 5: Verifikasi

- [ ] Responsive di semua device
- [ ] Accessibility OK
- [ ] Performance OK
- [ ] Tidak ada broken link

## Contoh Prompt

```
"Baca skill dari sources/taste-skill/skills/[nama-skill]/SKILL.md
Lalu buatkan [jenis UI] untuk [produk] dengan [style]"
```
```

---

## Template untuk SEO

```markdown
---
name: seo-[nama]
description: [deskripsi singkat]
tags: [seo, analysis, audit]
---

# SEO [Nama]

> [Tagline]

## Kapan Menggunakan

Gunakan skill ini saat:
- Perlu [jenis analisis]
- Target [target]
- Scope [scope]

## Proses

### Step 1: Persiapan

- [ ] Pahami website target
- [ ] Siapkan URL
- [ ] Identifikasi goals

### Step 2: Analisis

- [ ] Jalankan analisis
- [ ] Kumpulkan data
- [ ] Identifikasi issues

### Step 3: Review

- [ ] Baca hasil
- [ ] Prioritaskan issues
- [ ] Buat action plan

### Step 4: Present

- [ ] Present ke user
- [ ] Jelaskan findings
- [ ] Rekomendasikan next steps

## Contoh Prompt

```
"Baca skill dari sources/claude-seo/skills/[nama-skill]/SKILL.md
Lalu [deskripsi task]"
```
```

---

## Template untuk Engineering

```markdown
---
name: [nama-skill]
description: [deskripsi singkat]
tags: [engineering, workflow]
---

# [Nama Skill]

> [Tagline]

## Kapan Menggunakan

Gunakan skill ini saat:
- [Kondisi 1]
- [Kondisi 2]
- [Kondisi 3]

## Proses

### Step 1: [Step]

- [ ] [Ceklist 1]
- [ ] [Ceklist 2]
- [ ] [Ceklist 3]

### Step 2: [Step]

- [ ] [Ceklist 1]
- [ ] [Ceklist 2]
- [ ] [Ceklist 3]

### Step 3: [Step]

- [ ] [Ceklist 1]
- [ ] [Ceklist 2]
- [ ] [Ceklist 3]

## Verifikasi

- [ ] Semua test PASSING
- [ ] Kode sesuai spec
- [ ] Documentation terupdate

## Contoh Prompt

```
"Baca skill dari sources/agent-skills/skills/[nama-skill]/SKILL.md
Lalu [deskripsi task]"
```
```

---

## Template untuk Writing

```markdown
---
name: [nama-skill]
description: [deskripsi singkat]
tags: [writing, editing]
---

# [Nama Skill]

> [Tagline]

## Dua Mode

### Mode 1: Edit (Default)

User membagikan draft untuk diperbaiki.

### Mode 2: Detect

User menanyakan apakah tulisan mengandung pola AI.

## Aturan Editing

### Prinsip

- [Prinsip 1]
- [Prinsip 2]
- [Prinsip 3]

### Yang Harus Dipotong

- [Pola 1]
- [Pola 2]
- [Pola 3]

### Yang Harus Dipertahankan

- [Elemen 1]
- [Elemen 2]
- [Elemen 3]

## Contoh Prompt

```
"Baca skill dari sources/no-ai-slop/skills/[nama-skill]/SKILL.md
Lalu bersihkan tulisan ini dari AI slop: [teks]"
```
```

---

## Cara Menggunakan Template

1. **Pilih template** — Pilih yang sesuai dengan jenis skill
2. **Copy template** — Copy semua isi template
3. **Paste ke file baru** — Buat file `SKILL.md` baru
4. **Isi sesuai kebutuhan** — Ganti placeholder dengan konten sebenarnya
5. **Test** — Pastikan skill berfungsi
6. **Submit** — Ikuti panduan di CONTRIBUTING.md

---

## Checklist Sebelum Submit

```
□ Frontmatter lengkap (name, description, tags)
□ Ada minimal 3 step
□ Ada checklist di setiap step
□ Ada verifikasi
□ Ada contoh penggunaan
□ Ada catatan tambahan
□ Tidak ada placeholder yang belum diganti
□ Sudah di-test
```

---

**Gunakan template ini saat membuat skill baru.**
