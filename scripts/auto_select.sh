#!/bin/bash
# =============================================================================
# auto_select.sh
# Automated Skill Selection — Berdasarkan Deskripsi Task
# =============================================================================
# Menganalisis deskripsi task dan merekomendasikan skill yang tepat
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

# Check if task description is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Usage: $0 \"<task description>\"${NC}"
    echo ""
    echo "Examples:"
    echo "  $0 \"Buatkan landing page untuk startup SaaS\""
    echo "  $0 \"Audit SEO untuk website e-commerce\""
    echo "  $0 \"Buatkan fitur authentication dengan TDD\""
    echo "  $0 \"Bersihkan tulisan dari AI slop\""
    echo "  $0 \"Setup CI/CD pipeline untuk Node.js\""
    echo "  $0 \"Redesign website klien\""
    exit 1
fi

TASK="$1"

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  🤖 AUTOMATED SKILL SELECTION${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${CYAN}Task:${NC} $TASK"
echo ""

# Initialize arrays for recommended skills
RECOMMENDED=()
CATEGORY=""
PRIORITY=""
COMPLEXITY=""

# Function to add skill
add_skill() {
    local skill="$1"
    local reason="$2"
    RECOMMENDED+=("$skill|$reason")
}

# =============================================================================
# ANALYSIS: Frontend Design
# =============================================================================
if echo "$TASK" | grep -qi "landing page\|landing\|homepage\|hero section"; then
    CATEGORY="Frontend Design"
    add_skill "taste-skill" "Anti-slop frontend design"
    add_skill "output-skill" "Full output, no placeholder"
    
    if echo "$TASK" | grep -qi "minimalis\|clean\|simple\|notion\|linear"; then
        add_skill "minimalist-skill" "Minimalist UI style"
        PRIORITY="minimalist"
    elif echo "$TASK" | grep -qi "brutalis\|bold\|industrial\|hard"; then
        add_skill "brutalist-skill" "Brutalist UI style"
        PRIORITY="brutalist"
    elif echo "$TASK" | grep -qi "premium\|calm\|luxury\|elegant"; then
        add_skill "soft-skill" "Premium calm UI"
        PRIORITY="premium"
    fi
    
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "dashboard\|admin panel\|analytics\|data visualization"; then
    CATEGORY="Frontend Design"
    add_skill "minimalist-skill" "Clean dashboard UI"
    add_skill "frontend-ui-engineering" "Component architecture"
    add_skill "api-and-interface-design" "API integration"
    COMPLEXITY="high"
fi

if echo "$TASK" | grep -qi "redesign\|redesign\|modernize\|update.*ui\|update.*design"; then
    CATEGORY="Frontend Design"
    add_skill "redesign-skill" "Audit and improve existing UI"
    add_skill "minimalist-skill" "Modern minimalist style"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "screenshot\|gambar\|image.*code\|desain.*kode\|mockup"; then
    CATEGORY="Frontend Design"
    add_skill "image-to-code-skill" "Image to code pipeline"
    add_skill "taste-skill" "Apply design taste"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "brand\|logo\|color palette\|typography\|identity"; then
    CATEGORY="Frontend Design"
    add_skill "brandkit" "Brand identity design"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "mobile\|ios\|android\|app.*design"; then
    CATEGORY="Frontend Design"
    add_skill "imagegen-frontend-mobile" "Mobile screen generation"
    add_skill "taste-skill" "Apply design taste"
    COMPLEXITY="medium"
fi

# =============================================================================
# ANALYSIS: SEO
# =============================================================================
if echo "$TASK" | grep -qi "seo\|search engine\|ranking\|google\|serp"; then
    CATEGORY="SEO"
    add_skill "seo" "SEO orchestrator"
    
    if echo "$TASK" | grep -qi "audit\|full.*audit\|comprehensive\|lengkap"; then
        add_skill "seo-technical" "Technical SEO"
        add_skill "seo-content" "Content quality"
        PRIORITY="full-audit"
        COMPLEXITY="high"
    elif echo "$TASK" | grep -qi "technical\|crawl\|index\|core.*web.*vital\|performance"; then
        add_skill "seo-technical" "Technical SEO"
        COMPLEXITY="medium"
    elif echo "$TASK" | grep -qi "content\|article\|blog\|writing\|eeat"; then
        add_skill "seo-content" "Content quality"
        add_skill "seo-content-brief" "Content planning"
        COMPLEXITY="medium"
    elif echo "$TASK" | grep -qi "ecommerce\|e-commerce\|product\|toko\|shop"; then
        add_skill "seo-ecommerce" "E-commerce SEO"
        add_skill "seo-schema" "Product schema"
        COMPLEXITY="high"
    elif echo "$TASK" | grep -qi "local\|bisnis\|lokal\|google.*business\|gmb\|gbp"; then
        add_skill "seo-local" "Local SEO"
        add_skill "seo-maps" "Maps intelligence"
        COMPLEXITY="medium"
    elif echo "$TASK" | grep -qi "schema\|structured.*data\|json-ld\|markup"; then
        add_skill "seo-schema" "Schema markup"
        COMPLEXITY="low"
    elif echo "$TASK" | grep -qi "ai.*overview\|geo\|chatgpt\|perplexity\|ai.*search"; then
        add_skill "seo-geo" "AI search optimization"
        COMPLEXITY="medium"
    elif echo "$TASK" | grep -qi "backlink\|link.*building\|referring"; then
        add_skill "seo-backlinks" "Backlink analysis"
        COMPLEXITY="medium"
    elif echo "$TASK" | grep -qi "cluster\|topic\|pillar\|semantic"; then
        add_skill "seo-cluster" "Topic clustering"
        COMPLEXITY="medium"
    fi
fi

# =============================================================================
# ANALYSIS: Engineering
# =============================================================================
if echo "$TASK" | grep -qi "tdd\|test.*driven\|test.*first\|red.*green\|unit.*test"; then
    CATEGORY="Engineering"
    add_skill "test-driven-development" "TDD methodology"
    add_skill "spec-driven-development" "Write spec first"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "auth\|login\|register\|authentication\|authorization\|jwt\|session"; then
    CATEGORY="Engineering"
    add_skill "spec-driven-development" "Define requirements"
    add_skill "test-driven-development" "TDD approach"
    add_skill "security-and-hardening" "Security best practices"
    PRIORITY="security-critical"
    COMPLEXITY="high"
fi

if echo "$TASK" | grep -qi "api\|rest\|graphql\|endpoint\|contract"; then
    CATEGORY="Engineering"
    add_skill "api-and-interface-design" "API design"
    add_skill "test-driven-development" "TDD for API"
    add_skill "documentation-and-adrs" "API documentation"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "component\|ui.*library\|design.*system\|reusable"; then
    CATEGORY="Engineering"
    add_skill "frontend-ui-engineering" "Component architecture"
    add_skill "test-driven-development" "TDD for components"
    add_skill "documentation-and-adrs" "Component docs"
    COMPLEXITY="high"
fi

if echo "$TASK" | grep -qi "review\|code.*review\|pull.*request\|\bpr\b\|merge"; then
    CATEGORY="Engineering"
    add_skill "code-review-and-quality" "Code review"
    add_skill "code-simplification" "Simplify if needed"
    COMPLEXITY="low"
fi

if echo "$TASK" | grep -qi "refactor\|simplif\|clean.*up\|technical.*debt\|kompleks"; then
    CATEGORY="Engineering"
    add_skill "code-simplification" "Simplify code"
    add_skill "test-driven-development" "Ensure tests pass"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "bug\|error\|fix\|debug\|crash\|issue"; then
    CATEGORY="Engineering"
    add_skill "debugging-and-error-recovery" "Debug methodology"
    add_skill "test-driven-development" "Write regression test"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "performance\|slow\|lambat\|optim\|speed\|lighthouse"; then
    CATEGORY="Engineering"
    add_skill "performance-optimization" "Performance fix"
    add_skill "debugging-and-error-recovery" "Find root cause"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "security\|vulnerab\|owasp\|xss\|injection\|hack"; then
    CATEGORY="Engineering"
    add_skill "security-and-hardening" "Security hardening"
    add_skill "debugging-and-error-recovery" "Find vulnerability"
    PRIORITY="security-critical"
    COMPLEXITY="high"
fi

if echo "$TASK" | grep -qi "ci/cd\|pipeline\|github.*action\|deployment\|deploy"; then
    CATEGORY="Engineering"
    add_skill "ci-cd-and-automation" "CI/CD setup"
    add_skill "git-workflow-and-versioning" "Git workflow"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "launch\|release\|go.*live\|production\|ship"; then
    CATEGORY="Engineering"
    add_skill "shipping-and-launch" "Launch checklist"
    add_skill "ci-cd-and-automation" "Deployment pipeline"
    add_skill "observability-and-instrumentation" "Monitoring"
    COMPLEXITY="high"
fi

if echo "$TASK" | grep -qi "migrate\|migration\|deprecat\|sunsetting\|upgrade"; then
    CATEGORY="Engineering"
    add_skill "deprecation-and-migration" "Migration strategy"
    add_skill "test-driven-development" "Migration tests"
    add_skill "git-workflow-and-versioning" "Git strategy"
    COMPLEXITY="high"
fi

if echo "$TASK" | grep -qi "document\|docs\|readme\|adr\|adr.*decision"; then
    CATEGORY="Engineering"
    add_skill "documentation-and-adrs" "Documentation"
    COMPLEXITY="low"
fi

if echo "$TASK" | grep -qi "monitor\|observ\|log\|trace\|metric\|alert"; then
    CATEGORY="Engineering"
    add_skill "observability-and-instrumentation" "Observability setup"
    COMPLEXITY="medium"
fi

if echo "$TASK" | grep -qi "sprint\|plan\|task\|breakdown\|decompos"; then
    CATEGORY="Engineering"
    add_skill "planning-and-task-breakdown" "Task breakdown"
    add_skill "spec-driven-development" "Define scope"
    COMPLEXITY="low"
fi

if echo "$TASK" | grep -qi "requirement\|kbutuhan\|spec\|definisi\|interview\|needs"; then
    CATEGORY="Engineering"
    add_skill "interview-me" "Requirements gathering"
    add_skill "idea-refine" "Refine ideas"
    add_skill "spec-driven-development" "Write PRD"
    COMPLEXITY="low"
fi

# =============================================================================
# ANALYSIS: Writing
# =============================================================================
if echo "$TASK" | grep -qi "ai.*slop\|bersihkan.*tulis\|clean.*writing\|natural\|human.*like"; then
    CATEGORY="Writing"
    add_skill "no-ai-slop" "Remove AI slop patterns"
    COMPLEXITY="low"
fi

if echo "$TASK" | grep -qi "tulis\|writing\|blog\|article\|content"; then
    if ! echo "$TASK" | grep -qi "seo"; then
        CATEGORY="Writing"
        add_skill "no-ai-slop" "Ensure natural writing"
        COMPLEXITY="low"
    fi
fi

# =============================================================================
# OUTPUT RESULTS
# =============================================================================
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${MAGENTA}  📊 ANALISIS TASK${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ -z "$CATEGORY" ]; then
    echo -e "${YELLOW}⚠️  Tidak dapat mengidentifikasi kategori task${NC}"
    echo ""
    echo -e "${CYAN}Tips:${NC}"
    echo "  • Gunakan kata kunci seperti: landing page, seo, tdd, auth, dll"
    echo "  • Lihat decision tree: docs/DECISION_TREE.md"
    echo "  • Gunakan find tool: ./scripts/find_skill.sh <keyword>"
    echo ""
    exit 0
fi

echo -e "  ${CYAN}Kategori:${NC}     $CATEGORY"
echo -e "  ${CYAN}Complexity:${NC}   ${COMPLEXITY:-unknown}"
if [ -n "$PRIORITY" ]; then
    echo -e "  ${CYAN}Priority:${NC}     $PRIORITY"
fi
echo ""

# =============================================================================
# RECOMMENDED SKILLS
# =============================================================================
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${MAGENTA}  🎯 SKILL YANG DIREKOMENDASIKAN${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

for i in "${!RECOMMENDED[@]}"; do
    IFS='|' read -r skill reason <<< "${RECOMMENDED[$i]}"
    echo -e "  ${GREEN}$((i+1)). ${YELLOW}$skill${NC}"
    echo -e "     ${reason}"
    echo ""
done

# =============================================================================
# SKILL DETAILS
# =============================================================================
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${MAGENTA}  📋 DETAIL SKILL${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

for i in "${!RECOMMENDED[@]}"; do
    IFS='|' read -r skill reason <<< "${RECOMMENDED[$i]}"
    
    # Find skill path
    SKILL_PATH=""
    for dir in sources/*/skills/*/; do
        if [ "$(basename "$dir")" = "$skill" ]; then
            SKILL_PATH="${dir}SKILL.md"
            break
        fi
    done
    
    if [ -n "$SKILL_PATH" ] && [ -f "$SKILL_PATH" ]; then
        echo -e "  ${CYAN}[$skill]${NC}"
        echo -e "  Path: ${SKILL_PATH}"
        
        # Get description from frontmatter
        DESC=$(grep -m 1 "^description:" "$SKILL_PATH" 2>/dev/null | sed 's/^description:[[:space:]]*//' | sed 's/^"//' | sed 's/"$//' | head -c 120)
        if [ -n "$DESC" ]; then
            echo -e "  Desc: ${DESC:0:120}$([ ${#DESC} -gt 120 ] && echo "...")"
        fi
        echo ""
    fi
done

# =============================================================================
# PROMPT TEMPLATE
# =============================================================================
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${MAGENTA}  💡 PROMPT TEMPLATE${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Build prompt
PROMPT="Baca skill dari"
FIRST=true

for i in "${!RECOMMENDED[@]}"; do
    IFS='|' read -r skill reason <<< "${RECOMMENDED[$i]}"
    
    for dir in sources/*/skills/*/; do
        if [ "$(basename "$dir")" = "$skill" ]; then
            if [ "$FIRST" = true ]; then
                PROMPT="$PROMPT ${dir}SKILL.md"
                FIRST=false
            else
                PROMPT="$PROMPT\n   dan ${dir}SKILL.md"
            fi
            break
        fi
    done
done

echo -e "${GREEN}Copy prompt ini ke AI Agent:${NC}"
echo ""
echo -e "${YELLOW}\"${PROMPT}${NC}"
echo -e "${YELLOW}   ${TASK}\"${NC}"
echo ""

# =============================================================================
# QUICK ACTIONS
# =============================================================================
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${MAGENTA}  ⚡ QUICK ACTIONS${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

FIRST_SKILL=$(IFS='|' read -r skill reason <<< "${RECOMMENDED[0]}"; echo "$skill")

echo -e "  Preview skill utama:"
echo -e "    ${GREEN}./scripts/preview_skill.sh $FIRST_SKILL${NC}"
echo ""
echo -e "  Baca skill:"
echo -e "    ${GREEN}cat sources/*/skills/$FIRST_SKILL/SKILL.md${NC}"
echo ""
echo -e "  Lihat kombinasi:"
echo -e "    ${GREEN}cat docs/SKILL_COMBINATIONS.md${NC}"
echo ""

echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  ✅ Skill selection complete!${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""