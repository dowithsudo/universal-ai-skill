#!/bin/bash
# =============================================================================
# sync_upstream.sh
# Upstream Sync Tool — Sync with Original Repositories
# =============================================================================
# Mengambil update dari repo asli dan merge tanpa overwrite customizations
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Upstream repositories
declare -A REPOS=(
    ["taste-skill"]="https://github.com/Leonxlnx/taste-skill.git"
    ["claude-seo"]="https://github.com/AgriciDaniel/claude-seo.git"
    ["agent-skills"]="https://github.com/addyosmani/agent-skills.git"
    ["no-ai-slop"]="https://github.com/petergyang/no-ai-slop.git"
)

# Temp directory
TEMP_DIR="/tmp/upstream-sync"
LOG_FILE="sync_log_$(date +%Y%m%d_%H%M%S).txt"

# Parse arguments
DRY_RUN=false
FORCE=false
VERBOSE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --verbose)
            VERBOSE=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --dry-run    Show what would be changed without making changes"
            echo "  --force      Force sync even if there are local changes"
            echo "  --verbose    Show detailed output"
            echo "  -h, --help   Show this help"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  UPSTREAM SYNC TOOL${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}⚠️  DRY RUN MODE — No changes will be made${NC}"
    echo ""
fi

# Create temp directory
mkdir -p "$TEMP_DIR"

# Initialize log
echo "Sync started at $(date)" > "$LOG_FILE"
echo "Mode: $([ "$DRY_RUN" = true ] && echo "DRY RUN" || echo "LIVE")" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Function to sync a single repo
sync_repo() {
    local repo_name="$1"
    local repo_url="$2"
    local source_dir="sources/$repo_name"
    local temp_repo="$TEMP_DIR/$repo_name"
    
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}Syncing: $repo_name${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    # Check if source exists
    if [ ! -d "$source_dir" ]; then
        echo -e "${RED}❌ Source directory not found: $source_dir${NC}"
        echo "Sync skipped: $repo_name" >> "$LOG_FILE"
        return 1
    fi
    
    # Clone or update temp repo
    if [ -d "$temp_repo" ]; then
        echo -e "${YELLOW}Updating existing clone...${NC}"
        cd "$temp_repo"
        git pull origin main --quiet 2>/dev/null || git pull origin master --quiet 2>/dev/null || true
        cd - > /dev/null
    else
        echo -e "${YELLOW}Cloning repository...${NC}"
        git clone --quiet "$repo_url" "$temp_repo" 2>/dev/null
    fi
    
    if [ ! -d "$temp_repo" ]; then
        echo -e "${RED}❌ Failed to clone $repo_name${NC}"
        echo "Clone failed: $repo_name" >> "$LOG_FILE"
        return 1
    fi
    
    # Compare files
    echo -e "${YELLOW}Comparing files...${NC}"
    
    CHANGED=0
    NEW=0
    DELETED=0
    
    # Find all SKILL.md files in upstream
    find "$temp_repo" -name "SKILL.md" -type f | while read -r upstream_file; do
        # Get relative path
        rel_path="${upstream_file#$temp_repo/}"
        
        # Map to local path
        local_file="$source_dir/$rel_path"
        
        if [ -f "$local_file" ]; then
            # File exists locally, compare
            if ! diff -q "$upstream_file" "$local_file" > /dev/null 2>&1; then
                echo -e "  ${YELLOW}Modified: $rel_path${NC}"
                CHANGED=$((CHANGED + 1))
                
                if [ "$DRY_RUN" = false ]; then
                    # Backup local version
                    cp "$local_file" "${local_file}.backup"
                    
                    # Copy upstream version
                    cp "$upstream_file" "$local_file"
                    
                    echo "  Modified: $rel_path" >> "$LOG_FILE"
                fi
            fi
        else
            # New file
            echo -e "  ${GREEN}New: $rel_path${NC}"
            NEW=$((NEW + 1))
            
            if [ "$DRY_RUN" = false ]; then
                # Create directory if needed
                mkdir -p "$(dirname "$local_file")"
                
                # Copy file
                cp "$upstream_file" "$local_file"
                
                echo "  New: $rel_path" >> "$LOG_FILE"
            fi
        fi
    done
    
    # Check for deleted files
    find "$source_dir" -name "SKILL.md" -type f | while read -r local_file; do
        rel_path="${local_file#$source_dir/}"
        upstream_file="$temp_repo/$rel_path"
        
        if [ ! -f "$upstream_file" ]; then
            echo -e "  ${RED}Deleted upstream: $rel_path${NC}"
            DELETED=$((DELETED + 1))
            
            if [ "$DRY_RUN" = false ] && [ "$FORCE" = true ]; then
                echo "  Deleted upstream: $rel_path" >> "$LOG_FILE"
            fi
        fi
    done
    
    echo ""
    echo -e "${GREEN}✅ $repo_name sync complete${NC}"
    echo -e "  Changed: $CHANGED"
    echo -e "  New:     $NEW"
    echo -e "  Deleted: $DELETED"
    echo ""
    
    echo "Sync complete: $repo_name (Changed: $CHANGED, New: $NEW, Deleted: $DELETED)" >> "$LOG_FILE"
    
    return 0
}

# Sync each repo
TOTAL_CHANGED=0
TOTAL_NEW=0
TOTAL_DELETED=0

for repo_name in "${!REPOS[@]}"; do
    sync_repo "$repo_name" "${REPOS[$repo_name]}"
done

# Cleanup
echo -e "${YELLOW}Cleaning up temporary files...${NC}"
rm -rf "$TEMP_DIR"

# Summary
echo ""
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  SYNC SUMMARY${NC}"
echo -e "${BLUE}══════════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "  Log file: ${CYAN}$LOG_FILE${NC}"
echo -e "  Mode:     ${CYAN}$([ "$DRY_RUN" = true ] && echo "DRY RUN" || echo "LIVE")${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}⚠️  This was a dry run. No changes were made.${NC}"
    echo -e "    Run without --dry-run to apply changes."
else
    echo -e "${GREEN}✅ Sync complete!${NC}"
    echo -e "    Run ${CYAN}./scripts/test_all_skills.sh${NC} to verify."
    echo -e "    Run ${CYAN}./scripts/generate_registry.sh${NC} to update registry."
fi
echo ""

echo "Sync completed at $(date)" >> "$LOG_FILE"