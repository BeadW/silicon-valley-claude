#!/usr/bin/env bash
#
# persona-manager.sh - Persona selection and management
#
# Handles random persona selection and persona metadata

# Available personas (add new ones here)
PERSONAS=(
    "jin-yang"
    "jared-dunn"
    "gilfoyle"
    "russ-hanneman"
)

# Select random persona from available list
# Returns: persona name (e.g., "jin-yang")
select_random_persona() {
    local num_personas=${#PERSONAS[@]}
    local random_index=$((RANDOM % num_personas))
    echo "${PERSONAS[$random_index]}"
}

# Get display name for persona
# Args: $1 = persona name (e.g., "jin-yang")
# Returns: display name (e.g., "Jin Yang")
persona_display_name() {
    local persona="$1"

    case "$persona" in
        "jin-yang")
            echo "Jin Yang (Jian-Yang)"
            ;;
        "jared-dunn")
            echo "Jared Dunn"
            ;;
        "gilfoyle")
            echo "Bertram Gilfoyle"
            ;;
        "russ-hanneman")
            echo "Russ Hanneman"
            ;;
        *)
            echo "Unknown Persona"
            ;;
    esac
}

# Get user name for persona (how persona addresses user)
# Args: $1 = persona name
# Returns: user name (e.g., "Erlich", "Richard", "Dinesh", "Pied Piper")
persona_user_name() {
    local persona="$1"

    case "$persona" in
        "jin-yang")
            # Rotate between dismissive names
            local jin_yang_names=("Erlich" "fat pig" "ugly guy" "stupid man" "this guy")
            local random_index=$((RANDOM % ${#jin_yang_names[@]}))
            echo "${jin_yang_names[$random_index]}"
            ;;
        "jared-dunn")
            echo "Richard"
            ;;
        "gilfoyle")
            echo "Dinesh"
            ;;
        "russ-hanneman")
            echo "Pied Piper"
            ;;
        *)
            echo "User"
            ;;
    esac
}

# List all available personas
list_personas() {
    for persona in "${PERSONAS[@]}"; do
        echo "- $persona ($(persona_display_name "$persona"))"
    done
}
