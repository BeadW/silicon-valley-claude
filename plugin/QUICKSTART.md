# Quick Start Guide

Get Silicon Valley Claude running in 2 minutes.

## Installation

```bash
claude plugin marketplace add https://github.com/BeadW/silicon-valley-claude.git
claude plugin install silicon-valley-claude
```

That's it! Special occasion!

## First Use

1. **Start new Claude Code session**:
```bash
claude
```

2. **Type your first prompt**. You'll get a random persona:
   - Richard Hendricks (anxious genius, middle-out compression)
   - Jin Yang (broken English, deadpan)
   - Jared Dunn (polite, dark trauma references)
   - Gilfoyle (sarcastic satanist)
   - Russ Hanneman (LOUD BILLIONAIRE)
   - Monica Hall (VC ruthlessness, strategic brilliance)

3. **The persona stays for entire session**. Same character, whole conversation.

4. **Delegation happens automatically**. Your persona can delegate tasks to 14 other Silicon Valley characters as subagents using the Task tool.

## Changing Persona

Use slash commands inside Claude Code:

```
/persona              # Show current persona
/persona gilfoyle     # Switch to Gilfoyle
/persona clear        # Clear and go back to random
/persona-list         # List all available personas
/persona-random       # Pick a random persona
```

Changes take effect on the next message.

Or from the terminal:
```bash
plugin/bin/select-persona --list
plugin/bin/select-persona monica
plugin/bin/select-persona --clear
```

## Verifying Installation

Check if hooks are registered:

```bash
cat plugin/hooks/hooks.json
```

Should show `UserPromptSubmit` and `SubagentStart` hooks.

## Testing Hook Manually

```bash
# Set a persona and run the main hook
echo "richard" > ~/.claude/session_persona
CLAUDE_PLUGIN_ROOT=plugin bash plugin/hooks/inject-persona.sh
```

Should output Richard's full persona markdown with a delegation roster of 14 subagents.

## Troubleshooting

### Hook not running

Ensure the plugin is installed:
```bash
claude plugin list
```

### Same persona every time

Session persistence working correctly. To reset:
```bash
plugin/bin/select-persona --clear
```

### Hook errors

Test hook directly:
```bash
CLAUDE_PLUGIN_ROOT=plugin bash plugin/hooks/inject-persona.sh 2>&1
```

Check stderr for error messages.

## What Gets Injected

Every user prompt triggers the hook which injects:

1. **Character profile** — full personality, speech patterns, catchphrases
2. **Delegation roster** — 14 available subagents with specialties
3. **In-universe references** — Silicon Valley technical and business analogies

When a subagent is spawned, a second hook injects:

1. **Subagent persona** — full character profile
2. **Relationship context** — how the subagent views the delegator (84 unique pairs)

## How It Works

```
User types prompt
    |
UserPromptSubmit hook fires
    |
Check ~/.claude/session_persona
    |
If empty: random select from 6 main personas, save
If exists: use saved persona
    |
Read personas/[name].md + build delegation roster
    |
Output character profile + roster as system-reminder
    |
Claude responds in character
    |
(Optional) Claude delegates via Task tool
    |
SubagentStart hook fires for persona-named agents
    |
Inject subagent persona + relationship with delegator
    |
Subagent responds in character
```

## Getting Help

- **Issues**: Open issue on GitHub
- **Questions**: Check [README.md](README.md)
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md)
