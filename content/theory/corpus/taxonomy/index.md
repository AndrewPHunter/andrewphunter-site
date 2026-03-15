---
title: "Taxonomy"
date: 2026-02-15
type: writing
series: corpus
draft: false
summary: "Formal vocabulary for the corpus. Defines constraint, invariant space, enforcement, knowability, translation surfaces, composition, and collapse."
aliases:
  - /writing/taxonomy/
---


## A Formal Vocabulary for Constraint-Preserving Systems

------------------------------------------------------------------------

## 0. Purpose

This document defines the primitive terms used throughout the corpus.

Each term describes a structural property of systems whose correctness
must remain demonstrable across time and composition.

The taxonomy is substrate-independent.\
It applies equally to software systems, institutional systems, economic
systems, and socio-technical systems.

No term in the corpus should be used outside the definitions provided
here.

------------------------------------------------------------------------

# Part I --- Primitive Definitions

## 1. System

A **System** is a bounded structure that produces outcomes under a set
of constraints.

A system is defined not merely by its components, but by the constraints
that govern permissible states and transitions.

------------------------------------------------------------------------

## 2. Representation

A **Representation (R)** is the structure through which a system models
its environment, its internal structure, and the constraints governing
valid behavior.

Systems do not operate directly over invariant space.  
They operate over representations of it.

Representation determines which constraints can be articulated,
enforced, and reasoned about.

------------------------------------------------------------------------

## 3. State

A **State** is a complete representation of the system at a point in
time.

The set of all possible states is the system's state space.

------------------------------------------------------------------------

## 4. Transition

A **Transition** is a transformation from one valid state to another.

Transitions define how the system evolves.

------------------------------------------------------------------------

## 5. Constraint

A **Constraint** is a rule that excludes states or transitions from the
system's possibility space.

Constraints define what must never occur.

A constraint that cannot be enforced is not a constraint.\
It is an assumption.

------------------------------------------------------------------------

## 6. Invariant

An **Invariant** is a constraint that must hold across all valid states
of a system.

Invariants define structural correctness.

------------------------------------------------------------------------

## 7. Invariant Space

The **Invariant Space** is the complete set of enforced impossibilities
governing a system.

It defines the boundary between valid and invalid behavior.

If behavior outside this space is reachable, the invariant space is
incomplete.

------------------------------------------------------------------------

## 8. Represented Invariant Space

The **Represented Invariant Space (I_rep)** is the subset of invariant
space that a system's representation can express and enforce.

Formally:

    I_rep ⊆ I

Where:

- I is the full invariant space governing the system.
- I_rep is the enforceable portion available through the system's
  representation.

Correctness depends on enforcement over I_rep.

Drift and epistemic degradation occur when behavior is governed by
constraints outside the represented invariant space.

------------------------------------------------------------------------

## 9. Enforcement

**Enforcement** is the mechanism by which constraints are made
structurally unavoidable.

Enforcement differs from validation:

-   Validation observes behavior.
-   Enforcement excludes behavior.

Correctness requires enforcement.

------------------------------------------------------------------------

## 10. Epistemic Authority

**Epistemic Authority** is the locus within a system where correctness
is asserted independently of observed outcomes.

Authority exists where:

-   Invariants are encoded.
-   Constraints are mechanically enforced.
-   Invalid behavior is structurally impossible.

When authority migrates to plausibility, precedent, or coherence,
knowability degrades.

------------------------------------------------------------------------

## 11. Knowability

**Knowability** is the preserved ability of a system to justify its
outcomes through enforceable constraints.

A system is knowable if:

-   Its constraints are explicit.
-   Its invariant space is enforceable.
-   The relationship between constraints and outcomes remains
    recoverable.

Knowability precedes reliability, performance, and scale.

------------------------------------------------------------------------

## 12. Reproducibility

**Reproducibility** is the condition that allows the relationship
between constraints and outcomes to be re-established across time.

Reproducibility preserves knowability under temporal change.

Without reproducibility, correctness may persist, but it cannot be
demonstrated.

------------------------------------------------------------------------

## 13. Translation Surface

A **Translation Surface** is any boundary across which representations
must be interpreted.

At a translation surface:

- representations change,
- invariants must be re-expressed,
- enforcement must be preserved.

Constraint preservation requires that invariants remain enforceable
after translation.

If enforcement is lost, constraint becomes assumption.

------------------------------------------------------------------------

## 14. Representation Compression

**Representation Compression** occurs when a subsystem exposes a reduced
representation of its internal structure at a boundary.

Internal representations may encode invariants explicitly.

Interfaces typically expose a smaller representation in which some
constraints are summarized, implied, or omitted.

When compression removes enforceable constraint, the invariant does not
survive composition.

------------------------------------------------------------------------

## 15. Constraint Dilution

**Constraint Dilution** occurs when an invariant crosses a translation
surface and loses enforceability.

Dilution transforms:

-   Constraint → Assumption\
-   Enforcement → Documentation\
-   Impossibility → Expectation

Constraint dilution is a primary precursor to drift.

------------------------------------------------------------------------

## 16. Composition

**Composition** is the integration of multiple systems into a larger
structure.

Composition introduces interaction constraints that do not exist within
any component in isolation.

The invariant space of a composed system is therefore:

    I_C = (I_A ∩ I_B) ∩ I_interaction

where:

- I_A and I_B are component invariant spaces
- I_interaction represents constraints introduced by interaction.

Correctness requires that interaction constraints be modeled and
enforced.

------------------------------------------------------------------------

## 17. The Additive Fallacy

The **Additive Fallacy** is the mistaken belief that the invariant space
of a composed system is determined solely by the invariant spaces of its
components.

In reality, composition produces a new invariant space governed by the
intersection of component constraints together with additional
constraints introduced by interaction.

Failure to model and enforce interaction constraints leads to drift and
structural instability.

------------------------------------------------------------------------

## 18. Plausibility Substitution

**Plausibility Substitution** occurs when observed coherence replaces
enforced constraint as the basis for correctness.

Plausibility substitution marks the erosion of epistemic authority.

------------------------------------------------------------------------

## 19. Drift

**Drift** is the gradual divergence between a system's stated
constraints and its effective constraint set.

Drift does not require failure.

------------------------------------------------------------------------

## 20. Representation Drift

**Representation Drift** occurs when the system's representation no
longer captures the effective constraint structure governing behavior.

Formally:

    I_effective ⊄ I_rep

In this condition the system may still operate correctly, but its
behavior can no longer be justified through its represented invariant
space.

Representation drift precedes epistemic collapse.

------------------------------------------------------------------------

## 21. Epistemic Collapse

**Epistemic Collapse** is the condition in which correctness is inferred
rather than demonstrated.

A system in epistemic collapse may remain operational and appear stable,
but cannot justify its behavior through enforceable constraints.

------------------------------------------------------------------------

## 22. Collapse

**Collapse** occurs when the effective constraint set governing system
behavior no longer matches the stated invariant space.

Collapse may be sudden, gradual, or operationally silent.

------------------------------------------------------------------------

# Part II --- Appendix A

## Minimal Constraint Model (Notation Layer)

This appendix provides a minimal formal model sufficient to express the
structural claims of the taxonomy.

------------------------------------------------------------------------

## A.1 System as State--Transition Structure

Let:

-   S = set of all possible states\
-   T ⊆ S × S = set of possible transitions\
-   I ⊆ S = invariant subset (valid states)

A system is valid if all reachable states belong to I.

Invalid states are:

    S_invalid = S \ I

Enforcement ensures that no transition leads into S_invalid.

------------------------------------------------------------------------

## A.2 Invariant Space

The invariant space is the set of excluded states:

    I_excluded = S \ I

Correctness requires:

    Reachable(S) ⊆ I

------------------------------------------------------------------------

## A.3 Represented Invariant Space

Let:

    I_rep ⊆ I

Where I_rep represents the subset of invariant space expressible within
the system's representation.

Correctness enforcement operates over I_rep.

When I_rep fails to capture constraints governing behavior,
knowability degrades.

------------------------------------------------------------------------

## A.4 Enforcement vs Validation

Enforcement:

    ∀ (s1 → s2) ∈ T : s2 ∈ I

Validation:

Observation that s2 ∈ I after transition.

------------------------------------------------------------------------

## A.5 Translation Surfaces

Let:

-   System A: (S_A, I_A)\
-   System B: (S_B, I_B)\
-   φ : S_A → S_B

Constraint preservation requires:

    ∀ s ∈ I_A : φ(s) ∈ I_B

If:

    ∃ s ∈ I_A such that φ(s) ∉ I_B

Then invariant preservation fails.

------------------------------------------------------------------------

## A.6 Composition

Naïve additive assumption:

    I_C = I_A ∩ I_B

Actual composed system:

    I_C = (I_A ∩ I_B) ∩ I_interaction

The Additive Fallacy assumes:

    I_interaction = ∅

------------------------------------------------------------------------

## A.7 Drift

Let:

-   I_stated = documented invariant space\
-   I_effective = enforced invariant space

Drift occurs when:

    I_effective ⊂ I_stated

Collapse occurs when:

    I_effective ≠ I_stated

------------------------------------------------------------------------

# Closure

This taxonomy and minimal model define the structural substrate of the
corpus.

Constraint, invariant space, enforcement, translation, and composition
form the conceptual lattice.

Everything else is application.
