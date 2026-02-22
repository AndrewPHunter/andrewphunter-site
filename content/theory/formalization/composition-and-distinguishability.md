---
title: "Composition and Distinguishability"
date: 2026-02-22
type: theory-note
math: true
description: "Formalizing the composition of systems and the requirement for subsystem distinguishability."
---

Building on the definition of knowability, we must now account for how knowability is preserved when systems are combined. In the *Corpus*, composition is not merely the union of sets, but the creation of a new system structure that must maintain the identity of its constituents.

### 1. The Composite System

Consider two systems \\(S_1, S_2 \subseteq U\\). We define their **composition** \\(S_3\\) as the system formed by their union:

\\[
S_3 := S(S_1 \cup S_2)
\\]

This composite system possesses its own constraints \\(C_3 = C(S_3)\\) and state space \\(\Omega_3 = \Omega(S_3)\\).

### 2. Subsystem Distinguishability

A critical requirement for reasoning about composite systems is **Subsystem Distinguishability**. We say that \\(S_1\\) and \\(S_2\\) are distinguishable within \\(S_3\\) (denoted \\(S_1 \perp_{dist} S_2 \text{ in } S_3\\)) if and only if there exist projection mappings that preserve the uniqueness of the composite state.

> **Definition (Subsystem Distinguishability):**
> \\(S_1 \perp_{dist} S_2 \text{ in } S_3\\) iff
> \\[
> \{ \exists \pi_1: \Omega_3 \to \Omega_1 \wedge \exists \pi_2: \Omega_3 \to \Omega_2 \mid \phi(\omega_3) = (\pi_1(\omega_3), \pi_2(\omega_3)) \text{ is injective} \}
> \\]

### 3. Product Embedding

The formal consequence of distinguishability is that the state space of the composite system can be embedded into the product of the subsystem state spaces.

> **Lemma (Product Embedding under Distinguishability):**
> If \\(S_1 \perp_{dist} S_2 \text{ in } S_3\\), then \\(\Omega_3 \hookrightarrow \Omega_1 \times \Omega_2\\).

**Proof:**
By the injectivity of the mapping \\(\phi\\), for every composite state \\(\omega \in \Omega_3\\), there exists a unique pair of subsystem states \\((\omega_1, \omega_2) \in \Omega_1 \times \Omega_2\\). Therefore, \\(\phi\\) is an embedding.
\\[
\forall \omega \in \Omega_3, \exists! (\omega_1, \omega_2) \in \Omega_1 \times \Omega_2
\\]
**Q.E.D.**

This formalization ensures that a composite system remains a product of its parts, a necessary condition for knowability under composition.

*More to follow on the algebra of invariant space.*
