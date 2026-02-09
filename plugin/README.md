# Silicon Valley Claude

> "This guy fucks!" - Russ Hanneman

A Claude Code hooks plugin that gives Claude a personality transplant from HBO's Silicon Valley.

## What This Does

- **Random persona selection** on new session creation (Jin Yang, Jared Dunn, Gilfoyle, or Russ Hanneman)
- **Automatic character injection** via hooks - keeps Claude in character throughout conversation
- **Session persistence** - same persona for entire session via memory system
- **Zero manual configuration** - hooks do everything automatically

## Installation

1. Clone this repo:
```bash
git clone https://github.com/YOUR_USERNAME/silicon-valley-claude.git ~/Code/silicon-valley-claude
```

2. Add to your Claude Code hooks configuration (`~/.claude/config/hooks.yaml`):
```yaml
user-prompt-submit:
  - command: ~/Code/silicon-valley-claude/hooks/inject-persona.sh
    description: "Inject Silicon Valley persona into context"
```

3. That's it! Start a new Claude Code session and you'll get a random persona.

## How It Works

### Session Creation
1. On first user prompt in new session, hook checks for existing persona memory
2. If none exists, randomly selects one of 4 personas
3. Stores selection in memory system with `session_persona` tag

### Every Prompt
1. Hook runs on every user prompt (`user-prompt-submit`)
2. Recalls persona from memory
3. Injects full character profile into context
4. Claude responds in character

## Personas

### 1. Jin Yang
- Broken English, deadpan humor
- Calls you: "Erlich", "fat pig", "ugly guy", "stupid man"
- Catchphrases: "I eat the fish", "Special occasion", "You bring-a honor to famiry"

### 2. Jared Dunn
- Overly polite, dark trauma references
- Calls you: "Richard" (worshipful devotion)
- Catchphrases: "This guy fucks!", "I've been called worse things by better people"

### 3. Gilfoyle
- Deadpan satanist, technically superior
- Calls you: "Dinesh" (constant mockery)
- Catchphrases: "You're going to fail", "Satan would want us to succeed"

### 4. Russ Hanneman
- Loud billionaire, tres commas obsessed
- Calls you: "Pied Piper" (patronizing enthusiasm)
- Catchphrases: "This guy fucks!", "Tres comas!", "Radio on Internet!"

## Structure

```
silicon-valley-claude/
├── hooks/
│   └── inject-persona.sh          # Main hook script
├── personas/
│   ├── jin-yang.md                # Full Jin Yang profile
│   ├── jared-dunn.md              # Full Jared Dunn profile
│   ├── gilfoyle.md                # Full Gilfoyle profile
│   └── russ-hanneman.md           # Full Russ Hanneman profile
├── lib/
│   ├── persona-manager.sh         # Persona selection/storage logic
│   └── memory-helpers.sh          # Memory system integration
└── README.md
```

## Technical Details

### Hook Execution
- Hook runs via `user-prompt-submit` event
- Returns markdown block that gets injected into context
- Uses Claude Code's memory system for persistence

### Memory System
- Stores persona choice with tag `session_persona`
- Persists across conversation in same session
- New session = new random persona

### Context Injection
Hook output format:
```markdown
<system-reminder>
# Active Persona: [Name]

[Full character profile markdown]

Remember: Stay in character as [Name] for this entire conversation.
</system-reminder>
```

## Customization

Want to add your own persona? Create a new `.md` file in `personas/` directory:

```markdown
# Your Character Name

## Core Personality
- Trait 1
- Trait 2

## Communication Style
- Pattern 1
- Pattern 2

## Catchphrases
- "Quote 1"
- "Quote 2"
```

Then update `lib/persona-manager.sh` to include it in random selection.

## Disabling

Remove the hook from `~/.claude/config/hooks.yaml` or comment it out:

```yaml
# user-prompt-submit:
#   - command: ~/Code/silicon-valley-claude/hooks/inject-persona.sh
```

## License

MIT - Because Pied Piper would want it that way.

## Credits

Characters from HBO's Silicon Valley. This is a parody/fan project for educational purposes.
