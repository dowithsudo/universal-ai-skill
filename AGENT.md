# Universal Agent Skills

> **Dokumen Bootstrap Inti** — Wajib dibaca oleh AI Agent saat berinteraksi dengan repo ini.

---

## 📋 Daftar Isi

- [Taxonomy Skill](#taxonomy-skill)
- [Protokol Eksekusi Ketat](#protokol-eksekusi-ketat)
- [Pedoman Token Minimization](#pedoman-token-minimization)
- [Dokumentasi Pendukung](#dokumentasi-pendukung)

---

## Taxonomy Skill

Monorepo ini berisi **63 skills** dari 4 repositori sumber, dikonsolidasi tanpa kehilangan 1 fungsi pun.

### Lokasi Skill

| Kategori | Lokasi | Jumlah | Sumber |
|----------|--------|--------|--------|
| **Frontend Design** | `sources/taste-skill/skills/` | 13 | taste-skill |
| **SEO Analysis** | `sources/claude-seo/skills/` | 25 | claude-seo |
- **Engineering Workflow** | `sources/agent-skills/skills/` | 24 | agent-skills |
| **Writing Quality** | `sources/no-ai-slop/skills/` | 1 | no-ai-slop |

### Frontend Design Skills (13)

Lokasi: `sources/taste-skill/skills/`

| Skill | Deskripsi |
|-------|-----------|
| `taste-skill` | Anti-slop frontend v2 (experimental) |
| `taste-skill-v1` | Legacy v1 |
| `gpt-tasteskill` | GPT/Codex strict variant |
| `image-to-code-skill` | Image-first pipeline |
| `redesign-skill` | Audit project existing |
| `soft-skill` | Premium calm UI |
| `output-skill` | Anti-truncation |
| `minimalist-skill` | Editorial UI |
| `brutalist-skill` | Industrial UI |
| `stitch-skill` | Google Stitch compat |
| `imagegen-frontend-web` | Web comps |
| `imagegen-frontend-mobile` | Mobile screens |
| `brandkit` | Brand identity |

### SEO Analysis Skills (25)

Lokasi: `sources/claude-seo/skills/`

| Skill | Deskripsi |
|-------|-----------|
| `seo` | Main orchestrator |
| `seo-audit` | Full site audit |
| `seo-technical` | Technical SEO |
| `seo-content` | Content quality (E-E-A-T) |
| `seo-content-brief` | Content planning |
| `seo-schema` | Schema.org markup |
| `seo-geo` | AI search optimization |
| `seo-local` | Local SEO |
| `seo-maps` | Maps intelligence |
| `seo-backlinks` | Backlink analysis |
| `seo-images` | Image optimization |
| `seo-sitemap` | Sitemap management |
| `seo-cluster` | Semantic clustering |
| `seo-plan` | Strategic planning |
| `seo-programmatic` | Programmatic SEO |
| `seo-competitor-pages` | Competitor comparison |
| `seo-sxo` | Search experience |
| `seo-drift` | Drift monitoring |
| `seo-ecommerce` | E-commerce SEO |
| `seo-hreflang` | International SEO |
| `seo-flow` | Evidence-led framework |
| `seo-google` | Google API integration |
| `seo-dataforseo` | DataForSEO extension |
| `seo-image-gen` | AI image generation |
| `seo-page` | Single page analysis |

### Engineering Workflow Skills (24)

Lokasi: `sources/agent-skills/skills/`

#### Meta
| Skill | Deskripsi |
|-------|-----------|
| `using-agent-skills` | Cara menggunakan skill pack ini |

#### Define
| Skill | Deskripsi |
|-------|-----------|
| `interview-me` | Ekstraksi kebutuhan |
| `idea-refine` | Eksplorasi ide |
| `spec-driven-development` | PRD sebelum kode |

#### Plan
| Skill | Deskripsi |
|-------|-----------|
| `planning-and-task-breakdown` | Pecahan tugas |

#### Build
| Skill | Deskripsi |
|-------|-----------|
| `incremental-implementation` | Vertical slices |
| `test-driven-development` | Red-Green-Refactor |
| `context-engineering` | Informasi tepat waktu |
| `source-driven-development` | Berdasarkan dokumentasi resmi |
| `doubt-driven-development` | Review adversarial |
| `frontend-ui-engineering` | Komponen UI, a11y |
| `api-and-interface-design` | Contract-first API |

#### Verify
| Skill | Deskripsi |
|-------|-----------|
| `browser-testing-with-devtools` | Chrome DevTools MCP |
| `debugging-and-error-recovery` | Five-step triage |

#### Review
| Skill | Deskripsi |
|-------|-----------|
| `code-review-and-quality` | Five-axis review |
| `code-simplification` | Kurangi kompleksitas |
| `security-and-hardening` | Pencegahan OWASP |
| `performance-optimization` | Measure-first perf |

#### Ship
| Skill | Deskripsi |
|-------|-----------|
| `git-workflow-and-versioning` | Trunk-based git |
| `ci-cd-and-automation` | Pipelines & gates |
| `deprecation-and-migration` | Pola sunset |
| `documentation-and-adrs` | ADRs & API docs |
| `observability-and-instrumentation` | Logging & tracing |
| `shipping-and-launch` | Launch checklists |

### Writing Quality Skills (1)

Lokasi: `sources/no-ai-slop/skills/`

| Skill | Deskripsi |
|-------|-----------|
| `no-ai-slop` | Hapus 20+ pola AI slop |

---

## Protokol Eksekusi Ketat

### ⚠️ WAJIB DIPATUHI OLEH SEMUA AI AGENT

### 1. Sebelum Eksekusi (Pre-Flight)

```
□ Baca SKILL.md dari skill yang akan digunakan
□ Pahami konteks task dari user
□ Identifikasi dependency yang diperlukan
□ Pastikan environment sudah siap
□ Konfirmasi pemahaman dengan user (jika ada yang ambigu)
```

### 2. Saat Eksekusi (During)

```
□ Ikuti langkah-langkah dalam SKILL.md secara berurutan
□ Jangan skip langkah apapun
□ Jalankan test di setiap milestone
□ Dokumentasikan apa yang dilakukan
□ Jika ada error, STOP dan perbaiki dulu
```

### 3. Sesudah Eksekusi (Post-Flight)

```
□ Jalankan semua test
□ Pastikan semua test passing
□ Verifikasi hasil sesuai spec
□ Update dokumentasi jika perlu
□ Catat hasil dan lessons learned
```

### 4. Verification Gates

**Gate 1: Pre-Flight Check**
```
□ SKILL.md sudah dibaca
□ Konteks task sudah dipahami
□ Dependency sudah teridentifikasi
□ Environment sudah siap
```

**Gate 2: Mid-Flight Check**
```
□ Semua test yang sudah dijalankan PASSING
□ Tidak ada error yang terlewat
□ Kode sesuai dengan spec
```

**Gate 3: Pre-Completion Check**
```
□ Semua test PASSING
□ Documentation terupdate
□ Ada bukti verifikasi
```

**Gate 4: Final Verification**
```
□ User puas dengan hasil
□ Ada ringkasan perubahan
□ User bisa memverifikasi sendiri
```

### 5. Definition of Done

```
□ Semua test PASSING
□ Kode sesuai spec
□ Documentation terupdate
□ Ada bukti verifikasi
□ Tidak ada warning yang diabaikan
```

### 6. Anti-Rationalization

**LARANGAN:**
```
❌ "Test nanti saja" → Test WAJIB sebelum selesai
❌ "Sudah benar" → Verifikasi WAJIB ada bukti
❌ "Tidak cukup waktu" → Kualitas > Kecepatan
❌ "User tidak akan tahu" → Kita yang harus jujur
```

---

## Pedoman Token Minimization

### Prinsip: Hanya Load Yang Dibutuhkan

- **Untuk frontend design** → Baca `sources/taste-skill/skills/[target]/SKILL.md`
- **Untuk SEO** → Baca `sources/claude-seo/skills/[target]/SKILL.md`
- **Untuk engineering** → Baca `sources/agent-skills/skills/[target]/SKILL.md`
- **Untuk writing** → Baca `sources/no-ai-slop/skills/[target]/SKILL.md`

### Jangan:
- Load seluruh `sources/` sekaligus
- Baca semua SKILL.md jika hanya butuh 1 skill
- Muat references jika tidak diminta

---

## Dokumentasi Pendukung

### Untuk AI Agent

| Dokumen | Isi | Lokasi |
|---------|-----|--------|
| **AGENT.md** | Bootstrap document ini | Root |
| **Execution Checklist** | Checklist wajib sebelum/saat/sesudah eksekusi | `docs/EXECUTION_CHECKLIST.md` |
| **Anti-Rationalization** | Alasan yang DILARANG | `docs/ANTI_RATIONALIZATION.md` |
| **Verification Gates** | Checkpoint wajib | `docs/VERIFICATION_GATES.md` |
| **Definition of Done** | Kriteria selesai | `docs/DEFINITION_OF_DONE.md` |

### Untuk User

| Dokumen | Isi | Lokasi |
|---------|-----|--------|
| **README.md** | Panduan lengkap | Root |
| **HOW_TO_USE.md** | Panduan praktis | Root |
| **QUICK_REFERENCE.md** | Kartu singkat per skill | `docs/QUICK_REFERENCE.md` |
| **DECISION_TREE** | Pohon keputusan skill | `docs/DECISION_TREE.md` |
| **COMMON_WORKFLOWS** | Alur kerja umum | `docs/COMMON_WORKFLOWS.md` |

### Untuk Contributor

| Dokumen | Isi | Lokasi |
|---------|-----|--------|
| **CONTRIBUTING.md** | Panduan berkontribusi | Root |
| **SKILL_TEMPLATES** | Template membuat skill baru | `docs/SKILL_TEMPLATES.md` |

---

## Registry

Untuk pencarian skill lengkap, lihat `registry/skill_index.json`.

---

## Lisensi

Semua skill di monorepo ini berlisensi **MIT**. Lihat `LICENSE` file di masing-masing repo sumber untuk detail.
