---
name: find-skills
description: Discover and assess installable Agent Skills. Use when the user explicitly asks to find, compare, recommend, or install a skill, or asks whether a reusable skill exists for a specific workflow. Do not trigger for ordinary requests that can be completed directly.
---

# Find Skills

## Discover

1. Clarify the concrete workflow, host products, operating systems, and required tools.
2. Prefer the host product's built-in skill discovery or installer when available.
3. Otherwise search the open Agent Skills ecosystem with a focused query, for example:

   ```bash
   npx skills find "<query>"
   ```

4. If no relevant skill exists, offer to complete the task directly or create a small personal skill.

## Assess

Do not recommend a skill from search metadata alone. Inspect its `SKILL.md` and bundled scripts first.

Check:

- whether its description and workflow match the request;
- source reputation and maintenance activity;
- scripts, hooks, network calls, package installation, and destructive actions;
- required credentials, connectors, runtimes, and platform assumptions;
- compatibility with both Claude Code and Codex when portability matters;
- conflicts with the user's global or repository instructions.

Treat install counts, stars, and rankings as weak signals, not proof of quality.

## Present

Give the user a short comparison containing:

- skill name and source;
- what it adds beyond the host's built-in capabilities;
- relevant permissions or dependencies;
- portability limitations;
- the exact installation command or native installer action.

## Install

Install only after the user explicitly chooses a skill. Use the host's native installer where possible. If the fallback CLI is appropriate, use a reviewed package identifier:

```bash
npx skills add <owner/repo@skill> -g -y
```

After installation, report the installed location and any restart or reload requirement.
