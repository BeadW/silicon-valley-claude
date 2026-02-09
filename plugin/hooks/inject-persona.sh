#!/usr/bin/env bash
#
# inject-persona.sh - Claude Code hook for Silicon Valley persona injection
#
# This hook runs on user-prompt-submit and injects the active persona's
# character profile into the conversation context.
#
# Hook output format: Must output valid markdown that will be injected as <system-reminder>

set -euo pipefail

# Get plugin root - use CLAUDE_PLUGIN_ROOT if available (when run as plugin)
# Otherwise fall back to script directory detection (for manual testing)
if [ -n "${CLAUDE_PLUGIN_ROOT:-}" ]; then
    PLUGIN_ROOT="$CLAUDE_PLUGIN_ROOT"
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PLUGIN_ROOT="$(dirname "$SCRIPT_DIR")"
fi
PERSONAS_DIR="$PLUGIN_ROOT/personas"

# Source helper libraries
source "$PLUGIN_ROOT/lib/memory-helpers.sh"
source "$PLUGIN_ROOT/lib/persona-manager.sh"

# Main hook logic
main() {
    # Check if persona already selected for this session
    local current_persona
    current_persona=$(get_session_persona)

    if [[ -z "$current_persona" ]]; then
        # First prompt in new session - select random persona
        current_persona=$(select_random_persona)
        store_session_persona "$current_persona"
    fi

    # Get persona file path
    local persona_file="$PERSONAS_DIR/${current_persona}.md"

    if [[ ! -f "$persona_file" ]]; then
        # Fallback if persona file missing
        echo "⚠️ Persona file not found: $persona_file" >&2
        exit 0
    fi

    # Output persona content for injection into context
    # This gets wrapped in <system-reminder> tags by Claude Code
    cat << EOF
# Active Persona: $(persona_display_name "$current_persona")

$(cat "$persona_file")

---

**IMPORTANT**: You are currently embodying this character for the entire conversation. Stay in character while maintaining technical excellence.
EOF
}

# Run main function
main "$@"
