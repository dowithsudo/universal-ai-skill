# 📋 UNIVERSAL AGENT SKILLS — CHEAT SHEET

> **Quick Reference untuk Penggunaan Sehari-hari**

---

## 🚀 QUICK START

```bash
# 1. Clone
git clone git@github.com:dowithsudo/universal-ai-skill.git
cd universal-ai-skill

# 2. Baca Bootstrap
cat AGENT.md

# 3. Preview Skill
./scripts/preview_skill.sh <skill-name>

# 4. Cari Skill
./scripts/find_skill.sh <keyword>

# 5. Verifikasi
./scripts/test_all_skills.sh
```

---

## 📂 STRUKTUR FOLDER

```
universal-agent-skills/
├── AGENT.md                    # Bootstrap (WAJIB BACA)
├── README.md                   # Panduan lengkap
├── sources/                    # SEMUA SKILL
│   ├── taste-skill/            # 🎨 13 Frontend Design
│   ├── claude-seo/             # 🔍 25 SEO
│   ├── agent-skills/           # ⚙️ 24 Engineering
│   └── no-ai-slop/             # ✍️ 1 Writing
├── registry/                   # Index
├── scripts/                    # Tools
└── docs/                       # Dokumentasi
```

---

## 🎨 FRONTEND DESIGN SKILLS (13)

| Skill | Fungsi | Contoh Penggunaan |
|-------|--------|-------------------|
| `taste-skill` | Anti-slop frontend v2 | Landing page premium |
| `taste-skill-v1` | Legacy v1 | Proyek lama |
| `gpt-tasteskill` | GPT/Codex variant | GPT projects |
| `image-to-code-skill` | Image → Code | Screenshot to code |
| `redesign-skill` | Redesign existing | Website redesign |
| `soft-skill` | Premium calm UI | Luxury brand |
| `output-skill` | Full output | No placeholder |
| `minimalist-skill` | Editorial UI | Dashboard |
| `brutalist-skill` | Industrial UI | Portfolio |
| `stitch-skill` | Google Stitch | Stitch projects |
| `imagegen-frontend-web` | Web comps | Website mockup |
| `imagegen-frontend-mobile` | Mobile screens | App mockup |
| `brandkit` | Brand identity | Logo, colors |

### Quick Commands:
```bash
# Preview
./scripts/preview_skill.sh taste-skill

# Gunakan
cat sources/taste-skill/skills/taste-skill/SKILL.md
```

---

## 🔍 SEO SKILLS (25)

| Skill | Fungsi | Contoh Penggunaan |
|-------|--------|-------------------|
| `seo` | Orchestrator | Full audit |
| `seo-audit` | Full audit | Website audit |
| `seo-technical` | Technical SEO | Core Web Vitals |
| `seo-content` | Content quality | E-E-A-T analysis |
| `seo-content-brief` | Content planning | Content brief |
| `seo-schema` | Schema.org | JSON-LD |
| `seo-geo` | AI search | GEO optimization |
| `seo-local` | Local SEO | GBP optimization |
| `seo-maps` | Maps intelligence | Geo-grid |
| `seo-backlinks` | Backlink analysis | Link building |
| `seo-images` | Image optimization | Alt text |
| `seo-sitemap` | Sitemap | XML sitemap |
| `seo-cluster` | Semantic clustering | Topic clusters |
| `seo-plan` | Strategic planning | SEO roadmap |
| `seo-programmatic` | Programmatic SEO | Template pages |
| `seo-competitor-pages` | Competitor | Comparison pages |
| `seo-sxo` | Search experience | SXO |
| `seo-drift` | Drift monitoring | Change detection |
| `seo-ecommerce` | E-commerce | Product SEO |
| `seo-hreflang` | International | i18n SEO |
| `seo-flow` | FLOW framework | Evidence-led |
| `seo-google` | Google APIs | GSC, PageSpeed |
| `seo-dataforseo` | DataForSEO | Live data |
| `seo-image-gen` | AI images | SEO assets |
| `seo-page` | Single page | Deep analysis |

### Quick Commands:
```bash
# Preview
./scripts/preview_skill.sh seo

# Gunakan
cat sources/claude-seo/skills/seo/SKILL.md
```

---

## ⚙️ ENGINEERING SKILLS (24)

### Meta
| Skill | Fungsi |
|-------|--------|
| `using-agent-skills` | Cara pakai skill pack |

### Define
| Skill | Fungsi |
|-------|--------|
| `interview-me` | Requirements gathering |
| `idea-refine` | Ide exploration |
| `spec-driven-development` | PRD creation |

### Plan
| Skill | Fungsi |
|-------|--------|
| `planning-and-task-breakdown` | Task decomposition |

### Build
| Skill | Fungsi |
|-------|--------|
| `incremental-implementation` | Vertical slices |
| `test-driven-development` | TDD (Red-Green-Refactor) |
| `context-engineering` | Context management |
| `source-driven-development` | Documentation-driven |
| `doubt-driven-development` | Adversarial review |
| `frontend-ui-engineering` | Component architecture |
| `api-and-interface-design` | Contract-first API |

### Verify
| Skill | Fungsi |
|-------|--------|
| `browser-testing-with-devtools` | Chrome DevTools |
| `debugging-and-error-recovery` | Five-step triage |

### Review
| Skill | Fungsi |
|-------|--------|
| `code-review-and-quality` | Five-axis review |
| `code-simplification` | Simplify code |
| `security-and-hardening` | OWASP Top 10 |
| `performance-optimization` | Measure-first |

### Ship
| Skill | Fungsi |
|-------|--------|
| `git-workflow-and-versioning` | Trunk-based git |
| `ci-cd-and-automation` | Pipelines |
| `deprecation-and-migration` | Sunset patterns |
| `documentation-and-adrs` | ADRs |
| `observability-and-instrumentation` | Logging |
| `shipping-and-launch` | Launch checklists |

### Quick Commands:
```bash
# Preview
./scripts/preview_skill.sh test-driven-development

# Gunakan
cat sources/agent-skills/skills/test-driven-development/SKILL.md
```

---

## ✍️ WRITING SKILLS (1)

| Skill | Fungsi | Contoh Penggunaan |
|-------|--------|-------------------|
| `no-ai-slop` | Hapus AI slop | Clean writing |

### Quick Commands:
```bash
# Preview
./scripts/preview_skill.sh no-ai-slop

# Gunakan
cat sources/no-ai-slop/skills/no-ai-slop/SKILL.md
```

---

## 🔧 TOOLS

| Command | Fungsi |
|---------|--------|
| `./scripts/preview_skill.sh <skill>` | Preview skill cepat |
| `./scripts/find_skill.sh <keyword>` | Cari skill |
| `./scripts/search.sh <keyword>` | Fast search |
| `./scripts/build_index.sh` | Build search index |
| `./scripts/sync_upstream.sh` | Sync dengan upstream |
| `./scripts/tutorial.sh` | Tutorial interaktif |
| `./scripts/test_all_skills.sh` | Verifikasi semua skill |
| `./scripts/sync_diff.sh` | Cek perubahan file |
| `./scripts/generate_registry.sh` | Generate registry |

---

## 💡 SKILL COMBINATIONS

### Landing Page
```
taste-skill + output-skill
```

### Full SEO Audit
```
seo + seo-technical + seo-content
```

### New Feature Development
```
spec-driven-development + test-driven-development
```

### E-commerce Project
```
taste-skill + seo-ecommerce + seo-schema
```

### Website Redesign
```
redesign-skill + minimalist-skill
```

### Authentication System
```
spec-driven-development + test-driven-development + security-and-hardening
```

---

## 📝 PROMPT TEMPLATES

### Frontend Design
```
"Baca skill dari sources/taste-skill/skills/taste-skill/SKILL.md
Lalu buatkan [DESCRIPTION] dengan design premium"
```

### SEO Audit
```
"Baca skill dari sources/claude-seo/skills/seo/SKILL.md
Lalu jalankan full audit untuk [URL]"
```

### TDD Feature
```
"Baca skill dari sources/agent-skills/skills/test-driven-development/SKILL.md
Lalu buatkan [FEATURE] dengan pendekatan TDD"
```

### Clean Writing
```
"Baca skill dari sources/no-ai-slop/skills/no-ai-slop/SKILL.md
Lalu bersihkan tulisan ini dari AI slop: [TEXT]"
```

---

## 🎯 DECISION TREE (SINGKAT)

```
Apa yang ingin kamu buat?
│
├── Website/App/UI
│   ├── Landing Page → taste-skill
│   ├── Dashboard → minimalist-skill
│   ├── Redesign → redesign-skill
│   └── Brand → brandkit
│
├── SEO
│   ├── Full Audit → seo
│   ├── Technical → seo-technical
│   ├── Content → seo-content
│   └── Local → seo-local
│
├── Code
│   ├── New Feature → test-driven-development
│   ├── Review → code-review-and-quality
│   └── Debug → debugging-and-error-recovery
│
└── Writing
    └── Clean AI Slop → no-ai-slop
```

---

## ✅ DO & DON'T

### ✅ DO
- Baca AGENT.md saat pertama kali
- Gunakan preview tool sebelum memakai skill
- Berikan konteks yang jelas ke AI Agent
- Jalankan test secara berkala
- Gunakan decision tree untuk memilih skill

### ❌ DON'T
- Jangan load semua skill sekaligus (boros token)
- Jangan skip langkah dalam SKILL.md
- Jangan edit file di sources/ (backup permanen)
- Jangan gunakan skill tanpa membaca dulu

---

## 📊 VERIFIKASI

```bash
# Cek semua skill
./scripts/test_all_skills.sh

# Cek perubahan file
./scripts/sync_diff.sh

# Generate registry
./scripts/generate_registry.sh
```

---

## 🔗 LINK PENTING

| Link | Deskripsi |
|------|-----------|
| `AGENT.md` | Bootstrap document |
| `README.md` | Panduan lengkap |
| `HOW_TO_USE.md` | Cara praktis |
| `QUICKSTART.md` | Quick reference |
| `docs/DECISION_TREE.md` | Visual decision tree |
| `docs/CHEAT_SHEET.md` | Cheat sheet ini |
| `registry/skill_index.json` | Index semua skill |

---

## 🆘 TROUBLESHOOTING

### Skill tidak ditemukan?
```bash
./scripts/find_skill.sh <nama-skill>
```

### Ingin preview dulu?
```bash
./scripts/preview_skill.sh <nama-skill>
```

### Semua skill masih utuh?
```bash
./scripts/test_all_skills.sh
```

### Ada perubahan file?
```bash
./scripts/sync_diff.sh
```

---

**Terakhir diupdate:** August 28, 2026
**Versi:** 1.0.0
**Total Skills:** 63
**Total Tools:** 9