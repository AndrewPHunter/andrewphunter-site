---
title: "Distributed Truth"
date: 2026-03-15
type: writing
series: corpus
draft: false
summary: "Distributed systems permit multiple evaluation contexts to exist simultaneously. Each context may enforce the same invariant space yet operate over a different representation of system behavior. Under these conditions, locally correct transitions can produce globally inconsistent outcomes. Distributed truth arises not from weakened constraints but from constraint evaluation across divergent contexts, requiring reconciliation to restore coherent system behavior."
aliases:
  - /theory/corpus/distributed-truth/
  - /writing/distributed-truth/
---

## 0. Shared Representation Surfaces

Systems can only evaluate behavior relative to what they can represent.

When two systems interact, they do so across a shared representation surface — the portion of system structure both sides can observe, interpret, and evaluate.

This surface defines the portion of system structure across which constraints can be applied and invariants enforced.

In tightly composed systems this shared surface is wide. Transitions are evaluated against nearly the same representation of system behavior. Interaction constraints may still exist, and engineers may misunderstand the invariant space, but evaluation remains largely coherent.

Distributed systems change this condition.

Distance — whether physical, architectural, or arising from the propagation of system transitions — reduces the shared representation surface through which systems observe one another. Each system continues to enforce its constraints, but it does so relative to a representation that may no longer match the representations held elsewhere.

As the shared representation surface narrows, evaluation contexts diverge.

Distributed systems do not weaken constraint.

They reduce the shared representation surface through which constraints can be enforced.

---

## 1. Evaluation Context

Constraint enforcement occurs relative to a representation.

An **evaluation context** is the representation of system structure against which constraints are interpreted and transitions are validated.

Within an evaluation context:

- invariants define the states that are permitted,
- constraints exclude transitions that would violate those invariants,
- and only the structure visible within that representation can participate in enforcement.

Evaluation contexts are therefore not merely data stores or memory locations. They are the effective representations through which a system determines whether behavior is permitted.

In tightly composed systems, the shared representation surface between interacting structures is wide. Each system evaluates behavior relative to its own representation, but those representations overlap substantially. Transitions therefore propagate through nearly the same structural view of the system.

In distributed systems, the shared representation surface narrows.

Each system continues to enforce its constraints within its own evaluation context, but the representations through which those constraints operate may diverge. Systems remain locally correct relative to what they can observe. Yet the overlap between those observations may no longer be sufficient to preserve the invariants engineers assume govern the whole.

---

## 2. Divergent Evaluation Contexts

When evaluation contexts diverge, constraint enforcement remains local to each representation.

Each context interprets transitions relative to the structure visible within it. Invariants may still be enforced correctly within that context. No constraint may be violated locally.

Yet the representations themselves may no longer overlap sufficiently to preserve the invariants engineers assume govern the composed system.

This divergence does not require failure.

It arises when interacting contexts do not share enough representation to preserve the same invariant surface.

A transition may be fully valid within one representation while remaining outside what another representation can incorporate into enforcement.

Each context therefore remains internally coherent.

The system itself also remains coherent — but only relative to the invariant surface supported by the shared representation between those contexts.

This is the defining condition of distributed systems: multiple locally valid interpretations of system behavior can coexist simultaneously.

Truth does not fracture because constraint has weakened.

It becomes contextual because enforcement occurs relative to representations that no longer fully overlap.

---

## 3. Local Correctness and Global Structure

Under divergent evaluation contexts, a new structural condition appears.

A transition may enter one context while remaining outside the structure visible to another.

Each context continues to enforce constraints relative to the representation through which it operates. No invariant is relaxed. No boundary has necessarily failed.

Yet transitions incorporated independently across contexts may combine into configurations that would not arise if enforcement occurred across a larger shared representation.

The system continues to operate.

But the invariant surface actually governing behavior is smaller than the one engineers believe they designed.

---

## 4. Reconciliation

Because evaluation contexts can diverge, distributed systems require mechanisms that re-establish shared representation.

These mechanisms are not primarily about communication reliability or performance optimization. Their structural role is to increase the overlap between representations so that constraint enforcement can again operate across a larger shared surface.

When contexts diverge, transitions may be incorporated independently within different representations. Reconciliation determines how those independently incorporated transitions become part of the shared structure that participating systems recognize.

Reconciliation does not prevent divergence. It manages its consequences.

Consensus algorithms, conflict resolution strategies, and synchronization protocols are all responses to this requirement. Each attempts to expand the shared representation surface across which invariants can be enforced.

Reconciliation itself is not outside the system.  
It is another structure introduced into the composition.

Which means reconciliation also participates in the same compositional pressures it attempts to manage.

The deeper structural requirement is therefore not distribution itself.

It is the preservation of constraint when representation diverges.

---

## Conclusion: Distributed Truth

Composition assumes that interacting systems evaluate behavior across a sufficiently shared representation.

Distributed systems weaken that assumption.

As the shared representation surface narrows, evaluation contexts diverge. Each system continues to enforce its constraints relative to what it can represent. No rule must be violated for divergence to appear.

The system therefore remains coherent.

But only relative to the invariant surface supported by the representations actually shared across it.

Distributed truth emerges from this condition.

Not because constraint has weakened, and not because systems disagree about correctness, but because constraint enforcement occurs across representations that no longer fully overlap.

Reconciliation can expand that overlap. It can restore larger surfaces across which invariants are enforced.

But the structural challenge remains.

Distributed systems do not merely distribute computation.

They distribute representation.

And when representation is distributed, preserving constraint becomes a problem of geometry rather than logic.