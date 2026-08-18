---
name: code-review
description: "Review committed or uncommitted changes along two independent axes: repository standards and fidelity to the originating specification. Use when the user asks to review a branch, pull request, diff, staged work, working tree, or changes since a ref."
---

# Code Review

Review changes as a read-only task. Do not edit, commit, publish, or resolve findings unless the user separately asks.

Keep the axes separate:

- **Standards** — whether the change follows documented repository rules and introduces maintainability risks.
- **Spec** — whether the change implements the requested behavior without omissions or scope creep.

Use independent agents for the two axes when available and permitted. This is adversarial review work, so context isolation is useful. If delegation is unavailable, run the axes sequentially and keep their findings separate.

## 1. Establish the review scope

Use the scope named by the user. Otherwise:

1. Inspect the working tree.
2. If it contains changes, include staged, unstaged, and relevant untracked files.
3. If it is clean, resolve the repository's default base branch and compare its merge-base with `HEAD`.

For a fixed ref, verify it resolves before reviewing and use a merge-base comparison such as `git diff <ref>...HEAD`. Record the commands or file set once so every review axis examines the same scope. Stop cleanly when the scope is empty.

## 2. Find the specification

Look in this order:

1. a path, issue, pull request, or URL supplied by the user;
2. issue references in commits or branch metadata;
3. matching files under `docs/`, `specs/`, or `.scratch/`;
4. relevant conversation decisions.

Use an already configured tracker connector or CLI when needed. Do not install or configure a tracker during review. If no specification exists, run only the Standards axis and say that spec fidelity could not be assessed.

## 3. Find the standards

Read applicable `AGENTS.md`, `CLAUDE.md`, `CONTRIBUTING.md`, coding standards, formatter/analyzer configuration, and nearby conventions. Repository documentation overrides generic heuristics. Skip findings that deterministic tooling already reports unless the tooling result itself is part of the evidence.

Use this smell baseline only as labelled judgement calls:

- **Mysterious Name** — a name hides what a value or operation means.
- **Duplicated Code** — the same logic shape is repeated.
- **Feature Envy** — logic reaches into another module's data more than its own.
- **Data Clumps** — the same values repeatedly travel together and want a type.
- **Primitive Obsession** — a primitive stands in for a domain concept.
- **Repeated Switches** — repeated branching on the same kind or state.
- **Shotgun Surgery** — one behavior change requires scattered edits.
- **Divergent Change** — one module changes for unrelated reasons.
- **Speculative Generality** — abstraction exists for needs the spec does not have.
- **Message Chains** — callers depend on long navigation chains.
- **Middle Man** — a layer mostly delegates without hiding complexity.
- **Refused Bequest** — inheritance exposes behavior an implementation rejects.

## 4. Run both axes

Give each reviewer the same scope and commit/file list.

The Standards reviewer must cite the repository rule for hard violations and label baseline smells as judgement calls. It must tie every finding to a concrete file and failure or maintenance cost.

The Spec reviewer must quote or point to the requirement behind every finding and report missing behavior, incorrect behavior, and unrequested scope separately.

Reject speculative findings that cannot be connected to an actual changed path or requirement.

## 5. Report

Present findings first under `## Standards` and `## Spec`, ordered by severity within each axis. For each finding, give a file and line, the trigger or impact, and a concise fix direction. Do not merge or rerank the axes.

End with the reviewed scope, checks performed, finding count per axis, and any residual risk. If no actionable findings exist, say so explicitly.
