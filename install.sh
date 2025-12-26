#!/usr/bin/env bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_RULES_DIR="${SCRIPT_DIR}/.cursor/rules"

# Usage function
show_usage() {
    echo ""
    echo -e "${BLUE}Cursor Rules Installer${NC}"
    echo ""
    echo "Usage: $0 <target-project-path>"
    echo ""
    echo "Description:"
    echo "  Copies .cursor/rules directory to the specified project."
    echo "  Automatically backs up existing rules if found."
    echo ""
    echo "Examples:"
    echo "  $0 /Users/username/projects/my-project"
    echo "  $0 ~/projects/my-project"
    echo "  $0 ."
    echo ""
}

# Check if target path is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: Target project path is required${NC}"
    show_usage
    exit 1
fi

TARGET_PATH="$1"

# Validate source rules directory exists
if [ ! -d "$SOURCE_RULES_DIR" ]; then
    echo -e "${RED}Error: Source rules directory not found at ${SOURCE_RULES_DIR}${NC}"
    exit 1
fi

# Validate target path exists
if [ ! -d "$TARGET_PATH" ]; then
    echo -e "${RED}Error: Target path does not exist: ${TARGET_PATH}${NC}"
    exit 1
fi

# Resolve absolute path
TARGET_PATH="$(cd "$TARGET_PATH" && pwd)"
TARGET_CURSOR_DIR="${TARGET_PATH}/.cursor"
TARGET_RULES_DIR="${TARGET_CURSOR_DIR}/rules"

echo -e "${BLUE}Installing Cursor rules...${NC}"
echo "Source: ${SOURCE_RULES_DIR}"
echo "Target: ${TARGET_RULES_DIR}"
echo ""

# Create .cursor directory if it doesn't exist
if [ ! -d "$TARGET_CURSOR_DIR" ]; then
    echo -e "${YELLOW}Creating .cursor directory...${NC}"
    mkdir -p "$TARGET_CURSOR_DIR"
fi

# Backup existing rules if they exist
if [ -d "$TARGET_RULES_DIR" ]; then
    BACKUP_NAME="rules_bkp"
    BACKUP_PATH="${TARGET_CURSOR_DIR}/${BACKUP_NAME}"
    
    # If backup already exists, append timestamp
    if [ -d "$BACKUP_PATH" ]; then
        TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
        BACKUP_NAME="rules_bkp_${TIMESTAMP}"
        BACKUP_PATH="${TARGET_CURSOR_DIR}/${BACKUP_NAME}"
    fi
    
    echo -e "${YELLOW}Backing up existing rules to ${BACKUP_NAME}...${NC}"
    mv "$TARGET_RULES_DIR" "$BACKUP_PATH"
fi

# Copy rules
echo -e "${BLUE}Copying rules...${NC}"
cp -R "$SOURCE_RULES_DIR" "$TARGET_RULES_DIR"

# Success message
echo ""
echo -e "${GREEN}✓ Installation complete!${NC}"
echo ""
echo "Rules installed to: ${TARGET_RULES_DIR}"
if [ -n "${BACKUP_NAME:-}" ]; then
    echo "Previous rules backed up to: ${TARGET_CURSOR_DIR}/${BACKUP_NAME}"
fi
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Restart Cursor or reload the workspace"
echo "  2. The rules will be automatically applied to your AI sessions"
echo ""


