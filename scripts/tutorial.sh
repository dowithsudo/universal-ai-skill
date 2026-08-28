#!/bin/bash
# =============================================================================
# tutorial.sh
# Interactive Learning Mode — Step-by-Step Guide for Beginners
# =============================================================================
# Tutorial interaktif untuk memahami cara menggunakan Universal Agent Skills
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Clear screen
clear

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  🎓 UNIVERSAL AGENT SKILLS — INTERACTIVE TUTORIAL${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${CYAN}Selamat datang di tutorial interaktif Universal Agent Skills!${NC}"
echo -e "${CYAN}Tutorial ini akan membimbing Anda langkah demi langkah.${NC}"
echo ""

# Function to show step
show_step() {
    local step_num="$1"
    local title="$2"
    local content="$3"
    local action="$4"
    
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${MAGENTA}  STEP $step_num: $title${NC}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "$content"
    echo ""
    
    if [ -n "$action" ]; then
        echo -e "${YELLOW}💡 Aksi: $action${NC}"
        echo ""
    fi
    
    echo -e "${BLUE}Tekan Enter untuk melanjutkan...${NC}"
    read -r
    clear
}

# Function to show tip
show_tip() {
    local tip="$1"
    echo -e "${GREEN}💡 TIP: $tip${NC}"
    echo ""
}

# Function to show warning
show_warning() {
    local warning="$1"
    echo -e "${RED}⚠️  PERINGATAN: $warning${NC}"
    echo ""
}

# Step 1: Welcome
show_step 1 "MEMAHAMI KONSEP" "
${CYAN}Apa itu Universal Agent Skills?${NC}

Universal Agent Skills adalah kumpulan ${YELLOW}63 instruksi (SKILL.md)${NC} yang bisa dibaca oleh AI Agent.

${GREEN}Analogi Sederhana:${NC}
┌─────────────────────────────────────────────────────────────┐
│  🧠 AI Agent = Koki (bisa masak apa saja)                  │
│  📚 SKILL.md = Resep masakan (instruksi langkah demi langkah)│
│  📁 Repository ini = Kumpulan 63 resep masakan              │
└─────────────────────────────────────────────────────────────┘

Jadi, repository ini ${RED}bukan program${NC} yang dijalankan, tapi ${GREEN}kumpulan instruksi${NC} yang dibaca oleh AI Agent agar ia tahu cara mengerjakan tugas tertentu.

${YELLOW}Contoh:${NC}
• Skill 'taste-skill' → Instruksi untuk membuat UI yang bagus
• Skill 'seo' → Instruksi untuk audit SEO website
• Skill 'test-driven-development' → Instruksi untuk coding dengan TDD
" "Buka file AGENT.md untuk melihat overview lengkap"

# Step 2: Repository Structure
show_step 2 "STRUKTUR REPOSITORY" "
${CYAN}Mari kita lihat struktur folder repository ini:${NC}

${GREEN}universal-agent-skills/${NC}
├── ${YELLOW}AGENT.md${NC}              # 📖 Bootstrap document (WAJIB DIBACA)
├── ${YELLOW}README.md${NC}             # 📖 Panduan lengkap
├── ${YELLOW}QUICKSTART.md${NC}         # 📖 Quick reference
│
├── ${YELLOW}sources/${NC}              # 📁 SEMUA SKILL ADA DI SINI
│   ├── ${CYAN}taste-skill/${NC}      #    🎨 13 skill frontend design
│   ├── ${CYAN}claude-seo/${NC}       #    🔍 25 skill SEO
│   ├── ${CYAN}agent-skills/${NC}     #    ⚙️ 24 skill engineering
│   └── ${CYAN}no-ai-slop/${NC}       #    ✍️ 1 skill writing
│
├── ${YELLOW}registry/${NC}             # 📋 Index semua skill (skill_index.json)
├── ${YELLOW}scripts/${NC}              # 🔧 Tools verifikasi
└── ${YELLOW}docs/${NC}                 # 📚 Dokumentasi tambahan

${RED}PENTING:${NC} Semua skill original tersimpan di ${YELLOW}sources/${NC} — tidak ada yang dihapus atau dimodifikasi!
" "Jalankan: ls -la universal-agent-skills/"

# Step 3: Finding Skills
show_step 3 "MENCARI SKILL" "
${CYAN}Bagaimana cara menemukan skill yang tepat?${NC}

${GREEN}Cara 1: Gunakan Decision Tree${NC}
Buka ${YELLOW}docs/DECISION_TREE.md${NC} untuk melihat panduan visual.

${GREEN}Cara 2: Gunakan Find Tool${NC}
Jalankan script pencarian:
${BLUE}./scripts/find_skill.sh${NC}

${GREEN}Cara 3: Cari Berdasarkan Kategori${NC}
${BLUE}ls sources/taste-skill/skills/     # Frontend Design${NC}
${BLUE}ls sources/claude-seo/skills/      # SEO${NC}
${BLUE}ls sources/agent-skills/skills/    # Engineering${NC}
${BLUE}ls sources/no-ai-slop/skills/      # Writing${NC}

${GREEN}Cara 4: Gunakan Registry${NC}
${BLUE}cat registry/skill_index.json | head -50${NC}
" "Coba jalankan: ./scripts/find_skill.sh design"

# Step 4: Previewing Skills
show_step 4 "MEMPREVIEW SKILL" "
${CYAN}Sebelum menggunakan skill, Anda bisa melihat preview-nya:${NC}

${GREEN}Gunakan Preview Tool:${NC}
${BLUE}./scripts/preview_skill.sh <nama-skill>${NC}

${YELLOW}Contoh:${NC}
${BLUE}./scripts/preview_skill.sh taste-skill${NC}

Preview akan menampilkan:
• 📋 Info dasar (kategori, ukuran file)
• 📝 Deskripsi skill
• ✅ Fitur yang tersedia
• 💡 Contoh prompt
• 📂 Struktur file
" "Coba jalankan: ./scripts/preview_skill.sh taste-skill"

# Step 5: Using Skills
show_step 5 "MENGGUNAKAN SKILL" "
${CYAN}Bagaimana cara menggunakan skill?${NC}

${GREEN}Cara 1: Baca langsung SKILL.md${NC}
${BLUE}cat sources/taste-skill/skills/taste-skill/SKILL.md${NC}

${GREEN}Cara 2: Berikan instruksi ke AI Agent${NC}
${YELLOW}Contoh prompt:${NC}
${GREEN}\"Baca skill dari sources/taste-skill/skills/taste-skill/SKILL.md
Lalu buatkan landing page untuk produk SaaS dengan design premium\"${NC}

${GREEN}Cara 3: Gunakan dengan Claude/Cursor${NC}
${YELLOW}Claude:${NC} Buka repository ini, otomatis detect AGENT.md
${YELLOW}Cursor:${NC} Copy SKILL.md ke .cursor/rules/

${RED}PENTING:${NC}
✅ Selalu baca SKILL.md sebelum menggunakan
✅ Berikan konteks yang jelas
✅ Ikuti langkah-langkah dalam SKILL.md
❌ Jangan skip langkah apapun
" "Coba baca: cat sources/agent-skills/skills/test-driven-development/SKILL.md"

# Step 6: Practical Example
show_step 6 "CONTOH PRAKTIS" "
${CYAN}Mari kita coba contoh nyata:${NC}

${YELLOW}Membuat Landing Page dengan TDD${NC}

${GREEN}Step 1: Pilih Skill${NC}
Kita butuh:
• ${YELLOW}taste-skill${NC} untuk design
• ${YELLOW}test-driven-development${NC} untuk TDD approach

${GREEN}Step 2: Baca Skill${NC}
${BLUE}cat sources/taste-skill/skills/taste-skill/SKILL.md${NC}

${GREEN}Step 3: Berikan Instruksi${NC}
${YELLOW}Prompt:${NC}
${GREEN}\"Baca skill dari sources/taste-skill/skills/taste-skill/SKILL.md
Lalu buatkan landing page untuk produk AI writing tool dengan:
- Hero section yang menarik
- Pricing section
- Testimonial section
Gunakan design premium seperti di skill\"${NC}

${GREEN}Step 4: AI Agent Akan:${NC}
1. Membaca SKILL.md
2. Mengikuti instruksi design
3. Implementasi dengan layout, tipografi, motion
4. Menghasilkan landing page yang unik dan profesional
" "Buat prompt sendiri berdasarkan contoh di atas"

# Step 7: Verification
show_step 7 "VERIFIKASI" "
${CYAN}Bagaimana memastikan semua skill masih utuh?${NC}

${GREEN}Jalankan Test Suite:${NC}
${BLUE}./scripts/test_all_skills.sh${NC}

Test akan memeriksa:
• ✅ Semua 63 skill ada
• ✅ File SKILL.md tidak corrupt
• ✅ Infrastructure files ada
• ✅ File count > 500

${GREEN}Cek Perubahan File:${NC}
${BLUE}./scripts/sync_diff.sh${NC}

Script ini akan:
• Generate hash semua file
• Bandingkan dengan state sebelumnya
• Tampilkan file yang berubah

${YELLOW}Contoh output test:${NC}
${GREEN}✅ taste-skill (v2)
✅ seo (orchestrator)
✅ test-driven-development
✅ no-ai-slop
...
🎉 ALL TESTS PASSED — Zero Skill Loss Verified!${NC}
" "Jalankan: ./scripts/test_all_skills.sh"

# Step 8: Tips and Best Practices
show_step 8 "TIPS DAN BEST PRACTICES" "
${CYAN}Berikut tips untuk penggunaan optimal:${NC}

${GREEN}✅ DO:${NC}
• Baca AGENT.md saat pertama kali
• Gunakan preview tool sebelum memakai skill
• Berikan konteks yang jelas ke AI Agent
• Jalankan test secara berkala
• Gunakan decision tree untuk memilih skill

${RED}❌ DON'T:${NC}
• Jangan load semua skill sekaligus (boros token)
• Jangan skip langkah dalam SKILL.md
• Jangan edit file di sources/ (backup permanen)
• Jangan gunakan skill tanpa membaca dulu

${YELLOW}💡 Token Minimization:${NC}
${GREEN}BENAR:${NC} Baca hanya SKILL.md yang dibutuhkan
${RED}SALAH:${NC} find sources/ -name \"SKILL.md\" (load semua)

${YELLOW}💡 Skill Combination:${NC}
Gabungkan beberapa skill untuk hasil optimal:
• Landing page: taste-skill + output-skill
• Full audit: seo + seo-technical + seo-content
• New feature: spec-driven-development + test-driven-development
" "Ingat tips ini saat menggunakan Universal Agent Skills"

# Step 9: Next Steps
show_step 9 "LANGKAH SELANJUTNYA" "
${CYAN}Selamat! Anda sudah menyelesaikan tutorial!${NC}

${GREEN}Apa yang sudah Anda pelajari:${NC}
✅ Apa itu Universal Agent Skills
✅ Struktur repository
✅ Cara mencari skill
✅ Cara mempreview skill
✅ Cara menggunakan skill
✅ Contoh praktis
✅ Verifikasi skill
✅ Tips dan best practices

${YELLOW}Langkah selanjutnya:${NC}

1. ${GREEN}Eksplorasi Skill${NC}
   Jalankan: ${BLUE}./scripts/find_skill.sh${NC}

2. ${GREEN}Baca Documentation${NC}
   • ${YELLOW}docs/DECISION_TREE.md${NC} - Panduan visual
   • ${YELLOW}docs/QUICK_REFERENCE.md${NC} - Quick reference

3. ${GREEN}Mulai Proyek${NC}
   Pilih skill yang sesuai dan mulai coding!

4. ${GREEN}Berkontribusi${NC}
   Lihat ${YELLOW}CONTRIBUTING.md${NC} untuk panduan

${BLUE}══════════════════════════════════════════════════════════════════${NC}
${GREEN}🎉 Tutorial selesai! Selamat menggunakan Universal Agent Skills!${NC}
${BLUE}══════════════════════════════════════════════════════════════════${NC}
"

# Final summary
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${MAGENTA}  RINGKASAN TUTORIAL${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${GREEN}✓${NC} Concept understanding"
echo -e "  ${GREEN}✓${NC} Repository structure"
echo -e "  ${GREEN}✓${NC} Finding skills"
echo -e "  ${GREEN}✓${NC} Previewing skills"
echo -e "  ${GREEN}✓${NC} Using skills"
echo -e "  ${GREEN}✓${NC} Practical example"
echo -e "  ${GREEN}✓${NC} Verification"
echo -e "  ${GREEN}✓${NC} Tips and best practices"
echo -e "  ${GREEN}✓${NC} Next steps"
echo ""
echo -e "${BLUE}Untuk menjalankan tutorial lagi:${NC}"
echo -e "  ${GREEN}./scripts/tutorial.sh${NC}"
echo ""
echo -e "${BLUE}Untuk bantuan:${NC}"
echo -e "  ${GREEN}./scripts/find_skill.sh --help${NC}"
echo -e "  ${GREEN}./scripts/preview_skill.sh --help${NC}"
echo ""