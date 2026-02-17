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

## 2. State

A **State** is a complete representation of the system at a point in
time.

The set of all possible states is the system's state space.

------------------------------------------------------------------------

## 3. Transition

A **Transition** is a transformation from one valid state to another.

Transitions define how the system evolves.

------------------------------------------------------------------------

## 4. Constraint

A **Constraint** is a rule that excludes states or transitions from the
system's possibility space.

Constraints define what must never occur.

A constraint that cannot be enforced is not a constraint.\
It is an assumption.

------------------------------------------------------------------------

## 5. Invariant

An **Invariant** is a constraint that must hold across all valid states
of a system.

Invariants define structural correctness.

------------------------------------------------------------------------

## 6. Invariant Space

The **Invariant Space** is the complete set of enforced impossibilities
governing a system.

It defines the boundary between valid and invalid behavior.

If behavior outside this space is reachable, the invariant space is
incomplete.

------------------------------------------------------------------------

## 7. Enforcement

**Enforcement** is the mechanism by which constraints are made
structurally unavoidable.

Enforcement differs from validation:

-   Validation observes behavior.
-   Enforcement excludes behavior.

Correctness requires enforcement.

------------------------------------------------------------------------

## 8. Epistemic Authority

**Epistemic Authority** is the locus within a system where correctness
is asserted independently of observed outcomes.

Authority exists where:

-   Invariants are encoded.
-   Constraints are mechanically enforced.
-   Invalid behavior is structurally impossible.

When authority migrates to plausibility, precedent, or coherence,
knowability degrades.

------------------------------------------------------------------------

## 9. Knowability

**Knowability** is the preserved ability of a system to justify its
outcomes through enforceable constraints.

A system is knowable if:

-   Its constraints are explicit.
-   Its invariant space is enforceable.
-   The relationship between constraints and outcomes remains
    recoverable.

Knowability precedes reliability, performance, and scale.

------------------------------------------------------------------------

## 10. Reproducibility

**Reproducibility** is the condition that allows the relationship
between constraints and outcomes to be re-established across time.

Reproducibility preserves knowability under temporal change.

Without reproducibility, correctness may persist, but it cannot be
demonstrated.

------------------------------------------------------------------------

## 11. Translation Surface

A **Translation Surface** is any boundary across which constraints must
survive reinterpretation.

At a translation surface, constraints either remain enforceable or
degrade into assumptions.

------------------------------------------------------------------------

## 12. Constraint Dilution

**Constraint Dilution** occurs when an invariant crosses a translation
surface and loses enforceability.

Dilution transforms:

-   Constraint → Assumption\
-   Enforcement → Documentation\
-   Impossibility → Expectation

Constraint dilution is a primary precursor to drift.

------------------------------------------------------------------------

## 13. Composition

**Composition** is the integration of multiple systems into a larger
structure.

Composition introduces new constraints that do not exist in any
component alone.

Correctness does not compose additively.

------------------------------------------------------------------------

## 14. The Additive Fallacy

The **Additive Fallacy** is the mistaken belief that the invariant space
of a composed system equals the union of the invariant spaces of its
components.

In reality, composition produces a new constraint set that includes
interaction constraints.

If interaction constraints are not explicitly modeled and enforced,
collapse begins.

------------------------------------------------------------------------

## 15. Plausibility Substitution

**Plausibility Substitution** occurs when observed coherence replaces
enforced constraint as the basis for correctness.

Plausibility substitution marks the erosion of epistemic authority.

------------------------------------------------------------------------

## 16. Drift

**Drift** is the gradual divergence between a system's stated
constraints and its effective constraint set.

Drift does not require failure.

------------------------------------------------------------------------

## 17. Epistemic Collapse

**Epistemic Collapse** is the condition in which correctness is inferred
rather than demonstrated.

A system in epistemic collapse may remain operational and appear stable,
but cannot justify its behavior through enforceable constraints.

------------------------------------------------------------------------

## 18. Collapse

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

## A.3 Enforcement vs Validation

Enforcement:

    ∀ (s1 → s2) ∈ T : s2 ∈ I

Validation:

Observation that s2 ∈ I after transition.

------------------------------------------------------------------------

## A.4 Translation Surfaces

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

## A.5 Composition

Naïve additive assumption:

    I_C = I_A ∩ I_B

Actual composed system:

    I_C = (I_A ∩ I_B) ∩ I_interaction

The Additive Fallacy assumes:

    I_interaction = ∅

------------------------------------------------------------------------

## A.6 Drift

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
