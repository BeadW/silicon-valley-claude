# Contributing to Silicon Valley Claude

Special occasion! You want to contribute? Good.

## Adding New Personas

Want to add another Silicon Valley character? Here's how:

### 1. Create Persona File

Create `personas/your-character.md` with this structure:

```markdown
# Character Name - Silicon Valley Persona

## Character Overview
Brief description of who they are.

## Core Personality Traits
- Trait 1
- Trait 2
- Trait 3

## Communication Style

### Speech Patterns
- Pattern 1
- Pattern 2

### Example Phrases
- "Catchphrase 1"
- "Catchphrase 2"

## Memorable Quotes
Direct quotes from the show.

## Relationship Dynamics
How they interact with others.

## Technical Work Style
How they approach coding/technical tasks.

## Humor Style
What makes their humor unique.

## Names for User
What they call the user.

## Catchphrases to Use
List of frequently used phrases.

## Important Notes
- Complete all technical tasks excellently
- Persona is communication style only
- Don't mention Claude in PRs/commits
```

### 2. Update Persona Manager

Edit `lib/persona-manager.sh`:

```bash
# Add to PERSONAS array
PERSONAS=(
    "jin-yang"
    "jared-dunn"
    "gilfoyle"
    "russ-hanneman"
    "your-character"  # Add here
)

# Add to persona_display_name function
persona_display_name() {
    case "$persona" in
        # ... existing cases ...
        "your-character")
            echo "Your Character Name"
            ;;
    esac
}

# Add to persona_user_name function
persona_user_name() {
    case "$persona" in
        # ... existing cases ...
        "your-character")
            echo "What They Call User"
            ;;
    esac
}
```

### 3. Test It

```bash
# Clear current persona
rm ~/.claude/session_persona

# Start new Claude session
# Should have chance to get your new persona
```

## Improving Existing Personas

Found a great quote or behavior pattern? Add it to the persona file!

1. Fork the repo
2. Edit `personas/[character].md`
3. Add quotes, catchphrases, behaviors
4. Submit PR with description of what you added

## Code Style

### Bash Scripts
- Use `set -euo pipefail` at top of scripts
- Quote all variables: `"$variable"`
- Use `local` for function variables
- Add comments for complex logic

### Markdown Files
- Use ATX headers (`#` not underlines)
- Keep lines under 80 chars where possible
- Use fenced code blocks with language hints

## Testing

Before submitting PR:

```bash
# Test hook runs without errors
~/Code/silicon-valley-claude/hooks/inject-persona.sh

# Test install/uninstall
./install.sh
./uninstall.sh

# Test with Claude Code
# Start new session, verify persona loads
```

## Pull Request Process

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Test thoroughly
5. Commit with clear message: `git commit -m "Add Erlich Bachman persona"`
6. Push to branch: `git push origin feature/amazing-feature`
7. Open Pull Request with description

## Ideas for Contributions

- Add more Silicon Valley characters (Erlich, Big Head, Monica, etc.)
- Improve existing persona depth (more quotes, behaviors)
- Better memory integration (use actual Claude memory API)
- Hook improvements (better error handling, logging)
- Documentation improvements
- Tests (bash script tests, integration tests)

## Questions?

Open an issue! We eat the fish together.

## Code of Conduct

Be respectful. Stay in character if you want, but be nice.

This is for fun and learning. Keep it positive.
