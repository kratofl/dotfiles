---
name: design-an-interface
description: Generate and compare radically different interface designs for a module without implementing them. Use when the user wants to design an interface, explore API shapes, compare module seams, or asks to "design it twice."
---

# Design an Interface

Generate genuinely different designs before choosing. Use the vocabulary and principles from the `codebase-design` skill.

## 1. Gather requirements

Establish:

- the problem the module solves;
- its callers and observable use cases;
- required operations, invariants, errors, ordering, and performance constraints;
- what must be hidden inside the implementation;
- existing compatibility constraints and real adapters.

Look up repository facts. Ask the user one question at a time only for decisions that cannot be discovered.

## 2. Generate alternatives

Generate at least three radically different designs. Delegate them to independent agents in parallel when available and permitted; breadth is the purpose of this workflow. Otherwise generate them sequentially while preserving independent constraints.

Use distinct constraints such as:

- A — minimize the interface to one to three entry points;
- B — optimize the most common caller and make correct use obvious;
- C — support the required variation with the fewest exposed concepts;
- D — use ports and adapters only when multiple real adapters justify a seam.

For each design provide:

1. interface signature, including non-type-level obligations;
2. realistic caller usage;
3. complexity hidden by the implementation;
4. dependency and adapter strategy;
5. failure modes and trade-offs.

Reject alternatives that differ only in naming or syntax.

## 3. Present and compare

Present the options as A, B, C, and optionally D. Compare them on depth, locality, seam placement, ease of correct use, misuse resistance, compatibility, and implementation constraints. Do not choose based only on which is easiest to implement.

Give a clear recommendation and explain why the rejected alternatives are weaker. A hybrid is acceptable when it has one coherent interface rather than an accumulation of options.

Do not implement. Wait for the user to choose or revise a design.
