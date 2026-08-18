---
name: implement
description: Implement work from an approved specification or ticket. Use only when the user explicitly asks to implement defined work, not while requirements or design decisions are still open.
---

# Implement

Implement exactly the approved scope. Treat the specification, tickets, repository instructions, and the user's latest message as the contract.

1. Read the relevant code, tests, domain glossary, and ADRs before editing.
2. Surface an assumption only when ambiguity would materially change the result. Otherwise make the smallest reasonable choice and report it.
3. Apply the `tdd` skill when the user requested test-first work or when a pre-agreed seam makes a focused red-green loop useful.
4. Work in small vertical slices. Run targeted type checks and tests while iterating.
5. Run the relevant broader verification once the implementation is complete.
6. Apply the `code-review` skill when an independent standards/spec review is useful or requested.
7. Report the outcome, verification evidence, assumptions, and anything not verified.

Do not expand scope, publish, push, or commit unless the user explicitly requests that action.
