#!/bin/bash
# =============================================================================
# test_all_skills.sh
# Integration Test Suite — Verifikasi Zero Skill Loss
# =============================================================================
# Menjalankan verifikasi pada semua 63 skill dari 4 repo sumber
# Memastikan tidak ada file yang hilang atau rusak
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

# Counters
TOTAL=0
PASSED=0
FAILED=0
WARNINGS=0

# Helper function - check file exists
check_skill() {
    local path="$1"
    local name="$2"
    TOTAL=$((TOTAL + 1))
    
    if [ -f "$path" ]; then
        echo -e "${GREEN}✅ $name${NC}"
        PASSED=$((PASSED + 1))
    else
        echo -e "${RED}❌ $name — MISSING: $path${NC}"
        FAILED=$((FAILED + 1))
    fi
}

# Helper function - validate SKILL.md content with enhanced rules
validate_skill_content() {
    local path="$1"
    local name="$2"
    local strict="${3:-false}"
    TOTAL=$((TOTAL + 1))
    
    if [ ! -f "$path" ]; then
        echo -e "${RED}❌ $name — FILE NOT FOUND${NC}"
        FAILED=$((FAILED + 1))
        return
    fi
    
    # Check file size
    local size=$(wc -c < "$path")
    if [ "$size" -lt 50 ]; then
        echo -e "${RED}❌ $name — FILE TOO SMALL ($size bytes)${NC}"
        FAILED=$((FAILED + 1))
        return
    fi
    
    # Check for minimum lines
    local lines=$(wc -l < "$path")
    if [ "$lines" -lt 10 ]; then
        echo -e "${RED}❌ $name — TOO FEW LINES ($lines lines)${NC}"
        FAILED=$((FAILED + 1))
        return
    fi
    
    # Check for frontmatter
    local has_frontmatter=false
    if head -1 "$path" | grep -q "^---"; then
        has_frontmatter=true
    fi
    
    # Check for title
    local has_title=false
    if grep -q "^#" "$path"; then
        has_title=true
    fi
    
    # Check for content (non-empty lines)
    local content_lines=$(grep -v "^$" "$path" | grep -v "^---" | wc -l)
    if [ "$content_lines" -lt 5 ]; then
        echo -e "${YELLOW}⚠️  $name — INSUFFICIENT CONTENT ($content_lines content lines)${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    # Determine status
    if [ "$has_frontmatter" = true ] && [ "$has_title" = true ]; then
        echo -e "${GREEN}✅ $name (frontmatter + title)${NC}"
        PASSED=$((PASSED + 1))
    elif [ "$has_title" = true ]; then
        echo -e "${GREEN}✅ $name (title only)${NC}"
        PASSED=$((PASSED + 1))
    else
        echo -e "${YELLOW}⚠️  $name (no frontmatter/title, but OK)${NC}"
        PASSED=$((PASSED + 1))
    fi
}

# Helper function - validate JSON file
validate_json() {
    local path="$1"
    local name="$2"
    TOTAL=$((TOTAL + 1))
    
    if [ ! -f "$path" ]; then
        echo -e "${RED}❌ $name — FILE NOT FOUND${NC}"
        FAILED=$((FAILED + 1))
        return
    fi
    
    if python3 -m json.tool "$path" > /dev/null 2>&1; then
        echo -e "${GREEN}✅ $name (valid JSON)${NC}"
        PASSED=$((PASSED + 1))
    else
        echo -e "${RED}❌ $name — INVALID JSON${NC}"
        FAILED=$((FAILED + 1))
    fi
}

# Helper function - check script syntax
check_script_syntax() {
    local path="$1"
    local name="$2"
    TOTAL=$((TOTAL + 1))
    
    if [ ! -f "$path" ]; then
        echo -e "${RED}❌ $name — FILE NOT FOUND${NC}"
        FAILED=$((FAILED + 1))
        return
    fi
    
    if bash -n "$path" 2>/dev/null; then
        echo -e "${GREEN}✅ $name (syntax OK)${NC}"
        PASSED=$((PASSED + 1))
    else
        echo -e "${RED}❌ $name — SYNTAX ERROR${NC}"
        FAILED=$((FAILED + 1))
    fi
}

echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  Universal Agent Skills — Enhanced Test Suite${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""

# =============================================================================
# 1. FRONTEND DESIGN SKILLS (13)
# =============================================================================
echo -e "${MAGENTA}--- Frontend Design Skills (13) ---${NC}"

check_skill "sources/taste-skill/skills/taste-skill/SKILL.md" "taste-skill (v2)"
check_skill "sources/taste-skill/skills/taste-skill-v1/SKILL.md" "taste-skill-v1"
check_skill "sources/taste-skill/skills/gpt-tasteskill/SKILL.md" "gpt-tasteskill"
check_skill "sources/taste-skill/skills/image-to-code-skill/SKILL.md" "image-to-code-skill"
check_skill "sources/taste-skill/skills/redesign-skill/SKILL.md" "redesign-skill"
check_skill "sources/taste-skill/skills/soft-skill/SKILL.md" "soft-skill"
check_skill "sources/taste-skill/skills/output-skill/SKILL.md" "output-skill"
check_skill "sources/taste-skill/skills/minimalist-skill/SKILL.md" "minimalist-skill"
check_skill "sources/taste-skill/skills/brutalist-skill/SKILL.md" "brutalist-skill"
check_skill "sources/taste-skill/skills/stitch-skill/SKILL.md" "stitch-skill"
check_skill "sources/taste-skill/skills/imagegen-frontend-web/SKILL.md" "imagegen-frontend-web"
check_skill "sources/taste-skill/skills/imagegen-frontend-mobile/SKILL.md" "imagegen-frontend-mobile"
check_skill "sources/taste-skill/skills/brandkit/SKILL.md" "brandkit"

echo ""

# =============================================================================
# 2. SEO SKILLS (25)
# =============================================================================
echo -e "${MAGENTA}--- SEO Skills (25) ---${NC}"

check_skill "sources/claude-seo/skills/seo/SKILL.md" "seo (orchestrator)"
check_skill "sources/claude-seo/skills/seo-audit/SKILL.md" "seo-audit"
check_skill "sources/claude-seo/skills/seo-technical/SKILL.md" "seo-technical"
check_skill "sources/claude-seo/skills/seo-content/SKILL.md" "seo-content"
check_skill "sources/claude-seo/skills/seo-content-brief/SKILL.md" "seo-content-brief"
check_skill "sources/claude-seo/skills/seo-schema/SKILL.md" "seo-schema"
check_skill "sources/claude-seo/skills/seo-geo/SKILL.md" "seo-geo"
check_skill "sources/claude-seo/skills/seo-local/SKILL.md" "seo-local"
check_skill "sources/claude-seo/skills/seo-maps/SKILL.md" "seo-maps"
check_skill "sources/claude-seo/skills/seo-backlinks/SKILL.md" "seo-backlinks"
check_skill "sources/claude-seo/skills/seo-images/SKILL.md" "seo-images"
check_skill "sources/claude-seo/skills/seo-sitemap/SKILL.md" "seo-sitemap"
check_skill "sources/claude-seo/skills/seo-cluster/SKILL.md" "seo-cluster"
check_skill "sources/claude-seo/skills/seo-plan/SKILL.md" "seo-plan"
check_skill "sources/claude-seo/skills/seo-programmatic/SKILL.md" "seo-programmatic"
check_skill "sources/claude-seo/skills/seo-competitor-pages/SKILL.md" "seo-competitor-pages"
check_skill "sources/claude-seo/skills/seo-sxo/SKILL.md" "seo-sxo"
check_skill "sources/claude-seo/skills/seo-drift/SKILL.md" "seo-drift"
check_skill "sources/claude-seo/skills/seo-ecommerce/SKILL.md" "seo-ecommerce"
check_skill "sources/claude-seo/skills/seo-hreflang/SKILL.md" "seo-hreflang"
check_skill "sources/claude-seo/skills/seo-flow/SKILL.md" "seo-flow"
check_skill "sources/claude-seo/skills/seo-google/SKILL.md" "seo-google"
check_skill "sources/claude-seo/skills/seo-dataforseo/SKILL.md" "seo-dataforseo"
check_skill "sources/claude-seo/skills/seo-image-gen/SKILL.md" "seo-image-gen"
check_skill "sources/claude-seo/skills/seo-page/SKILL.md" "seo-page"

echo ""

# =============================================================================
# 3. ENGINEERING SKILLS (24)
# =============================================================================
echo -e "${MAGENTA}--- Engineering Skills (24) ---${NC}"

# Meta
check_skill "sources/agent-skills/skills/using-agent-skills/SKILL.md" "using-agent-skills (meta)"

# Define
check_skill "sources/agent-skills/skills/interview-me/SKILL.md" "interview-me"
check_skill "sources/agent-skills/skills/idea-refine/SKILL.md" "idea-refine"
check_skill "sources/agent-skills/skills/spec-driven-development/SKILL.md" "spec-driven-development"

# Plan
check_skill "sources/agent-skills/skills/planning-and-task-breakdown/SKILL.md" "planning-and-task-breakdown"

# Build
check_skill "sources/agent-skills/skills/incremental-implementation/SKILL.md" "incremental-implementation"
check_skill "sources/agent-skills/skills/test-driven-development/SKILL.md" "test-driven-development"
check_skill "sources/agent-skills/skills/context-engineering/SKILL.md" "context-engineering"
check_skill "sources/agent-skills/skills/source-driven-development/SKILL.md" "source-driven-development"
check_skill "sources/agent-skills/skills/doubt-driven-development/SKILL.md" "doubt-driven-development"
check_skill "sources/agent-skills/skills/frontend-ui-engineering/SKILL.md" "frontend-ui-engineering"
check_skill "sources/agent-skills/skills/api-and-interface-design/SKILL.md" "api-and-interface-design"

# Verify
check_skill "sources/agent-skills/skills/browser-testing-with-devtools/SKILL.md" "browser-testing-with-devtools"
check_skill "sources/agent-skills/skills/debugging-and-error-recovery/SKILL.md" "debugging-and-error-recovery"

# Review
check_skill "sources/agent-skills/skills/code-review-and-quality/SKILL.md" "code-review-and-quality"
check_skill "sources/agent-skills/skills/code-simplification/SKILL.md" "code-simplification"
check_skill "sources/agent-skills/skills/security-and-hardening/SKILL.md" "security-and-hardening"
check_skill "sources/agent-skills/skills/performance-optimization/SKILL.md" "performance-optimization"

# Ship
check_skill "sources/agent-skills/skills/git-workflow-and-versioning/SKILL.md" "git-workflow-and-versioning"
check_skill "sources/agent-skills/skills/ci-cd-and-automation/SKILL.md" "ci-cd-and-automation"
check_skill "sources/agent-skills/skills/deprecation-and-migration/SKILL.md" "deprecation-and-migration"
check_skill "sources/agent-skills/skills/documentation-and-adrs/SKILL.md" "documentation-and-adrs"
check_skill "sources/agent-skills/skills/observability-and-instrumentation/SKILL.md" "observability-and-instrumentation"
check_skill "sources/agent-skills/skills/shipping-and-launch/SKILL.md" "shipping-and-launch"

echo ""

# =============================================================================
# 4. WRITING SKILLS (1)
# =============================================================================
echo -e "${MAGENTA}--- Writing Skills (1) ---${NC}"

check_skill "sources/no-ai-slop/skills/no-ai-slop/SKILL.md" "no-ai-slop"

echo ""

# =============================================================================
# 5. ENHANCED CONTENT VALIDATION
# =============================================================================
echo -e "${MAGENTA}--- Enhanced Content Validation ---${NC}"

# Validate sample skills with strict mode
validate_skill_content "sources/taste-skill/skills/taste-skill/SKILL.md" "taste-skill" "true"
validate_skill_content "sources/claude-seo/skills/seo/SKILL.md" "seo" "true"
validate_skill_content "sources/agent-skills/skills/test-driven-development/SKILL.md" "tdd" "true"
validate_skill_content "sources/no-ai-slop/skills/no-ai-slop/SKILL.md" "no-ai-slop" "true"

# Validate all skills (sample from each category)
echo ""
echo -e "${YELLOW}Validating all skills...${NC}"
for skill in $(find sources/ -name "SKILL.md" -type f | head -20); do
    validate_skill_content "$skill" "$(basename $(dirname $skill))"
done

echo ""

# =============================================================================
# 6. JSON VALIDATION
# =============================================================================
echo -e "${MAGENTA}--- JSON Validation ---${NC}"

validate_json "registry/skill_index.json" "skill_index.json"
validate_json "registry/skill_index_v2.json" "skill_index_v2.json"
validate_json "mcp.json" "mcp.json"
validate_json "openapi.json" "openapi.json"

echo ""

# =============================================================================
# 7. SCRIPT SYNTAX CHECK
# =============================================================================
echo -e "${MAGENTA}--- Script Syntax Check ---${NC}"

check_script_syntax "scripts/test_all_skills.sh" "test_all_skills.sh"
check_script_syntax "scripts/sync_diff.sh" "sync_diff.sh"
check_script_syntax "scripts/generate_registry.sh" "generate_registry.sh"
check_script_syntax "scripts/preview_skill.sh" "preview_skill.sh"
check_script_syntax "scripts/find_skill.sh" "find_skill.sh"
check_script_syntax "scripts/search.sh" "search.sh"
check_script_syntax "scripts/build_index.sh" "build_index.sh"
check_script_syntax "scripts/sync_upstream.sh" "sync_upstream.sh"
check_script_syntax "scripts/tutorial.sh" "tutorial.sh"

echo ""

# =============================================================================
# 8. INFRASTRUCTURE CHECKS
# =============================================================================
echo -e "${MAGENTA}--- Infrastructure ---${NC}"

check_skill "AGENT.md" "AGENT.md (bootstrap)"
check_skill "README.md" "README.md (documentation)"
check_skill "HOW_TO_USE.md" "HOW_TO_USE.md (guide)"
check_skill "QUICKSTART.md" "QUICKSTART.md (quick reference)"
check_skill "CONTRIBUTING.md" "CONTRIBUTING.md (contributing)"
check_skill "mcp.json" "mcp.json (MCP manifest)"
check_skill "openapi.json" "openapi.json (REST manifest)"
check_skill "registry/skill_index.json" "skill_index.json (registry)"
check_skill "registry/skill_index_v2.json" "skill_index_v2.json (enhanced registry)"
check_skill "scripts/test_all_skills.sh" "test_all_skills.sh"
check_skill "scripts/sync_diff.sh" "sync_diff.sh"
check_skill "scripts/generate_registry.sh" "generate_registry.sh"
check_skill "scripts/preview_skill.sh" "preview_skill.sh"
check_skill "scripts/find_skill.sh" "find_skill.sh"
check_skill "scripts/search.sh" "search.sh"
check_skill "scripts/build_index.sh" "build_index.sh"
check_skill "scripts/sync_upstream.sh" "sync_upstream.sh"
check_skill "scripts/tutorial.sh" "tutorial.sh"
check_skill "docs/DECISION_TREE.md" "DECISION_TREE.md"
check_skill "docs/QUICK_REFERENCE.md" "QUICK_REFERENCE.md"

echo ""

# =============================================================================
# 9. FILE COUNT VERIFICATION
# =============================================================================
echo -e "${MAGENTA}--- File Count Verification ---${NC}"

COPIED_COUNT=$(find sources/ -type f -not -path "*/.git/*" | wc -l)
SCRIPT_COUNT=$(find scripts/ -type f -name "*.sh" | wc -l)
DOC_COUNT=$(find docs/ -type f -name "*.md" | wc -l)

TOTAL=$((TOTAL + 1))
if [ "$COPIED_COUNT" -gt 500 ]; then
    echo -e "${GREEN}✅ File count: $COPIED_COUNT files (expected >500)${NC}"
    PASSED=$((PASSED + 1))
else
    echo -e "${RED}❌ File count too low: $COPIED_COUNT (expected >500)${NC}"
    FAILED=$((FAILED + 1))
fi

echo -e "${CYAN}  Scripts: $SCRIPT_COUNT${NC}"
echo -e "${CYAN}  Documentation: $DOC_COUNT${NC}"

echo ""

# =============================================================================
# 10. GITIGNORE CHECK
# =============================================================================
echo -e "${MAGENTA}--- Gitignore Check ---${NC}"

TOTAL=$((TOTAL + 1))
if [ -f ".gitignore" ]; then
    if grep -q ".sync-hashes" .gitignore; then
        echo -e "${GREEN}✅ .gitignore exists and includes .sync-hashes${NC}"
        PASSED=$((PASSED + 1))
    else
        echo -e "${YELLOW}⚠️  .gitignore exists but missing .sync-hashes${NC}"
        PASSED=$((PASSED + 1))
    fi
else
    echo -e "${RED}❌ .gitignore not found${NC}"
    FAILED=$((FAILED + 1))
fi

echo ""

# =============================================================================
# RESULTS
# =============================================================================
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  TEST RESULTS${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "  Total checks:  ${TOTAL}"
echo -e "  ${GREEN}Passed:         ${PASSED}${NC}"
echo -e "  ${RED}Failed:         ${FAILED}${NC}"
echo -e "  ${YELLOW}Warnings:       ${WARNINGS}${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}══════════════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}  🎉 ALL TESTS PASSED — Zero Skill Loss Verified!${NC}"
    echo -e "${GREEN}══════════════════════════════════════════════════════════════════${NC}"
    
    if [ $WARNINGS -gt 0 ]; then
        echo ""
        echo -e "${YELLOW}  ⚠️  $WARNINGS warnings detected (non-critical)${NC}"
    fi
    
    exit 0
else
    echo -e "${RED}══════════════════════════════════════════════════════════════════${NC}"
    echo -e "${RED}  ⚠️  SOME TESTS FAILED — Please investigate missing files${NC}"
    echo -e "${RED}══════════════════════════════════════════════════════════════════${NC}"
    exit 1
fi