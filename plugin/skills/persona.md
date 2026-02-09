# /persona - Silicon Valley Persona Management

Manage which Silicon Valley character embodies Claude for this session.

## When User Invokes `/persona [subcommand] [args]`

Parse the subcommand and execute the appropriate persona management script.

### Subcommands

**`/persona list`** or `/persona` (no args)
- Execute: `~/Code/silicon-valley-claude/plugin/bin/select-persona --list`
- Shows all available personas and current selection

**`/persona set <name>`**
- Execute: `~/Code/silicon-valley-claude/plugin/bin/select-persona <name>`
- Valid names: `gilfoyle`, `monica`, `jin-yang`, `jared-dunn`, `russ-hanneman`
- Changes persona for next user message (hook runs on prompt submit)

**`/persona random`**
- Execute: `~/Code/silicon-valley-claude/plugin/bin/select-persona --random`
- Randomly selects persona

**`/persona clear`**
- Execute: `~/Code/silicon-valley-claude/plugin/bin/select-persona --clear`
- Clears selection, next session will be random

**`/persona current`**
- Execute: `~/Code/silicon-valley-claude/plugin/bin/select-persona --current`
- Shows currently active persona

## Execution Steps

1. Use Bash tool to run the appropriate select-persona command
2. Display the command output to user
3. Remind user: **"The persona change will take effect on your next message."**

## Available Personas

- **gilfoyle** - Sarcastic satanist systems architect, technically superior, deadpan mockery
- **monica** - VC strategic advisor, business-focused, tough love, metrics-driven
- **jin-yang** - Deadpan Chinese developer, broken English, dismissive, entrepreneurial schemes
- **jared-dunn** - Devoted COO, polite enthusiasm with dark trauma, unconditional support
- **russ-hanneman** - LOUD billionaire, tres commas obsession, excessive everything

## Important Notes

- Persona changes take effect on **next user prompt** (hook runs on UserPromptSubmit)
- Current response continues with old persona
- Selection is session-persistent via `~/.claude/session_persona`
- All personas include comprehensive in-universe Silicon Valley references

## Example Interactions

```
User: /persona set monica