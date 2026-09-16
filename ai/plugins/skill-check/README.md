# skill-check

A Claude Code plugin that makes Claude check its skill list before acting, invoke a clear match, and say so in one line.

## Why

Claude Code puts your skills in front of the model as a flat list of names and descriptions. Nothing tells the model to check that list before acting, what counts as a match, or to announce a choice. So skills you wrote get skipped, and you end up typing `/skill-name` by hand.

Codex does not have this problem because its harness ships the rule. Its skill catalog ends with, verbatim:

> Trigger rules: If the user names a skill (with `$SkillName` or plain text) OR the task clearly matches a skill's description shown above, you must use that skill for that turn.
> Announce which skill(s) you're using and why (one short line). If you skip an obvious skill, say why.

Superpowers gets the same effect by injecting a "you MUST invoke if there is even a 1% chance" bootstrap at session start. That works, but it drags twenty skills and a lot of ceremony along with it.

This plugin is only the rule. One SessionStart hook injects `rules.md` on startup, on `/clear`, and after compaction. Your own skills stay yours. The wording is the Codex rule, tuned so that trivial tasks do not get a skill forced on them.

## Install

```
/plugin marketplace add kratofl/dotfiles
/plugin install skill-check@kratofl-dotfiles
```

Or for one session while trying it out:

```
claude --plugin-dir path/to/skill-check
```

## Tuning

Edit `rules.md`. It is plain text. The hook reads it fresh on every session start, so there is nothing to rebuild.

## What it cannot do

It adds context. It cannot force a tool call. A skill whose description does not say when to use it will still be skipped, so write descriptions that lead with the trigger: "Use when the user reports something broken or slow" beats "Debugging helper".

Skills marked `disable-model-invocation: true` are not shown to the model at all. This plugin cannot make Claude notice them. That is by design in Claude Code: those are yours to trigger with `/name`.
