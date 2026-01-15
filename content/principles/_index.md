---
title: "Principles"
description: "Enduring constraints that guide how I design, build, and change software systems."
---

These principles define how I think about **architecture, delivery, and engineering leadership**.

They are not preferences or best practices.  
They are **constraints** — rules that exist to preserve correctness, reduce risk, and make change safe over time.

They are grouped into five pillars.

---

## I. Architecture as Constraint

Architecture exists to **constrain complexity over time**.

- Architecture is the practice of preventing accidental complexity from becoming the dominant cost.
- If a system is hard to change, the architecture has already failed.
- Good architecture is not created once; it is practiced continuously.
- Frameworks do not create systems. **Boundaries do.**
- If a system is hard to reason about, that is not a tooling problem.
- If you cannot explain the system, you do not control it.
- Scalability is not a feature. It is the result of early boundary decisions.
- Every system eventually reflects the shape of the organization that builds it. Design both deliberately.
- Architecture must account for **composition**: how independently correct systems combine into larger behaviors.

Architecture is not about diagrams.  
It is about shaping systems so they remain understandable and changeable as they grow.

---

## II. System Honesty

A system must **never lie** about what it is or what it can do.

- Fake behavior in production systems is a form of technical debt.
- If a system can lie about its state, it will eventually do so at the worst possible time.
- Partial implementations that present themselves as complete are failures of design.
- Failure must be explicit, observable, and part of the contract.
- Development and test modes must not misrepresent reality.
- Feature flags are honesty boundaries: a capability does not exist unless its invariants and failure modes are real.

Systems that appear healthy while hiding incomplete or unsafe behavior accumulate invisible risk.

---

## III. Reproducibility and Determinism

If behavior cannot be reproduced, it cannot be trusted.

- Reproducibility is not infrastructure. It is design.
- A system that only works in one environment is not a finished system.
- “It works on my machine” is an architectural failure.
- Builds must be reproducible.
- Tests must be deterministic.
- Hidden state, implicit configuration, and ambient behavior are design failures.
- Dependencies are part of the system, and their behavior must be controlled.

Reproducibility is how we know a system is correct — and how we make change safe.

---

## IV. Intentional Change and Governance

Change is only safe when **intent is explicit** and **scope is controlled**.

- Nothing should change unless you intended it to.
- The difficulty of a change should match its scope, not its shape.
- Refactors are not neutral; they are changes and must be treated as such.
- Tests are not for coverage. They are for control.
- Dependency management *is* change management.
- If integration is deferred, risk is being accumulated.
- The most expensive upgrade is the one you postpone.

Governance exists to reduce ambiguity, not to add friction.  
It is a delivery enabler, not a tax.

---

## V. Reasoning and Judgment

Correct systems depend on **correct reasoning**.

- Tools do not replace judgment. They amplify it — for better or worse.
- Most execution problems are really system design problems.
- Sustainable systems are built by sustainable teams.
- You cannot scale reliability by hiring. You have to design it.
- If ownership is unclear, failure will be ambiguous.
- Changes must be auditable and documented so intent can be reconstructed later.
- Decisions should be explicit, inspectable, and challengeable.

Clear reasoning is not a communication preference.  
It is a safety mechanism.

---

These principles are meant to be **applied**, not admired.

When they feel restrictive, that is usually the point.
