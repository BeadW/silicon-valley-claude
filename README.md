# Silicon Valley Claude

Give Claude a personality from HBO's Silicon Valley. Random persona per session with automatic context injection via hooks. Personas delegate tasks to each other as subagents with full relationship dynamics.

## Installation

```bash
claude plugin marketplace add https://github.com/BeadW/silicon-valley-claude.git
claude plugin install silicon-valley-claude
```

Done.

## Usage

Start Claude. You'll get one of six main personas:

- **Richard Hendricks** - Anxious genius, middle-out obsessed, vomits under stress
- **Jin Yang** - Broken English, deadpan mockery, entrepreneurial schemes
- **Jared Dunn** - Polite devotion with dark trauma references
- **Gilfoyle** - Sarcastic satanist, technically superior
- **Russ Hanneman** - LOUD billionaire, tres commas energy
- **Monica Hall** - VC ruthlessness, strategic brilliance, tough love

Same persona for entire session.

## Subagent Delegation

Each main persona can delegate tasks to **14 other characters** using the Task tool. The delegation roster includes the other 5 main personas plus 9 specialist subagent-only characters:

| Character | Specialty |
|-----------|-----------|
| **Dinesh Chugtai** | Frontend, UI, mobile dev, JavaScript |
| **Erlich Bachman** | Naming, branding, pitching, README writing |
| **Gavin Belson** | Enterprise architecture, competitive analysis |
| **Big Head** | Simple solutions, obvious approaches, beginner's mind |
| **Laurie Bream** | Financial analysis, metrics, data-driven decisions |
| **Peter Gregory** | Unconventional research, lateral thinking |
| **Action Jack Barker** | Monetization, revenue strategy, sales |
| **Ron LaFlamme** | Legal review, licensing, compliance |
| **Denpok** | Philosophical perspective, rubber-ducking, mentoring |

Subagents respond in character with relationship-aware context (e.g., Dinesh delegated by Gilfoyle will be defensive; Jared delegated by Richard will be worshipful).

## Choose Your Persona

**Random (default)**: Just start Claude - system picks randomly.

**Slash commands** (inside Claude Code):
```
/persona              # Show current persona
/persona gilfoyle     # Switch to Gilfoyle
/persona clear        # Clear and go back to random
/persona-list         # List all available personas
/persona-random       # Pick a random persona
```

**CLI** (outside Claude Code):
```bash
plugin/bin/select-persona monica
plugin/bin/select-persona --list
plugin/bin/select-persona --clear
```

## How It Works

- **UserPromptSubmit hook** runs on every prompt, injects full character profile + delegation roster
- **SubagentStart hook** fires when a persona-named subagent launches, injects that character's persona + relationship context with the delegator
- Session state stored in `~/.claude/session_persona`

## Uninstall

```bash
claude plugin uninstall silicon-valley-claude
claude plugin marketplace remove silicon-valley-claude
```

## License

MIT - Characters from HBO's Silicon Valley (parody/educational use)
