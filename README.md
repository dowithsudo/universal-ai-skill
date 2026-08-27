# Universal Agent Skills

> **63 Skills dari 4 Repositori — Digabungkan Tanpa Kehilangan 1 Fungsi Pun**

Monorepo universal yang bisa dipakai oleh berbagai AI Agent: Claude, Cursor, OpenCode, FreeBuff, Codex, Gemini, Windsurf, dan lainnya.

---

## 📋 Daftar Isi

- [Apa Ini?](#apa-ini)
- [Cara Cepat](#cara-cepat)
- [63 Skills Tersedia](#63-skills-tersedia)
- [Cara Pakai per Agent](#cara-pakai-per-agent)
- [Contoh Penggunaan](#contoh-penggunaan)
- [Struktur Folder](#struktur-folder)
- [Troubleshooting](#troubleshooting)

---

## Apa Ini?

Monorepo ini berisi **63 skills** dari 4 repositori sumber:

| Repo Sumber | Skills | Domain |
|-------------|--------|--------|
| [taste-skill](https://github.com/Leonxlnx/taste-skill) | 13 | Frontend Design & Anti-Slop UI |
| [claude-seo](https://github.com/AgriciDaniel/claude-seo) | 25 | SEO Analysis & Audit |
| [agent-skills](https://github.com/addyosmani/agent-skills) | 24 | Engineering Workflow |
| [no-ai-slop](https://github.com/petergyang/no-ai-slop) | 1 | Writing Quality |

**Semua skill original tersimpan di `sources/` — tidak ada yang dihapus atau dimodifikasi.**

---

## Cara Cepat

### 1. Clone Repository

```bash
git clone git@github.com:dowithsudo/universal-ai-skill.git
cd universal-ai-skill
```

### 2. Baca AGENT.md

Buka `AGENT.md` untuk melihat semua skill yang tersedia dan cara menggunakannya.

### 3. Pilih Skill yang Dibutuhkan

Lihat tabel di bawah atau buka `registry/skill_index.json` untuk pencarian lengkap.

---

## 63 Skills Tersedia

### 🎨 Frontend Design (13 skills)

Lokasi: `sources/taste-skill/skills/`

| Skill | Install Name | Deskripsi |
|-------|--------------|-----------|
| taste-skill | `design-taste-frontend` | Anti-slop frontend v2 (experimental) |
| taste-skill-v1 | `design-taste-frontend-v1` | Legacy v1 |
| gpt-tasteskill | `gpt-taste` | GPT/Codex strict variant |
| image-to-code-skill | `image-to-code` | Image-first pipeline |
| redesign-skill | `redesign-existing-projects` | Existing projects audit |
| soft-skill | `high-end-visual-design` | Premium calm UI |
| output-skill | `full-output-enforcement` | Anti-truncation |
| minimalist-skill | `minimalist-ui` | Editorial UI |
| brutalist-skill | `industrial-brutalist-ui` | Industrial UI |
| stitch-skill | `stitch-design-taste` | Google Stitch compat |
| imagegen-frontend-web | `imagegen-frontend-web` | Web comps |
| imagegen-frontend-mobile | `imagegen-frontend-mobile` | Mobile screens |
| brandkit | `brandkit` | Brand identity |

### 🔍 SEO Analysis (25 skills)

Lokasi: `sources/claude-seo/skills/`

| Skill | Deskripsi |
|-------|-----------|
| seo | Main orchestrator |
| seo-audit | Full site audit |
| seo-technical | Technical SEO |
| seo-content | Content quality (E-E-A-T) |
| seo-content-brief | Content planning |
| seo-schema | Schema.org markup |
| seo-geo | AI search optimization |
| seo-local | Local SEO |
| seo-maps | Maps intelligence |
| seo-backlinks | Backlink analysis |
| seo-images | Image optimization |
| seo-sitemap | Sitemap management |
| seo-cluster | Semantic clustering |
| seo-plan | Strategic planning |
| seo-programmatic | Programmatic SEO |
| seo-competitor-pages | Competitor comparison |
| seo-sxo | Search experience |
| seo-drift | Drift monitoring |
| seo-ecommerce | E-commerce SEO |
| seo-hreflang | International SEO |
| seo-flow | Evidence-led framework |
| seo-google | Google API integration |
| seo-dataforseo | DataForSEO extension |
| seo-image-gen | AI image generation |
| seo-page | Single page analysis |

### ⚙️ Engineering Workflow (24 skills)

Lokasi: `sources/agent-skills/skills/`

#### Meta
| Skill | Deskripsi |
|-------|-----------|
| using-agent-skills | Cara menggunakan skill pack ini |

#### Define
| Skill | Deskripsi |
|-------|-----------|
| interview-me | Ekstraksi kebutuhan |
| idea-refine | Eksplorasi ide |
| spec-driven-development | PRD sebelum kode |

#### Plan
| Skill | Deskripsi |
|-------|-----------|
| planning-and-task-breakdown | Pecahan tugas |

#### Build
| Skill | Deskripsi |
|-------|-----------|
| incremental-implementation | Vertical slices |
| test-driven-development | Red-Green-Refactor |
| context-engineering | Informasi tepat waktu |
| source-driven-development | Berdasarkan dokumentasi resmi |
| doubt-driven-development | Review adversarial |
| frontend-ui-engineering | Komponen UI, a11y |
| api-and-interface-design | Contract-first API |

#### Verify
| Skill | Deskripsi |
|-------|-----------|
| browser-testing-with-devtools | Chrome DevTools MCP |
| debugging-and-error-recovery | Five-step triage |

#### Review
| Skill | Deskripsi |
|-------|-----------|
| code-review-and-quality | Five-axis review |
| code-simplification | Kurangi kompleksitas |
| security-and-hardening | Pencegahan OWASP |
| performance-optimization | Measure-first perf |

#### Ship
| Skill | Deskripsi |
|-------|-----------|
| git-workflow-and-versioning | Trunk-based git |
| ci-cd-and-automation | Pipelines & gates |
| deprecation-and-migration | Pola sunset |
| documentation-and-adrs | ADRs & API docs |
| observability-and-instrumentation | Logging & tracing |
| shipping-and-launch | Launch checklists |

### ✍️ Writing Quality (1 skill)

Lokasi: `sources/no-ai-slop/skills/`

| Skill | Deskripsi |
|-------|-----------|
| no-ai-slop | Hapus 20+ pola AI slop |

---

## Cara Pakai per Agent

### Claude Code

```bash
# Install via marketplace
/plugin marketplace add dowithsudo/universal-ai-skill

# Atau clone langsung
git clone git@github.com:dowithsudo/universal-ai-skill.git
claude --plugin-dir /path/to/universal-ai-skill
```

**Cara pakai skill:**
```
# Frontend design
Ikuti skill di sources/taste-skill/skills/taste-skill/SKILL.md

# SEO
Ikuti skill di sources/claude-seo/skills/seo/SKILL.md

# Engineering
Ikuti skill di sources/agent-skills/skills/test-driven-development/SKILL.md

# Writing
Ikuti skill di sources/no-ai-slop/skills/no-ai-slop/SKILL.md
```

### Cursor

```bash
# Copy SKILL.md ke .cursor/rules/
cp sources/taste-skill/skills/taste-skill/SKILL.md .cursor/rules/
cp sources/agent-skills/skills/test-driven-development/SKILL.md .cursor/rules/
```

### OpenCode

```bash
# Baca AGENT.md untuk bootstrap
# Lalu gunakan skill tool untuk load skill yang dibutuhkan
```

### FreeBuff

```bash
# Baca AGENT.md untuk bootstrap
# Referensikan skill langsung dari sources/
```

### Codex

```bash
# Install via plugin marketplace
codex plugin marketplace add dowithsudo/universal-ai-skill
```

### Gemini CLI

```bash
# Install sebagai native skills
gemini skills install /path/to/universal-ai-skill/sources/
```

---

## Contoh Penggunaan

### Contoh 1: Frontend Design

```
User: "Buatkan landing page untuk SaaS product dengan design yang premium"

Agent:
1. Baca sources/taste-skill/skills/taste-skill/SKILL.md
2. Ikuti instruksi design
3. Implementasi dengan layout, tipografi, motion yang disarankan
```

### Contoh 2: SEO Audit

```
User: "Audit SEO untuk website saya di https://example.com"

Agent:
1. Baca sources/claude-seo/skills/seo/SKILL.md
2. Jalankan /seo audit https://example.com
3. Hasilkan laporan prioritas
```

### Contoh 3: Test-Driven Development

```
User: "Buatkan fitur authentication dengan TDD"

Agent:
1. Baca sources/agent-skills/skills/test-driven-development/SKILL.md
2. Tulis test dulu (Red)
3. Implementasi (Green)
4. Refactor
```

### Contoh 4: Clean Writing

```
User: "Bersihkan tulisan ini dari AI slop: [teks]"

Agent:
1. Baca sources/no-ai-slop/skills/no-ai-slop/SKILL.md
2. Identifikasi pola AI slop
3. Bersihkan tanpa menghilangkan voice
```

---

## Struktur Folder

```
universal-ai-skill/
├── AGENT.md                    # Bootstrap document (WAJIB DIBACA)
├── mcp.json                    # MCP manifest
├── openapi.json                # REST manifest
├── HOW_TO_USE.md               # Panduan praktis untuk pemula
├── QUICKSTART.md               # Quick reference
├── registry/
│   └── skill_index.json        # Global skill index
├── scripts/
│   ├── test_all_skills.sh      # Verifikasi semua skill
│   └── sync_diff.sh            # Incremental sync
└── sources/                    # 584 files (SEMUA ORIGINAL)
    ├── taste-skill/            # 64 files (13 skills)
    ├── claude-seo/             # 383 files (25 skills)
    ├── agent-skills/           # 124 files (24 skills)
    └── no-ai-slop/             # 13 files (1 skill)
```

---

## Token Minimization

### Prinsip: Hanya Load Yang Dibutuhkan

**Jangan:**
- Muat seluruh `sources/` sekaligus
- Baca semua SKILL.md jika hanya butuh 1 skill
- Load references jika tidak diminta

**Lakukan:**
- Identifikasi skill yang dibutuhkan
- Baca hanya SKILL.md dari skill tersebut
- Muat references hanya jika diminta skill-nya

### Contoh:

```
# ❌ Jangan lakukan ini:
find sources/ -name "SKILL.md"  # Load semua 63 skills

# ✅ Lakukan ini:
cat sources/taste-skill/skills/taste-skill/SKILL.md  # Hanya 1 skill
```

---

## Troubleshooting

### Q: Skill tidak terdeteksi?

**A:** Pastikan path-nya benar:
```bash
# Cek apakah file ada
ls sources/taste-skill/skills/taste-skill/SKILL.md
```

### Q: Bagaimana cara mengetahui skill yang harus dipakai?

**A:** Baca `AGENT.md` atau gunakan `registry/skill_index.json`:
```bash
cat registry/skill_index.json | jq '.categories'
```

### Q: Apakah saya boleh menambahkan skill sendiri?

**A:** Ya! Tambahkan di `sources/` dengan struktur:
```
sources/my-new-skill/
└── my-skill/
    └── SKILL.md
```

Lalu update `registry/skill_index.json`.

### Q: Bagaimana cara memverifikasi semua skill masih utuh?

**A:** Jalankan test suite:
```bash
bash scripts/test_all_skills.sh
```

### Q: Bagaimana cara mengetahui ada perubahan file?

**A:** Jalankan script sync_diff:
```bash
bash scripts/sync_diff.sh
```

### Q: Apakah saya boleh mengedit isi SKILL.md?

**A:** Boleh, tapi disarankan untuk membuat salinan terlebih dahulu agar tidak mengubah file asli.

### Q: Dimana saya bisa menemukan skill yang saya butuhkan?

**A:** Lihat `registry/skill_index.json` atau langsung lihat folder `sources/[kategori]/skills/`.

### Q: Apakah ada batasan jumlah skill yang bisa dipakai?

**A:** Tidak ada batasan. Gunakan sesuai kebutuhan.

---

## Development

### Menambahkan Skill Baru

1. Buat folder di `sources/`:
   ```bash
   mkdir -p sources/my-repo/skills/my-skill
   ```

2. Buat `SKILL.md`:
   ```markdown
   ---
   name: my-skill
   description: Deskripsi skill
   ---
   
   # My Skill
   
   Instruksi skill di sini...
   ```

3. Update `registry/skill_index.json`

4. Jalankan test:
   ```bash
   bash scripts/test_all_skills.sh
   ```

### Memverifikasi Integritas

```bash
# Cek semua skill
bash scripts/test_all_skills.sh

# Cek perubahan file
bash scripts/sync_diff.sh
```

---

## License

Semua skill di monorepo ini berlisensi **MIT**. Lihat `LICENSE` file di masing-masing repo sumber untuk detail.

| Repo | License |
|------|---------|
| taste-skill | MIT |
| claude-seo | MIT |
| agent-skills | MIT |
| no-ai-slop | MIT |

---

## Credits

Terima kasih kepada para pembuat skill original:

- **taste-skill** by [Leonxlnx](https://github.com/Leonxlnx)
- **claude-seo** by [Agrici Daniel](https://github.com/AgriciDaniel)
- **agent-skills** by [Addy Osmani](https://github.com/addyosmani)
- **no-ai-slop** by [Peter Yang](https://github.com/petergyang)

---

## Contributing

Silakan berkontribusi! Lihat `CONTRIBUTING.md` untuk panduan.

---

**Made with ❤️ for the AI Agent community**
