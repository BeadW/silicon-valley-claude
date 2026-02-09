# Contributing to Silicon Valley Claude

Special occasion! You want to contribute? Good.

## Architecture Overview

The system has two tiers:

- **Main personas** (6): Eligible for random selection as the session's main agent AND as delegation targets. Defined in `MAIN_PERSONAS` array in `persona-manager.sh`.
- **Subagent-only personas** (9): Delegation targets only — never randomly selected as the main agent. Defined in `SUBAGENT_ONLY_PERSONAS` array.

Both tiers use the same file structure: a persona file (`personas/slug.md`) and an agent definition (`agents/slug.md`).

## Adding a New Main Persona

### 1. Create Persona File

Create `personas/your-character.md` with this structure:

```markdown
# Character Name - Silicon Valley Persona

## Character Overview
Brief description of who they are.

## Core Personality Traits
- Trait 1
- Trait 2

## Communication Style

### Speech Patterns
- Pattern 1

### Example Phrases
- "Catchphrase 1"

## Technical Work Style
How they approach coding tasks.

## Humor Style
What makes their humor unique.

## Names for User
What they call the user.

## Catchphrases to Use
Frequently used phrases.

## In-Universe Technical References
How they reference Silicon Valley storylines in technical work.

## Important Notes
- Complete all technical tasks excellently
- Persona is communication style only
- Don't mention Claude in PRs/commits
```

### 2. Create Agent Definition

Create `agents/your-character.md`:

```markdown
---
name: your-character
description: Short description of specialty. A fun in-universe quip.
---

You are a Silicon Valley persona subagent. Your full persona and relationship
context will be injected by the SubagentStart hook. Complete all tasks with
technical excellence. Persona affects communication style only.
```

### 3. Update Persona Manager

Edit `lib/persona-manager.sh`:

- Add slug to `MAIN_PERSONAS` array (or `SUBAGENT_ONLY_PERSONAS` for delegation-only)
- Add entry to `persona_display_name()` case statement
- Add entry to `persona_user_name()` case statement
- Add entry to `persona_task_aptitude()` case statement

### 4. Update hooks.json

Add the slug to the `SubagentStart` matcher regex in `hooks/hooks.json`.

### 5. Add Relationships

Edit `lib/relationships.sh`:

- For a **main persona**: add bidirectional pairs with all other main personas, plus pairs for all main personas delegating TO the new character (if it's subagent-only, only the latter).
- Each pair is a `"delegator:subagent"` case in `get_relationship_context()`.

### 6. Test It

```bash
# Syntax check
bash -n lib/persona-manager.sh
bash -n lib/relationships.sh
bash -n hooks/inject-persona.sh
bash -n hooks/inject-subagent-persona.sh
python3 -m json.tool hooks/hooks.json

# Functional test
echo "your-character" > ~/.claude/session_persona
CLAUDE_PLUGIN_ROOT=. bash hooks/inject-persona.sh 2>/dev/null | grep '(`.*`):'  # Check roster
```

## Code Style

### Bash Scripts
- Use `set -euo pipefail` at top of scripts
- Quote all variables: `"$variable"`
- Use `local` for function variables
- Add comments for complex logic

### Markdown Files
- Use ATX headers (`#` not underlines)
- Keep persona files consistent with existing structure
- Include In-Universe Technical References section

## Pull Request Process

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Test thoroughly (syntax checks + functional tests)
5. Commit with clear message
6. Push to branch
7. Open Pull Request with description

## Questions?

Open an issue! We eat the fish together.

## Code of Conduct

Be respectful. Stay in character if you want, but be nice.

This is for fun and learning. Keep it positive.
