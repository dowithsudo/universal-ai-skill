#!/bin/bash
# =============================================================================
# search.sh
# Fast Search Tool — Using Pre-built Index
# =============================================================================
# Pencarian cepat menggunakan index yang sudah dibangun
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

# Index file
INDEX_FILE="registry/search_index.json"

# Check if index exists
if [ ! -f "$INDEX_FILE" ]; then
    echo -e "${YELLOW}⚠️  Search index not found. Building index...${NC}"
    ./scripts/build_index.sh
    echo ""
fi

# Parse arguments
SEARCH_TERM=""
CATEGORY=""
LIMIT=20

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
        -l|--limit)
            LIMIT="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS] [SEARCH_TERM]"
            echo ""
            echo "Options:"
            echo "  -s, --search <term>      Search by keyword"
            echo "  -c, --category <cat>     Filter by category"
            echo "  -l, --limit <n>          Limit results (default: 20)"
            echo "  -h, --help               Show this help"
            echo ""
            echo "Examples:"
            echo "  $0 design"
            echo "  $0 -c seo audit"
            echo "  $0 -l 5 tdd"
            exit 0
            ;;
        *)
            if [ -z "$SEARCH_TERM" ]; then
                SEARCH_TERM="$1"
            fi
            shift
            ;;
    esac
done

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  FAST SKILL SEARCH${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""

# Build search criteria
CRITERIA=""
if [ -n "$SEARCH_TERM" ]; then
    CRITERIA="Search: ${YELLOW}${SEARCH_TERM}${NC}"
fi
if [ -n "$CATEGORY" ]; then
    CRITERIA="${CRITERIA}  Category: ${YELLOW}${CATEGORY}${NC}"
fi

if [ -n "$CRITERIA" ]; then
    echo -e "${MAGENTA}$CRITERIA${NC}"
    echo ""
fi

# Search using jq or grep
if command -v jq &> /dev/null; then
    # Use jq for fast JSON search
    RESULTS=$(jq -r --arg search "$SEARCH_TERM" --arg category "$CATEGORY" --arg limit "$LIMIT" '
        .skills | 
        map(select(
            (if $search != "" then 
                (.id | test($search; "i")) or 
                (.title | test($search; "i")) or 
                (.description | test($search; "i")) or 
                (.keywords | test($search; "i"))
            else true end) and
            (if $category != "" then 
                .category == $category
            else true end)
        )) |
        .[:($limit | tonumber)] |
        .[] |
        "  \(.category) | \(.id) | \(.title)\n    \(.description[:80])...\n    cat \(.path)SKILL.md\n"
    ' "$INDEX_FILE")
else
    # Fallback to grep
    RESULTS=$(grep -i "$SEARCH_TERM" "$INDEX_FILE" | head -"$LIMIT" | while read -r line; do
        echo "$line"
    done)
fi

if [ -z "$RESULTS" ]; then
    echo -e "${RED}No results found for: $SEARCH_TERM${NC}"
    echo ""
    echo -e "Try different search terms or categories:"
    echo -e "  ${GREEN}./scripts/search.sh design${NC}"
    echo -e "  ${GREEN}./scripts/search.sh -c seo${NC}"
else
    echo -e "${GREEN}Results:${NC}"
    echo ""
    echo "$RESULTS"
fi

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "  Quick actions:"
echo -e "    Preview: ${GREEN}./scripts/preview_skill.sh <skill-name>${NC}"
echo -e "    Use:     ${GREEN}cat sources/<category>/skills/<skill-name>/SKILL.md${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""