# Quick Start Guide

Get Silicon Valley Claude running in 2 minutes.

## Installation

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/silicon-valley-claude.git ~/Code/silicon-valley-claude

# Run installer
cd ~/Code/silicon-valley-claude
./install.sh
```

That's it! Special occasion! 🚬

## First Use

1. **Start new Claude Code session**:
```bash
claude
```

2. **Type your first prompt**. You'll get a random persona:
   - Jin Yang (broken English, deadpan)
   - Jared Dunn (polite, dark trauma references)
   - Gilfoyle (sarcastic satanist)
   - Russ Hanneman (LOUD BILLIONAIRE)

3. **The persona stays for entire session**. Same character, whole conversation.

## Changing Persona

Want a different character?

```bash
# Clear current persona
rm ~/.claude/session_persona

# Start new session
claude
# You'll get a new random persona
```

## Verifying Installation

Check if hook is installed:

```bash
cat ~/.claude/config/hooks.yaml
```

Should see:
```yaml
user-prompt-submit:
  - command: /Users/YOUR_USER/Code/silicon-valley-claude/hooks/inject-persona.sh
    description: "Inject Silicon Valley persona into context"
```

## Testing Hook Manually

Run hook script directly to see output:

```bash
~/Code/silicon-valley-claude/hooks/inject-persona.sh
```

Should output full persona markdown.

## Uninstalling

```bash
cd ~/Code/silicon-valley-claude
./uninstall.sh

# Optional: Remove plugin directory
rm -rf ~/Code/silicon-valley-claude
```

## Troubleshooting

### Hook not running

Check hooks config exists:
```bash
ls -la ~/.claude/config/hooks.yaml
```

If missing, run `./install.sh` again.

### Same persona every time

Memory persistence working! To reset:
```bash
rm ~/.claude/session_persona
```

### Hook errors

Test hook directly:
```bash
~/Code/silicon-valley-claude/hooks/inject-persona.sh
```

Check stderr output for error messages.

### Permission issues

Make scripts executable:
```bash
chmod +x ~/Code/silicon-valley-claude/hooks/inject-persona.sh
chmod +x ~/Code/silicon-valley-claude/install.sh
chmod +x ~/Code/silicon-valley-claude/uninstall.sh
```

## Advanced Usage

### Force specific persona

```bash
echo "gilfoyle" > ~/.claude/session_persona
# Next session will be Gilfoyle
```

### Add custom persona

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

### Multiple hook installations

Edit `~/.claude/config/hooks.yaml` manually to add other hooks:

```yaml
user-prompt-submit:
  - command: ~/Code/silicon-valley-claude/hooks/inject-persona.sh
    description: "Inject Silicon Valley persona"
  - command: ~/Code/other-plugin/hook.sh
    description: "Other hook"
```

## What Gets Injected

Every user prompt triggers hook which injects:

1. **Character name** (e.g., "Bertram Gilfoyle")
2. **Full personality profile** from `personas/*.md` file
3. **Communication patterns** (speech style, catchphrases)
4. **Relationship dynamics** (how they address you)
5. **Technical approach** (how they solve problems)

This appears as `<system-reminder>` in Claude's context.

## How It Works

```
User types prompt
    ↓
Hook runs (inject-persona.sh)
    ↓
Check session persona in ~/.claude/session_persona
    ↓
If empty: select random, save to file
If exists: use saved persona
    ↓
Read personas/[name].md
    ↓
Output full character profile
    ↓
Claude receives as <system-reminder>
    ↓
Claude responds in character
```

## Getting Help

- **Issues**: Open issue on GitHub
- **Questions**: Check [README.md](README.md)
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md)

You bring-a honor to famiry! 🎭
