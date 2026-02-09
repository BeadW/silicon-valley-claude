#!/usr/bin/env bash
#
# persona-manager.sh - Persona selection and management
#
# Handles random persona selection and persona metadata.
# Two-tier system: main personas (random selection + delegation) vs
# subagent-only personas (delegation targets only).

# Main personas - eligible for random selection as main agent
MAIN_PERSONAS=(
    "jin-yang"
    "jared-dunn"
    "gilfoyle"
    "russ-hanneman"
    "monica"
    "richard"
)

# Subagent-only personas - delegation targets, never main agent
SUBAGENT_ONLY_PERSONAS=(
    "dinesh"
    "erlich"
    "gavin-belson"
    "big-head"
    "laurie-bream"
    "peter-gregory"
    "action-jack"
    "ron-laflamme"
    "denpok"
)

# All personas combined - for delegation roster and hook matching
ALL_PERSONAS=("${MAIN_PERSONAS[@]}" "${SUBAGENT_ONLY_PERSONAS[@]}")

# Backward compat: PERSONAS = MAIN_PERSONAS (used by select_random_persona, list_personas)
PERSONAS=("${MAIN_PERSONAS[@]}")

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
        "monica")
            echo "Monica Hall"
            ;;
        "richard")
            echo "Richard Hendricks"
            ;;
        "dinesh")
            echo "Dinesh Chugtai"
            ;;
        "erlich")
            echo "Erlich Bachman"
            ;;
        "gavin-belson")
            echo "Gavin Belson"
            ;;
        "big-head")
            echo "Nelson \"Big Head\" Bighetti"
            ;;
        "laurie-bream")
            echo "Laurie Bream"
            ;;
        "peter-gregory")
            echo "Peter Gregory"
            ;;
        "action-jack")
            echo "Action Jack Barker"
            ;;
        "ron-laflamme")
            echo "Ron LaFlamme"
            ;;
        "denpok")
            echo "Denpok"
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
        "monica")
            echo "Richard"
            ;;
        "richard")
            echo "guys"
            ;;
        "dinesh")
            echo "dude"
            ;;
        "erlich")
            echo "gentlemen"
            ;;
        "gavin-belson")
            echo "employee"
            ;;
        "big-head")
            echo "man"
            ;;
        "laurie-bream")
            echo "founder"
            ;;
        "peter-gregory")
            echo "entrepreneur"
            ;;
        "action-jack")
            echo "team"
            ;;
        "ron-laflamme")
            echo "client"
            ;;
        "denpok")
            echo "seeker"
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

# Get task aptitude description for a persona (used in delegation roster)
# Args: $1 = persona name
# Returns: short description of what tasks this persona excels at
persona_task_aptitude() {
    local persona="$1"

    case "$persona" in
        "gilfoyle")
            echo "Infrastructure, security, systems architecture, code review, deep codebase exploration"
            ;;
        "jared-dunn")
            echo "Planning, operations, documentation, project management, organizational tasks"
            ;;
        "jin-yang")
            echo "Quick implementations, niche features, prototyping, rapid builds"
            ;;
        "monica")
            echo "Strategic review, evaluation, PR review, business analysis, quality assessment"
            ;;
        "russ-hanneman")
            echo "Big picture brainstorming, ambitious architecture, scaling strategy, moonshot features"
            ;;
        "richard")
            echo "Product vision, algorithm design, founder decisions, technical architecture"
            ;;
        "dinesh")
            echo "Frontend, UI, mobile dev, JavaScript, user-facing features"
            ;;
        "erlich")
            echo "Naming, branding, pitching, README writing, marketing copy"
            ;;
        "gavin-belson")
            echo "Enterprise architecture, competitive analysis, platform strategy"
            ;;
        "big-head")
            echo "Simple solutions, obvious approaches, beginner-friendly explanations"
            ;;
        "laurie-bream")
            echo "Financial analysis, metrics, data-driven decisions, resource allocation"
            ;;
        "peter-gregory")
            echo "Unconventional research, lateral thinking, contrarian analysis"
            ;;
        "action-jack")
            echo "Monetization, revenue strategy, sales engineering, business metrics"
            ;;
        "ron-laflamme")
            echo "Legal review, licensing, compliance, terms of service, IP questions"
            ;;
        "denpok")
            echo "Philosophical perspective, rubber-ducking, mentoring, architectural reflection"
            ;;
        *)
            echo "General tasks"
            ;;
    esac
}
