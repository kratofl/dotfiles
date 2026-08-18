---
name: prototype
description: Build a clearly marked throwaway prototype to answer a specific behavior, state-model, interaction, or UI design question. Use when the user asks to explore an idea concretely before changing production code.
---

# Prototype

A prototype is throwaway code that answers one named question. State that question before building.

## Choose the branch

- For logic, behavior, or state-model questions, read [LOGIC.md](LOGIC.md).
- For visual or interaction questions, read [UI.md](UI.md).
- If the question is ambiguous, ask one blocking question. If the user is unavailable, choose from the surrounding code and state the assumption.

## Rules

1. Do not edit the real production component first. Build the variant beside it or in an explicitly named scratch/prototype location.
2. Reuse the project's existing runtime, task runner, tokens, and conventions. Do not introduce a new framework for the prototype.
3. Provide one command or route that lets the user inspect it.
4. Keep state in memory unless persistence is the question being tested.
5. Skip production hardening, broad abstractions, exhaustive tests, and unrelated cleanup.
6. Make relevant state and transitions visible so the user can evaluate the answer.
7. Present alternatives as A, B, C when the prototype explores a genuine design choice.
8. Summarize what the prototype established and what remains uncertain.

Do not fold the prototype into production, create a branch, commit it, or publish it unless the user explicitly asks.
