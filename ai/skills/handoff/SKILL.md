---
name: handoff
description: Compact the current conversation into a provider-neutral handoff document for a fresh agent. Use only when the user explicitly asks to prepare or save a handoff.
---

# Handoff

Write a concise handoff document and save it in the operating system's temporary directory, not the workspace.

Include the objective, current state, decisions, constraints, remaining work, verification status, and suggested skills. Reference existing specs, plans, ADRs, issues, commits, and diffs rather than duplicating them. Use paths or URLs that the receiving agent can resolve.

Redact credentials, tokens, personal data, and other sensitive information. If the user describes the next session's focus, tailor the handoff to it.

Return the absolute path to the saved document. Do not launch another agent unless the user separately asks for that action.
