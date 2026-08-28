#!/bin/bash
# =============================================================================
# preview_skill.sh
# Skill Preview System — Quick Summary of Any Skill
# =============================================================================
# Menampilkan ringkasan cepat dari skill tanpa membaca seluruh SKILL.md
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

# Check if skill name is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Usage: $0 <skill-name>${NC}"
    echo ""
    echo "Examples:"
    echo "  $0 taste-skill"
    echo "  $0 seo"
    echo "  $0 test-driven-development"
    echo ""
    echo "List all skills:"
    echo "  ls sources/*/skills/"
    exit 1
fi

SKILL_NAME="$1"

# Find the skill
SKILL_PATH=""
for dir in sources/*/skills/*/; do
    if [ "$(basename "$dir")" = "$SKILL_NAME" ]; then
        SKILL_PATH="$dir"
        break
    fi
done

if [ -z "$SKILL_PATH" ]; then
    echo -e "${RED}❌ Skill '$SKILL_NAME' not found${NC}"
    echo ""
    echo "Available skills:"
    for dir in sources/*/skills/*/; do
        echo "  - $(basename "$dir")"
    done
    exit 1
fi

SKILL_FILE="${SKILL_PATH}SKILL.md"

if [ ! -f "$SKILL_FILE" ]; then
    echo -e "${RED}❌ SKILL.md not found at: $SKILL_FILE${NC}"
    exit 1
fi

# Get file info
FILE_SIZE=$(wc -c < "$SKILL_FILE")
FILE_SIZE_KB=$((FILE_SIZE / 1024))
LINE_COUNT=$(wc -l < "$SKILL_FILE")

# Extract frontmatter
HAS_FRONTMATTER=false
if head -1 "$SKILL_FILE" | grep -q "^---"; then
    HAS_FRONTMATTER=true
fi

# Extract title (first # heading)
TITLE=$(grep -m 1 "^#" "$SKILL_FILE" | sed 's/^#\+\s*//')

# Extract description (first non-empty, non-heading line after frontmatter)
DESCRIPTION=""
if [ "$HAS_FRONTMATTER" = true ]; then
    # Skip frontmatter and get first meaningful line
    DESCRIPTION=$(sed -n '/^---$/,/^---$/d; p' "$SKILL_FILE" | head -10 | grep -v "^#" | grep -v "^$" | head -1)
else
    # Get first non-heading, non-empty line
    DESCRIPTION=$(grep -v "^#" "$SKILL_FILE" | grep -v "^$" | head -1)
fi

# Check for examples
HAS_EXAMPLES=false
if grep -qi "example\|contoh\|prompt" "$SKILL_FILE"; then
    HAS_EXAMPLES=true
fi

# Check for references
HAS_REFERENCES=false
if grep -qi "reference\|referensi\|see also" "$SKILL_FILE"; then
    HAS_REFERENCES=true
fi

# Extract sample prompt (first quoted text or prompt example)
SAMPLE_PROMPT=""
SAMPLE_PROMPT=$(grep -m 1 -oP '(?<=")[^"]+(?=")' "$SKILL_FILE" 2>/dev/null || true)
if [ -z "$SAMPLE_PROMPT" ]; then
    SAMPLE_PROMPT=$(grep -m 1 -oP "(?<=')[^']+(?=')" "$SKILL_FILE" 2>/dev/null || true)
fi

# Determine category
CATEGORY=""
if [[ "$SKILL_PATH" == *"taste-skill"* ]]; then
    CATEGORY="Frontend Design"
    CATEGORY_ICON="🎨"
elif [[ "$SKILL_PATH" == *"claude-seo"* ]]; then
    CATEGORY="SEO Analysis"
    CATEGORY_ICON="🔍"
elif [[ "$SKILL_PATH" == *"agent-skills"* ]]; then
    CATEGORY="Engineering Workflow"
    CATEGORY_ICON="⚙️"
elif [[ "$SKILL_PATH" == *"no-ai-slop"* ]]; then
    CATEGORY="Writing Quality"
    CATEGORY_ICON="✍️"
fi

# Print preview
echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  SKILL PREVIEW: ${CYAN}$SKILL_NAME${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""

echo -e "${MAGENTA}📋 Basic Info${NC}"
echo -e "  Category:     ${CATEGORY_ICON} ${CATEGORY}"
echo -e "  Title:        ${TITLE:-$SKILL_NAME}"
echo -e "  File Size:    ${FILE_SIZE_KB}KB (${LINE_COUNT} lines)"
echo -e "  Location:     ${SKILL_PATH}"
echo ""

echo -e "${MAGENTA}📝 Description${NC}"
echo -e "  ${DESCRIPTION:-No description available}"
echo ""

echo -e "${MAGENTA}✅ Features${NC}"
echo -e "  Frontmatter:  $([ "$HAS_FRONTMATTER" = true ] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}")"
echo -e "  Examples:     $([ "$HAS_EXAMPLES" = true ] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}")"
echo -e "  References:   $([ "$HAS_REFERENCES" = true ] && echo -e "${GREEN}✓${NC}" || echo -e "${RED}✗${NC}")"
echo ""

if [ -n "$SAMPLE_PROMPT" ]; then
    echo -e "${MAGENTA}💡 Sample Prompt${NC}"
    echo -e "  ${YELLOW}\"${SAMPLE_PROMPT:0:100}$([ ${#SAMPLE_PROMPT} -gt 100 ] && echo "...")\"${NC}"
    echo ""
fi

echo -e "${MAGENTA}📂 File Structure${NC}"
if [ -d "${SKILL_PATH}references" ]; then
    echo -e "  ├── SKILL.md"
    echo -e "  └── references/"
    ls -1 "${SKILL_PATH}references" 2>/dev/null | head -3 | while read -r ref; do
        echo -e "      ├── $ref"
    done
    REF_COUNT=$(ls -1 "${SKILL_PATH}references" 2>/dev/null | wc -l)
    if [ "$REF_COUNT" -gt 3 ]; then
        echo -e "      └── ... ($REF_COUNT files total)"
    fi
else
    echo -e "  └── SKILL.md"
fi
echo ""

echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "  To use: ${GREEN}cat ${SKILL_FILE}${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""