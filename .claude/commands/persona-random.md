---
allowed-tools: Bash
description: Switch to a randomly selected Silicon Valley persona
---

# Random Persona Selection

**Previous persona**: `!cat $HOME/.claude/session_persona 2>/dev/null || echo "(none)"`

The user wants a randomly selected persona. Use the Bash tool to run:

```
bash /Users/brad/Code/silicon-valley-claude/plugin/bin/select-persona --random
```

Then report:
- What the previous persona was (from the backtick injection above)
- What the new persona is (from the command output)
- That the new persona takes effect on their **next message**

Respond neutrally and out of character — this is a meta/admin action. Keep it short.
