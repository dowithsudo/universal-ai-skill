#!/bin/bash
# =============================================================================
# sync_diff.sh
# Incremental Sync Script — Hemat Token & Bandwidth
# =============================================================================
# Membandingkan hash file local vs state sebelumnya
# Hanya file yang berubah (modified/staged delta) yang akan di-sync
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Config
HASH_FILE=".sync-hashes"
SYNC_DIR="sources/"
TEMP_DIR="/tmp/universal-agent-skills-sync"

# Create temp directory
mkdir -p "$TEMP_DIR"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Universal Agent Skills — Sync Diff    ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# =============================================================================
# 1. Generate current hashes
# =============================================================================
echo -e "${YELLOW}Generating file hashes...${NC}"

find "$SYNC_DIR" -type f -not -path "*/.git/*" -exec sha256sum {} \; | sort > "$TEMP_DIR/current-hashes.txt"

CURRENT_COUNT=$(wc -l < "$TEMP_DIR/current-hashes.txt")
echo -e "Total files: ${CURRENT_COUNT}"
echo ""

# =============================================================================
# 2. Compare with previous hashes
# =============================================================================
if [ -f "$HASH_FILE" ]; then
    echo -e "${YELLOW}Comparing with previous state...${NC}"
    
    # Find modified files
    CHANGED=$(diff --new-line-format="%L" --old-line-format="" --unchanged-line-format="" \
        <(cut -d' ' -f1 "$HASH_FILE" | sort) \
        <(cut -d' ' -f1 "$TEMP_DIR/current-hashes.txt" | sort) | wc -l)
    
    # Find new files
    NEW_FILES=$(comm -13 <(awk '{print $2}' "$HASH_FILE" | sort) <(awk '{print $2}' "$TEMP_DIR/current-hashes.txt" | sort) | wc -l)
    
    # Find deleted files
    DELETED_FILES=$(comm -23 <(awk '{print $2}' "$HASH_FILE" | sort) <(awk '{print $2}' "$TEMP_DIR/current-hashes.txt" | sort) | wc -l)
    
    echo ""
    echo -e "Changed files: ${CHANGED}"
    echo -e "New files:     ${NEW_FILES}"
    echo -e "Deleted files: ${DELETED_FILES}"
    echo ""
    
    if [ $CHANGED -eq 0 ] && [ $NEW_FILES -eq 0 ] && [ $DELETED_FILES -eq 0 ]; then
        echo -e "${GREEN}✅ No changes detected — nothing to sync${NC}"
    else
        echo -e "${YELLOW}Changes detected:${NC}"
        echo ""
        
        # Show changed files
        if [ $CHANGED -gt 0 ]; then
            echo -e "${YELLOW}Modified files:${NC}"
            diff --new-line-format="%L" --old-line-format="" --unchanged-line-format="" \
                <(cut -d' ' -f1 "$HASH_FILE" | sort) \
                <(cut -d' ' -f1 "$TEMP_DIR/current-hashes.txt" | sort) | head -20
            echo ""
        fi
        
        # Show new files
        if [ $NEW_FILES -gt 0 ]; then
            echo -e "${GREEN}New files:${NC}"
            comm -13 <(awk '{print $2}' "$HASH_FILE" | sort) <(awk '{print $2}' "$TEMP_DIR/current-hashes.txt" | sort) | head -20
            echo ""
        fi
        
        # Show deleted files
        if [ $DELETED_FILES -gt 0 ]; then
            echo -e "${RED}Deleted files:${NC}"
            comm -23 <(awk '{print $2}' "$HASH_FILE" | sort) <(awk '{print $2}' "$TEMP_DIR/current-hashes.txt" | sort) | head -20
            echo ""
        fi
    fi
    
else
    echo -e "${YELLOW}First run — all files will be synced${NC}"
    echo ""
    echo -e "Files to sync:"
    awk '{print $2}' "$TEMP_DIR/current-hashes.txt" | head -20
    echo "..."
fi

# =============================================================================
# 3. Save current state
# =============================================================================
echo -e "${YELLOW}Saving current state...${NC}"
cp "$TEMP_DIR/current-hashes.txt" "$HASH_FILE"
echo -e "${GREEN}✅ State saved to $HASH_FILE${NC}"
echo ""

# =============================================================================
# 4. Summary
# =============================================================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}            SYNC SUMMARY                ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "Hash file:    $HASH_FILE"
echo -e "Total files:  $CURRENT_COUNT"
echo -e "State:        Saved"
echo ""
echo -e "${GREEN}Run this script again to detect future changes.${NC}"
echo -e "Only modified files will be shown for sync."
echo ""

# Cleanup
rm -rf "$TEMP_DIR"
