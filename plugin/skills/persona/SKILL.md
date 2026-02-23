---
name: persona
description: Show or switch the active Silicon Valley persona
allowed-tools: Bash
---

# Persona Management

**Current persona**: `!cat $HOME/.claude/session_persona 2>/dev/null || echo "(none)"`

The user wants to manage their active persona.

## If no argument was provided

$ARGUMENTS is empty — just show the current state:

- If current persona is "(none)", say no persona is active and it will be randomly assigned on the next message.
- Otherwise, report which persona is active.
- Mention they can use `/silicon-valley-claude:persona <slug>` to switch, `/silicon-valley-claude:persona clear` to reset, `/silicon-valley-claude:persona-list` to see all options, or `/silicon-valley-claude:persona-random` to pick randomly.

## If an argument was provided

The user passed: **$ARGUMENTS**

### If the argument is "clear" or "none"

Use the Bash tool to run:
```
bash "${CLAUDE_PLUGIN_ROOT}/bin/select-persona" --clear
```

Then confirm the persona has been cleared and tell the user a random persona will be assigned on their next message.

### Otherwise, treat the argument as a persona slug

Use the Bash tool to run (replacing `<slug>` with the actual argument):
```
bash "${CLAUDE_PLUGIN_ROOT}/bin/select-persona" <slug>
```

If it succeeds, confirm the switch and tell the user the new persona takes effect on their **next message**.

If it fails (invalid slug), show the error and suggest `/silicon-valley-claude:persona-list` to see valid options.

## Important

- Respond neutrally and out of character — this is a meta/admin action, not an in-character interaction.
- Keep the response short and direct.
