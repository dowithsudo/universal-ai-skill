# 🚀 Quick Start — Universal Agent Skills

## 3 Langkah Cepat

### 1. Clone
```bash
git clone https://github.com/your-username/universal-agent-skills.git
cd universal-agent-skills
```

### 2. Baca Bootstrap
```bash
cat AGENT.md
```

### 3. Gunakan Skill
```bash
# Frontend Design
cat sources/taste-skill/skills/taste-skill/SKILL.md

# SEO
cat sources/claude-seo/skills/seo/SKILL.md

# Engineering
cat sources/agent-skills/skills/test-driven-development/SKILL.md

# Writing
cat sources/no-ai-slop/skills/no-ai-slop/SKILL.md
```

---

## 📂 Skill by Category

### Frontend Design (13)
```
sources/taste-skill/skills/
├── taste-skill/           → Anti-slop frontend v2
├── taste-skill-v1/        → Legacy v1
├── gpt-tasteskill/        → GPT/Codex variant
├── image-to-code-skill/   → Image → Code
├── redesign-skill/        → Redesign existing
├── soft-skill/            → Premium calm UI
├── output-skill/          → Full output
├── minimalist-skill/      → Minimalist UI
├── brutalist-skill/       → Brutalist UI
├── stitch-skill/          → Google Stitch
├── imagegen-frontend-web/ → Web comps
├── imagegen-frontend-mobile/ → Mobile screens
└── brandkit/              → Brand identity
```

### SEO (25)
```
sources/claude-seo/skills/
├── seo/                   → Orchestrator
├── seo-audit/             → Full audit
├── seo-technical/         → Technical SEO
├── seo-content/           → Content quality
├── seo-schema/            → Schema.org
├── seo-geo/               → AI search
├── seo-local/             → Local SEO
├── seo-backlinks/         → Backlinks
└── ... (25 total)
```

### Engineering (24)
```
sources/agent-skills/skills/
├── interview-me/          → Requirements
├── spec-driven-development/ → PRD
├── test-driven-development/ → TDD
├── code-review-and-quality/ → Review
├── security-and-hardening/ → Security
└── ... (24 total)
```

### Writing (1)
```
sources/no-ai-slop/skills/
└── no-ai-slop/            → Remove AI slop
```

---

## 🔧 Verifikasi

```bash
# Cek semua skill
bash scripts/test_all_skills.sh

# Cek perubahan
bash scripts/sync_diff.sh
```

---

## 📚 Dokumentasi

| File | Isi |
|------|-----|
| `AGENT.md` | Bootstrap document (WAJIB BACA) |
| `README.md` | Panduan lengkap |
| `QUICKSTART.md` | Quick reference (ini) |
| `registry/skill_index.json` | Index semua skill |

---

## 🎯 Contoh Prompt

### Frontend Design
```
"Gunakan skill design-taste-frontend untuk buatkan landing page"
```

### SEO
```
"Jalankan seo-audit untuk website https://example.com"
```

### TDD
```
"Gunakan test-driven-development untuk buatkan fitur auth"
```

### Writing
```
"Bersihkan tulisan ini dengan no-ai-slop: [teks]"
```

---

**Baca `AGENT.md` untuk panduan lengkap!** 📖
