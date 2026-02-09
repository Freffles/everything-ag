#!/bin/bash

# Everything Antigravity: Global Installer (Linux/macOS)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CLAUDE_RULES="$HOME/.claude/rules"
AG_BASE="$HOME/.gemini/antigravity"
AG_SKILLS="$AG_BASE/skills"
AG_WORKFLOWS="$AG_BASE/workflows"

echo "Everything Antigravity: Global Sync Initialized"
echo "-----------------------------------------------"

# 1. Sync Rules
if [ -d "$SCRIPT_DIR/docs/rules" ]; then
    mkdir -p "$CLAUDE_RULES"
    echo "Syncing Rules..."
    # Copy subdirectories from docs/rules to global rules
    for d in "$SCRIPT_DIR/docs/rules/"*/ ; do
        [ -L "${d%/}" ] && continue
        dirname=$(basename "$d")
        # Skip utility scripts
        if [[ ! "$dirname" =~ ^(install\.sh|install\.py|install\.ps1)$ ]]; then
            cp -r "$d" "$CLAUDE_RULES/"
            echo "  - Rule: $dirname"
        fi
    done
fi

# 2. Sync Skills
if [ -d "$SCRIPT_DIR/skills" ]; then
    mkdir -p "$AG_SKILLS"
    echo "Syncing Skills..."
    for d in "$SCRIPT_DIR/skills/"*/ ; do
        [ -L "${d%/}" ] && continue
        dirname=$(basename "$d")
        cp -r "$d" "$AG_SKILLS/"
        echo "  - Skill: $dirname"
    done
fi

# 3. Sync Workflows
if [ -d "$SCRIPT_DIR/.agent/workflows" ]; then
    mkdir -p "$AG_WORKFLOWS"
    echo "Syncing Workflows..."
    for f in "$SCRIPT_DIR/.agent/workflows/"*.md ; do
        [ -e "$f" ] || continue
        filename=$(basename "$f")
        cp "$f" "$AG_WORKFLOWS/"
        echo "  - Workflow: $filename"
    done
fi

echo "-----------------------------------------------"
echo "Global installation complete!"
