# Universal Agent Skills

> **Dokumen Bootstrap Inti** — Wajib dibaca oleh AI Agent saat berinteraksi dengan repo ini.

## Taxonomy Skill

Monorepo ini berisi **63 skills** dari 4 repositori sumber, dikonsolidasi tanpa kehilangan 1 fungsi pun.

### Lokasi Skill

| Kategori | Lokasi | Jumlah | Sumber |
|----------|--------|--------|--------|
| **Frontend Design** | `sources/taste-skill/skills/` | 13 | taste-skill |
| **SEO Analysis** | `sources/claude-seo/skills/` | 25 | claude-seo |
| **Engineering Workflow** | `sources/agent-skills/skills/` | 24 | agent-skills |
| **Writing Quality** | `sources/no-ai-slop/skills/` | 1 | no-ai-slop |

---

## Frontend Design Skills (13)

Lokasi: `sources/taste-skill/skills/`

| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `taste-skill` | `sources/taste-skill/skills/taste-skill/` | Anti-slop frontend v2 (experimental) |
| `taste-skill-v1` | `sources/taste-skill/skills/taste-skill-v1/` | Legacy v1 |
| `gpt-tasteskill` | `sources/taste-skill/skills/gpt-tasteskill/` | GPT/Codex strict variant |
| `image-to-code-skill` | `sources/taste-skill/skills/image-to-code-skill/` | Image-first pipeline |
| `redesign-skill` | `sources/taste-skill/skills/redesign-skill/` | Audit project existing |
| `soft-skill` | `sources/taste-skill/skills/soft-skill/` | Premium calm UI |
| `output-skill` | `sources/taste-skill/skills/output-skill/` | Anti-truncation |
| `minimalist-skill` | `sources/taste-skill/skills/minimalist-skill/` | Editorial UI |
| `brutalist-skill` | `sources/taste-skill/skills/brutalist-skill/` | Industrial UI |
| `stitch-skill` | `sources/taste-skill/skills/stitch-skill/` | Google Stitch compat |
| `imagegen-frontend-web` | `sources/taste-skill/skills/imagegen-frontend-web/` | Web comps |
| `imagegen-frontend-mobile` | `sources/taste-skill/skills/imagegen-frontend-mobile/` | Mobile screens |
| `brandkit` | `sources/taste-skill/skills/brandkit/` | Brand identity |

---

## SEO Analysis Skills (25)

Lokasi: `sources/claude-seo/skills/`

| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `seo` | `sources/claude-seo/skills/seo/` | Main orchestrator |
| `seo-audit` | `sources/claude-seo/skills/seo-audit/` | Full site audit |
| `seo-technical` | `sources/claude-seo/skills/seo-technical/` | Technical SEO |
| `seo-content` | `sources/claude-seo/skills/seo-content/` | Content quality (E-E-A-T) |
| `seo-content-brief` | `sources/claude-seo/skills/seo-content-brief/` | Content planning |
| `seo-schema` | `sources/claude-seo/skills/seo-schema/` | Schema.org markup |
| `seo-geo` | `sources/claude-seo/skills/seo-geo/` | AI search optimization |
| `seo-local` | `sources/claude-seo/skills/seo-local/` | Local SEO |
| `seo-maps` | `sources/claude-seo/skills/seo-maps/` | Maps intelligence |
| `seo-backlinks` | `sources/claude-seo/skills/seo-backlinks/` | Backlink analysis |
| `seo-images` | `sources/claude-seo/skills/seo-images/` | Image optimization |
| `seo-sitemap` | `sources/claude-seo/skills/seo-sitemap/` | Sitemap management |
| `seo-cluster` | `sources/claude-seo/skills/seo-cluster/` | Semantic clustering |
| `seo-plan` | `sources/claude-seo/skills/seo-plan/` | Strategic planning |
| `seo-programmatic` | `sources/claude-seo/skills/seo-programmatic/` | Programmatic SEO |
| `seo-competitor-pages` | `sources/claude-seo/skills/seo-competitor-pages/` | Competitor comparison |
| `seo-sxo` | `sources/claude-seo/skills/seo-sxo/` | Search experience |
| `seo-drift` | `sources/claude-seo/skills/seo-drift/` | Drift monitoring |
| `seo-ecommerce` | `sources/claude-seo/skills/seo-ecommerce/` | E-commerce SEO |
| `seo-hreflang` | `sources/claude-seo/skills/seo-hreflang/` | International SEO |
| `seo-flow` | `sources/claude-seo/skills/seo-flow/` | Evidence-led framework |
| `seo-google` | `sources/claude-seo/skills/seo-google/` | Google API integration |
| `seo-dataforseo` | `sources/claude-seo/skills/seo-dataforseo/` | DataForSEO extension |
| `seo-image-gen` | `sources/claude-seo/skills/seo-image-gen/` | AI image generation |
| `seo-page` | `sources/claude-seo/skills/seo-page/` | Single page analysis |

---

## Engineering Workflow Skills (24)

Lokasi: `sources/agent-skills/skills/`

### Meta
| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `using-agent-skills` | `sources/agent-skills/skills/using-agent-skills/` | Cara menggunakan skill pack ini |

### Define
| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `interview-me` | `sources/agent-skills/skills/interview-me/` | Ekstraksi kebutuhan |
| `idea-refine` | `sources/agent-skills/skills/idea-refine/` | Eksplorasi ide |
| `spec-driven-development` | `sources/agent-skills/skills/spec-driven-development/` | PRD sebelum kode |

### Plan
| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `planning-and-task-breakdown` | `sources/agent-skills/skills/planning-and-task-breakdown/` | Pecahan tugas |

### Build
| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `incremental-implementation` | `sources/agent-skills/skills/incremental-implementation/` | Vertical slices |
| `test-driven-development` | `sources/agent-skills/skills/test-driven-development/` | Red-Green-Refactor |
| `context-engineering` | `sources/agent-skills/skills/context-engineering/` | Informasi tepat waktu |
| `source-driven-development` | `sources/agent-skills/skills/source-driven-development/` | Berdasarkan dokumentasi resmi |
| `doubt-driven-development` | `sources/agent-skills/skills/doubt-driven-development/` | Review adversarial |
| `frontend-ui-engineering` | `sources/agent-skills/skills/frontend-ui-engineering/` | Komponen UI, a11y |
| `api-and-interface-design` | `sources/agent-skills/skills/api-and-interface-design/` | Contract-first API |

### Verify
| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `browser-testing-with-devtools` | `sources/agent-skills/skills/browser-testing-with-devtools/` | Chrome DevTools MCP |
| `debugging-and-error-recovery` | `sources/agent-skills/skills/debugging-and-error-recovery/` | Five-step triage |

### Review
| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `code-review-and-quality` | `sources/agent-skills/skills/code-review-and-quality/` | Five-axis review |
| `code-simplification` | `sources/agent-skills/skills/code-simplification/` | Kurangi kompleksitas |
| `security-and-hardening` | `sources/agent-skills/skills/security-and-hardening/` | Pencegahan OWASP |
| `performance-optimization` | `sources/agent-skills/skills/performance-optimization/` | Measure-first perf |

### Ship
| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `git-workflow-and-versioning` | `sources/agent-skills/skills/git-workflow-and-versioning/` | Trunk-based git |
| `ci-cd-and-automation` | `sources/agent-skills/skills/ci-cd-and-automation/` | Pipelines & gates |
| `deprecation-and-migration` | `sources/agent-skills/skills/deprecation-and-migration/` | Pola sunset |
| `documentation-and-adrs` | `sources/agent-skills/skills/documentation-and-adrs/` | ADRs & API docs |
| `observability-and-instrumentation` | `sources/agent-skills/skills/observability-and-instrumentation/` | Logging & tracing |
| `shipping-and-launch` | `sources/agent-skills/skills/shipping-and-launch/` | Launch checklists |

---

## Writing Quality Skills (1)

Lokasi: `sources/no-ai-slop/skills/`

| Skill | Lokasi | Deskripsi |
|-------|--------|-----------|
| `no-ai-slop` | `sources/no-ai-slop/skills/no-ai-slop/` | Hapus 20+ pola AI slop |

---

## Protokol Eksekusi Ketat

### Aturan Wajib

1. **Jangan hapus file apapun** dari `sources/` — itu backup permanen
2. **Jangan modifikasi file** di `sources/` — baca apa adanya
3. **Referensikan file langsung** dari `sources/` saat bekerja
4. **Jangan ubah kode** di `sources/` tanpa memvalidasi test suite

### Cara Menggunakan Skill

1. Identifikasi skill yang dibutuhkan dari tabel di atas
2. Baca `SKILL.md` dari lokasi yang tercantum
3. Ikuti instruksi dalam SKILL.md
4. Untuk SEO skills, gunakan scripts dari `sources/claude-seo/scripts/`
5. Untuk engineering skills, gunakan references dari `sources/agent-skills/references/`

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

## Registry

Untuk pencarian skill lengkap, lihat `registry/skill_index.json`.

---

## Lisensi

Semua skill di monorepo ini berlisensi **MIT**. Lihat `LICENSE` file di masing-masing repo sumber untuk detail.
