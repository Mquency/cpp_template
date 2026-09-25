#!/bin/sh

# use.sh
#
# This script deletes the unnecessary files to give the template a fresh start
# Removes template-specific files so you can start fresh.
# Deletes itself when done.

set -euo pipefail

# Colors for nicer output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}Cleaning up template files...${NC}"

# List of files to remove
FILES_TO_REMOVE=(
    ".gitignore"
    "README.md"
    "header/.gitkeep"
)

for file in "${FILES_TO_REMOVE[@]}"; do
    if [[ -f "$file" ]]; then
        rm -f "$file"
        echo -e "${GREEN}  removed:${NC} $file"
    else
        echo -e "${RED}  skipped (not found):${NC} $file"
    fi
done

echo -e "${GREEN}Cleanup complete.${NC}"
echo -e "${YELLOW}This script will now delete itself...${NC}"

# Self-destruct
rm -f -- "$0"

echo -e "${GREEN}Done. Happy coding!${NC}"
