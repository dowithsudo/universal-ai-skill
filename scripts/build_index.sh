#!/bin/bash
# =============================================================================
# build_index.sh
# Performance Optimization — Build Search Index
# =============================================================================
# Membangun index untuk pencarian cepat tanpa scan filesystem setiap kali
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Index file
INDEX_FILE="registry/search_index.json"
TEMP_FILE="/tmp/search_index_$$.json"

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  BUILDING SEARCH INDEX${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""

# Start JSON
echo "{" > "$TEMP_FILE"
echo '  "version": "1.0.0",' >> "$TEMP_FILE"
echo '  "generated_at": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",' >> "$TEMP_FILE"
echo '  "skills": [' >> "$TEMP_FILE"

FIRST=true
COUNT=0

# Function to add skill to index
add_to_index() {
    local skill_dir="$1"
    local skill_file="${skill_dir}SKILL.md"
    
    if [ ! -f "$skill_file" ]; then
        return
    fi
    
    local skill_name=$(basename "$skill_dir")
    local file_size=$(wc -c < "$skill_file")
    local line_count=$(wc -l < "$skill_file")
    
    # Extract title
    local title=$(grep -m 1 "^#" "$skill_file" | sed 's/^#\+\s*//')
    
    # Extract first 3 non-empty, non-heading lines as description
    local description=$(head -30 "$skill_file" | grep -v "^#" | grep -v "^$" | grep -v "^---" | head -3 | tr '\n' ' ')
    
    # Extract all words for search (lowercase, unique)
    local words=$(tr '[:upper:]' '[:lower:]' < "$skill_file" | tr -cs '[:alnum:]' '\n' | sort -u | head -50 | tr '\n' ',' | sed 's/,$//')
    
    # Determine category
    local category=""
    if [[ "$skill_dir" == *"taste-skill"* ]]; then
        category="frontend-design"
    elif [[ "$skill_dir" == *"claude-seo"* ]]; then
        category="seo"
    elif [[ "$skill_dir" == *"agent-skills"* ]]; then
        category="engineering"
    elif [[ "$skill_dir" == *"no-ai-slop"* ]]; then
        category="writing"
    fi
    
    if [ "$FIRST" = true ]; then
        FIRST=false
    else
        echo "," >> "$TEMP_FILE"
    fi
    
    # Escape description for JSON
    local escaped_desc=$(echo "$description" | sed 's/"/\\"/g' | sed 's/\\/\\\\/g')
    local escaped_title=$(echo "$title" | sed 's/"/\\"/g' | sed 's/\\/\\\\/g')
    
    cat >> "$TEMP_FILE" << EOF
    {
      "id": "$skill_name",
      "title": "$escaped_title",
      "category": "$category",
      "path": "$skill_dir",
      "file_size": $file_size,
      "line_count": $line_count,
      "description": "$escaped_desc",
      "keywords": "$words"
    }
EOF
    
    COUNT=$((COUNT + 1))
    echo -e "  ${GREEN}✓${NC} Indexed: $skill_name"
}

# Index all skills
echo -e "${YELLOW}Indexing Frontend Design skills...${NC}"
for dir in sources/taste-skill/skills/*/; do
    add_to_index "$dir"
done

echo -e "${YELLOW}Indexing SEO skills...${NC}"
for dir in sources/claude-seo/skills/*/; do
    add_to_index "$dir"
done

echo -e "${YELLOW}Indexing Engineering skills...${NC}"
for dir in sources/agent-skills/skills/*/; do
    add_to_index "$dir"
done

echo -e "${YELLOW}Indexing Writing skills...${NC}"
for dir in sources/no-ai-slop/skills/*/; do
    add_to_index "$dir"
done

# Close JSON
echo "" >> "$TEMP_FILE"
echo "  ]," >> "$TEMP_FILE"
echo "  \"total_skills\": $COUNT" >> "$TEMP_FILE"
echo "}" >> "$TEMP_FILE"

# Move to final location
mv "$TEMP_FILE" "$INDEX_FILE"

echo ""
echo -e "${GREEN}✅ Search index built successfully!${NC}"
echo -e "  Total skills indexed: ${CYAN}$COUNT${NC}"
echo -e "  Index file: ${CYAN}$INDEX_FILE${NC}"
echo ""

# Show index stats
echo -e "${MAGENTA}Index Statistics:${NC}"
echo -e "  File size: $(wc -c < "$INDEX_FILE") bytes"
echo -e "  Skills: $COUNT"
echo ""