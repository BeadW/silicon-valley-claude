#!/usr/bin/env bash
#
# uninstall.sh - Remove Silicon Valley Claude hooks plugin
#
# This script removes the persona injection hook from Claude Code's hooks configuration.

set -euo pipefail

HOOKS_CONFIG="$HOME/.claude/config/hooks.yaml"
SESSION_FILE="$HOME/.claude/session_persona"

echo "🗑️  Uninstalling Silicon Valley Claude hooks plugin..."

# Remove hook from hooks.yaml
if [[ -f "$HOOKS_CONFIG" ]]; then
    if grep -q "inject-persona.sh" "$HOOKS_CONFIG"; then
        echo "Removing hook from $HOOKS_CONFIG..."

        # Backup
        cp "$HOOKS_CONFIG" "$HOOKS_CONFIG.backup.uninstall"

        # Remove lines containing inject-persona.sh and the previous line (command:)
        sed -i.tmp '/inject-persona.sh/d' "$HOOKS_CONFIG"

        echo "✓ Hook removed from configuration"
        echo "  Backup saved to: $HOOKS_CONFIG.backup.uninstall"
    else
        echo "Hook not found in $HOOKS_CONFIG (already removed?)"
    fi
else
    echo "No hooks configuration found"
fi

# Remove session persona file
if [[ -f "$SESSION_FILE" ]]; then
    rm "$SESSION_FILE"
    echo "✓ Cleared session persona"
fi

echo ""
echo "✅ Uninstall complete!"
echo ""
echo "The plugin directory is still at:"
echo "  ~/Code/silicon-valley-claude/"
echo ""
echo "To completely remove:"
echo "  rm -rf ~/Code/silicon-valley-claude/"
