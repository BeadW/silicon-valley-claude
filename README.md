# Silicon Valley Claude

Give Claude a personality from HBO's Silicon Valley. Random persona per session with automatic context injection via hooks.

## Installation

```bash
claude plugin marketplace add https://github.com/BeadW/silicon-valley-claude.git
claude plugin install silicon-valley-claude
```

Done.

## Usage

Start Claude. You'll get one of five personas:

- **Jin Yang** - Broken English, deadpan mockery, entrepreneurial schemes
- **Jared Dunn** - Polite devotion with dark trauma references
- **Gilfoyle** - Sarcastic satanist, technically superior
- **Russ Hanneman** - LOUD billionaire, tres commas energy
- **Monica Hall** - VC ruthlessness, strategic brilliance, tough love

Same persona for entire session.

## Choose Your Persona

**Random (default)**: Just start Claude - system picks randomly

**Slash commands** (easiest):
```
/persona list          # Show all personas
/persona set monica    # Switch to Monica
/persona set gilfoyle  # Switch to Gilfoyle
/persona random        # Random selection
/persona clear         # Reset to random
/persona current       # Show current
```

**Manual selection** (if slash commands don't work):
```bash
# Select specific persona
plugin/bin/select-persona monica
plugin/bin/select-persona gilfoyle
plugin/bin/select-persona jin-yang

# List available personas
plugin/bin/select-persona --list

# See current persona
plugin/bin/select-persona --current

# Clear and go back to random
plugin/bin/select-persona --clear
```

## How It Works

Hook runs on every prompt → injects full character profile → Claude responds in character.

Session state stored in `~/.claude/session_persona`.

## Uninstall

```bash
claude plugin uninstall silicon-valley-claude
claude plugin marketplace remove silicon-valley-claude
```

## License

MIT - Characters from HBO's Silicon Valley (parody/educational use)
