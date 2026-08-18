---
name: claude-handoff
description: Launch a fresh Claude Code background session with a concise handoff of the current work. Use only when the user explicitly asks for a Claude background handoff.
---

# Claude Handoff

Write a concise handoff covering the objective, current state, decisions, constraints, remaining work, verification status, and suggested skills. Reference existing artifacts by path or URL instead of duplicating them. Redact credentials, tokens, personal data, and other sensitive information.

If the user describes the next session's focus, tailor the handoff to it. Then run:

```text
claude --bg --name "<descriptive name>" "<handoff summary>"
```

Always provide a descriptive name. Report the launched session name and do not perform additional work in the current session unless requested.
