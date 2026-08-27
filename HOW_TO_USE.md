# 🎯 Cara Pakai — Panduan Praktis untuk Pemula

> **Tidak familiar dengan AI Agent Skills? Baca panduan ini dulu.**

---

## Apa Sebenarnya Isi Repository Ini?

Repository ini berisi **63 file instruksi** (namanya `SKILL.md`) yang bisa dibaca oleh AI Agent (Claude, Cursor, ChatGPT, dll).

**Analogi sederhana:**

```
🧠 AI Agent = Koki (bisa masak apa saja)
📚 SKILL.md = Resep masakan (instruksi langkah demi langkah)
📁 Repository ini = Kumpulan 63 resep masakan
```

Jadi, repository ini **bukan program** yang dijalankan, tapi **kumpulan instruksi** yang dibaca oleh AI Agent agar ia tahu cara mengerjakan tugas tertentu.

---

## Contoh Kasus Nyata

### Kasus 1: "Saya mau buat landing page yang bagus"

**Tanpa skill:**
```
User: "Buatkan landing page untuk SaaS"
AI: [Membuat landing page biasa-biasa saja, terlihat template]
```

**Dengan skill:**
```
User: "Buatkan landing page untuk SaaS"
AI: [Membaca SKILL.md → Mengikuti instruksi anti-slop → 
     Membuat landing page yang unik dan profesional]
```

### Kasus 2: "Saya mau audit SEO website"

**Tanpa skill:**
```
User: "Audit SEO website saya"
AI: [Memberikan saran umum, tidak terstruktur]
```

**Dengan skill:**
```
User: "Audit SEO website saya"
AI: [Membaca SKILL.md → Mengikuti framework audit → 
     Menghasilkan laporan lengkap dengan skor dan rekomendasi prioritas]
```

---

## Langkah 1: Install / Clone Repository

```bash
# Clone repository
git clone git@github.com:dowithsudo/universal-ai-skill.git

# Masuk ke folder
cd universal-ai-skill
```

---

## Langkah 2: Pahami Struktur Folder

```
universal-ai-skill/
│
├── AGENT.md              # 📖 BACA INI DULU (Bootstrap)
├── README.md             # 📖 Panduan lengkap
├── HOW_TO_USE.md         # 📖 Panduan ini
│
├── sources/              # 📁 SEMUA SKILL ADA DI SINI
│   ├── taste-skill/      #    🎨 13 skill frontend design
│   ├── claude-seo/       #    🔍 25 skill SEO
│   ├── agent-skills/     #    ⚙️ 24 skill engineering
│   └── no-ai-slop/       #    ✍️ 1 skill writing
│
├── registry/             # 📋 Index semua skill
└── scripts/              # 🔧 Tools verifikasi
```

---

## Langkah 3: Cara Pakai dengan AI Agent

### 🔹 Cara A: Pakai dengan Claude Code

```bash
# 1. Buka Claude Code
claude

# 2. Buka repository ini di Claude Code
# (biasanya otomatis detect jika ada AGENT.md)

# 3. Berikan instruksi
User: "Baca skill dari sources/taste-skill/skills/taste-skill/SKILL.md, 
       lalu buatkan landing page untuk produk SaaS"
```

### 🔹 Cara B: Pakai dengan Cursor

```bash
# 1. Buka Cursor
# 2. Buka folder universal-ai-skill
# 3. Copy skill ke .cursor/rules/
cp sources/taste-skill/skills/taste-skill/SKILL.md .cursor/rules/

# 4. Berikan instruksi di Cursor Chat
User: "Ikuti skill yang ada di .cursor/rules/SKILL.md, 
       buatkan landing page untuk SaaS"
```

### 🔹 Cara C: Pakai dengan ChatGPT / Claude Web

```bash
# 1. Buka file SKILL.md yang diinginkan
cat sources/taste-skill/skills/taste-skill/SKILL.md

# 2. Copy isi file tersebut

# 3. Paste ke ChatGPT/Claude sebagai system prompt

# 4. Berikan instruksi
User: "[Isi SKILL.md sudah di-paste di atas]
       Sekarang buatkan landing page untuk SaaS"
```

### 🔹 Cara D: Pakai dengan OpenCode / FreeBuff

```bash
# 1. Buka terminal di folder universal-ai-skill
# 2. Jalankan perintah
User: "Gunakan skill dari sources/agent-skills/skills/test-driven-development/SKILL.md
       untuk membuat fitur authentication dengan TDD"
```

---

## Contoh Prompt Siap Pakai

### 🎨 Frontend Design

```
# Prompt 1: Landing page
"Baca skill dari sources/taste-skill/skills/taste-skill/SKILL.md
Lalu buatkan landing page untuk produk AI写作工具 dengan design premium"

# Prompt 2: Redesign
"Baca skill dari sources/taste-skill/skills/redesign-skill/SKILL.md
Lalu redesign website saya yang sudah ada agar lebih modern"

# Prompt 3: Minimalist UI
"Baca skill dari sources/taste-skill/skills/minimalist-skill/SKILL.md
Lalu buatkan dashboard admin dengan gaya minimalist seperti Notion"
```

### 🔍 SEO

```
# Prompt 1: Full audit
"Baca skill dari sources/claude-seo/skills/seo/SKILL.md
Lalu jalankan full audit untuk website https://example.com"

# Prompt 2: Schema markup
"Baca skill dari sources/claude-seo/skills/seo-schema/SKILL.md
Lalu generate Schema.org markup untuk halaman produk saya"

# Prompt 3: Content brief
"Baca skill dari sources/claude-seo/skills/seo-content-brief/SKILL.md
Lalu buatkan content brief untuk keyword 'AI writing tool'"
```

### ⚙️ Engineering

```
# Prompt 1: TDD
"Baca skill dari sources/agent-skills/skills/test-driven-development/SKILL.md
Lalu buatkan fitur user authentication dengan pendekatan TDD"

# Prompt 2: Code review
"Baca skill dari sources/agent-skills/skills/code-review-and-quality/SKILL.md
Lalu review kode saya ini: [paste kode]"

# Prompt 3: API design
"Baca skill dari sources/agent-skills/skills/api-and-interface-design/SKILL.md
Lalu buatkan REST API untuk aplikasi e-commerce"
```

### ✍️ Writing

```
# Prompt 1: Clean writing
"Baca skill dari sources/no-ai-slop/skills/no-ai-slop/SKILL.md
Lalu bersihkan tulisan ini dari AI slop: [paste tulisan]"

# Prompt 2: Detect slop
"Baca skill dari sources/no-ai-slop/skills/no-ai-slop/SKILL.md
Lalu cek apakah tulisan ini mengandung pola AI slop: [paste tulisan]"
```

---

## Tips untuk Pemula

### 1. Mulai dari AGENT.md
```bash
# Selalu baca dulu
cat AGENT.md
```

### 2. Cari Skill yang Sesuai
```bash
# Lihat daftar semua skill
cat registry/skill_index.json

# Atau cari berdasarkan kategori
ls sources/taste-skill/skills/    # Frontend
ls sources/claude-seo/skills/     # SEO
ls sources/agent-skills/skills/   # Engineering
ls sources/no-ai-slop/skills/     # Writing
```

### 3. Baca SKILL.md Sebelum Dipakai
```bash
# Contoh: baca skill frontend
cat sources/taste-skill/skills/taste-skill/SKILL.md
```

### 4. Berikan Konteks yang Jelas
```
# ❌ Jangan lakukan ini:
"Buatkan website"

# ✅ Lakukan ini:
"Baca skill dari sources/taste-skill/skills/taste-skill/SKILL.md
Lalu buatkan landing page untuk produk SaaS dengan target audiens 
developer, menggunakan design style minimalist seperti Linear"
```

---

## FAQ (Pertanyaan yang Sering Ditanyakan)

### Q: Apakah ini program yang harus diinstall?
**A:** Tidak. Ini kumpulan file instruksi (SKILL.md) yang dibaca oleh AI Agent.

### Q: AI Agent mana yang bisa pakai?
**A:** Claude, Cursor, ChatGPT, OpenCode, FreeBuff, Codex, Gemini, Windsurf, dan lainnya.

### Q: Bagai mana cara AI Agent mengetahui skill ini?
**A:** AI Agent akan membaca file `AGENT.md` saat pertama kali membuka repository ini.

### Q: Apakah semua skill harus dipakai sekaligus?
**A:** Tidak. Pilih skill yang dibutuhkan saja.

### Q: Bagaimana cara menambahkan skill baru?
**A:** Tambahkan folder baru di `sources/` dengan file `SKILL.md` di dalamnya.

---

## Ringkasan

```
1. Clone repository
2. Baca AGENT.md
3. Pilih skill yang dibutuhkan
4. Baca SKILL.md-nya
5. Berikan instruksi ke AI Agent
6. AI Agent mengikuti instruksi dari SKILL.md
7. Hasil: pekerjaan yang lebih terstruktur dan berkualitas
```

---

**Masih bingung? Baca `README.md` untuk panduan lengkap.**
