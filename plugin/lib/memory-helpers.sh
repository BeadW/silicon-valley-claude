#!/usr/bin/env bash
#
# memory-helpers.sh - Interface with Claude Code memory system
#
# These functions interact with Claude's memory system to store/retrieve
# the active persona for the current session.

# NAMESPACED SESSION FILE - allows multiple persona plugins to coexist
SESSION_FILE="$HOME/.claude/session_persona_silicon_valley"

# Get current session persona from memory
# Returns: persona name (e.g., "jin-yang") or empty string if not found
get_session_persona() {
    # Check if memory file exists for current session
    # Memory is stored in ~/.claude/session_persona_silicon_valley (namespaced)
    # This allows silicon-valley-claude and it-crowd-claude to coexist

    if [[ -f "$SESSION_FILE" ]]; then
        cat "$SESSION_FILE"
    else
        echo ""
    fi
}

# Store persona selection for current session
# Args: $1 = persona name (e.g., "jin-yang")
store_session_persona() {
    local persona="$1"

    echo "$persona" > "$SESSION_FILE"

    # Also log to stderr for debugging
    echo "✓ Stored Silicon Valley session persona: $persona" >&2
}

# Clear session persona (useful for testing)
clear_session_persona() {
    if [[ -f "$SESSION_FILE" ]]; then
        rm "$SESSION_FILE"
        echo "✓ Cleared Silicon Valley session persona" >&2
    fi
}

# Set specific persona (for manual selection)
# Args: $1 = persona name (e.g., "monica")
# Returns: 0 on success, 1 on invalid persona
set_persona() {
    local persona="$1"

    # Source persona manager to validate persona exists
    source "$(dirname "${BASH_SOURCE[0]}")/persona-manager.sh"

    # Check if persona is valid
    local valid=0
    for p in "${PERSONAS[@]}"; do
        if [[ "$p" == "$persona" ]]; then
            valid=1
            break
        fi
    done

    if [[ $valid -eq 0 ]]; then
        echo "❌ Invalid Silicon Valley persona: $persona" >&2
        echo "Available personas:" >&2
        list_personas >&2
        return 1
    fi

    echo "$persona" > "$SESSION_FILE"
    echo "✓ Set Silicon Valley persona to: $(persona_display_name "$persona")" >&2
    return 0
}
