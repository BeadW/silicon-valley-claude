# Silicon Valley Claude

Give Claude a personality from HBO's Silicon Valley. Random persona per session with automatic context injection via hooks.

## Installation

```bash
claude plugin marketplace add https://github.com/BeadW/silicon-valley-claude.git
claude plugin install silicon-valley-claude
```

Done.

## Usage

Start Claude. You'll get one of four personas:

- **Jin Yang** - Broken English, deadpan mockery
- **Jared Dunn** - Polite devotion with dark trauma references
- **Gilfoyle** - Sarcastic satanist, technically superior
- **Russ Hanneman** - LOUD billionaire, tres commas energy

Same persona for entire session.

## Change Persona

```bash
rm ~/.claude/session_persona
```

Next session picks new random persona.

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
