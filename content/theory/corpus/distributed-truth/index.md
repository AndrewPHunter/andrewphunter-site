---
title: "Distributed Truth"
date: 2026-02-20
type: writing
series: corpus
draft: true
summary: "Distributed systems introduce the possibility that locally enforced invariants produce globally inconsistent truth. Preserving invariant space under partition requires reconciliation, not merely boundary discipline."
---

## 0. From Composition to Distribution

In composition, invariant space does not accumulate. It intersects — and interaction narrows it further.
Components bring their own constraints. Interaction introduces new ones.

This is the Additive Fallacy.

But composition assumes something else.

Even when interaction constraints are incomplete or misrepresented, invariant evaluation occurs within a coherent evaluation context. All transitions are evaluated against that same context. The system progresses as a single structure.

Distributed systems remove this coherence.

When components evaluate constraints over non-identical transition histories, invariant evaluation occurs against divergent evaluation contexts. Enforcement becomes local.

Locally valid transitions can therefore produce globally inconsistent truth.

This is not the Additive Fallacy.

It is a distinct and harder problem.

---

## 1. Divergent Evaluation

### 1.1 Coherent Evaluation Under Composition

In composed systems, invariant evaluation occurs within a single coherent evaluation context.

Even when interaction constraints are incomplete or misrepresented, all transitions are evaluated against the same effective context. Components reason within a shared frame of reference.

The invariant space of the whole may be narrower than represented. Interaction constraints may remain implicit. But evaluation remains coherent.

The system may be wrong about its invariant space.

But it is wrong coherently.

---

### 1.2 Divergent Evaluation Contexts

Distributed systems remove coherent evaluation context.

When components do not evaluate over identical transition histories, their evaluation contexts diverge. Transitions that are visible in one context may be absent in another. Enforcement remains relative to what is locally observable.

Invariant enforcement does not disappear.

It becomes local.

This introduces a new condition:

Locally enforced invariants no longer guarantee globally coherent truth.

No constraint has been diluted.  
No boundary has been weakened.  
No interaction constraint is necessarily missing.

Yet the system may admit combinations of transitions that would not arise under coherent evaluation.

This is not interaction drift.

It is divergence of evaluation context.

---

## 2. Local Correctness and Global Inconsistency

Distributed systems admit a distinct failure pattern.

Invariant enforcement may hold within each evaluation context.  
No local constraint is violated.  
No interaction boundary is weakened.

Yet globally coherent truth may fail to emerge.

When evaluation contexts diverge, each context evaluates transitions against a different reachable history. A transition that is valid relative to one history may be incompatible with transitions validated relative to another. Each context remains internally coherent. The system as a whole does not.

This is the critical distinction.

In the Additive Fallacy, invariant space narrows because interaction constraints are unmodeled. The failure arises from incomplete representation.

Here, invariant space may be fully modeled and correctly enforced locally. The failure arises because invariant evaluation depends on transition history, and that history is no longer shared.

Local correctness no longer composes.

This is not interaction drift.  
It is not constraint dilution.  

It is divergence under local enforcement.

Under composition, invariant preservation depends on modeling interaction constraints within a coherent evaluation context.

Under distribution, invariant preservation additionally depends on restoring coherence across divergent evaluation contexts.

This is strictly harder.

---

## 3. Incomplete Transition Visibility

Divergence does not require collapse.

It arises whenever transition visibility is incomplete.

A transition may be validated within one evaluation context and remain absent from another. Enforcement continues relative to what is locally observable. Invariant space remains defined. Constraint discipline does not disappear.

What disappears is coherence.

Under incomplete transition visibility, the system may admit combinations of locally valid transitions that would not arise within a coherent evaluation context.

This is not constraint dilution.  
It is not boundary failure.

It is the structural consequence of independent evaluation over non-identical transition histories.

Convergence after divergence does not imply continuous invariant preservation.

Restoring coherence after divergence is not equivalent to preserving coherence throughout.

---

## 4. Reconciliation

When invariant evaluation becomes local, preservation requires reconciliation.

Reconciliation is the mechanism by which divergent state is brought back into alignment with invariant space.

It includes:

- Conflict resolution rules.
- Authority ordering.
- Versioning.
- Causality tracking.
- Deterministic merge strategies.

Reconciliation is not documentation.
It is structural enforcement across time.

Composition required modeling interaction constraints.

Distribution requires modeling interaction constraints *and* modeling reconciliation under divergence.

Without reconciliation, invariant preservation becomes probabilistic.

With reconciliation, invariant preservation becomes eventual.

The distinction matters.

---

## 5. Distributed Truth in Inference Systems

Multi-agent inference systems are distributed systems.

An agent invocation is a node.
A context window is a partition.
Tool calls are remote invocations.
Memory stores are replicated state.
Retrieval is asynchronous state access.

Each agent evaluates constraints against its local state representation.

Context windows are bounded.

They truncate history.
They omit causality.
They collapse prior constraint encoding.

Each invocation reasons over S_local, not S_global.

Invariant enforcement is local.

---

### 5.1 Hallucination Propagation

Consider the following pattern:

1. Agent A produces an output based on incomplete context.
2. Agent B consumes that output as authoritative state.
3. Agent C retrieves memory influenced by B.
4. The system converges on a globally inconsistent belief.

Each agent:

- Produced coherent output.
- Respected its local constraints.
- Passed validation.

No explicit invariant was weakened.

Yet global truth drifted.

This is distributed truth failure.

Hallucination propagation is not merely model weakness.

It is local inference evaluated over incomplete state and then propagated without reconciliation.

---

### 5.2 Context Windows as Partition Boundaries

Context windows are structural partitions.

They limit:

- Available history.
- Accessible constraints.
- Causal visibility.

An agent may produce output that is locally valid under its context window but globally inconsistent when evaluated against full system state.

Without reconciliation mechanisms, such inconsistencies accumulate.

The system remains plausible.

But it ceases to be globally coherent.

---

## 6. The Escalation

Constraint preservation under distribution is strictly harder than under composition.

Under composition:

- Interaction constraints must be modeled.

Under distribution:

- Interaction constraints must be modeled.
- Divergent state must be reconciled.
- Authority ordering must be defined.
- Temporal instability must be constrained.

When inference participates in state mutation under distribution, architectural questions become authority questions.

Who defines truth?
Which node is authoritative?
How are conflicts resolved?
Where is invariant space reasserted?

These are not organizational concerns.

They are structural requirements.

---

## Conclusion — Truth Under Partition

Distributed systems introduce the possibility that truth becomes locally coherent and globally inconsistent without explicit invariant violation.

Invariant preservation is no longer a matter of boundary discipline alone.

It requires reconciliation.

Inference systems inherit this property.

When agents reason over partitioned context and propagate state across asynchronous boundaries, distributed truth becomes unavoidable.

Without structural reconciliation, plausibility propagates faster than constraint.

Truth under partition is not self-stabilizing.

It must be governed.