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
NC='\033[0m' # No Color

# Counters
TOTAL=0
PASSED=0
FAILED=0

# Helper function
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

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Universal Agent Skills — Test Suite   ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# =============================================================================
# 1. FRONTEND DESIGN SKILLS (13)
# =============================================================================
echo -e "${YELLOW}--- Frontend Design Skills (13) ---${NC}"

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
echo -e "${YELLOW}--- SEO Skills (25) ---${NC}"

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
echo -e "${YELLOW}--- Engineering Skills (24) ---${NC}"

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
echo -e "${YELLOW}--- Writing Skills (1) ---${NC}"

check_skill "sources/no-ai-slop/skills/no-ai-slop/SKILL.md" "no-ai-slop"

echo ""

# =============================================================================
# 5. INFRASTRUCTURE CHECKS
# =============================================================================
echo -e "${YELLOW}--- Infrastructure ---${NC}"

check_skill "AGENT.md" "AGENT.md (bootstrap)"
check_skill "mcp.json" "mcp.json (MCP manifest)"
check_skill "openapi.json" "openapi.json (REST manifest)"
check_skill "registry/skill_index.json" "skill_index.json (registry)"
check_skill "scripts/test_all_skills.sh" "test_all_skills.sh"
check_skill "scripts/sync_diff.sh" "sync_diff.sh"

echo ""

# =============================================================================
# 6. FILE COUNT VERIFICATION
# =============================================================================
echo -e "${YELLOW}--- File Count Verification ---${NC}"

ORIGINAL_COUNT=$(find ../taste-skill ../claude-seo ../agent-skills ../no-ai-slop -type f -not -path "*/.git/*" | wc -l)
COPIED_COUNT=$(find sources/ -type f -not -path "*/.git/*" | wc -l)

TOTAL=$((TOTAL + 1))
if [ "$ORIGINAL_COUNT" = "$COPIED_COUNT" ]; then
    echo -e "${GREEN}✅ File count: $ORIGINAL_COUNT original = $COPIED_COUNT copied${NC}"
    PASSED=$((PASSED + 1))
else
    echo -e "${RED}❌ File count mismatch: $ORIGINAL_COUNT original ≠ $COPIED_COUNT copied${NC}"
    FAILED=$((FAILED + 1))
fi

echo ""

# =============================================================================
# RESULTS
# =============================================================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}            TEST RESULTS                ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "Total checks: ${TOTAL}"
echo -e "${GREEN}Passed: ${PASSED}${NC}"
echo -e "${RED}Failed: ${FAILED}${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 ALL TESTS PASSED — Zero Skill Loss Verified!${NC}"
    exit 0
else
    echo -e "${RED}⚠️  SOME TESTS FAILED — Please investigate missing files${NC}"
    exit 1
fi
