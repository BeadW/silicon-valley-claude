---
allowed-tools: []
description: List all available Silicon Valley personas
---

# Available Personas

**Current persona**: `!cat $HOME/.claude/session_persona 2>/dev/null || echo "(none)"`

Here are all the available Silicon Valley personas:

| Slug | Character |
|------|-----------|
| `jin-yang` | Jin Yang (Jian-Yang) |
| `jared-dunn` | Jared Dunn |
| `gilfoyle` | Bertram Gilfoyle |
| `russ-hanneman` | Russ Hanneman |
| `monica` | Monica Hall |

Display this table to the user. Mark the current persona with a arrow or indicator if one is active.

Then remind them:
- `/persona <slug>` to switch
- `/persona clear` to reset
- `/persona-random` to pick randomly

Respond neutrally and out of character — this is a meta/admin action.
