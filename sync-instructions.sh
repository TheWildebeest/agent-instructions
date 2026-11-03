#!/bin/bash
# Sync all instructions from INDEX.md and individual instruction files into ~/.pi/agent/AGENTS.md
# This ensures Pi always loads the latest instructions

set -e

# Ensure log directory exists
mkdir -p "$HOME/.pi"

INSTRUCTIONS_DIR="$HOME/.agents/instructions"
INDEX_FILE="$INSTRUCTIONS_DIR/INDEX.md"
OUTPUT_FILE="$HOME/.pi/agent/AGENTS.md"
LOG_FILE="$HOME/.pi/instructions-sync.log"

# Verify INDEX.md exists
if [ ! -f "$INDEX_FILE" ]; then
    echo "Error: $INDEX_FILE not found" >&2
    exit 1
fi

# Build the output from INDEX.md content plus all referenced instruction files
{
    echo "# Agent Instructions"
    echo ""
    echo "Last synced: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo ""
    echo "Authoritative source: \`~/.agents/instructions/INDEX.md\`"
    echo ""
    echo "---"
    echo ""
    cat "$INDEX_FILE"
    echo ""
    echo "---"
    echo ""
    
    # Extract all markdown file references from INDEX.md and concatenate them
    grep -oE '\./[a-z0-9_-]+\.md' "$INDEX_FILE" | sort | uniq | while read -r file; do
        full_path="$INSTRUCTIONS_DIR/$file"
        if [ -f "$full_path" ]; then
            echo "# $(basename "$file" .md)"
            echo ""
            cat "$full_path"
            echo ""
        fi
    done
} > "$OUTPUT_FILE"

# Log the sync timestamp with instruction and line counts
INSTRUCTION_COUNT=$(grep -c "^## " "$INDEX_FILE")
INSTRUCTION_FILES=$(grep -oE '\./[a-z0-9_-]+\.md' "$INDEX_FILE" | sort | uniq | wc -l | tr -d ' ')
LINE_COUNT=$(wc -l < "$OUTPUT_FILE" | tr -d ' ')
echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) - synced $INSTRUCTION_COUNT instruction groups from $INSTRUCTION_FILES files ($LINE_COUNT lines total) to AGENTS.md" >> "$HOME/.pi/instructions-sync.log"

echo "✓ Instructions synced to $OUTPUT_FILE"
