#!/bin/bash
# =============================================================================
# find_skill.sh
# Skill Discovery Tool — Interactive Search & Filtering
# =============================================================================
# Mencari skill berdasarkan keyword, kategori, tag, atau use case
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

# Default values
SEARCH_TERM=""
CATEGORY=""
TAG=""
DIFFICULTY=""
USE_CASE=""
LIST_ALL=false
SHOW_HELP=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--search)
            SEARCH_TERM="$2"
            shift 2
            ;;
        -c|--category)
            CATEGORY="$2"
            shift 2
            ;;
        -t|--tag)
            TAG="$2"
            shift 2
            ;;
        -d|--difficulty)
            DIFFICULTY="$2"
            shift 2
            ;;
        -u|--use-case)
            USE_CASE="$2"
            shift 2
            ;;
        -l|--list)
            LIST_ALL=true
            shift
            ;;
        -h|--help)
            SHOW_HELP=true
            shift
            ;;
        *)
            # If no flag, treat as search term
            if [ -z "$SEARCH_TERM" ]; then
                SEARCH_TERM="$1"
            fi
            shift
            ;;
    esac
done

# Show help
if [ "$SHOW_HELP" = true ]; then
    echo -e "${BLUE}Skill Discovery Tool${NC}"
    echo ""
    echo "Usage: $0 [OPTIONS] [SEARCH_TERM]"
    echo ""
    echo "Options:"
    echo "  -s, --search <term>      Search by keyword"
    echo "  -c, --category <cat>     Filter by category (frontend-design, seo, engineering, writing)"
    echo "  -t, --tag <tag>          Filter by tag"
    echo "  -d, --difficulty <level>  Filter by difficulty (beginner, intermediate, advanced)"
    echo "  -u, --use-case <case>    Filter by use case"
    echo "  -l, --list               List all skills"
    echo "  -h, --help               Show this help"
    echo ""
    echo "Examples:"
    echo "  $0 design                           # Search for 'design'"
    echo "  $0 -c seo                           # List all SEO skills"
    echo "  $0 -t tdd                           # Find skills tagged 'tdd'"
    echo "  $0 -d beginner                      # Find beginner skills"
    echo "  $0 -u \"landing page\"                # Find skills for landing pages"
    echo "  $0 -c frontend-design -t animation  # Frontend skills with animation"
    echo ""
    exit 0
fi

# If no search criteria, list all
if [ -z "$SEARCH_TERM" ] && [ -z "$CATEGORY" ] && [ -z "$TAG" ] && [ -z "$DIFFICULTY" ] && [ -z "$USE_CASE" ] && [ "$LIST_ALL" = false ]; then
    LIST_ALL=true
fi

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  SKILL DISCOVERY TOOL${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""

# Build search criteria
CRITERIA=""
if [ -n "$SEARCH_TERM" ]; then
    CRITERIA="${CRITERIA}Search: ${YELLOW}${SEARCH_TERM}${NC}  "
fi
if [ -n "$CATEGORY" ]; then
    CRITERIA="${CRITERIA}Category: ${YELLOW}${CATEGORY}${NC}  "
fi
if [ -n "$TAG" ]; then
    CRITERIA="${CRITERIA}Tag: ${YELLOW}${TAG}${NC}  "
fi
if [ -n "$DIFFICULTY" ]; then
    CRITERIA="${CRITERIA}Difficulty: ${YELLOW}${DIFFICULTY}${NC}  "
fi
if [ -n "$USE_CASE" ]; then
    CRITERIA="${CRITERIA}Use Case: ${YELLOW}${USE_CASE}${NC}  "
fi

if [ -n "$CRITERIA" ]; then
    echo -e "${MAGENTA}Filter:${NC} $CRITERIA"
    echo ""
fi

# Function to check if skill matches criteria
matches_criteria() {
    local skill_dir="$1"
    local skill_file="${skill_dir}SKILL.md"
    
    if [ ! -f "$skill_file" ]; then
        return 1
    fi
    
    # Check search term
    if [ -n "$SEARCH_TERM" ]; then
        if ! grep -qi "$SEARCH_TERM" "$skill_file" 2>/dev/null; then
            return 1
        fi
    fi
    
    # Check category
    if [ -n "$CATEGORY" ]; then
        case "$CATEGORY" in
            frontend-design|taste-skill)
                if [[ "$skill_dir" != *"taste-skill"* ]]; then
                    return 1
                fi
                ;;
            seo|claude-seo)
                if [[ "$skill_dir" != *"claude-seo"* ]]; then
                    return 1
                fi
                ;;
            engineering|agent-skills)
                if [[ "$skill_dir" != *"agent-skills"* ]]; then
                    return 1
                fi
                ;;
            writing|no-ai-slop)
                if [[ "$skill_dir" != *"no-ai-slop"* ]]; then
                    return 1
                fi
                ;;
        esac
    fi
    
    # Check tag
    if [ -n "$TAG" ]; then
        if ! grep -qi "$TAG" "$skill_file" 2>/dev/null; then
            return 1
        fi
    fi
    
    # Check difficulty
    if [ -n "$DIFFICULTY" ]; then
        if ! grep -qi "$DIFFICULTY" "$skill_file" 2>/dev/null; then
            return 1
        fi
    fi
    
    # Check use case
    if [ -n "$USE_CASE" ]; then
        if ! grep -qi "$USE_CASE" "$skill_file" 2>/dev/null; then
            return 1
        fi
    fi
    
    return 0
}

# Search and display results
FOUND=0

# Frontend Design Skills
echo -e "${CYAN}🎨 Frontend Design Skills${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────${NC}"
for skill_dir in sources/taste-skill/skills/*/; do
    if matches_criteria "$skill_dir"; then
        skill_name=$(basename "$skill_dir")
        skill_file="${skill_dir}SKILL.md"
        
        # Extract title
        title=$(grep -m 1 "^#" "$skill_file" | sed 's/^#\+\s*//')
        
        # Extract description from frontmatter
        description=$(grep -m 1 "^description:" "$skill_file" 2>/dev/null | sed 's/^description:[[:space:]]*//' | sed 's/^"//' | sed 's/"$//' | head -c 100)
        
        echo -e "  ${GREEN}✓${NC} ${YELLOW}${skill_name}${NC}"
        echo -e "    ${description:-$title}"
        echo -e "    ${BLUE}cat ${skill_file}${NC}"
        echo ""
        
        FOUND=$((FOUND + 1))
    fi
done

# SEO Skills
echo -e "${CYAN}🔍 SEO Skills${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────${NC}"
for skill_dir in sources/claude-seo/skills/*/; do
    if matches_criteria "$skill_dir"; then
        skill_name=$(basename "$skill_dir")
        skill_file="${skill_dir}SKILL.md"
        
        title=$(grep -m 1 "^#" "$skill_file" | sed 's/^#\+\s*//')
        description=$(head -20 "$skill_file" | grep -v "^#" | grep -v "^$" | grep -v "^---" | head -1)
        
        echo -e "  ${GREEN}✓${NC} ${YELLOW}${skill_name}${NC}"
        echo -e "    ${description:-No description}"
        echo -e "    ${BLUE}cat ${skill_file}${NC}"
        echo ""
        
        FOUND=$((FOUND + 1))
    fi
done

# Engineering Skills
echo -e "${CYAN}⚙️ Engineering Skills${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────${NC}"
for skill_dir in sources/agent-skills/skills/*/; do
    if matches_criteria "$skill_dir"; then
        skill_name=$(basename "$skill_dir")
        skill_file="${skill_dir}SKILL.md"
        
        title=$(grep -m 1 "^#" "$skill_file" | sed 's/^#\+\s*//')
        description=$(head -20 "$skill_file" | grep -v "^#" | grep -v "^$" | grep -v "^---" | head -1)
        
        echo -e "  ${GREEN}✓${NC} ${YELLOW}${skill_name}${NC}"
        echo -e "    ${description:-No description}"
        echo -e "    ${BLUE}cat ${skill_file}${NC}"
        echo ""
        
        FOUND=$((FOUND + 1))
    fi
done

# Writing Skills
echo -e "${CYAN}✍️ Writing Skills${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────────────────${NC}"
for skill_dir in sources/no-ai-slop/skills/*/; do
    if matches_criteria "$skill_dir"; then
        skill_name=$(basename "$skill_dir")
        skill_file="${skill_dir}SKILL.md"
        
        title=$(grep -m 1 "^#" "$skill_file" | sed 's/^#\+\s*//')
        description=$(head -20 "$skill_file" | grep -v "^#" | grep -v "^$" | grep -v "^---" | head -1)
        
        echo -e "  ${GREEN}✓${NC} ${YELLOW}${skill_name}${NC}"
        echo -e "    ${description:-No description}"
        echo -e "    ${BLUE}cat ${skill_file}${NC}"
        echo ""
        
        FOUND=$((FOUND + 1))
    fi
done

# Summary
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "  Found: ${GREEN}${FOUND}${NC} skills"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""

# Quick actions
if [ "$FOUND" -gt 0 ]; then
    echo -e "${MAGENTA}Quick Actions:${NC}"
    echo -e "  Preview a skill:  ${GREEN}./scripts/preview_skill.sh <skill-name>${NC}"
    echo -e "  Use a skill:      ${GREEN}cat sources/<category>/skills/<skill-name>/SKILL.md${NC}"
    echo ""
fi