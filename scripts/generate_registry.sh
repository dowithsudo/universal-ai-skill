#!/bin/bash
# =============================================================================
# generate_registry.sh
# Auto-Generate Skill Registry from Filesystem
# =============================================================================
# Script ini akan scan semua skill di sources/ dan generate
# registry/skill_index.json secara otomatis
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Output file
OUTPUT="registry/skill_index.json"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Generate Skill Registry               ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Create registry directory
mkdir -p registry

# Counters
TOTAL_SKILLS=0
TASTE_SKILLS=0
SEO_SKILLS=0
AGENT_SKILLS=0
NOSLOP_SKILLS=0

# Start JSON
echo "{" > "$OUTPUT"
echo '  "version": "1.0.0",' >> "$OUTPUT"
echo '  "generated_at": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",' >> "$OUTPUT"
echo '  "description": "Auto-generated skill registry",' >> "$OUTPUT"

# Count skills per category
echo -e "${YELLOW}Scanning taste-skill...${NC}"
TASTE_SKILLS=$(find sources/taste-skill/skills -name "SKILL.md" -type f 2>/dev/null | wc -l)
TOTAL_SKILLS=$((TOTAL_SKILLS + TASTE_SKILLS))
echo -e "  Found ${GREEN}$TASTE_SKILLS${NC} skills"

echo -e "${YELLOW}Scanning claude-seo...${NC}"
SEO_SKILLS=$(find sources/claude-seo/skills -name "SKILL.md" -type f 2>/dev/null | wc -l)
TOTAL_SKILLS=$((TOTAL_SKILLS + SEO_SKILLS))
echo -e "  Found ${GREEN}$SEO_SKILLS${NC} skills"

echo -e "${YELLOW}Scanning agent-skills...${NC}"
AGENT_SKILLS=$(find sources/agent-skills/skills -name "SKILL.md" -type f 2>/dev/null | wc -l)
TOTAL_SKILLS=$((TOTAL_SKILLS + AGENT_SKILLS))
echo -e "  Found ${GREEN}$AGENT_SKILLS${NC} skills"

echo -e "${YELLOW}Scanning no-ai-slop...${NC}"
NOSLOP_SKILLS=$(find sources/no-ai-slop/skills -name "SKILL.md" -type f 2>/dev/null | wc -l)
TOTAL_SKILLS=$((TOTAL_SKILLS + NOSLOP_SKILLS))
echo -e "  Found ${GREEN}$NOSLOP_SKILLS${NC} skills"

echo ""

# Write totals
echo '  "total_skills": '$TOTAL_SKILLS',' >> "$OUTPUT"
echo '  "categories": {' >> "$OUTPUT"

# Write taste-skill category
echo '    "frontend-design": {' >> "$OUTPUT"
echo '      "path": "sources/taste-skill/skills/",' >> "$OUTPUT"
echo '      "description": "Frontend design, anti-slop UI, image generation",' >> "$OUTPUT"
echo '      "skills_count": '$TASTE_SKILLS',' >> "$OUTPUT"
echo '      "skills": [' >> "$OUTPUT"

FIRST=true
for skill_path in $(find sources/taste-skill/skills -name "SKILL.md" -type f | sort); do
    skill_dir=$(dirname "$skill_path")
    skill_name=$(basename "$skill_dir")
    
    if [ "$FIRST" = true ]; then
        FIRST=false
    else
        echo "," >> "$OUTPUT"
    fi
    
    # Extract description from SKILL.md (first non-empty line after frontmatter)
    description=$(sed -n '/^---$/,/^---$/d; p' "$skill_path" | head -5 | grep -v "^#" | grep -v "^$" | head -1)
    if [ -z "$description" ]; then
        description="Skill: $skill_name"
    fi
    
    printf '      {"id": "%s", "path": "sources/taste-skill/skills/%s/", "description": "%s"}' "$skill_name" "$skill_name" "$description" >> "$OUTPUT"
done

echo '' >> "$OUTPUT"
echo '    ],' >> "$OUTPUT"

# Write seo category
echo '    "seo": {' >> "$OUTPUT"
echo '      "path": "sources/claude-seo/skills/",' >> "$OUTPUT"
echo '      "description": "SEO analysis, audits, schema, GEO, local, ecommerce",' >> "$OUTPUT"
echo '      "skills_count": '$SEO_SKILLS',' >> "$OUTPUT"
echo '      "skills": [' >> "$OUTPUT"

FIRST=true
for skill_path in $(find sources/claude-seo/skills -name "SKILL.md" -type f | sort); do
    skill_dir=$(dirname "$skill_path")
    skill_name=$(basename "$skill_dir")
    
    if [ "$FIRST" = true ]; then
        FIRST=false
    else
        echo "," >> "$OUTPUT"
    fi
    
    description=$(sed -n '/^---$/,/^---$/d; p' "$skill_path" | head -5 | grep -v "^#" | grep -v "^$" | head -1)
    if [ -z "$description" ]; then
        description="Skill: $skill_name"
    fi
    
    printf '      {"id": "%s", "path": "sources/claude-seo/skills/%s/", "description": "%s"}' "$skill_name" "$skill_name" "$description" >> "$OUTPUT"
done

echo '' >> "$OUTPUT"
echo '    ],' >> "$OUTPUT"

# Write engineering category
echo '    "engineering": {' >> "$OUTPUT"
echo '      "path": "sources/agent-skills/skills/",' >> "$OUTPUT"
echo '      "description": "Software engineering workflow skills",' >> "$OUTPUT"
echo '      "skills_count": '$AGENT_SKILLS',' >> "$OUTPUT"
echo '      "skills": [' >> "$OUTPUT"

FIRST=true
for skill_path in $(find sources/agent-skills/skills -name "SKILL.md" -type f | sort); do
    skill_dir=$(dirname "$skill_path")
    skill_name=$(basename "$skill_dir")
    
    if [ "$FIRST" = true ]; then
        FIRST=false
    else
        echo "," >> "$OUTPUT"
    fi
    
    description=$(sed -n '/^---$/,/^---$/d; p' "$skill_path" | head -5 | grep -v "^#" | grep -v "^$" | head -1)
    if [ -z "$description" ]; then
        description="Skill: $skill_name"
    fi
    
    printf '      {"id": "%s", "path": "sources/agent-skills/skills/%s/", "description": "%s"}' "$skill_name" "$skill_name" "$description" >> "$OUTPUT"
done

echo '' >> "$OUTPUT"
echo '    ],' >> "$OUTPUT"

# Write writing category
echo '    "writing": {' >> "$OUTPUT"
echo '      "path": "sources/no-ai-slop/skills/",' >> "$OUTPUT"
echo '      "description": "Writing quality and AI slop detection",' >> "$OUTPUT"
echo '      "skills_count": '$NOSLOP_SKILLS',' >> "$OUTPUT"
echo '      "skills": [' >> "$OUTPUT"

FIRST=true
for skill_path in $(find sources/no-ai-slop/skills -name "SKILL.md" -type f | sort); do
    skill_dir=$(dirname "$skill_path")
    skill_name=$(basename "$skill_dir")
    
    if [ "$FIRST" = true ]; then
        FIRST=false
    else
        echo "," >> "$OUTPUT"
    fi
    
    description=$(sed -n '/^---$/,/^---$/d; p' "$skill_path" | head -5 | grep -v "^#" | grep -v "^$" | head -1)
    if [ -z "$description" ]; then
        description="Skill: $skill_name"
    fi
    
    printf '      {"id": "%s", "path": "sources/no-ai-slop/skills/%s/", "description": "%s"}' "$skill_name" "$skill_name" "$description" >> "$OUTPUT"
done

echo '' >> "$OUTPUT"
echo '    ]' >> "$OUTPUT"

# Close JSON
echo '  }' >> "$OUTPUT"
echo "}" >> "$OUTPUT"

echo ""
echo -e "${GREEN}✅ Registry generated: $OUTPUT${NC}"
echo -e "${GREEN}   Total skills: $TOTAL_SKILLS${NC}"
echo ""
echo -e "${BLUE}Summary:${NC}"
echo -e "  Frontend Design: $TASTE_SKILLS skills"
echo -e "  SEO Analysis:    $SEO_SKILLS skills"
echo -e "  Engineering:     $AGENT_SKILLS skills"
echo -e "  Writing:         $NOSLOP_SKILLS skills"
