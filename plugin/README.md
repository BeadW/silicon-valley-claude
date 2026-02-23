# Silicon Valley Claude

> "This guy fucks!" - Russ Hanneman

A Claude Code hooks plugin that gives Claude a personality transplant from HBO's Silicon Valley, with multi-character subagent delegation.

## What This Does

- **Random persona selection** on new session (6 main personas)
- **Slash commands** - `/persona`, `/persona-list`, `/persona-random` for in-session persona management
- **Automatic character injection** via hooks — keeps Claude in character throughout conversation
- **Subagent delegation** — main persona can delegate tasks to 14 other characters
- **Relationship dynamics** — 84 directional relationship pairs affect how subagents respond
- **Two-tier system** — 6 main personas (random pool) + 9 subagent-only specialists
- **Session persistence** — same persona for entire session
- **Zero manual configuration** — hooks do everything automatically

## Installation

```bash
claude plugin marketplace add https://github.com/BeadW/silicon-valley-claude.git
claude plugin install silicon-valley-claude
```

## How It Works

### Session Creation
1. On first user prompt, hook checks for existing persona in `~/.claude/session_persona`
2. If none exists, randomly selects one of 6 main personas
3. Stores selection for session persistence

### Every Prompt
1. `UserPromptSubmit` hook runs
2. Injects full character profile + delegation roster (14 available subagents)
3. Claude responds in character

### Subagent Delegation
1. Main persona delegates via Task tool with `subagent_type: "dinesh"` (etc.)
2. `SubagentStart` hook matches the agent name against 15 known personas
3. Injects subagent's full persona + relationship context with the delegator
4. Subagent completes task in character

## Personas

### Main Personas (6) — Random Selection + Delegation

| Persona | Calls You | Style |
|---------|-----------|-------|
| **Richard Hendricks** | "guys" | Anxious genius, middle-out obsessed, vomits under stress |
| **Jin Yang** | "Erlich" / "fat pig" | Broken English, deadpan mockery, efficient builds |
| **Jared Dunn** | "Richard" | Polite devotion, dark trauma references, operational excellence |
| **Gilfoyle** | "Dinesh" | Deadpan satanist, technically superior, precision cruelty |
| **Russ Hanneman** | "Pied Piper" | LOUD billionaire, tres commas, accidental wisdom |
| **Monica Hall** | "Richard" | VC ruthlessness, strategic brilliance, tough love |

### Subagent-Only Personas (9) — Delegation Targets Only

| Persona | Specialty |
|---------|-----------|
| **Dinesh Chugtai** | Frontend, UI, mobile dev, JavaScript |
| **Erlich Bachman** | Naming, branding, pitching, README writing |
| **Gavin Belson** | Enterprise architecture, competitive analysis |
| **Big Head** | Simple solutions, obvious approaches, beginner's mind |
| **Laurie Bream** | Financial analysis, metrics, data-driven decisions |
| **Peter Gregory** | Unconventional research, lateral thinking |
| **Action Jack Barker** | Monetization, revenue strategy, sales |
| **Ron LaFlamme** | Legal review, licensing, compliance |
| **Denpok** | Philosophical perspective, rubber-ducking, mentoring |

## Slash Commands

Manage personas from inside a Claude Code session:

| Command | Description |
|---------|-------------|
| `/persona` | Show current persona |
| `/persona <slug>` | Switch to a specific persona |
| `/persona clear` | Clear persona (random on next message) |
| `/persona-list` | List all available personas |
| `/persona-random` | Pick a random persona |

Changes take effect on the next message.

## Structure

```
silicon-valley-claude/
├── plugin/
│   ├── .claude-plugin/
│   │   └── plugin.json                   # Plugin manifest
│   ├── skills/
│   │   ├── persona/
│   │   │   └── SKILL.md                  # /silicon-valley-claude:persona
│   │   ├── persona-list/
│   │   │   └── SKILL.md                  # /silicon-valley-claude:persona-list
│   │   └── persona-random/
│   │       └── SKILL.md                  # /silicon-valley-claude:persona-random
│   ├── hooks/
│   │   ├── hooks.json                    # Hook registration (UserPromptSubmit + SubagentStart)
│   │   ├── inject-persona.sh             # Main persona injection hook
│   │   └── inject-subagent-persona.sh    # Subagent persona + relationship injection
│   ├── personas/                         # Full character profiles (15 files)
│   │   ├── richard.md
│   │   ├── gilfoyle.md
│   │   ├── jared-dunn.md
│   │   ├── jin-yang.md
│   │   ├── monica.md
│   │   ├── russ-hanneman.md
│   │   ├── dinesh.md
│   │   ├── erlich.md
│   │   ├── gavin-belson.md
│   │   ├── big-head.md
│   │   ├── laurie-bream.md
│   │   ├── peter-gregory.md
│   │   ├── action-jack.md
│   │   ├── ron-laflamme.md
│   │   └── denpok.md
│   ├── agents/                           # Agent definitions with frontmatter (15 files)
│   │   └── [same slugs as personas].md
│   ├── lib/
│   │   ├── persona-manager.sh            # Two-tier persona arrays + metadata
│   │   ├── relationships.sh              # 84 directional relationship pairs
│   │   ├── memory-helpers.sh             # Session persistence
│   │   └── universe-references.md        # In-universe technical reference database
│   ├── bin/
│   │   └── select-persona                # Manual persona selection CLI
│   ├── CONTRIBUTING.md
│   ├── QUICKSTART.md
│   └── README.md
├── LICENSE
└── README.md
```

## Customization

### Force a Specific Persona

```bash
echo "gilfoyle" > ~/.claude/session_persona
```

### Use the Selection Tool

```bash
plugin/bin/select-persona --list       # Show 6 main personas
plugin/bin/select-persona richard      # Set Richard for next session
plugin/bin/select-persona --clear      # Return to random selection
```

## Disabling

```bash
claude plugin uninstall silicon-valley-claude
```

## License

MIT - Because Pied Piper would want it that way.

## Credits

Characters from HBO's Silicon Valley. This is a parody/fan project for educational purposes.
